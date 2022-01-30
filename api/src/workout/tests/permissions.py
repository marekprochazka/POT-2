from workout.tests.base import BaseWorkoutTestCase

from django.urls import reverse
from rest_framework import status


class PermissionsTestCases(BaseWorkoutTestCase):
    def setUp(self) -> None:
        super(PermissionsTestCases, self).setUp()
        self.setup_training_plans()
        self.setup_trainings()
        self.setup_exercises()
        self.setup_overload_types()

    def base_test_VIEW(self, url: str) -> None:
        self.login(self.person_0)

        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)

        self.login(self.person_1)

        response_2 = self.client.get(url)

        self.assertEqual(status.HTTP_403_FORBIDDEN, response_2.status_code)

    def test_training_plan_permission_VIEW(self) -> None:
        url = reverse('workout:training_plan',
                      kwargs=dict(training_plan_id=str(self.training_plan_0.id))
                      )
        self.base_test_VIEW(url)

    def test_training_permission_VIEW(self) -> None:
        url = reverse('workout:training',
                      kwargs=dict(training_plan_id=str(self.training_plan_0.id), training_id=str(self.training_0_0.id))
                      )
        self.base_test_VIEW(url)

    def test_exercise_permission_VIEW(self) -> None:
        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                      )
        self.base_test_VIEW(url)

    def test_exercise_permission_EDIT(self) -> None:
        url_add_overload = reverse('workout:exercise_overload', kwargs=dict(exercise_id=str(self.exercise_0_0.id)))
        data_add_overload = {'value': 15}
        url_remove_overload = reverse('workout:exercise_overload',
                                      kwargs=dict(exercise_id=str(self.exercise_0_0.id), index=0))
        url_order = reverse('workout:exercise_order',
                            kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                            )
        data_order = {'index': 1}

        self.login(self.person_0)

        response_add_overload = self.client.post(url_add_overload, data_add_overload)
        self.assertEqual(status.HTTP_200_OK, response_add_overload.status_code)

        response_remove_overload = self.client.delete(url_remove_overload)
        self.assertEqual(status.HTTP_204_NO_CONTENT, response_remove_overload.status_code)

        response_order = self.client.patch(url_order, data_order)
        self.assertEqual(status.HTTP_200_OK, response_order.status_code)

        self.login(self.person_1)
        response_add_overload_2 = self.client.post(url_add_overload, data_add_overload)
        response_remove_overload_2 = self.client.delete(url_remove_overload)
        response_order_2 = self.client.patch(url_order, data_order)

        for response in [response_add_overload_2, response_remove_overload_2, response_order_2]:
            self.assertEqual(status.HTTP_403_FORBIDDEN, response.status_code)
