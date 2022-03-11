from rest_framework import serializers

from core.models import Person
from core.serializers.base import BaseSerializer


class ProfilePictureSerializer(BaseSerializer):
    profile_picture = serializers.CharField(source='profile_picture.url')

    class Meta:
        model = Person
        fields = ['profile_picture']
