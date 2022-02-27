from rest_framework import status

from core.tests.base import BaseTestCase
from django.urls import reverse


class PersonCreateTestCase(BaseTestCase):

    # tests, if persons are properly created by signal
    def test_person_creation(self):
        self.assertNotEqual(self.person_0, None)
        self.assertNotEqual(self.person_1, None)
        self.assertNotEqual(self.person_2, None)
        self.assertEqual(self.person_none, None)

    def test_person_upload_picture(self):
        url = reverse('core:profile_picture')
        response_1 = self.client.post(url)

        self.login(self.person_0)
        response_2 = self.client.post(url)

        self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_1.status_code)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_2.status_code)

    def test_person_get_picture(self):
        url = reverse('core:profile_picture')
        response_1 = self.client.get(url)

        self.login(self.person_0)
        response_2 = self.client.get(url)

        self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_1.status_code)
        self.assertEqual(status.HTTP_200_OK, response_2.status_code)
        self.assertEqual(None, response_2.data.get('profile_picture'))
