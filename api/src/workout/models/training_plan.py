from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models


class TrainingPlan(BaseModel):
    plan_name = models.CharField(verbose_name=_('Plan name'), max_length=128)
    owner = models.ForeignKey('core.Person', on_delete=models.CASCADE, verbose_name=_('Owner'), null=True)

    class Meta:
        verbose_name = _('Training plan')
        verbose_name_plural = _('Training plans')

