from src.helpers.database import Database


def transform_tables():
    """
    - This function handles all of the SQL statements that need to
    be executed in order to transform raw data into the necessary
    VisionEval inputs
    """

    db = Database()

    # Create a table named 'bzone_to_azone' within the 'transform' schema
    # This table is a lookup table that matches BlockGrp IDs to PUMA IDs
    db.execute(
        """
        create table if not exists transform.bzone_to_azone as (
            select 
                b.geoid10 as bzone_id,
                p.geoid10 as azone_id
            from
                extract.limitedenglishproficiency_2017 b,
                extract.limitedengproficiencypuma_2017 p 
            where
                st_contains(
                    p.geom,
                    st_centroid(b.geom)
                )
            order by
                azone_id desc
        )
    """
    )
