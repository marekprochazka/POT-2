from rest_framework import status
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from core.utils.permission_handler import BaseRight
from core.utils.permissions import get_class_for_right
from core.views.base import BaseAPIView
from core.utils import decorators
from workout.models import Exercise, Training
from workout.serializers.exercise import ExerciseSerializer, ExerciseOrderSerializer
from workout.utils.permission_handlers import ExercisePermissionHandler


class BaseExerciseView(BaseAPIView):
    queryset = Exercise.objects.all()
    serializer_class = ExerciseSerializer
    permission_classes = [IsAuthenticated, get_class_for_right(ExercisePermissionHandler, BaseRight.VIEW)]
    lookup_url_kwarg = 'exercise_id'
    training: Training = None

    def initial(self, request, *args, **kwargs):
        super(BaseExerciseView, self).initial(request, *args, **kwargs)
        self.training = Training.objects.get(id=self.kwargs.get('training_id'))

    def get_serializer_context(self):
        context = super(BaseExerciseView, self).get_serializer_context()
        context.update(dict(training=self.training))
        return context


class ExerciseListCreateView(ListCreateAPIView, BaseExerciseView):
    def get_queryset(self):
        return self.training.get_all_exercises()


class ExerciseView(RetrieveUpdateDestroyAPIView, BaseExerciseView):
    exercise: Exercise = None

    def initial(self, request, *args, **kwargs):
        super(ExerciseView, self).initial(request, *args, **kwargs)
        self.exercise = self.get_object()

    @decorators.has_right(ExercisePermissionHandler, 'exercise', BaseRight.EDIT)
    def put(self, request, *args, **kwargs):
        return super(ExerciseView, self).put(request, *args, **kwargs)

    @decorators.has_right(ExercisePermissionHandler, 'exercise', BaseRight.EDIT)
    def patch(self, request, *args, **kwargs):
        return super(ExerciseView, self).patch(request, *args, **kwargs)

    @decorators.has_right(ExercisePermissionHandler, 'exercise', BaseRight.DELETE)
    def delete(self, request, *args, **kwargs):
        return super(ExerciseView, self).delete(request, *args, **kwargs)


class ExerciseOrderView(BaseExerciseView):
    exercise: Exercise = None
    serializer_class = ExerciseOrderSerializer
    permission_classes = [IsAuthenticated]

    def initial(self, request, *args, **kwargs):
        super(ExerciseOrderView, self).initial(request, *args, **kwargs)
        self.exercise = Exercise.objects.get(id=self.kwargs.get('exercise_id'))

    def get_serializer_context(self):
        context = super(ExerciseOrderView, self).get_serializer_context()
        context.update(dict(exercise=self.exercise))
        return context

    @decorators.has_right(ExercisePermissionHandler, 'exercise', BaseRight.EDIT)
    def patch(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.training.change_exercise_order(self.exercise, serializer.data.get('index'))
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)
