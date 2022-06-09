# Generated by Django 4.0 on 2022-01-21 15:46

from django.db import migrations, models
import django.db.models.deletion
import django_extensions.db.fields
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('workout', '0004_alter_training_description_alter_training_name_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='training',
            old_name='name',
            new_name='training_name',
        ),
        migrations.CreateModel(
            name='Exercise',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('x_created', django_extensions.db.fields.CreationDateTimeField(auto_now_add=True, verbose_name='x_created')),
                ('x_modified', django_extensions.db.fields.ModificationDateTimeField(auto_now=True, verbose_name='x_modified')),
                ('exercise_name', models.CharField(blank=True, max_length=128, null=True, verbose_name='Plan name')),
                ('overload_history', models.CharField(default='', max_length=1028, verbose_name='Overload history')),
                ('order', models.IntegerField(verbose_name='Order')),
                ('overload_type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='workout.typeoverload', verbose_name='Overload type')),
                ('training', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='workout.training', verbose_name='Training')),
            ],
            options={
                'verbose_name': 'Exercise',
                'verbose_name_plural': 'Exercises',
            },
        ),
    ]
