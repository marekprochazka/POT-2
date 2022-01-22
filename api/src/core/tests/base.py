from django.contrib.auth.models import User
from rest_framework.test import APITestCase

from core.models import Person


class BaseTestCase(APITestCase):
    person_0: Person = None
    person_1: Person = None
    person_2: Person = None
    person_none: Person = None

    def setUp(self) -> None:
        self.setup_persons()

    def create_user(self, data: dict) -> None:
        tmp_user = User(username=data['username'])
        tmp_user.set_password(data['password'])
        tmp_user.save()

    def setup_persons(self) -> None:
        for name in ['person_0@email.cz', 'person_1@email.cz', 'person_2@email.cz']:
            self.create_user(
                data={'username': name, 'password': 'myEpicPassword'})
        self.person_0 = Person.objects.filter(user__username='person_0@email.cz').first()
        self.person_1 = Person.objects.filter(user__username='person_1@email.cz').first()
        self.person_2 = Person.objects.filter(user__username='person_2@email.cz').first()

    def setup_api_token(self, token: str):
        self.client.credentials(HTTP_AUTHORIZATION='TOKEN {}'.format(token))
