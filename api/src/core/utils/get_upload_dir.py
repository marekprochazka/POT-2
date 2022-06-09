from django.utils import timezone
import os
from pathlib import Path
from django.conf import settings

from core.models.base_model import BaseModel


def get_upload_dir(base_dir_name: str, instance: BaseModel, filename: str, identifier: str = None) -> str:
    now = timezone.now()

    Path(os.path.join(settings.MEDIA_ROOT,
                      base_dir_name,
                      str(now.year),
                      '%02d' % now.month,
                      '%02d' % now.day)).mkdir(parents=True, exist_ok=True)

    identifier = str(identifier) if identifier else str(instance.id)

    return os.path.join(
        base_dir_name,
        str(now.year),
        '%02d' % now.month,
        '%02d' % now.day,
        identifier + '.' + filename.split('.')[-1]
    )
