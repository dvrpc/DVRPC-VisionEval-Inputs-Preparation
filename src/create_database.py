from src.environment_variables import DATABASE_URL
from src.database import Database


if __name__ == "__main__":

    db = Database()

    # Create the database if it doesn't exist yet
    if not db.exists():
        db.execute(f"CREATE DATABASE {db.db_name};", autocommit=True)

    # Make sure the PostGIS extension is loaded in the new database
    db.execute(f"CREATE EXTENSION IF NOT EXISTS postgis")

    print("Done")
