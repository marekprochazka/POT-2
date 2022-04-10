from rest_framework import serializers

from core.serializers.base import BaseSerializer
from workout.models import Overload


class OverloadSerializerLite(BaseSerializer):
    class Meta:
        model = Overload
        fields = ('id', 'value')


class OverloadSerializer(OverloadSerializerLite):
    exercise_id = serializers.CharField(source='exercise.id')
    exercise_name = serializers.CharField(source='exercise.exercise_name')
    overload_unit = serializers.CharField(source='exercise.overload_type.unit')
    default_add_overload_value = serializers.FloatField(source='exercise.default_add_overload_value')

    class Meta(OverloadSerializerLite.Meta):
        fields = OverloadSerializerLite.Meta.fields + (
            'exercise_name', 'exercise_id', 'overload_unit', 'default_add_overload_value')
