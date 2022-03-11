from core.serializers.base import BaseSerializer
from workout.models import TrainingPlan
from rest_framework import serializers

from workout.serializers.training import TrainingSerializerLite


class TrainingPlanSerializer(BaseSerializer):
    id = serializers.UUIDField(read_only=True)
    trainings = TrainingSerializerLite(read_only=True, many=True)
    x_created = serializers.DateTimeField(read_only=True)
    x_modified = serializers.DateTimeField(read_only=True)
    plan_image = serializers.CharField(source='plan_image.url')

    class Meta:
        model = TrainingPlan
        fields = ['id', 'plan_name', 'trainings', 'x_created', 'x_modified', 'plan_image']

    def create(self, validated_data) -> TrainingPlan:
        instance = self.logged_person.add_plan(**validated_data)
        return instance

    def update(self, instance: TrainingPlan, validated_data) -> TrainingPlan:
        instance.update_data(**validated_data)
        return instance
