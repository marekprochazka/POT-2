from core.serializers.base import BaseSerializer
from workout.models import TypeOverload


class TypeOverloadSerializer(BaseSerializer):
    class Meta:
        model = TypeOverload
        fields = ['id', 'identifier', 'description', 'unit']
