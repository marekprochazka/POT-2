from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.views.base import BaseAPIView
from workout.models import Training, TrainingPlan
from workout.serializers.training import TrainingSerializer


class BaseTrainingView(BaseAPIView):
    queryset = Training.objects.all()
    serializer_class = TrainingSerializer
    permission_classes = [IsAuthenticated]
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
