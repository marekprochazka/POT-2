from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _

from core.typing.base import QuerysetType
from core.utils.get_upload_dir import get_upload_dir
from core.utils.token import get_or_create_token
from workout.models import TrainingPlan

from rest_framework.authtoken.models import Token

from rest_framework import status


def upload_dir_profile_picture(instance, filename):
    return get_upload_dir('profile_picture', instance, filename)


class Person(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_('user'))
    profile_picture = models.FileField(null=True, blank=True, upload_to=upload_dir_profile_picture,
                                       verbose_name=_('Profile picture'))

    @property
    def num_plans(self) -> int:
        return self.get_all_plans().count()

    @property
    def username(self) -> str:
        return self.user.first_name

    @property
    def email(self) -> str:
        return self.user.username

    @property
    def token(self) -> Token:
        return get_or_create_token(user=self.user)

    class Meta:
        verbose_name = _('Person')
        verbose_name_plural = _('Persons')

    def __str__(self):
        return str(self.user.username)

    @staticmethod
    def create_person_from_user(user: User):
        person = Person(user=user)
        person.save()

    def logout(self) -> (int, str):
        try:
            Token.objects.get(user=self.user).delete()
            msg = _('Logout successful')
            num_status = status.HTTP_200_OK
        except Token.DoesNotExist:
            msg = _('Logout failed')
            num_status = status.HTTP_403_FORBIDDEN
        return num_status, msg

    # TrainingPlan related methods
    def add_plan(self, **kwargs) -> TrainingPlan:
        plan = TrainingPlan(owner=self)
        for key, value in kwargs.items():
            if hasattr(plan, key):
                setattr(plan, key, value)
        plan.save()
        return plan

    def remove_plan(self, plan_id: str) -> None:
        TrainingPlan.objects.get(id=plan_id).delete()

    def get_all_plans(self) -> QuerysetType[TrainingPlan]:
        return TrainingPlan.objects.filter(owner=self)


def create_person_on_user_save(sender, instance, created, **kwargs):
    if created:
        Person.create_person_from_user(user=instance)


post_save.connect(create_person_on_user_save, sender=User)
