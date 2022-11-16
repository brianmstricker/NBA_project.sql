from flask import Blueprint, jsonify, abort, request
# from ..models import 

bp = Blueprint('teams', __name__, url_prefix='/teams')