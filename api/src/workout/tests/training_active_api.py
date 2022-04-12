import json
import uuid

from rest_framework import status

from workout.models import TypeTrainingState, TrainingActive, Overload
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

    def test_set_one_overload(self):
        self.login(self.person_0)
        url = reverse('workout:training_active_set_one_overload',
                      kwargs=dict(training_active_id=str(self.training_active_0.id)))
        data = dict(exercise_id=str(self.exercise_0_0.id), value=50)
        response = self.client.put(url, data=data)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(50, self.exercise_0_0.last_overload_value)

        data2 = dict(exercise_id=str(uuid.uuid4()), value=50)
        response2 = self.client.put(url, data=data2)

        self.assertEqual(status.HTTP_404_NOT_FOUND, response2.status_code)

        data3 = dict()
        response3 = self.client.put(url, data=data3)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response3.status_code)

    def test_set_multiple_overloads(self):
        self.login(self.person_0)
        url = reverse('workout:training_active_set_multiple_overloads',
                      kwargs=dict(training_active_id=str(self.training_active_0.id)))
        data = [
            dict(exercise_id=str(self.exercise_0_0.id), value=50),
            dict(exercise_id=str(self.exercise_0_1.id), value=75),
        ]

        response = self.client.put(url, json.dumps(data), content_type='application/json')

        data2 = [
            dict(exercise_id=str(self.exercise_0_0.id), value=50),
            dict(exercise_id=str('aaaaaaaaaaaa'), value=75),
        ]

        response_invalid_uuid = self.client.put(url, json.dumps(data2), content_type='application/json')

        data3 = [
            dict(exercise_id=str(uuid.uuid4()), value=50),
            dict(exercise_id=str(self.exercise_0_1.id), value=100),
        ]

        response_exercise_doesnt_exist = self.client.put(url, json.dumps(data3), content_type='application/json')

        # valid data
        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(50, self.exercise_0_0.last_overload_value)
        self.assertEqual(75, self.exercise_0_1.last_overload_value)

        # invalid data stopped by serializer
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_invalid_uuid.status_code)

        # exercise doesn't exist, atomic transaction
        self.assertEqual(status.HTTP_404_NOT_FOUND, response_exercise_doesnt_exist.status_code)
        self.assertEqual(50, self.exercise_0_0.last_overload_value)
        self.assertEqual(75, self.exercise_0_1.last_overload_value)
