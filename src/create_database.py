from src.environment_variables import DATABASE_URL
from src.database import Database


if __name__ == "__main__":

    db = Database()

    # Get the database name from the DATABASE_URL variable
    db_name = DATABASE_URL.split(r"/")[-1]

    # TODO: check if database exists first
    db.execute(f"CREATE DATABASE {db_name};", autocommit=True)

    # Make sure the PostGIS extension is loaded in the new database
    db.execute(f"CREATE EXTENSION IF NOT EXISTS postgis")

    print("Done")
