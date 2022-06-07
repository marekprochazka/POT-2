from core.tests.base import BaseTestCase
from workout.models import TrainingPlan, Training, Exercise, OverloadDefinition, TrainingActive, Overload, TypeTrainingState
from workout.models.types import OverloadDataTypes


class BaseWorkoutTestCase(BaseTestCase):
    training_plan_0: TrainingPlan = None
    training_plan_1: TrainingPlan = None
    training_plan_2: TrainingPlan = None

    training_0_0: Training = None
    training_0_1: Training = None
    training_0_2: Training = None
    training_1_0: Training = None

    overload_definition_0: OverloadDefinition = None
    overload_definition_1: OverloadDefinition = None

    exercise_0_0: Exercise = None
    exercise_0_1: Exercise = None
    exercise_0_2: Exercise = None
    exercise_1_0: Exercise = None
    exercise_1_1: Exercise = None
    exercise_2_0: Exercise = None
    exercise_1_1_1: Exercise = None

    training_active_0: TrainingActive = None

    overload_0: Overload = None
    overload_1: Overload = None

    def setup_training_plans(self) -> None:
        self.training_plan_0 = self.person_0.add_plan(plan_name='training_plan_0')
        self.training_plan_1 = self.person_1.add_plan(plan_name='training_plan_1')
        self.training_plan_2 = self.person_2.add_plan(plan_name='training_plan_2')

    def setup_trainings(self) -> None:
        self.training_0_0 = self.training_plan_0.add_training(training_name='training_0_0')
        self.training_0_1 = self.training_plan_0.add_training(training_name='training_0_1')
        self.training_0_2 = self.training_plan_0.add_training(training_name='training_0_2')
        self.training_1_0 = self.training_plan_1.add_training(training_name='training_1_0')

    def setup_overload_definitions(self):
        self.overload_definition_0 = OverloadDefinition.objects.create(unit='kg', data_type=OverloadDataTypes.NUMBER)
        self.overload_definition_1 = OverloadDefinition.objects.create(unit='kg', data_type=OverloadDataTypes.NUMBER)
        self.overload_definition_0.save()
        self.overload_definition_1.save()

    def setup_exercises(self) -> None:
        self.exercise_0_0 = self.training_0_0.add_exercise(
            exercise_name='exercise_0_0', overload_definition=self.overload_definition_0)
        self.exercise_0_1 = self.training_0_0.add_exercise(
            exercise_name='exercise_0_1', overload_definition=self.overload_definition_0)
        self.exercise_0_2 = self.training_0_0.add_exercise(
            exercise_name='exercise_0_2', overload_definition=self.overload_definition_0)
        self.exercise_1_0 = self.training_0_1.add_exercise(
            exercise_name='exercise_1_0', overload_definition=self.overload_definition_0)
        self.exercise_1_1 = self.training_0_1.add_exercise(
            exercise_name='exercise_1_1', overload_definition=self.overload_definition_0)
        self.exercise_2_0 = self.training_0_2.add_exercise(
            exercise_name='exercise_2_0', overload_definition=self.overload_definition_0)
        self.exercise_1_1_1 = self.training_1_0.add_exercise(
            exercise_name='exercise_1_1_1', overload_definition=self.overload_definition_0)

    def setup_training_active(self) -> None:
        self.training_active_0 = self.training_0_0.create_training_active()

    def setup_training_states(self) -> None:
        TypeTrainingState(identifier=TypeTrainingState.NEW, description='New', order=0).save()
        TypeTrainingState(identifier=TypeTrainingState.IN_PROGRESS, description='In progress', order=1).save()
        TypeTrainingState(identifier=TypeTrainingState.FINISHED, description='Finished', order=2).save()

    def setup_overloads(self) -> None:
        self.overload_0 = self.training_active_0.set_overload(self.exercise_0_0, 10)
        self.overload_1 = self.training_active_0.set_overload(self.exercise_0_1, 20)