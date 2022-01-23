from django.urls import reverse
from rest_framework import status

from workout.tests.base import BaseWorkoutTestCase


class TrainingAPITestCases(BaseWorkoutTestCase):
    def setUp(self) -> None:
        super(TrainingAPITestCases, self).setUp()
        self.setup_training_plans()

    def test_add_training(self):
        self.login(self.person_0)
        training_plan_id = self.training_plan_0.id
        url = reverse('workout:training', kwargs=dict(training_plan_id=str(training_plan_id)))
        data = {'training_name': 'training 1'}
        response = self.client.post(url, data)
        self.assertEqual(status.HTTP_201_CREATED, response.status_code)
        self.assertEqual(1, self.training_plan_0.num_trainings)


