from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Player(db.Model):
    __tablename__ = 'players'
    first_name = db.Column(db.String(100), nullable=False)
    last_name = db.Column(db.String(100), nullable=False)
    number = db.Column(db.Integer, nullable=False)
    position = db.Column(db.String(200))
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    stats_id = db.Column(db.Integer, db.ForeignKey('stats.id'))
    
    def __init__(self, first_name:str, last_name:str, number:int):
        self.first_name = first_name
        self.last_name = last_name
        self.number = number
    
    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'number': self.number,
            'position': self.position,
            'stats_id': self.stats_id
        }
    

class Stat(db.Model):
    __tablename__ = 'stats'
    ppg = db.Column(db.Float )
    avg_min_played = db.Column(db.Float )
    fg_percentage = db.Column(db.Float )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

class Arena(db.Model):
    __tablename__ = 'arenas'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(200))
    location = db.Column(db.String(150), nullable=False)
    team_id = db.Column(db.Integer, db.ForeignKey('teams.id'), nullable=False)
    
class Team(db.Model):
    __tablename__ = 'teams'
    name = db.Column(db.String(75), nullable=False)
    location = db.Column(db.String(100), nullable=False)
    mascot = db.Column(db.String(100))
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    conference = db.Column(db.String(25), nullable=False)
    
class Game(db.Model):
    __tablename__ = 'games'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    home_team = db.Column(db.String(50), nullable=False)
    away_team = db.Column(db.String(50), nullable=False)
    winner = db.Column(db.String(50), nullable=False)
    played_at = db.Column(db.Integer, db.ForeignKey('arenas.id'), nullable=False)


class PlayerTeam(db.Model):
    __tablename__ = 'players_teams'
    players_id = db.Column(db.Integer, db.ForeignKey('players.id'), primary_key=True)
    teams_id = db.Column(db.Integer, db.ForeignKey('teams.id'), primary_key=True)