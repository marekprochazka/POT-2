from django.contrib.auth.models import User
from rest_framework.test import APITestCase

from core.models import Person
from workout.models import TrainingPlan, Training


class BaseTestCase(APITestCase):
    person_0: Person = None
    person_1: Person = None
    person_2: Person = None
    person_none: Person = None

    training_plan_0: TrainingPlan = None
    training_plan_1: TrainingPlan = None
    training_plan_2: TrainingPlan = None

    training_0_0: Training = None
    training_0_1: Training = None
    training_0_2: Training = None
    training_1_0: Training = None

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

    def setup_training_plans(self) -> None:
        self.training_plan_0 = self.person_0.add_plan({'plan_name': 'training_plan_0'})
        self.training_plan_1 = self.person_1.add_plan({'plan_name': 'training_plan_1'})
        self.training_plan_2 = self.person_2.add_plan({'plan_name': 'training_plan_2'})

    def setup_trainings(self) -> None:
        self.training_0_0 = self.training_plan_0.add_training({'name': 'training_0_0'})
        self.training_0_1 = self.training_plan_0.add_training({'name': 'training_0_1'})
        self.training_0_2 = self.training_plan_0.add_training({'name': 'training_0_2'})
        self.training_1_0 = self.training_plan_1.add_training({'name': 'training_1_0'})
