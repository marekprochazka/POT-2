from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models


class Overload(BaseModel):
    exercise = models.ForeignKey('workout.Exercise', on_delete=models.CASCADE, related_name='overloads',
                                 verbose_name=_('Exercise'))
    value = models.IntegerField(verbose_name=_('Value'))
    training_active = models.ForeignKey('workout.TrainingActive', on_delete=models.CASCADE, related_name='overloads',
                                        verbose_name=_('Training active'))
    order = models.IntegerField(verbose_name=_('Order'), blank=True, null=True)

    class Meta:
        verbose_name = _('Overload')
        verbose_name_plural = _('Overloads')
        ordering = ['-order']
