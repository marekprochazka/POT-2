from rest_framework.exceptions import ValidationError

from core.serializers.base import BaseSerializer
from rest_framework import serializers
from typing import List
from workout.models import Exercise, Training
from workout.serializers.types import TypeOverloadSerializer


class ExerciseSerializer(BaseSerializer):
    overload_history = serializers.SerializerMethodField(read_only=True)
    last_overload_value_string = serializers.SerializerMethodField(read_only=True)
    order = serializers.IntegerField(read_only=True)

    class Meta:
        model = Exercise
        fields = ['id', 'exercise_name', 'overload_type', 'overload_history', 'last_overload_value_string', 'order',
                  'description', 'default_add_overload_value']

    def get_overload_history(self, obj: Exercise) -> (List[float], None):
        return obj.overload_history_list

    def get_last_overload_value_string(self, obj: Exercise) -> (str, None):
        if obj.last_overload_value:
            return f'{obj.last_overload_value} {obj.overload_type.unit}'
        return None

    def create(self, validated_data: dict) -> Exercise:
        training: Training = self.context.get('training')
        instance = training.add_exercise(**validated_data)
        return instance

    def update(self, instance: Exercise, validated_data: dict) -> Exercise:
        instance.update_data(**validated_data)
        return instance

    def to_representation(self, instance: Exercise):
        representation = super(ExerciseSerializer, self).to_representation(instance)
        serializer = TypeOverloadSerializer(instance.overload_type)
        representation.update(dict(overload_type=serializer.data))
        return representation


class ExerciseSerializerLite(BaseSerializer):
    last_overload_value_string = serializers.SerializerMethodField()

    class Meta:
        model = Exercise
        fields = ['id', 'exercise_name', 'last_overload_value_string', 'order', 'description']

    def get_last_overload_value_string(self, obj: Exercise) -> (str, None):
        if obj.last_overload_value:
            return f'{obj.last_overload_value} {obj.overload_type.unit}'
        return None


class ExerciseOrderSerializer(serializers.Serializer):
    index = serializers.IntegerField(min_value=0)

    def validate(self, attrs):
        validated_data = super(ExerciseOrderSerializer, self).validate(attrs)

        training: Training = self.context.get('training')
        exercise: Exercise = self.context.get('exercise')

        if exercise.training != training:
            raise ValidationError('Exercise is not part of this training')

        if validated_data.get('index') >= training.num_exercises:
            raise ValidationError('Invalid index')

        return validated_data
