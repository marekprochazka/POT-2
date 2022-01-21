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

    def create_person(self, data: dict) -> None:
        tmp_user = User(username=data['username'], password=data['password'], email=data['email'])
        tmp_user.save()

    def setup_persons(self) -> None:
        for name in ['person_0', 'person_1', 'person_2']:
            self.create_person(
                data={'username': name, 'password': 'myEpicPassword', 'email': 'email@email.cz'})
        self.person_0 = Person.objects.filter(user__username='person_0').first()
        self.person_1 = Person.objects.filter(user__username='person_1').first()
        self.person_2 = Person.objects.filter(user__username='person_2').first()
