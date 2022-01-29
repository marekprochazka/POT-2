from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated

from core.views.base import BaseAPIView
from workout.models import Exercise, Training
from workout.serializers.exercise import ExerciseSerializer


class BaseExerciseView(BaseAPIView):
    queryset = Exercise.objects.all()
    serializer_class = ExerciseSerializer
    permission_classes = [IsAuthenticated]
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
    pass
