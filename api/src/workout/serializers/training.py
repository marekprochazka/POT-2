from core.serializers.base import BaseSerializer
from workout.models import Training, TrainingPlan
from rest_framework import serializers

from workout.serializers.exercise import ExerciseSerializer


class TrainingSerializer(BaseSerializer):
    id = serializers.UUIDField(read_only=True)
    exercises = ExerciseSerializer(many=True, read_only=True)

    class Meta:
        model = Training
        fields = ['id', 'training_name', 'exercises']

    def create(self, validated_data) -> Training:
        plan: TrainingPlan = self.context.get('training_plan')
        instance = plan.add_training(**validated_data)
        return instance

    def update(self, instance: Training, validated_data) -> Training:
        instance.update_data(**validated_data)
        return instance


class TrainingSerializerLite(BaseSerializer):
    class Meta:
        model = Training
        fields = ['id', 'training_name']
