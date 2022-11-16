from flask import Blueprint, jsonify, abort, request
from ..models import Player, db

bp = Blueprint('players', __name__, url_prefix='/players')

# ORM approach - index 
@bp.route('', methods=['GET'])
def index():
    players = Player.query.order_by('id').all()
    result = []
    for p in players:
        result.append(p.serialize())
    return jsonify(result)

#shows all players - raw sql
# @bp.route('', methods=['GET'])
# def index():
#     result = []
#     engine = db.get_engine()
#     with engine.connect() as conn:
#         rows = conn.execute('SELECT id, first_name, last_name FROM players ORDER BY id;')
#         for r in rows:
#             result.append({'id': r[0], 'first_name': r[1], 'last_name': r[2]})
#     return jsonify(result)

#show specific player - raw sql
# @bp.route('/<int:id>', methods=['GET'])
# def show(id:int):
#     result = []
#     engine = db.get_engine()
#     with engine.connect() as conn:
#         rows = conn.execute(f'SELECT id, first_name, last_name, number, position, stats_id FROM players WHERE id = {id};')
#         for r in rows:
#             result.append({'id': r[0], 'first_name': r[1], 'last_name': r[2], 'number': r[3], 'position': r[4], 'stats_id': r[5]})
        
#     return jsonify(result)

# ORM show specific player
@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    p = Player.query.get_or_404(id)
    return jsonify(p.serialize())

# search for player last name, cant get it to work...
@bp.route('/<last_name>', methods=['GET'])
def search(last_name):
    pl = Player.query.get_or_404(last_name)
    # pl = Player.query.filter_by(last_name=last_name).first()
    return jsonify(pl)

#create entry to players 
@bp.route('', methods=['POST'])
def create():
    if 'first_name' not in request.json or 'last_name' not in request.json or 'number' not in request.json:
        return abort(400)
    p = Player(
        first_name = request.json['first_name'],
        last_name=request.json['last_name'],
        number=request.json['number']
    )
    db.session.add(p)
    db.session.commit()
    return jsonify(p.serialize())

#delete 
@bp.route('/<int:id>', methods=['DELETE'])
def delete(id:int):
    p = Player.query.get_or_404(id)
    try:
        db.session.delete(p)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)
    
#update
@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id:int):
    p = Player.query.get_or_404(id)
    if 'first_name' not in request.json and 'last_name' not in request.json:
        return abort(400)
    else:
        p.first_name = request.json['first_name']  
        p.last_name = request.json['last_name']
    try:
        db.session.commit()
        return jsonify(p.serialize())
    except:
        return jsonify(False)