# Generated by Django 4.0 on 2022-06-07 05:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('workout', '0020_exercise_overload_unit'),
    ]

    operations = [
        migrations.RenameField(
            model_name='exercise',
            old_name='overload_unit',
            new_name='overload_datatype',
        ),
    ]