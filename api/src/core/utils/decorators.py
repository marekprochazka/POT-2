from rest_framework import status
from rest_framework.response import Response


def has_right(handler_class, instance_name: str, right: str):
    def decorator(function):
        def wrapper(self, request, *args, **kwargs):
            if getattr(self, instance_name) and self.logged_person:
                handler = handler_class(self.logged_person, getattr(self, instance_name))
                if handler.has_right(right):
                    return function(self, request, *args, **kwargs)
            return Response(status=status.HTTP_403_FORBIDDEN, data='Access denied')

        return wrapper

    return decorator
