from rest_framework import serializers

from core.utils import get_logged_person, get_lang
from rest_framework.fields import empty


class BaseSerializer(serializers.ModelSerializer):
    _logged_person = None

    def __init__(self, instance=None, data=empty, **kwargs):
        super(BaseSerializer, self).__init__(instance=instance, data=data, **kwargs)
        self._logged_person = get_logged_person(self.context.get('request'))

    def _get_language(self):
        return get_lang(self.context.get('request'))
