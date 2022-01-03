from django.test import TestCase
from django.contrib.auth.models import User
from core.models.person import Person


# Tests if person instance is created on user creation
class PersonCreateTestCase(TestCase):

    def setUp(self):
        User.objects.create_user(username="Igor")
        User.objects.create_user(username="Zbysek")

    def test_person_creation(self):
        person1 = Person.objects.filter(user__username="Igor").first()
        person2 = Person.objects.filter(user__username="Zbysek").first()

        self.assertNotEqual(person1, None)
        self.assertNotEqual(person2, None)
