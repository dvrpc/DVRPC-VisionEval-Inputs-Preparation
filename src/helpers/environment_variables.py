import os
from dotenv import find_dotenv, load_dotenv


load_dotenv(find_dotenv())

DATABASE_URL = os.getenv("DATABASE_URL")
SUPERUSER_DATABASE_URL = os.getenv("SUPERUSER_DATABASE_URL")
GOOGLE_DRIVE_FOLDER = os.getenv("GOOGLE_DRIVE_FOLDER")
