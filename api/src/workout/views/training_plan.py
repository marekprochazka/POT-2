from rest_framework.generics import ListCreateAPIView

from core.views.base import BaseAPIView
from workout.models import TrainingPlan


class BaseTrainingPlanView(BaseAPIView):
    queryset = TrainingPlan.objects.all()
    serializer_class = None
    permission_classes = []
    lookup_url_kwarg = 'training_plan_id'

