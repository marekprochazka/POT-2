# Generated by Django 4.0 on 2022-01-29 11:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('workout', '0007_alter_exercise_training_alter_training_training_plan_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='typeoverload',
            name='unit',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='Unit'),
        ),
    ]