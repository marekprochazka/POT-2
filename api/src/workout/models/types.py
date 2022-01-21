from core.models.base_model import BaseTypeModel
from django.utils.translation import gettext_lazy as _


class TypeOverload(BaseTypeModel):
    class Meta:
        ordering = ['order']
        verbose_name = _('Overload type')
        verbose_name_plural = _('Overload types')
