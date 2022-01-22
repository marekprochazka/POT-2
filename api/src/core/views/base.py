from rest_framework.generics import GenericAPIView
from rest_framework import serializers

from core.utils import get_lang, get_logged_person
from django.utils.translation import gettext_lazy as _


class BaseAPIView(GenericAPIView):

    logged_person = None
    member = None
    lang = None
    permission_classes = []

    def setup(self, request, *args, **kwargs):
        super(BaseAPIView, self).setup(request, *args, **kwargs)
        self.lang = get_lang(request)
        self.logged_person = get_logged_person(request)

    def initial(self, request, *args, **kwargs):
        super().initial(request, *args, **kwargs)
        serializers.Field.default_error_messages['null'] = _('This field may not be blank')

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({
            'logged_person': self.logged_person,
            'lang': self.lang,
        })
        return context

