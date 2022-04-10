from rest_framework import status

from core.utils import decorators
from core.utils.permission_handler import BaseRight
from core.views.base import BaseAPIView
from workout.models import Training
from workout.serializers.training_active import TrainingActiveSerializer
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from core.utils.permissions import get_class_for_right
from workout.utils.permission_handlers import TrainingPermissionHandler


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
