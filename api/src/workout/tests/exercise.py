from workout.tests.base import BaseWorkoutTestCase


class ExerciseTestCases(BaseWorkoutTestCase):
    def setUp(self) -> None:
        super(ExerciseTestCases, self).setUp()
        self.setup_training_plans()
        self.setup_trainings()

    def test_add_and_remove_exercise(self):
        self.exercise_0_0 = self.training_0_0.add_exercise(
            exercise_name='squat', overload_type=self.overload_definition_0)
        self.exercise_0_1 = self.training_0_0.add_exercise(
            exercise_name='bench', overload_type=self.overload_definition_0)
        self.exercise_1_0 = self.training_0_1.add_exercise(
            exercise_name='deadlift', overload_type=self.overload_definition_0)

        self.assertEqual(2, self.training_0_0.num_exercises)
        self.assertEqual(1, self.training_0_1.num_exercises)

        self.training_0_0.remove_exercise(self.exercise_0_0.id)
        self.training_0_1.remove_exercise(self.exercise_1_0.id)

        self.assertEqual(1, self.training_0_0.num_exercises)
        self.assertEqual(0, self.training_0_1.num_exercises)

    def test_order_existence(self):
        self.setup_exercises()
        self.assertEqual(0, self.exercise_0_0.order)
        self.assertEqual(2, self.exercise_0_2.order)
        self.assertEqual(0, self.exercise_1_0.order)

    def test_order_change_down(self):
        self.setup_exercises()
        self.training_0_0.change_exercise_order(exercise_instance=self.exercise_0_2, new_order=0)
        queryset = list(self.training_0_0.get_all_exercises())
        self.assertEqual(queryset[0].exercise_name, self.exercise_0_2.exercise_name)
        self.assertEqual(queryset[1].exercise_name, self.exercise_0_0.exercise_name)
        self.assertEqual(queryset[2].exercise_name, self.exercise_0_1.exercise_name)

    def test_order_change_up(self):
        self.setup_exercises()
        self.training_0_0.change_exercise_order(exercise_instance=self.exercise_0_0, new_order=2)
        queryset = list(self.training_0_0.get_all_exercises())
        self.assertEqual(queryset[0].exercise_name, self.exercise_0_1.exercise_name)
        self.assertEqual(queryset[1].exercise_name, self.exercise_0_2.exercise_name)
        self.assertEqual(queryset[2].exercise_name, self.exercise_0_0.exercise_name)

    def test_overloads_list(self):
        self.setup_exercises()
        self.setup_training_states()
        self.setup_training_active()
        self.setup_overloads()

        self.assertEqual(1, len(self.exercise_0_0.overloads_history_list))

    def test_last_overload_value(self):
        self.setup_exercises()
        self.setup_training_states()
        self.setup_training_active()
        self.setup_overloads()

        another_active_training = self.training_0_0.create_training_active()
        another_active_training.set_overload(self.exercise_0_0, 50)

        self.assertEqual(50, self.exercise_0_0.last_overload_value)