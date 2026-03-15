import os

from flask import Flask
from flask_cors import CORS


def create_app():
    app = Flask(__name__)

    from .routes import api
    app.register_blueprint(api)

    # Allow overriding CORS origins via env (comma-separated). Defaults to local dev + known frontend.
    origins = os.getenv("CORS_ORIGINS", "http://localhost:5173,https://neuralspot.vercel.app")
    origins = [o.strip() for o in origins.split(",") if o.strip()]
    CORS(app, origins=origins)

    return app