import json
from typing import Union

from workout.tests.base import BaseWorkoutTestCase

from django.urls import reverse
from rest_framework import status


class PermissionsTestCases(BaseWorkoutTestCase):
    """
    Tests if the permissions and unauthorized situations are handled correctly.
    """
    def setUp(self) -> None:
        super(PermissionsTestCases, self).setUp()
        self.setup_training_plans()
        self.setup_trainings()
        self.setup_overload_definitions()
        self.setup_exercises()
        self.setup_training_states()
        self.setup_training_active()

    def base_test_VIEW(self, url: str) -> None:
        self.response_unauthorized = self.client.get(url)

        self.assertEqual(status.HTTP_401_UNAUTHORIZED, self.response_unauthorized.status_code)

        self.login(self.person_0)

        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)

        self.login(self.person_1)

        response_2 = self.client.get(url)

        self.assertEqual(status.HTTP_403_FORBIDDEN, response_2.status_code)

    def base_test_EDIT(self, url: str, data: Union[dict, list], put=True, patch=True) -> None:
        response_unauthorized1 = self.client.put(url, data=json.dumps(data), content_type='application/json')
        response_unauthorized2 = self.client.patch(url, data=json.dumps(data), content_type='application/json')
        if put:
            self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_unauthorized1.status_code)
        if patch:
            self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_unauthorized2.status_code)

        self.login(self.person_0)
        response_1 = self.client.put(url, json.dumps(data), content_type='application/json')
        response_2 = self.client.patch(url, json.dumps(data), content_type='application/json')

        self.login(self.person_1)
        response_3 = self.client.put(url, json.dumps(data), content_type='application/json')
        response_4 = self.client.patch(url, json.dumps(data), content_type='application/json')

        if put:
            self.assertEqual(status.HTTP_200_OK, response_1.status_code)
            self.assertEqual(status.HTTP_403_FORBIDDEN, response_3.status_code)

        if patch:
            self.assertEqual(status.HTTP_200_OK, response_2.status_code)
            self.assertEqual(status.HTTP_403_FORBIDDEN, response_4.status_code)

    def base_test_DELETE(self, url_1: str, url_2: str) -> None:
        self.login(self.person_0)
        response_1 = self.client.delete(url_1)
        self.login(self.person_2)
        response_2 = self.client.delete(url_2)
        self.assertEqual(status.HTTP_204_NO_CONTENT, response_1.status_code)
        self.assertEqual(status.HTTP_403_FORBIDDEN, response_2.status_code)

    def test_training_plan_permission_VIEW(self) -> None:
        url = reverse('workout:training_plan',
                      kwargs=dict(training_plan_id=str(self.training_plan_0.id))
                      )
        self.base_test_VIEW(url)

    def test_training_plan_permission_EDIT(self) -> None:
        url = reverse('workout:training_plan',
                      kwargs=dict(training_plan_id=str(self.training_plan_0.id))
                      )
        data = {'plan_name': 'new_name'}
        self.base_test_EDIT(url, data)

    def test_training_plan_permission_DELETE(self) -> None:
        url_1 = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(self.training_plan_0.id)))
        url_2 = reverse('workout:training_plan', kwargs=dict(training_plan_id=str(self.training_plan_1.id)))
        self.base_test_DELETE(url_1, url_2)

    def test_training_permission_VIEW(self) -> None:
        url = reverse('workout:training',
                      kwargs=dict(training_plan_id=str(self.training_plan_0.id), training_id=str(self.training_0_0.id))
                      )
        self.base_test_VIEW(url)

    def test_training_permission_EDIT(self) -> None:
        url = reverse('workout:training',
                      kwargs=dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))
        data = {'training_name': 'new_name'}
        self.base_test_EDIT(url, data)

    def test_training_permission_DELETE(self) -> None:
        url_1 = reverse('workout:training',
                        kwargs=dict(training_plan_id=self.training_plan_0.id, training_id=self.training_0_0.id))
        url_2 = reverse('workout:training',
                        kwargs=dict(training_plan_id=self.training_plan_1.id, training_id=self.training_1_0.id))
        self.base_test_DELETE(url_1, url_2)

    def test_exercise_permission_VIEW(self) -> None:
        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                      )
        self.base_test_VIEW(url)

    def test_exercise_permission_EDIT(self) -> None:
        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                      )
        data = {'exercise_name': 'new_name'}
        self.base_test_EDIT(url, data)

    def test_exercise_permission_DELETE(self) -> None:
        url_1 = reverse('workout:exercise',
                        kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                        )
        url_2 = reverse('workout:exercise',
                        kwargs=dict(training_id=str(self.training_1_0.id), exercise_id=str(self.exercise_1_1_1.id))
                        )
        self.base_test_DELETE(url_1, url_2)

    def test_exercise_permission_EDIT_special(self) -> None:
        url_order = reverse('workout:exercise_order',
                            kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                            )
        data_order = {'index': 1}

        self.login(self.person_0)

        response_order = self.client.patch(url_order, data_order)
        self.assertEqual(status.HTTP_200_OK, response_order.status_code)

        self.login(self.person_1)

        response_order_2 = self.client.patch(url_order, data_order)

        for response in [response_order_2]:
            self.assertEqual(status.HTTP_403_FORBIDDEN, response.status_code)

    def test_training_active_permission_GET(self) -> None:
        url = reverse('workout:training_active', kwargs=dict(training_id=str(self.training_0_0.id)))
        self.base_test_VIEW(url)

    def test_set_one_overload_permission_EDIT(self) -> None:
        url = reverse('workout:training_active_set_one_overload',
                      kwargs=dict(training_active_id=str(self.training_active_0.id)))
        data = dict(exercise_id=str(self.exercise_0_0.id), value=50)
        self.base_test_EDIT(url, data, patch=False)

    def test_set_multiple_overloads_permission_edit(self) -> None:
        url = reverse('workout:training_active_set_multiple_overloads',
                      kwargs=dict(training_active_id=str(self.training_active_0.id)))
        data = [
            dict(exercise_id=str(self.exercise_0_0.id), value=50),
            dict(exercise_id=str(self.exercise_0_1.id), value=75),
        ]
        self.base_test_EDIT(url, data, patch=False)

    def test_finish_training_active_permission_GET(self) -> None:
        url = reverse('workout:training_active_finish', kwargs=dict(training_active_id=str(self.training_active_0.id)))
        self.base_test_VIEW(url)