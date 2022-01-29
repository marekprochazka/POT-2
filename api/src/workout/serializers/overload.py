from rest_framework import serializers

from workout.models import Exercise


class AddOverloadSerializer(serializers.Serializer):
    exercise: Exercise = None

    def __init__(self, *args, **kwargs):
        super(AddOverloadSerializer, self).__init__(*args, **kwargs)
        self.exercise = self.context.get('exercise')

    value = serializers.FloatField()
