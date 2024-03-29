from core.serializers.base import BaseSerializer
from workout.models import TrainingPlan, DefaultPlanImage
from rest_framework import serializers

from workout.serializers.training import TrainingSerializerLite


class TrainingPlanSerializer(BaseSerializer):
    id = serializers.UUIDField(read_only=True)
    x_created = serializers.DateTimeField(read_only=True)
    x_modified = serializers.DateTimeField(read_only=True)
    default_image = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = TrainingPlan
        fields = ['id', 'plan_name', 'x_created', 'x_modified', 'plan_image', 'default_image',
                  'description']

    def get_default_image(self, obj):
        return DefaultPlanImage.objects.first().image.url if DefaultPlanImage.objects.first() else None

    def create(self, validated_data) -> TrainingPlan:
        instance = self.logged_person.add_plan(**validated_data)
        return instance

    def update(self, instance: TrainingPlan, validated_data) -> TrainingPlan:
        instance.update_data(**validated_data)
        return instance

    def to_representation(self, instance: TrainingPlan):
        representation = super(TrainingPlanSerializer, self).to_representation(instance)
        representation['plan_image'] = instance.plan_image.url if representation['plan_image'] else None
        return representation
