from core.models import Person
from core.utils.permission_handler import PermissionHandler
from workout.models import TrainingPlan, Training, Exercise


class TrainingPLanPermissionHandler(PermissionHandler):
    instance: TrainingPlan = None

    def __init__(self, person: Person, instance: TrainingPlan) -> None:
        super(TrainingPLanPermissionHandler, self).__init__(person, instance)
        self.i_am_owner = self.instance.owner == self.person
        self.i_have_access = False


class TrainingPermissionHandler(PermissionHandler):
    instance: Training = None

    def __init__(self, person: Person, instance: Training) -> None:
        super(TrainingPermissionHandler, self).__init__(person, instance)
        self.i_am_owner = self.instance.training_plan.owner == self.person
        self.i_have_access = False


class ExercisePermissionHandler(PermissionHandler):
    instance: Exercise = None

    def __init__(self, person: Person, instance: Exercise) -> None:
        super(ExercisePermissionHandler, self).__init__(person, instance)
        self.i_am_owner = self.instance.training.training_plan.owner == self.person
        self.i_have_access = False
