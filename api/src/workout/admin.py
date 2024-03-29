from django.contrib import admin

# Register your models here.
from workout.models import TrainingPlan, Training, Exercise, OverloadDefinition, TypeTrainingState, Overload, TrainingActive, \
    DefaultPlanImage


@admin.register(TrainingPlan)
class TrainingPlanAdmin(admin.ModelAdmin):
    pass


@admin.register(Training)
class TrainingAdmin(admin.ModelAdmin):
    pass


@admin.register(Exercise)
class ExerciseAdmin(admin.ModelAdmin):
    pass


@admin.register(Overload)
class OverloadAdmin(admin.ModelAdmin):
    pass


@admin.register(TrainingActive)
class TrainingActiveAdmin(admin.ModelAdmin):
    pass


@admin.register(OverloadDefinition)
class TypeOverloadPlanAdmin(admin.ModelAdmin):
    pass


@admin.register(TypeTrainingState)
class TypeTrainingStateAdmin(admin.ModelAdmin):
    pass


@admin.register(DefaultPlanImage)
class DefaultPlanImageAdmin(admin.ModelAdmin):
    pass
