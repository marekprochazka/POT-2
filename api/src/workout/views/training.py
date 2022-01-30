from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.utils.permission_handler import BaseRight
from core.utils.permissions import get_class_for_right
from core.views.base import BaseAPIView
from workout.models import Training, TrainingPlan
from workout.serializers.training import TrainingSerializer
from workout.utils.permission_handlers import TrainingPermissionHandler


class BaseTrainingView(BaseAPIView):
    queryset = Training.objects.all()
    serializer_class = TrainingSerializer
    permission_classes = [IsAuthenticated, get_class_for_right(TrainingPermissionHandler, BaseRight.VIEW)]
    lookup_url_kwarg = 'training_id'
    training_plan: TrainingPlan = None

    def initial(self, request, *args, **kwargs):
        super(BaseTrainingView, self).initial(request, *args, **kwargs)
        self.training_plan = TrainingPlan.objects.get(id=self.kwargs.get('training_plan_id'))

    def get_serializer_context(self):
        context = super(BaseTrainingView, self).get_serializer_context()
        context.update({'training_plan': self.training_plan})
        return context


class TrainingListCreateView(ListCreateAPIView, BaseTrainingView):
    def get_queryset(self):
        return self.training_plan.get_all_trainings()


class TrainingView(RetrieveUpdateDestroyAPIView, BaseTrainingView):
    pass
