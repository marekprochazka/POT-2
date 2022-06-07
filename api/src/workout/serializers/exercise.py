from rest_framework.exceptions import ValidationError

from core.serializers.base import BaseSerializer
from rest_framework import serializers
from typing import List
from workout.models import Exercise, Training, OverloadDefinition
from workout.serializers.overload import OverloadSerializerLite
from workout.serializers.types import OverloadDefinitionSerializer


class ExerciseSerializer(BaseSerializer):
    overload_values = serializers.SerializerMethodField(read_only=True)
    order = serializers.IntegerField(read_only=True)
    overload_definition = OverloadDefinitionSerializer(required=False)
    last_overload_value = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Exercise
        fields = ['id', 'exercise_name', 'overload_definition', 'order',
                  'description', 'default_add_overload_value', 'overload_values', 'last_overload_value']

    def get_overload_values(self, obj: Exercise) -> (str, None):
        return OverloadSerializerLite(obj.overloads_history_list, many=True).data

    def get_last_overload_value(self, obj: Exercise) -> (str, None):
        return obj.last_overload_value_str

    def create(self, validated_data: dict) -> Exercise:
        training: Training = self.context.get('training')
        instance = training.add_exercise(**validated_data)
        return instance

    def update(self, instance: Exercise, validated_data: dict) -> Exercise:
        if validated_data.get('overload_definition'):
            instance.overload_definition.update_data(**validated_data.get('overload_definition'))
            validated_data.pop('overload_definition')
        instance.update_data(**validated_data)
        return instance

    # def to_representation(self, instance: Exercise):
    #     representation = super(ExerciseSerializer, self).to_representation(instance)
    #     serializer = OverloadDefinitionSerializer(instance.overload_definition)
    #     representation.update(dict(overload_type=serializer.data))
    #     return representation


class ExerciseSerializerLite(BaseSerializer):
    last_overload_value_string = serializers.SerializerMethodField()

    class Meta:
        model = Exercise
        fields = ['id', 'exercise_name', 'last_overload_value_string', 'order', 'description']

    def get_last_overload_value_string(self, obj: Exercise) -> (str, None):
        if obj.last_overload_value:
            return f'{obj.last_overload_value} {obj.overload_definition.unit}'
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
