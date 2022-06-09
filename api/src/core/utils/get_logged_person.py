from core.models.person import Person
from typing import Union


def get_logged_person(request) -> Union[Person, None]:
    try:
        return request.user.person
    except AttributeError:
        return None
