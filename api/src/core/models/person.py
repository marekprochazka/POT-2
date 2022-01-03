from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _


class Person(BaseModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name=_('user'))

    class Meta:
        verbose_name = _('Person')
        verbose_name_plural = _('Persons')

    @staticmethod
    def create_person_from_user(user: User):
        person = Person(user=user)
        person.save()

    def __str__(self):
        return str(self.user.username)


def create_person_on_user_save(sender, instance, created, **kwargs):
    if created:
        Person.create_person_from_user(user=instance)


post_save.connect(create_person_on_user_save, sender=User)
