from core.models import Person
from core.serializers.base import BaseSerializer


class ProfilePictureSerializer(BaseSerializer):
    class Meta:
        model = Person
        fields = ['profile_picture']
