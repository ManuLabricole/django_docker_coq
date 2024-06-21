import os
from pathlib import Path

from split_settings.tools import include, optional  # noqa

# include("components/base.py", "components/database.py", optional("components/local_settings.py"))

if os.getenv("DJANGO_ENV") == "development":
    include("development.py")
else:
    include("production.py")

print("DJANGO SETTINGS MODULE:", os.getenv("DJANGO_SETTINGS_MODULE"))
print("DJANGO ENV:", os.getenv("DJANGO_ENV"))
print("SECRET_KEY:", os.getenv("SECRET_KEY"))
print("DEBUG:", os.getenv("DEBUG"))
print("ALLOWED_HOSTS:", os.getenv("ALLOWED_HOSTS"))
