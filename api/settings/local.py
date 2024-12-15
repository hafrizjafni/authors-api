from .base import * # noqa
from .base import env

SECRET_KEY = env(
    "DJANGO_SECRET_KEY",
    default="VETpTJ-gu-oRd5r1o2mZIJhiPg0IKPCMut3tDJLtJdpzv8C675o",
)

DEBUG = True

ALLOWED_HOSTS = []

CSRF_TRUSTED_ORIGINS = ["http://localhost:8080"]
