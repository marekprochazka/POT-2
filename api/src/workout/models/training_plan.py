from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from core.typing.base import QuerysetType
from core.utils.get_upload_dir import get_upload_dir
from workout.models.training import Training


def upload_dir_plan_picture(instance, filename):
    return get_upload_dir('training_plan', instance, filename)


class TrainingPlan(BaseModel):
    plan_name = models.CharField(verbose_name=_('Plan name'), max_length=128, null=True, blank=True)
    owner = models.ForeignKey('core.Person', on_delete=models.CASCADE, verbose_name=_('Owner'), null=True, blank=True,
                              related_name='plans')
    plan_image = models.FileField(null=True, blank=True, upload_to=upload_dir_plan_picture,
                                    verbose_name=_('Plan picture'))
    description = models.TextField(verbose_name=_('Description'), null=True, blank=True)

    @property
    def num_trainings(self) -> int:
        return self.get_all_trainings().count()

    class Meta:
        verbose_name = _('Training plan')
        verbose_name_plural = _('Training plans')

    def __str__(self):
        return str(self.plan_name)

    # Trainings related methods
    def add_training(self, **kwargs) -> Training:
        training = Training(training_plan=self)
        for key, value in kwargs.items():
            if hasattr(training, key):
                setattr(training, key, value)
        training.save()
        return training

    def remove_training(self, training_id) -> None:
        Training.objects.get(id=training_id).delete()

    def get_all_trainings(self) -> QuerysetType[Training]:
        return Training.objects.filter(training_plan=self)
