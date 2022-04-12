from core.models.base_model import BaseTypeModel
from django.utils.translation import gettext_lazy as _
from django.db import models


class TypeOverload(BaseTypeModel):

    unit = models.CharField(max_length=32, verbose_name=_('Unit'), null=True, blank=True)

    class Meta:
        ordering = ['order']
        verbose_name = _('Overload type')
        verbose_name_plural = _('Overload types')


class TypeTrainingState(BaseTypeModel):
    NEW = 'new'
    IN_PROGRESS = 'in_progress'
    FINISHED = 'finished'

    class Meta:
        ordering = ['order']
        verbose_name = _('Training state')
        verbose_name_plural = _('Training states')
