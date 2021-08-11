from src.helpers.database import Database


def create_database():
    """
    - Create the database if it doesn't exist
    - Enable the postgis extension if it doesn't exist
    """
    db = Database()

    # Create the database if it doesn't exist yet
    if not db.exists():
        db.execute(f"CREATE DATABASE {db.db_name};", autocommit=True)

    # Make sure the PostGIS extension is loaded in the new database
    db.execute(f"CREATE EXTENSION IF NOT EXISTS postgis")

    # Make sure the schemas we want to use exist in the database
    for schema in ["extract", "transform", "staging"]:
        db.execute(f"CREATE SCHEMA IF NOT EXISTS {schema}")
