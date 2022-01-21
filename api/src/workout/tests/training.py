from core.tests.base import BaseTestCase


class TrainingTestCases(BaseTestCase):

    def setUp(self) -> None:
        super(TrainingTestCases, self).setUp()
        self.setup_training_plans()

    def test_add_and_remove_training_to_plan(self):
        self.training_0_0 = self.training_plan_0.add_training({'name': 'cool training'})
        self.training_0_1 = self.training_plan_0.add_training({'name': 'another training'})
        self.training_1_0 = self.training_plan_1.add_training({'name': 'third training'})

        self.assertEqual(2, self.training_plan_0.num_trainings)
        self.assertEqual(1, self.training_plan_1.num_trainings)

        self.training_plan_0.remove_training(self.training_0_0.id)
        self.training_plan_1.remove_training(self.training_1_0.id)

        self.assertEqual(1, self.training_plan_0.num_trainings)
        self.assertEqual(0, self.training_plan_1.num_trainings)

    def test_update_training_data(self):
        self.setup_trainings()
        self.training_0_0.update_data({'name': 'new name'})
        self.assertEqual('new name', self.training_0_0.name)
