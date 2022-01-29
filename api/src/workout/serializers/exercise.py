from core.serializers.base import BaseSerializer
from rest_framework import serializers
from typing import List
from workout.models import Exercise, Training


class ExerciseSerializer(BaseSerializer):
    overload_history = serializers.SerializerMethodField(read_only=True)
    last_overload_value = serializers.SerializerMethodField(read_only=True)
    order = serializers.IntegerField(read_only=True)

    class Meta:
        model = Exercise
        fields = ['id', 'exercise_name', 'overload_type', 'overload_history', 'last_overload_value', 'order']

    def get_overload_history(self, obj: Exercise) -> List[float]:
        return obj.overload_history_list

    def get_last_overload_value(self, obj: Exercise) -> float:
        return obj.last_overload_value

    def create(self, validated_data: dict) -> Exercise:
        training: Training = self.context.get('training')
        instance = training.add_exercise(validated_data)
        return instance

    def update(self, instance: Exercise, validated_data: dict) -> Exercise:
        instance.update_data(validated_data)
        return instance

    def to_representation(self, instance):
        representation = super(ExerciseSerializer, self).to_representation(instance)
        # TODO overload type serializer
        return representation
