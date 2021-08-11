from pathlib import Path
from src.helpers.database import Database


def save_csv_files(folder: str):
    """
    - This function saves all tables defined within to CSV files
    """

    db = Database()

    # Iterate over all tables in the list of tables to dump
    tables_to_dump_to_csv = ["transform.bzone_to_azone"]

    for table in tables_to_dump_to_csv:

        # Get all rows and columns out of the database and into a pandas dataframe
        df = db.get_dataframe_from_query(f"SELECT * FROM {table}")

        # Build a filepath that uses the tablename (but omits the schema name)
        csv_filepath = Path(folder) / (table.split(".")[-1] + ".csv")

        # Save the data to the CSV filepath that was just defined
        df.to_csv(csv_filepath)
