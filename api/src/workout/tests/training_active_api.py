from rest_framework import status

from workout.models import TypeTrainingState, TrainingActive
from workout.tests.base import BaseWorkoutTestCase
from django.urls import reverse


class TrainingActiveAPITestCases(BaseWorkoutTestCase):
    def setUp(self):
        super().setUp()
        self.setup_training_plans()
        self.setup_trainings()
        self.setup_training_states()
        self.setup_overload_types()
        self.setup_exercises()
        self.setup_training_active()

    def test_get_last_training_active_or_create(self):
        self.login(self.person_0)
        url = reverse('workout:training_active', kwargs=dict(training_id=str(self.training_0_0.id)))
        response = self.client.get(url)
        response2 = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(response.data['id'], response2.data['id'])
        self.training_active_0 = TrainingActive.objects.get(id=response.data['id'])
        self.training_active_0.state = TypeTrainingState.objects.get(identifier=TypeTrainingState.FINISHED)
        self.training_active_0.save()

        response3 = self.client.get(url)

        self.assertNotEqual(response2.data['id'], response3.data['id'])
