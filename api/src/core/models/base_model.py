from django.db import models
from uuid import uuid4
from django_extensions.db.fields import CreationDateTimeField, ModificationDateTimeField
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid4, editable=False)

    x_created = CreationDateTimeField(_('x_created'))
    x_modified = ModificationDateTimeField(_('x_modified'))

    class Meta:
        abstract = True

    def update_data(self, **kwargs) -> None:
        for key, value in kwargs.items():
            if hasattr(self, key):
                setattr(self, key, value)
        self.save()


class BaseTypeModel(BaseModel):
    identifier = models.CharField(verbose_name=_("Identifier"), max_length=128, unique=True,
                                  null=True, blank=True)
    description = models.CharField(verbose_name=_("Description"), max_length=255)
    order = models.IntegerField(verbose_name=_("Order"), default=1)

    def __str__(self) -> str:
        return self.description

    class Meta:
        abstract = True
        ordering = ['order']
