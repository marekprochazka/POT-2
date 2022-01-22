from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token


def get_or_create_token(user: User) -> Token:
    try:
        token = Token.objects.get(user=user)
    except Token.DoesNotExist:
        token = Token(user=user)
        token.save()
    return token
