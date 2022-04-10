from core.serializers.base import BaseSerializer
from workout.models import TrainingActive
from rest_framework import serializers

from workout.serializers.overload import OverloadSerializer


class TrainingActiveSerializer(BaseSerializer):
    overloads = serializers.SerializerMethodField()

    class Meta:
        model = TrainingActive
        fields = ('id','training', 'state', 'overloads')

    def get_overloads(self, instance: TrainingActive):
        return OverloadSerializer(instance.overloads_list, many=True).data
