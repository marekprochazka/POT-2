from typing import List

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from workout.models.overload import Overload
from workout.models.exercise import Exercise
from workout.models.types import TypeTrainingState


class TrainingActive(BaseModel):
    training = models.ForeignKey('workout.Training', on_delete=models.CASCADE, related_name='trainings_active',
                                 verbose_name=_('Training'))
    state = models.ForeignKey('workout.TypeTrainingState', on_delete=models.PROTECT, related_name='trainings_active',
                              verbose_name=_('State'))

    class Meta:
        verbose_name = _('Active training')
        verbose_name_plural = _('Active trainings')
        ordering = ('x_modified',)

    @property
    def overloads_list(self) -> List[Overload]:
        result = []
        for exercise in self.training.exercises.all():
            try:
                result.append(self.overloads.get(exercise=exercise, training_active=self))
            except Overload.DoesNotExist:
                new_overload = Overload(exercise=exercise, training_active=self, order=exercise.num_overloads)
                new_overload.save()
                result.append(new_overload)
        return result

    def __update_state(self):
        if self.state.identifier == TypeTrainingState.NEW:
            self.state = TypeTrainingState.objects.get(identifier=TypeTrainingState.IN_PROGRESS)
            self.save()

    def set_overload(self, exercise: Exercise, value) -> Overload:
        self.__update_state()
        try:
            overload = self.overloads.get(exercise=exercise)
            overload.value = value
        except Overload.DoesNotExist:
            overload = Overload(exercise=exercise, value=value, training_active=self, order=exercise.num_overloads)
        overload.save()
        return overload

    def set_overloads(self, overloads: List[dict]) -> List[Overload]:
        self.__update_state()
        for overload_data in overloads:
            try:
                overload = self.overloads.get(exercise__id=overload_data['exercise_id'])
                overload.value = overload_data['value']
            except Overload.DoesNotExist:
                overload = Overload(exercise_id=overload_data['exercise_id'], value=overload_data['value'],
                                    training_active=self, order=self.overloads.count())
            overload.save()
        return self.overloads_list
