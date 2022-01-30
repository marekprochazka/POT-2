from rest_framework.permissions import BasePermission

from core.utils.get_logged_person import get_logged_person


def get_class_for_right(handler, right):
    class Permission(BasePermission):
        def has_permission(self, request, view):
            logged_person = get_logged_person(request)
            return handler.person_has_permission(logged_person, right)

        def has_object_permission(self, request, view, obj):
            logged_person = get_logged_person(request)
            return handler.person_has_object_permission(logged_person, obj, right)

    return Permission
