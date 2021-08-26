import pandas as pd

from src.helpers.database import Database
from src.helpers.environment_variables import DATABASE_URL


def load_h5_file(filepath: str):
    """
    - Load all sub-tables within the h5 file into SQL
    """

    # Connect to the database
    db = Database()

    # Read the H5 file
    h5data = pd.HDFStore(filepath, mode="r")

    # Iterate over each table within the file and import it into SQL
    for tablename in h5data.keys():

        # Make SQL tablename without slashes, in lowercase, and prefixed with 'usim_'
        # ... this table will be created within the 'extract' schema
        new_tablename = "extract.usim_" + tablename.replace("/", "_").lower()

        # Import the dataframe to SQL
        db.import_dataframe(h5data.get(tablename), new_tablename)