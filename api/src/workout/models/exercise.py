from typing import List, Union

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from django.db.models.signals import pre_delete


class Exercise(BaseModel):
    exercise_name = models.CharField(verbose_name=_('Plan name'), max_length=128, null=True, blank=True)
    overload_type = models.ForeignKey('workout.TypeOverload', on_delete=models.PROTECT, verbose_name=_('Overload type'),
                                      null=True, blank=True)
    training = models.ForeignKey('workout.Training', on_delete=models.CASCADE, verbose_name=_('Training'), null=True,
                                 blank=True, related_name='exercises')
    overload_history = models.CharField(verbose_name=_('Overload history'), max_length=1028, default='')
    order = models.IntegerField(verbose_name=_('Order'))
    description = models.CharField(verbose_name=_('Description'), max_length=255, null=True, blank=True)

    @property
    def owner(self):
        return self.training.training_plan.owner

    @property
    def last_overload_value(self) -> Union[float, None]:
        if self.overload_history:
            return float(str(self.overload_history).split(';')[-1])
        return None

    @property
    def overload_history_list(self) -> Union[List[float], None]:
        if self.overload_history:
            return [float(value) for value in str(self.overload_history).split(';')]
        return None

    def __get_overload_history_string_list(self) -> Union[List[str], None]:
        if self.overload_history:
            return str(self.overload_history).split(';')
        return None

    class Meta:
        verbose_name = _('Exercise')
        verbose_name_plural = _('Exercises')
        ordering = ['order']

    def __str__(self):
        return f'{self.exercise_name} - {self.training.training_name}'

    def add_overload_value(self, value: float) -> None:
        if self.overload_history:
            self.overload_history += f';{value}'
        else:
            self.overload_history += f'{value}'
        self.save()

    def remove_overload_value_by_index(self, index: int) -> None:
        tmp_list = self.__get_overload_history_string_list()
        del tmp_list[index]
        self.overload_history = ';'.join(tmp_list)
        self.save()


def update_exercise_order_on_delete(sender, instance: Exercise, using, **kwargs):
    training = instance.training
    training.change_exercise_order(instance, training.num_exercises - 1)


pre_delete.connect(update_exercise_order_on_delete, sender=Exercise)
