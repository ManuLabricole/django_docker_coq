import os

from split_settings.tools import include, optional

include("components/base.py", "components/database.py", optional("components/local_settings.py"))

if os.getenv("DJANGO_ENV") == "development":
    include("components/development.py")
else:
    include("components/production.py")
