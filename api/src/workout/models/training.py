from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from core.typing.base import QuerysetType
from workout.models.exercise import Exercise
from workout.models.types import TypeOverload


class Training(BaseModel):
    training_name = models.CharField(verbose_name=_('Training name'), max_length=128, null=True, blank=True)
    description = models.CharField(verbose_name=_('Description'), max_length=1024, null=True, blank=True)
    training_plan = models.ForeignKey('workout.TrainingPlan', on_delete=models.CASCADE, verbose_name=_('Training plan'),
                                      null=True, blank=True)

    @property
    def num_exercises(self) -> int:
        return self.get_all_exercises().count()

    class Meta:
        verbose_name = _('Training')
        verbose_name_plural = _('Trainings')

    def __str__(self):
        return str(self.training_name)

    # Exercise related methods
    def add_exercise(self, data: dict) -> Exercise:
        exercise = Exercise(training=self)
        for key, value in data.items():
            setattr(exercise, key, value)
        exercise.order = self.num_exercises
        exercise.save()
        return exercise

    def remove_exercise(self, exercise_id) -> None:
        Exercise.objects.get(id=exercise_id).delete()

    def get_all_exercises(self) -> QuerysetType[Exercise]:
        return Exercise.objects.filter(training=self)

    def change_exercise_order(self, exercise_instance: Exercise, new_order: int):
        for exercise in self.get_all_exercises():
            if exercise_instance.order > new_order:
                if new_order <= exercise.order < exercise_instance.order:
                    exercise.order += 1
                    exercise.save()
            elif exercise_instance.order < new_order:
                if exercise_instance.order < exercise.order <= new_order:
                    exercise.order -= 1
                    exercise.save()
        exercise_instance.order = new_order
        exercise_instance.save()

        # orders = list(self.get_all_exercises().values_list('order', flat=True))
        # tmp = orders[exercise.order]
        # orders.pop(exercise.order)
        # orders.insert(new_index, tmp)
        #
        # for index, exercise in enumerate(list(self.get_all_exercises())):
        #     exercise.order = orders[index]
        #     exercise.save()

    def get_all_exercises_of_overload_type(self, type_overload: TypeOverload):
        return Exercise.objects.filter(training=self, type_overload=type_overload)
