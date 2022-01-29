from django.urls import path

from workout.views.exercise import ExerciseListCreateView, ExerciseView
from workout.views.training import TrainingListCreateView, TrainingView
from workout.views.training_plan import TrainingPlanListCreateView, TrainingPlanView

app_name = 'workout'

urlpatterns = [
    path('plan', TrainingPlanListCreateView.as_view(), name='training_plan'),
    path('plan/<uuid:training_plan_id>', TrainingPlanView.as_view(), name='training_plan'),

    path('training/<uuid:training_plan_id>', TrainingListCreateView.as_view(), name='training'),
    path('training/<uuid:training_plan_id>/<uuid:training_id>', TrainingView.as_view(), name='training'),

    path('exercise/<uuid:training_id>', ExerciseListCreateView.as_view(), name='exercise'),
    path('exercise/<uuid:training_id>/<uuid:exercise_id>', ExerciseView.as_view(), name='exercise'),
]
