from .base import *  # noqa: F403, F401
from .base import env

DEBUG = True
ALLOWED_HOSTS = ["*"]
SECRET_KEY = NotImplemented


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": env("POSTGRES_DB"),
        "USER": env("POSTGRES_USER"),
        "PASSWORD": env("POSTGRES_PASSWORD"),
        "HOST": env("POSTGRES_HOST"),
        "PORT": env("POSTGRES_PORT"),
    }
}

A = "kbuerfuberferuberferuberferuberferuberferuberferuberferuberferuberferuberferuberferuberferuberferuberferuberfeuberferuberferuberferuberferuberferruberfer"
