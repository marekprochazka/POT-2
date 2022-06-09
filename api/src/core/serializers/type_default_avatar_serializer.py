from rest_framework import serializers

from core.models import TypeDefaultAvatar
from core.serializers.base import BaseSerializer


class TypeDefaultAvatarSerializer(BaseSerializer):
    class Meta:
        model = TypeDefaultAvatar
        fields = ['description', 'image']

    def to_representation(self, instance: TypeDefaultAvatar):
        representation = super(TypeDefaultAvatarSerializer, self).to_representation(instance)
        representation['image'] = instance.image.url if representation['image'] else None
        return representation
