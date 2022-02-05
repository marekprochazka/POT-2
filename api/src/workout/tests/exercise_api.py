from django.urls import reverse
from rest_framework import status

from workout.tests.base import BaseWorkoutTestCase


class ExerciseApiTestCases(BaseWorkoutTestCase):
    def setUp(self) -> None:
        super(ExerciseApiTestCases, self).setUp()
        self.setup_training_plans()
        self.setup_trainings()
        self.setup_overload_types()

    def test_add_exercise(self) -> None:
        self.login(self.person_0)
        url = reverse('workout:exercise', kwargs=dict(training_id=str(self.training_0_0.id)))
        data = {'exercise_name': 'epic exercise', 'overload_type': str(self.overload_type_0.id)}
        response = self.client.post(url, data)

        self.assertEqual(status.HTTP_201_CREATED, response.status_code)
        self.assertEqual(1, self.training_0_0.num_exercises)

    def test_get_exercises_list(self) -> None:
        self.login(self.person_0)
        self.exercise_0_0 = self.training_0_0.add_exercise(exercise_name='exercise_0_0',
                                                           overload_type=self.overload_type_0)
        self.exercise_0_1 = self.training_0_0.add_exercise(exercise_name='exercise_0_1',
                                                           overload_type=self.overload_type_0)

        url = reverse('workout:exercise', kwargs=dict(training_id=str(self.training_0_0.id)))
        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(2, len(response.data))
        self.assertEqual(str(self.exercise_0_0.id), response.data[0].get('id'))

    def test_get_exercise_detail(self) -> None:
        self.login(self.person_0)
        self.exercise_0_0 = self.training_0_0.add_exercise(exercise_name='exercise_0_0',
                                                           overload_type=self.overload_type_0)

        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id)))
        response = self.client.get(url)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(str(self.exercise_0_0.id), response.data.get('id'))

    def test_update_exercise(self) -> None:
        self.login(self.person_0)
        self.exercise_0_0 = self.training_0_0.add_exercise(exercise_name='exercise_0_0',
                                                           overload_type=self.overload_type_0)

        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id)))
        data = dict(exercise_name='new_name')
        response = self.client.patch(url, data)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual('new_name', self.training_0_0.get_all_exercises().get(id=self.exercise_0_0.id).exercise_name)

    def test_delete_exercise(self) -> None:
        self.login(self.person_0)
        self.exercise_0_0 = self.training_0_0.add_exercise(exercise_name='exercise_0_0',
                                                           overload_type=self.overload_type_0)

        url = reverse('workout:exercise',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id)))
        response = self.client.delete(url)

        self.assertEqual(status.HTTP_204_NO_CONTENT, response.status_code)
        self.assertEqual(0, self.training_0_0.num_exercises)

    def test_change_order(self) -> None:
        self.login(self.person_0)
        self.setup_exercises()

        url = reverse('workout:exercise_order',
                      kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_0.id))
                      )
        data = dict(index=2)
        response = self.client.patch(url, data)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(self.exercise_0_1, self.training_0_0.get_all_exercises()[0])
        self.assertEqual(self.exercise_0_2, self.training_0_0.get_all_exercises()[1])
        self.assertEqual(self.exercise_0_0, self.training_0_0.get_all_exercises()[2])

        url_2 = reverse('workout:exercise_order',
                        kwargs=dict(training_id=str(self.training_0_0.id), exercise_id=str(self.exercise_0_2.id))
                        )
        data_2 = dict(index=0)
        response_2 = self.client.patch(url_2, data_2)

        self.assertEqual(status.HTTP_200_OK, response_2.status_code)
        self.assertEqual(self.exercise_0_2, self.training_0_0.get_all_exercises()[0])
        self.assertEqual(self.exercise_0_1, self.training_0_0.get_all_exercises()[1])
        self.assertEqual(self.exercise_0_0, self.training_0_0.get_all_exercises()[2])

        data_3 = dict(index=10)
        response_3 = self.client.patch(url_2, data_3)

        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_3.status_code)

    def test_add_overload(self) -> None:
        self.login(self.person_0)
        self.setup_exercises()

        url = reverse('workout:exercise_overload',
                      kwargs=dict(exercise_id=str(self.exercise_0_0.id))
                      )
        data = dict(value=15)
        response = self.client.post(url, data)

        self.assertEqual(status.HTTP_200_OK, response.status_code)
        self.assertEqual(15.0, self.training_0_0.get_all_exercises().get(id=self.exercise_0_0.id).last_overload_value)

        data_2 = dict(value=18)
        response_2 = self.client.post(url, data_2)

        self.assertEqual(status.HTTP_200_OK, response_2.status_code)
        self.assertEqual(18.0, self.training_0_0.get_all_exercises().get(id=self.exercise_0_0.id).last_overload_value)
        self.assertEqual([15.0, 18.0],
                         self.training_0_0.get_all_exercises().get(id=self.exercise_0_0.id).overload_history_list)

    def test_remove_overload(self) -> None:
        self.login(self.person_0)
        self.setup_exercises()
        self.exercise_0_0.add_overload_value(15)
        self.exercise_0_0.add_overload_value(18)
        self.exercise_0_0.add_overload_value(20)

        url = reverse('workout:exercise_overload',
                      kwargs=dict(exercise_id=str(self.exercise_0_0.id), index=0)
                      )
        response = self.client.delete(url)

        self.assertEqual(status.HTTP_204_NO_CONTENT, response.status_code)
        self.assertEqual([18.0, 20.0],
                         self.training_0_0.get_all_exercises().get(id=self.exercise_0_0.id).overload_history_list)
