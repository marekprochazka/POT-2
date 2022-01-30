from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.utils.permission_handler import BaseRight
from core.utils.permissions import get_class_for_right
from core.views.base import BaseAPIView
from workout.models import TrainingPlan
from workout.serializers.training_plan import TrainingPlanSerializer
from workout.utils.permission_handlers import TrainingPLanPermissionHandler


class BaseTrainingPlanView(BaseAPIView):
    queryset = TrainingPlan.objects.all()
    serializer_class = TrainingPlanSerializer
    permission_classes = [IsAuthenticated, get_class_for_right(TrainingPLanPermissionHandler, BaseRight.VIEW)]
    lookup_url_kwarg = 'training_plan_id'


class TrainingPlanListCreateView(ListCreateAPIView, BaseTrainingPlanView):
    def get_queryset(self):
        return TrainingPlan.objects.filter(owner=self.logged_person)


class TrainingPlanView(RetrieveUpdateDestroyAPIView, BaseTrainingPlanView):
    pass
