from workout.tests.base import BaseWorkoutTestCase


class TrainingPlanTestCases(BaseWorkoutTestCase):

    # tests, if plans are correctly added to persons
    def test_add_plan_to_person(self):
        self.person_1.add_plan(data={'plan_name': 'Amazing workout week'})
        self.plan_1 = self.person_1.get_all_plans().first()

        self.assertEqual('Amazing workout week', self.plan_1.plan_name)

        self.person_1.add_plan(data={'plan_name': 'Bigger by day'})
        self.assertEqual(2, self.person_1.num_plans)
        self.assertEqual(0, self.person_0.num_plans)

    def test_remove_plan(self):
        plan = self.person_2.add_plan(data={'plan_name': 'Amazing workout week'})
        self.person_2.remove_plan(plan.id)
        self.assertEqual(0, self.person_2.num_plans)

    def test_update_plan(self):
        new_plan_name = 'new name'
        plan = self.person_2.add_plan(data={'plan_name': 'Rich Pianna killer workout'})
        plan.update_data(data={'plan_name': new_plan_name})
        self.assertEqual(new_plan_name, plan.plan_name)
