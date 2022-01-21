from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models


class Training(BaseModel):
    name = models.CharField(verbose_name=_('Training name'), max_length=128, null=True)
    description = models.CharField(verbose_name=_('Description'), max_length=1024, null=True)
    training_plan = models.ForeignKey('workout.TrainingPlan', on_delete=models.CASCADE, verbose_name=_('Training plan'), null=True)

    class Meta:
        verbose_name = _('Training')
        verbose_name_plural = _('Trainings')
