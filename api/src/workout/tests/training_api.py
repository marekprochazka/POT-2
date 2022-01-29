from django.urls import reverse
from rest_framework import status

from workout.tests.base import BaseWorkoutTestCase


class TrainingAPITestCases(BaseWorkoutTestCase):
    def setUp(self) -> None:
        super(TrainingAPITestCases, self).setUp()
        self.setup_training_plans()

    def get_url(self, kwargs: dict) -> str:
        return reverse('workout:training', kwargs=kwargs)

    def test_add_training(self):
        self.login(self.person_0)
        training_plan_id = self.training_plan_0.id
        url = self.get_url(kwargs=dict(training_plan_id=str(training_plan_id)))
        data = {'training_name': 'training 1'}
        response = self.client.post(url, data)
        self.assertEqual(status.HTTP_201_CREATED, response.status_code)
        self.assertEqual(1, self.training_plan_0.num_trainings)

    def test_get_trainings_list(self):
        self.login(self.person_0)
        self.training_plan_0.add_training({'training_name': 'training 0'})
        self.training_plan_0.add_training({'training_name': 'training 1'})
        self.training_plan_1.add_training({'training_name': 'training 2'})
        self.training_plan_2.add_training({'training_name': 'training 3'})

        url = self.get_url(dict(training_plan_id=self.training_plan_0.id))
        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(self.training_plan_0.num_trainings, len(response.data))

    def test_get_training_detail(self):
        self.login(self.person_0)
        self.training_0_0 = self.training_plan_0.add_training({'training_name': 'training_0_0'})
        self.training_0_1 = self.training_plan_0.add_training({'training_name': 'training_0_1'})

        url = self.get_url(dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))
        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(str(self.training_0_0.id), response.data.get('id'))

    def test_update_training(self):
        self.login(self.person_0)
        self.training_0_0 = self.training_plan_0.add_training({'training_name': 'training_0_0'})

        url = self.get_url(dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))
        data = {'training_name': 'new_name'}
        response = self.client.patch(url, data)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual('new_name',
                         self.training_plan_0.get_all_trainings().get(id=self.training_0_0.id).training_name)

    def test_delete_training(self):
        self.login(self.person_0)
        self.training_0_0 = self.training_plan_0.add_training({'plan_name': 'training_0_0'})

        url = self.get_url(dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))
        response = self.client.delete(url)

        self.assertEqual(status.HTTP_204_NO_CONTENT, response.status_code)
        self.assertEqual(0, self.training_plan_0.num_trainings)

    def test_unauthorized(self):
        self.setup_trainings()
        url_1 = self.get_url(kwargs=dict(training_plan_id=str(self.training_plan_0.id)))

        response_1 = self.client.post(url_1, data={'training_name': 'epic training'})
        response_2 = self.client.get(url_1)

        url_2 = self.get_url(dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))

        response_3 = self.client.get(url_2)
        response_4 = self.client.patch(url_2, data={'training_name': 'new_name'})
        response_5 = self.client.delete(url_2)

        for response in (response_1, response_2, response_3, response_4, response_5):
            self.assertEqual(status.HTTP_401_UNAUTHORIZED, response.status_code)
