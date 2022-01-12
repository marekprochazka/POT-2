from core.tests.base import BaseTestCase


class TrainingPlanTestCases(BaseTestCase):

    # tests, if plans are correctly added to persons
    def test_add_plan_to_person(self):
        self.person_1.add_plan(data={'plan_name': 'Amazing workout week'})
        self.plan_1 = self.person_1.get_all_plans().first()

        self.assertEqual(self.plan_1.plan_name, 'Amazing workout week')

        self.person_1.add_plan(data={'plan_name': 'Bigger by day'})
        self.assertEqual(self.person_1.get_all_plans().count(), 2)
        self.assertEqual(self.person_2.get_all_plans().count(), 0)
