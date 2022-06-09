from workout.tests.base import BaseWorkoutTestCase


class TrainingActiveTestCases(BaseWorkoutTestCase):
    def setUp(self):
        super().setUp()
        self.setup_training_plans()
        self.setup_trainings()
        self.setup_training_states()
        self.setup_exercises()
        self.setup_training_active()

    def test_set_new_overload(self):
        self.training_active_0.set_overload(self.exercise_0_0, 10)
        self.training_active_0.set_overload(self.exercise_0_1, 20)
        overload_0 = self.training_active_0.overloads.filter(exercise=self.exercise_0_0).first()
        overload_1 = self.training_active_0.overloads.filter(exercise=self.exercise_0_1).first()

        self.assertEqual(10, overload_0.value)
        self.assertEqual(20, overload_1.value)

    def test_set_existing_overload(self):
        self.setup_overloads()
        self.training_active_0.set_overload(self.exercise_0_0, 35)
        self.training_active_0.set_overload(self.exercise_0_0, 25)
        self.assertEqual(1, self.training_active_0.overloads.filter(exercise=self.exercise_0_0).count())
        self.assertEqual(25, self.training_active_0.overloads.filter(exercise=self.exercise_0_0).first().value)

    def test_overloads_list(self):
        self.setup_overloads()
        self.assertEqual(3, len(self.training_active_0.overloads_list))

    def test_set_multiple_overloads(self):
        self.setup_overloads()
        data = [{'exercise_id': self.exercise_0_0.id, 'value': 40},
                {'exercise_id': self.exercise_0_1.id, 'value': 60}]
        self.training_active_0.set_overloads(data)
        self.assertEqual(60, self.training_active_0.overloads.filter(exercise=self.exercise_0_1).first().value)
