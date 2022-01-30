import abc
from core.models import Person


class BaseRight(object):
    VIEW = 'view'
    EDIT = 'edit'
    DELETE = 'delete'


class PermissionHandler(abc.ABC):
    instance = None
    person: Person = None
    i_am_owner: bool = None
    i_have_access: bool = None

    @abc.abstractmethod
    def __init__(self, person: Person, instance) -> None:
        self.person = person
        self.instance = instance

    def _right_view(self) -> bool:
        return self.i_have_access or self.i_am_owner

    def _right_edit(self) -> bool:
        return self.i_am_owner

    def _right_delete(self) -> bool:
        return self.i_am_owner

    def _get_mapping(self) -> dict:
        return {
            BaseRight.VIEW: self._right_view,
            BaseRight.EDIT: self._right_edit,
            BaseRight.DELETE: self._right_delete,
        }

    def has_right(self, right: str) -> bool:
        try:
            return self._get_mapping().get(right)()
        except TypeError:
            return False

    @classmethod
    def get_rights(cls, person: Person, instance) -> dict:
        handler = cls(person, instance)

        def get_result(right) -> bool:
            return handler.has_right(right)

        return {
            right: get_result(right) for right in handler._get_mapping().keys()
        }

    @classmethod
    def person_has_object_permission(cls, person: Person, instance, right: str) -> bool:
        handler = cls(person, instance)
        return handler.has_right(right)

    @classmethod
    def person_has_permission(cls, person, right) -> bool:
        return True
