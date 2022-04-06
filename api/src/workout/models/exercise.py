from typing import List, Union

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from django.db.models.signals import pre_delete

from core.typing.base import QuerysetType


class Exercise(BaseModel):
    exercise_name = models.CharField(verbose_name=_('Plan name'), max_length=128, null=True, blank=True)
    overload_type = models.ForeignKey('workout.TypeOverload', on_delete=models.PROTECT, verbose_name=_('Overload type'),
                                      null=True, blank=True)
    training = models.ForeignKey('workout.Training', on_delete=models.CASCADE, verbose_name=_('Training'), null=True,
                                 blank=True, related_name='exercises')
    order = models.IntegerField(verbose_name=_('Order'))
    description = models.CharField(verbose_name=_('Description'), max_length=255, null=True, blank=True)
    default_add_overload_value = models.IntegerField(blank=True, null=True,
                                                     verbose_name=_('Default add overload value'))

    @property
    def owner(self):
        return self.training.training_plan.owner

    @property
    def overloads_history_list(self) -> List:
        return list(self.overloads.all())

    @property
    def num_overloads(self):
        return self.overloads.count()

    class Meta:
        verbose_name = _('Exercise')
        verbose_name_plural = _('Exercises')
        ordering = ['order']

    def __str__(self):
        return f'{self.exercise_name} - {self.training.training_name}'

    def get_overloads_history(self) -> QuerysetType:
        return self.overloads.all()


def update_exercise_order_on_delete(sender, instance: Exercise, using, **kwargs):
    training = instance.training
    training.change_exercise_order(instance, training.num_exercises - 1)


pre_delete.connect(update_exercise_order_on_delete, sender=Exercise)
