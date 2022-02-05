from django.conf import settings


def get_lang(request) -> str:
    return request.headers.get('Content-Language') if request else settings.LANGUAGE_CODE
