# Generated by Django 4.0 on 2022-02-27 11:39

import core.models.person
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_person_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='profile_picture',
            field=models.FileField(blank=True, null=True, upload_to=core.models.person.upload_dir_profile_picture, verbose_name='Profile picture'),
        ),
    ]