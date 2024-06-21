import os

from django.contrib.auth.models import User
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = "Create a superuser from environment variables"

    def handle(self, *args, **options):
        username = os.getenv("DJANGO_SUPERUSER_USERNAME")
        email = os.getenv("DJANGO_SUPERUSER_EMAIL")
        password = os.getenv("DJANGO_SUPERUSER_PASSWORD")

        if not username or not email or not password:
            self.stderr.write(
                "❌ Error: Missing environment variables for superuser creation"
            )
            return

        if User.objects.filter(username=username).exists():
            self.stdout.write("ℹ️  Superuser already exists.")
        else:
            User.objects.create_superuser(
                username=username, email=email, password=password
            )
            self.stdout.write("✅ Superuser created successfully.")
