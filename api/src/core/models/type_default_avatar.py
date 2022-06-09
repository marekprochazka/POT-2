from core.models.base_model import BaseTypeModel
from django.db import models
from django.utils.translation import gettext_lazy as _

from core.utils.get_upload_dir import get_upload_dir


def upload_dir_default_avatar(instance, filename):
    return get_upload_dir('default_avatars', instance, filename)


class TypeDefaultAvatar(BaseTypeModel):
    image = models.FileField(blank=True, null=True, upload_to=upload_dir_default_avatar, verbose_name=_('Avatar image'))

    class Meta:
        verbose_name = _('Type default avatar')
        verbose_name_plural = _('Type default avatars')
        ordering = ['order']
