from core.serializers.base import BaseSerializer
from workout.models import TrainingPlan
from rest_framework import serializers


class TrainingPlanSerializer(BaseSerializer):
    id = serializers.UUIDField(read_only=True)

    class Meta:
        model = TrainingPlan
        fields = ['id', 'plan_name']

    def create(self, validated_data) -> TrainingPlan:
        instance = self.logged_person.add_plan(validated_data)
        return instance

    def update(self, instance: TrainingPlan, validated_data) -> TrainingPlan:
        instance.update_data(validated_data)
        return instance
