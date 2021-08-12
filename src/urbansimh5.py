from src.environment_variables import DATABASE_URL
import pandas as pd
from pandas.core.frame import DataFrame
from database import Database

h5data = pd.HDFStore('/Users/fakram/Downloads/results_dvrpc_run_570_run_results.h5',mode = 'r')

#load dataframe into postgreSQL using Database.py 
print(h5data.keys())

db = Database()
for tablename in h5data.keys():
    # generate tableame that doesnt have slashes or start with Num
   new_tablename = tablename.replace("/", "_")
   new_tablename = "usim_run570" + new_tablename
   db.import_dataframe(h5data.get(tablename), new_tablename)



