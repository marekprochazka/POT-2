# Generated by Django 4.0 on 2022-01-23 09:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_person_options'),
        ('workout', '0006_alter_exercise_options'),
    ]

    operations = [
        migrations.AlterField(
            model_name='exercise',
            name='training',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='exercises', to='workout.training', verbose_name='Training'),
        ),
        migrations.AlterField(
            model_name='training',
            name='training_plan',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='trainings', to='workout.trainingplan', verbose_name='Training plan'),
        ),
        migrations.AlterField(
            model_name='trainingplan',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='plans', to='core.person', verbose_name='Owner'),
        ),
    ]