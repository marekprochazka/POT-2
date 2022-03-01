from core.models import TypeDefaultAvatar
from core.serializers.base import BaseSerializer


class TypeDefaultAvatarSerializer(BaseSerializer):
    class Meta:
        model = TypeDefaultAvatar
        fields = ['description', 'image']
