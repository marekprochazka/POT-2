from rest_framework import serializers

from core.models import TypeDefaultAvatar
from core.serializers.base import BaseSerializer


class TypeDefaultAvatarSerializer(BaseSerializer):
    image = serializers.CharField(source='image.url')

    class Meta:
        model = TypeDefaultAvatar
        fields = ['description', 'image']
