from rest_framework import serializers

from core.models import Person
from core.serializers.base import BaseSerializer


class ProfilePictureSerializer(BaseSerializer):
    class Meta:
        model = Person
        fields = ['profile_picture']

    def to_representation(self, instance: Person):
        representation = super(ProfilePictureSerializer, self).to_representation(instance)
        representation['profile_picture'] = instance.profile_picture.url if representation['profile_picture'] else None
        return representation
