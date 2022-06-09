from .base import *
import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration
import dj_database_url

DEBUG = True
DATABASES = {
    'default': dj_database_url.config(conn_max_age=600, ssl_require=True)

}

sentry_sdk.init(
    dsn=os.environ['SENTRY_DSN'],
    integrations=[DjangoIntegration()]
)
