from rest_framework import status
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from core.views.base import BaseAPIView
from workout.models import Exercise, Training
from workout.serializers.exercise import ExerciseSerializer, ExerciseOrderSerializer
from workout.serializers.overload import AddOverloadSerializer


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


class ExerciseOverloadView(BaseAPIView):
    exercise: Exercise = None

    def initial(self, request, *args, **kwargs):
        super(ExerciseOverloadView, self).initial(request, *args, **kwargs)
        self.exercise = Exercise.objects.get(id=self.kwargs.get('exercise_id'))

    def validate_index(self, index: int) -> bool:
        if index >= len(self.exercise.overload_history_list):
            return False
        return True

    def post(self, request, *args, **kwargs):
        serializer = AddOverloadSerializer(data=request.data, context=self.get_serializer_context())
        if serializer.is_valid():
            self.exercise.add_overload_value(serializer.data.get('value'))
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)

    def delete(self, request, *args, **kwargs):
        index = self.kwargs.get('index')
        if self.validate_index(index):
            self.exercise.remove_overload_value_by_index(index)
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response(status=status.HTTP_400_BAD_REQUEST, data='Invalid index')


class ExerciseOrderView(BaseExerciseView):
    exercise: Exercise = None
    serializer_class = ExerciseOrderSerializer

    def initial(self, request, *args, **kwargs):
        super(ExerciseOrderView, self).initial(request, *args, **kwargs)
        self.exercise = Exercise.objects.get(id=self.kwargs.get('exercise_id'))

    def get_serializer_context(self):
        context = super(ExerciseOrderView, self).get_serializer_context()
        context.update(dict(exercise=self.exercise))
        return context

    def patch(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.training.change_exercise_order(self.exercise, serializer.data.get('index'))
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)
