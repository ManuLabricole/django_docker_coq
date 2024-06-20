import os

from split_settings.tools import include, optional  # noqa

# include("components/base.py", "components/database.py", optional("components/local_settings.py"))

if os.getenv("DJANGO_ENV") == "development":
    include("development.py")
else:
    include("production.py")
