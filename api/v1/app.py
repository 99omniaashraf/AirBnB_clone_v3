#!/usr/bin/python3
"""
The RESTFUL API for the app 
"""

from flask import Flask, jsonify
from flask_cors import CORS
from os import getenv
from api.v1.views import app_views
from models import storage

app = Flask(__name__)
app.url_map.strict_slashes = False
app.reqister_blueprint(app_views)
CORS(app, resources={r"/*": {"origins": "0.0.0.0"}})
host = getenv("HBNB_API_HOST", "0.0.0.0")
port = getenv("HBNB_API_PORT", "5000")


@app.teardown_appcontext
def teardown_db(exception):
    """Cleanup operation"""
    storage.close()


@app.errorhandler(404)
def page_not_found(error):
    """404 error handler"""
    return jsonify({"error": "Not found"}), 404


if __name__ == "__main__":
    app.run(host=host, port=port, threaded=True, debug=True)
