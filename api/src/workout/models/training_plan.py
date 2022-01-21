from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from core.typing.base import QuerysetType
from workout.models.training import Training


class TrainingPlan(BaseModel):
    plan_name = models.CharField(verbose_name=_('Plan name'), max_length=128, null=True)
    owner = models.ForeignKey('core.Person', on_delete=models.CASCADE, verbose_name=_('Owner'), null=True)

    class Meta:
        verbose_name = _('Training plan')
        verbose_name_plural = _('Training plans')

    @property
    def num_trainings(self) -> int:
        return self.get_all_trainings().count()

    # Trainings related methods
    def add_training(self, data: dict) -> Training:
        training = Training(training_plan=self)
        for key, value in data.items():
            setattr(training, key, value)
        training.save()
        return training

    def remove_training(self, training_id) -> None:
        Training.objects.get(id=training_id).delete()

    def get_all_trainings(self) -> QuerysetType[Training]:
        return Training.objects.filter(training_plan=self)

    def __str__(self):
        return str(self.plan_name)
