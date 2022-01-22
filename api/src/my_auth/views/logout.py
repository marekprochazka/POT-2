from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from core.views.base import BaseAPIView


class LogoutView(BaseAPIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        status, message = self.logged_person.logout()
        return Response(message, status)
