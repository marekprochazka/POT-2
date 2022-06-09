from django.urls import reverse
from rest_framework import status

from workout.tests.base import BaseWorkoutTestCase


class TrainingPlanAPITestCases(BaseWorkoutTestCase):
    def test_add_training_plan(self):
        self.login(self.person_0)
        url = reverse('workout:training_plan')
        data = {'plan_name': 'plan 1'}
        response = self.client.post(url, data)
        self.assertEqual(status.HTTP_201_CREATED, response.status_code)
        self.assertEqual(1, self.person_0.num_plans)
        self.assertEqual('plan 1', self.person_0.get_all_plans()[0].plan_name)

    def test_get_training_plan_list(self):
        self.login(self.person_0)
        url = reverse('workout:training_plan')
        self.person_0.add_plan(plan_name='plan 1')
        self.person_0.add_plan(plan_name='plan 2')
        self.person_0.add_plan(plan_name='plan 3')
        self.person_1.add_plan(plan_name='dummy')
        response = self.client.get(url)
        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(3, len(response.data))

    def test_get_training_plan_detail(self):
        self.login(self.person_0)
        self.person_0.add_plan(plan_name='plan 1')
        self.person_0.add_plan(plan_name='plan 2')
        self.person_0.add_plan(plan_name='plan 3')
        training_plan_id = self.person_0.get_all_plans().get(plan_name='plan 2').id
        url = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(training_plan_id)))
        response = self.client.get(url)
        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual('plan 2', response.data.get('plan_name'))

    def test_update_plan(self):
        self.login(self.person_0)
        self.person_0.add_plan(plan_name='plan 1')
        training_plan_id = self.person_0.get_all_plans()[0].id
        url = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(training_plan_id)))
        response = self.client.patch(url, {'plan_name': 'new name'})
        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual('new name', self.person_0.get_all_plans()[0].plan_name)

    def test_delete_plan(self):
        self.login(self.person_0)
        self.person_0.add_plan(plan_name='plan 1')
        training_plan_id = self.person_0.get_all_plans()[0].id
        url = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(training_plan_id)))
        response = self.client.delete(url)
        self.assertEqual(status.HTTP_204_NO_CONTENT, response.status_code)
        self.assertEqual(0, self.person_0.num_plans)

    def test_unauthorized(self):
        url_1 = reverse('workout:training_plan')
        response_1 = self.client.post(url_1, data={'plan_name': 'plan 1'})
        response_2 = self.client.get(url_1)
        self.person_0.add_plan(plan_name='plan 1')
        training_plan_id = self.person_0.get_all_plans()[0].id
        url_2 = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(training_plan_id)))
        response_3 = self.client.get(url_2)
        response_4 = self.client.patch(url_2, data={'plan_name': 'new name'})
        response_5 = self.client.delete(url_2)

        for response in [response_1, response_2, response_3, response_4, response_5]:
            self.assertEqual(status.HTTP_401_UNAUTHORIZED, response.status_code)
