from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework import status

from core.views.base import BaseAPIView
from my_auth.serializers.user import UserRegisterSerializer
from django.contrib.auth import login, authenticate


class RegisterView(CreateAPIView, BaseAPIView):
    serializer_class = UserRegisterSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
