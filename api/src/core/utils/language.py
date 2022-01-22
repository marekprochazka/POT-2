from django.conf import settings


def get_lang(request):
    return request.headers.get('Content-Language') if request else settings.LANGUAGE_CODE
