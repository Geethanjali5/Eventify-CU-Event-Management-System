from sqlalchemy import create_engine, text
from sqlalchemy.pool import NullPool

class QueryExecutor:

    def __init__(self, DATABASE_URL):
        self.engine = create_engine(DATABASE_URL)
        self.connection = self.engine.connect()

    def _execute_fetch_query(self, query, params=None):
        result = self.connection.execute(query, params)
        results_as_dict = result.mappings().all()
        return results_as_dict

    def _execute_query(self, query, params=None):
        result = self.connection.execute(query, params)
        self.connection.commit()
        return result
    