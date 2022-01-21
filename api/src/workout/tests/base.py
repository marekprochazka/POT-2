from core.tests.base import BaseTestCase
from workout.models import TrainingPlan, Training, Exercise, TypeOverload


class BaseWorkoutTestCase(BaseTestCase):
    training_plan_0: TrainingPlan = None
    training_plan_1: TrainingPlan = None
    training_plan_2: TrainingPlan = None

    training_0_0: Training = None
    training_0_1: Training = None
    training_0_2: Training = None
    training_1_0: Training = None

    overload_type_0: TypeOverload = None
    overload_type_1: TypeOverload = None

    exercise_0_0: Exercise = None
    exercise_0_1: Exercise = None
    exercise_0_2: Exercise = None
    exercise_1_0: Exercise = None
    exercise_1_1: Exercise = None
    exercise_2_0: Exercise = None

    def setup_training_plans(self) -> None:
        self.training_plan_0 = self.person_0.add_plan({'plan_name': 'training_plan_0'})
        self.training_plan_1 = self.person_1.add_plan({'plan_name': 'training_plan_1'})
        self.training_plan_2 = self.person_2.add_plan({'plan_name': 'training_plan_2'})

    def setup_trainings(self) -> None:
        self.training_0_0 = self.training_plan_0.add_training({'training_name': 'training_0_0'})
        self.training_0_1 = self.training_plan_0.add_training({'training_name': 'training_0_1'})
        self.training_0_2 = self.training_plan_0.add_training({'training_name': 'training_0_2'})
        self.training_1_0 = self.training_plan_1.add_training({'training_name': 'training_1_0'})

    def setup_overload_types(self):
        self.overload_type_0 = TypeOverload(identifier='overload_0', description='Overload 0', order=0)
        self.overload_type_1 = TypeOverload(identifier='overload_1', description='Overload 1', order=0)

    def setup_exercises(self) -> None:
        self.exercise_0_0 = self.training_0_0.add_exercise(
            {'exercise_name': 'exercise_0_0', 'overload_type': self.overload_type_0})
        self.exercise_0_1 = self.training_0_0.add_exercise(
            {'exercise_name': 'exercise_0_1', 'overload_type': self.overload_type_0})
        self.exercise_0_2 = self.training_0_0.add_exercise(
            {'exercise_name': 'exercise_0_2', 'overload_type': self.overload_type_0})
        self.exercise_1_0 = self.training_0_1.add_exercise(
            {'exercise_name': 'exercise_1_0', 'overload_type': self.overload_type_0})
        self.exercise_1_1 = self.training_0_1.add_exercise(
            {'exercise_name': 'exercise_1_1', 'overload_type': self.overload_type_0})
        self.exercise_2_0 = self.training_0_2.add_exercise(
            {'exercise_name': 'exercise_2_0', 'overload_type': self.overload_type_0})
