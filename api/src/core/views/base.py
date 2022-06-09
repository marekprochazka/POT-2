from rest_framework.generics import GenericAPIView
from rest_framework import serializers

from core.models import Person
from core.utils.get_logged_person import get_logged_person
from core.utils.language import get_lang
from django.utils.translation import gettext_lazy as _


class BaseAPIView(GenericAPIView):

    logged_person: Person = None
    lang = None
    permission_classes = []

    def initial(self, request, *args, **kwargs):
        super().initial(request, *args, **kwargs)
        self.lang = get_lang(request)
        self.logged_person = get_logged_person(request)
        serializers.Field.default_error_messages['null'] = _('This field may not be blank')

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({
            'logged_person': self.logged_person,
            'lang': self.lang,
        })
        return context

