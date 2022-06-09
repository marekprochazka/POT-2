from core.serializers.base import BaseSerializer
from workout.models import OverloadDefinition


class OverloadDefinitionSerializer(BaseSerializer):
    class Meta:
        model = OverloadDefinition
        fields = ['id', 'unit', 'data_type']

