from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.exceptions import ValidationError
from django.contrib.auth import password_validation, authenticate
from django.core.exceptions import ValidationError as DjangoValidationError
from django.utils.translation import gettext_lazy as _
from django.db import transaction
from rest_framework.authtoken.models import Token

from core.utils.token import get_or_create_token


class BaseUserAuthSerializer(serializers.Serializer):
    token = None

    def to_representation(self, instance):
        data = {'token': self.token}
        return data


class UserRegisterSerializer(BaseUserAuthSerializer):
    username = serializers.CharField(write_only=True)
    email = serializers.EmailField()
    password1 = serializers.CharField(write_only=True)
    password2 = serializers.CharField(write_only=True)

    token = None

    def validate(self, attrs):
        validated_data = super(UserRegisterSerializer, self).validate(attrs)

        email = validated_data.get('email')
        if User.objects.filter(username=email).exists():
            raise ValidationError(detail=dict(username=_('This email is already used as a username.')))

        if validated_data.get('password1') != validated_data.get('password2'):
            raise ValidationError(detail=dict(password2=_('Password mismatch.')))

        try:
            password_validation.validate_password(validated_data.get('password1'))
        except DjangoValidationError as e:
            raise ValidationError(detail=dict(password1=e.messages[0]))

        return validated_data

    @transaction.atomic
    def create(self, validated_data):
        user: User = User()
        user.first_name = validated_data.get('username')
        user.username = validated_data.get('email')
        user.set_password(validated_data.get('password1'))
        user.save()
        self.token = user.person.token.key
        return user


class UserLoginSerializer(BaseUserAuthSerializer):
    username = serializers.EmailField()
    password = serializers.CharField(write_only=True)

    def validate(self, attrs):
        validated_data = super().validate(attrs)
        user = authenticate(username=validated_data.get('username'), password=validated_data.get('password'))
        if not user:
            raise ValidationError(detail=dict(username=_("Login failed"), password=_("Login failed")))
        validated_data.update({'user': user})
        self.token = user.person.token.key
        return validated_data
