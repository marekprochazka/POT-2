from core.tests.base import BaseTestCase


class TrainingPlanTestCases(BaseTestCase):

    # tests, if plans are correctly added to persons
    def test_add_plan_to_person(self):
        self.person_1.add_plan(data={'plan_name': 'Amazing workout week'})
        self.plan_1 = self.person_1.get_all_plans().first()

        self.assertEqual('Amazing workout week', self.plan_1.plan_name)

        self.person_1.add_plan(data={'plan_name': 'Bigger by day'})
        self.assertEqual(2, self.person_1.num_plans)
        self.assertEqual(0, self.person_0.num_plans)

    def test_remove_plan(self):
        self.person_2.add_plan(data={'plan_name': 'Amazing workout week'})
        plan = self.person_2.get_all_plans().first()
        self.person_2.remove_plan(plan.id)
        self.assertEqual(0, self.person_2.num_plans)

    def test_update_plan(self):
        new_plan_name = 'new name'
        self.person_2.add_plan(data={'plan_name': 'Rich Pianna killer workout'})
        plan = self.person_2.get_all_plans().first()
        plan.update_data(data={'plan_name': new_plan_name})
        self.assertEqual(new_plan_name, plan.plan_name)
