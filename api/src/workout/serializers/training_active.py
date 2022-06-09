from core.serializers.base import BaseSerializer
from workout.models import TrainingActive
from rest_framework import serializers

from workout.serializers.overload import OverloadSerializer


class TrainingActiveSerializer(BaseSerializer):
    overloads = serializers.SerializerMethodField()
    training_name = serializers.CharField(source='training.training_name')
    training_id = serializers.UUIDField(source='training.id')

    class Meta:
        model = TrainingActive
        fields = ('id', 'training_name', 'training_id', 'state', 'overloads')

    def get_overloads(self, instance: TrainingActive):
        return OverloadSerializer(instance.overloads_list, many=True).data


class SetOverloadSerializer(serializers.Serializer):
    exercise_id = serializers.UUIDField()
    value = serializers.IntegerField()
