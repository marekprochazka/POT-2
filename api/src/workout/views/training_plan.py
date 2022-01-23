from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.views.base import BaseAPIView
from workout.models import TrainingPlan
from workout.serializers.training_plan import TrainingPlanSerializer


class BaseTrainingPlanView(BaseAPIView):
    queryset = TrainingPlan.objects.all()
    serializer_class = TrainingPlanSerializer
    permission_classes = [IsAuthenticated]
    lookup_url_kwarg = 'training_plan_id'


class TrainingPlanListCreateView(ListCreateAPIView, BaseTrainingPlanView):
    def get_queryset(self):
        return TrainingPlan.objects.filter(owner=self.logged_person)


class TrainingPlanView(RetrieveUpdateDestroyAPIView, BaseTrainingPlanView):
    pass
