from core.models.base_model import BaseModel
from django.utils.translation import gettext_lazy as _
from django.db import models

from core.utils.get_upload_dir import get_upload_dir


def upload_dir_default_plan_picture(instance, filename):
    return get_upload_dir('default_training_plan', instance, filename)


class DefaultPlanImage(BaseModel):
    image = models.FileField(null=True, blank=True, upload_to=upload_dir_default_plan_picture,
                             verbose_name=_('Default picture'))
