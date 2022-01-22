from core.tests.base import BaseTestCase
from django.urls import reverse
from rest_framework import status


class AuthTestCase(BaseTestCase):
    registration_data = None
    registration_data_wrong_1 = None
    registration_data_wrong_2 = None

    login_data = None
    login_data_wrong_1 = None
    login_data_wrong_2 = None

    def setUp(self) -> None:
        super(AuthTestCase, self).setUp()
        self.setup_data()

    def setup_data(self):
        self.registration_data = {
            'username': 'Zbynek',
            'email': 'zbynek@email.com',
            'password1': 'megaEpicPassword69',
            'password2': 'megaEpicPassword69'
        }
        self.registration_data_wrong_1 = {
            'username': 'Zbynek',
            'email': 'zbynek@email.com',
            'password1': 'megaEpicPassword69',
            'password2': 'megaEpicPassword68'
        }
        self.registration_data_wrong_2 = {
            'username': 'Zbynek',
            'email': 'zbynek',
            'password1': 'megaEpicPassword69',
            'password2': 'megaEpicPassword68'
        }
        self.login_data = {
            'username': self.person_0.email,
            'password': 'myEpicPassword'
        }
        self.login_data_wrong_1 = {
            'username': self.person_0.email,
            'password': 'wrongPassword'
        }
        self.login_data_wrong_2 = {
            'username': self.person_0.email,
            'password': 'wrongPassword'
        }

    def test_registration(self):
        url = reverse('my_auth:register')

        # Ok registration
        response_1 = self.client.post(url, self.registration_data)
        self.assertEqual(status.HTTP_201_CREATED, response_1.status_code)
        self.assertEqual(self.registration_data.get('username'), response_1.data.get('username'))
        self.assertEqual(self.registration_data.get('email'), response_1.data.get('email'))

        # Already exist
        response_2 = self.client.post(url, self.registration_data)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_2.status_code)

        # Passwords not same
        response_3 = self.client.post(url, self.registration_data_wrong_1)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_3.status_code)

        # No email
        response_4 = self.client.post(url, self.registration_data_wrong_2)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_4.status_code)

    def test_login(self):
        url = reverse('my_auth:login')

        # Ok login
        response_1 = self.client.post(url, self.login_data)
        self.assertEqual(status.HTTP_201_CREATED, response_1.status_code)
        self.assertEqual(self.person_0.token.key, response_1.data.get('token'))

        # Wrong password
        response_2 = self.client.post(url, self.login_data_wrong_1)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_2.status_code)

        # Wrong email
        response_3 = self.client.post(url, self.login_data_wrong_2)
        self.assertEqual(status.HTTP_400_BAD_REQUEST, response_3.status_code)

    def test_login_and_logout(self):
        url_login = reverse('my_auth:login')
        url_logout = reverse('my_auth:logout')

        # login

        token = self.client.post(url_login, self.login_data).data.get('token')
        self.assertEqual(self.person_0.token.key, token)
        # logout
        self.setup_api_token(token)
        response_1 = self.client.get(url_logout)
        self.assertEqual(status.HTTP_200_OK, response_1.status_code)
        self.assertNotEqual(self.person_0.token, token)

        # logout again
        response_2 = self.client.get(url_logout)
        self.assertEqual(status.HTTP_401_UNAUTHORIZED, response_2.status_code)
