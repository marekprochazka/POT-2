from abc import ABC, abstractmethod

from rest_framework import status

from core.utils import decorators
from core.utils.permission_handler import BaseRight
from core.views.base import BaseAPIView
from workout.models import Training, TrainingActive, Exercise
from workout.serializers.training_active import TrainingActiveSerializer
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from core.utils.permissions import get_class_for_right
from workout.utils.permission_handlers import TrainingPermissionHandler
from django.utils.translation import gettext_lazy as _


class LastTrainingActiveView(BaseAPIView):
    training: Training = None
    serializer_class = TrainingActiveSerializer
    permission_classes = (IsAuthenticated, get_class_for_right(TrainingPermissionHandler, BaseRight.VIEW))

    def initial(self, request, *args, **kwargs):
        super().initial(request, *args, **kwargs)
        self.training = Training.objects.get(id=self.kwargs.get('training_id'))

    @decorators.has_right(TrainingPermissionHandler, 'training', BaseRight.EDIT)
    def get(self, request, *args, **kwargs):
        serializer = self.get_serializer(self.training.get_training_active_in_progress_or_new())
        return Response(status=status.HTTP_200_OK, data=serializer.data)


class TrainingActiveBaseUpdateOverloadView(BaseAPIView, ABC):
    training_active: TrainingActive = None
    permission_classes = (IsAuthenticated, get_class_for_right(TrainingPermissionHandler, BaseRight.EDIT))

    def initial(self, request, *args, **kwargs):
        super().initial(request, *args, **kwargs)
        self.training_active = TrainingActive.objects.get(id=self.kwargs.get('training_active_id'))

    @decorators.has_right(TrainingPermissionHandler, 'training_active', BaseRight.EDIT)
    @abstractmethod
    def put(self, request, *args, **kwargs):
        pass


class TrainingActiveSetOneOverloadView(TrainingActiveBaseUpdateOverloadView):
    def put(self, request, *args, **kwargs):
        if request.data.get('exercise_id') and request.data.get('value'):
            try:
                exercise = Exercise.objects.get(id=request.data.get('exercise_id'))
                self.training_active.set_overload(exercise, request.data.get('value'))
                return Response(status=status.HTTP_200_OK)

            except Exercise.DoesNotExist:
                return Response(status=status.HTTP_404_NOT_FOUND, data={'detail': _('Exercise not found')})

        return Response(status=status.HTTP_400_BAD_REQUEST, data={'detail': _('Exercise id and value are required')})