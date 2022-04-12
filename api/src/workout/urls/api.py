from django.urls import path

from workout.views.exercise import ExerciseListCreateView, ExerciseView, ExerciseOrderView
from workout.views.training import TrainingListCreateView, TrainingView
from workout.views.training_active import LastTrainingActiveView, TrainingActiveSetOneOverloadView, \
    TrainingActiveSetMultipleOverloadsView, FinishTrainingActiveView
from workout.views.training_plan import TrainingPlanListCreateView, TrainingPlanView

app_name = 'workout'

urlpatterns = [
    path('plan', TrainingPlanListCreateView.as_view(), name='training_plan'),
    path('plan/<uuid:training_plan_id>', TrainingPlanView.as_view(), name='training_plan'),

    path('training/<uuid:training_plan_id>', TrainingListCreateView.as_view(), name='training'),
    path('training/<uuid:training_plan_id>/<uuid:training_id>', TrainingView.as_view(), name='training'),

    path('training-active/<uuid:training_id>', LastTrainingActiveView.as_view(), name='training_active'),
    path('training-active/<uuid:training_active_id>/set-overload/one', TrainingActiveSetOneOverloadView.as_view(),
         name='training_active_set_one_overload'),
    path('training-active/<uuid:training_active_id>/set-overload/multiple',
         TrainingActiveSetMultipleOverloadsView.as_view(), name='training_active_set_multiple_overloads'),
    path('training-active/<uuid:training_active_id>/finish', FinishTrainingActiveView.as_view(),
         name='training_active_finish'),

    path('exercise/<uuid:training_id>', ExerciseListCreateView.as_view(), name='exercise'),
    path('exercise/<uuid:training_id>/<uuid:exercise_id>', ExerciseView.as_view(), name='exercise'),
    path('exercise/<uuid:training_id>/<uuid:exercise_id>/order', ExerciseOrderView.as_view(),
         name='exercise_order')
]
