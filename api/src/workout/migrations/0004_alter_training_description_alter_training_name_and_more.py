# Generated by Django 4.0 on 2022-01-21 15:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_person_options'),
        ('workout', '0003_typeoverload'),
    ]

    operations = [
        migrations.AlterField(
            model_name='training',
            name='description',
            field=models.CharField(blank=True, max_length=1024, null=True, verbose_name='Description'),
        ),
        migrations.AlterField(
            model_name='training',
            name='name',
            field=models.CharField(blank=True, max_length=128, null=True, verbose_name='Training name'),
        ),
        migrations.AlterField(
            model_name='training',
            name='training_plan',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='workout.trainingplan', verbose_name='Training plan'),
        ),
        migrations.AlterField(
            model_name='trainingplan',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.person', verbose_name='Owner'),
        ),
        migrations.AlterField(
            model_name='trainingplan',
            name='plan_name',
            field=models.CharField(blank=True, max_length=128, null=True, verbose_name='Plan name'),
        ),
    ]
