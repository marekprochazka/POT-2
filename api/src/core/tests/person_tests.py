from core.tests.base import BaseTestCase


class PersonCreateTestCase(BaseTestCase):

    # tests, if persons are properly created by signal
    def test_person_creation(self):
        self.assertNotEqual(self.person_0, None)
        self.assertNotEqual(self.person_1, None)
        self.assertNotEqual(self.person_2, None)
        self.assertEqual(self.person_none, None)
