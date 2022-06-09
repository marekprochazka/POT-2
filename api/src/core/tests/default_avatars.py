from django.urls import reverse
from rest_framework import status

from core.tests.base import BaseTestCase


class DefaultAvatarTestCase(BaseTestCase):
    def test_get_default_avatars(self):
        url = reverse('core:default_avatars')
        response_1 = self.client.get(url)

        self.login(self.person_1)

        response_2 = self.client.get(url)

        self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_1.status_code)
        self.assertEqual(status.HTTP_200_OK, response_2.status_code)
