from rest_framework import serializers

from rest_framework.fields import empty

from core.models import Person


class BaseSerializer(serializers.ModelSerializer):
    logged_person: Person = None

    def __init__(self, instance=None, data=empty, **kwargs):
        super(BaseSerializer, self).__init__(instance=instance, data=data, **kwargs)
        self.logged_person = self.context.get('logged_person')

    def _get_language(self):
        return self.context.get('lang')
