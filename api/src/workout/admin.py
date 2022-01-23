from django.contrib import admin

# Register your models here.
from workout.models import TrainingPlan, Training, Exercise, TypeOverload


@admin.register(TrainingPlan)
class TrainingPlanAdmin(admin.ModelAdmin):
    pass


@admin.register(Training)
class TrainingAdmin(admin.ModelAdmin):
    pass


@admin.register(Exercise)
class ExerciseAdmin(admin.ModelAdmin):
    pass


@admin.register(TypeOverload)
class TypeOverloadPlanAdmin(admin.ModelAdmin):
    pass


