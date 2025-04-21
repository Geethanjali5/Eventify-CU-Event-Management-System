from flask import Flask
from dotenv import load_dotenv
from query_executor import QueryExecutor
import os

load_dotenv()
query_executor = QueryExecutor(os.getenv('DATABASE_URL'))

app = Flask(__name__, static_url_path='', static_folder='web/static', template_folder='web/template')

