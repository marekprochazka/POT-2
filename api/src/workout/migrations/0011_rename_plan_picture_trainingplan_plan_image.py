# Generated by Django 4.0 on 2022-02-27 12:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('workout', '0010_trainingplan_plan_picture'),
    ]

    operations = [
        migrations.RenameField(
            model_name='trainingplan',
            old_name='plan_picture',
            new_name='plan_image',
        ),
    ]
