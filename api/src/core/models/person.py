from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _

from core.typing.base import QuerysetType
from workout.models import TrainingPlan


class Person(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_('user'))

    class Meta:
        verbose_name = _('Person')
        verbose_name_plural = _('Persons')

    @property
    def num_plans(self) -> int:
        return self.get_all_plans().count()

    @staticmethod
    def create_person_from_user(user: User):
        person = Person(user=user)
        person.save()

    # TrainingPlan related methods
    def add_plan(self, data: dict) -> TrainingPlan:
        plan = TrainingPlan(owner=self)
        for key, value in data.items():
            setattr(plan, key, value)
        plan.save()
        return plan

    def remove_plan(self, plan_id: str) -> None:
        TrainingPlan.objects.get(id=plan_id).delete()

    def get_all_plans(self) -> QuerysetType[TrainingPlan]:
        return TrainingPlan.objects.filter(owner=self)

    def __str__(self):
        return str(self.user.username)


def create_person_on_user_save(sender, instance, created, **kwargs):
    if created:
        Person.create_person_from_user(user=instance)


post_save.connect(create_person_on_user_save, sender=User)
