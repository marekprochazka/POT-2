from core.models.person import Person


def get_logged_person(request) -> (Person, None):
    try:
        return request.user.person
    except AttributeError:
        return None
