"""empty message

Revision ID: 14a3a19da708
Revises: 143190a63f1c
Create Date: 2022-11-06 22:34:00.477414

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = '14a3a19da708'
down_revision = '143190a63f1c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('stats')
    op.drop_table('games')
    op.drop_table('arenas')
    op.drop_table('players_teams')
    op.drop_table('players')
    op.drop_table('teams')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('teams',
    sa.Column('name', sa.VARCHAR(length=75), autoincrement=False, nullable=False),
    sa.Column('location', sa.VARCHAR(length=100), autoincrement=False, nullable=False),
    sa.Column('mascot', sa.VARCHAR(length=100), autoincrement=False, nullable=True),
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('team_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('conference', sa.VARCHAR(length=25), server_default=sa.text("''::character varying"), autoincrement=False, nullable=False),
    sa.PrimaryKeyConstraint('id', name='team_pkey'),
    sa.UniqueConstraint('name', name='team_name_key'),
    postgresql_ignore_search_path=False
    )
    op.create_table('players',
    sa.Column('first_name', sa.VARCHAR(length=100), autoincrement=False, nullable=False),
    sa.Column('last_name', sa.VARCHAR(length=100), autoincrement=False, nullable=False),
    sa.Column('number', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('position', sa.VARCHAR(length=200), autoincrement=False, nullable=True),
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('player_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('stats_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['stats_id'], ['stats.id'], name='players_stats_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='player_pkey'),
    postgresql_ignore_search_path=False
    )
    op.create_table('players_teams',
    sa.Column('players_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('teams_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.ForeignKeyConstraint(['players_id'], ['players.id'], name='players_teams_players_id_fkey'),
    sa.ForeignKeyConstraint(['teams_id'], ['teams.id'], name='players_teams_teams_id_fkey'),
    sa.PrimaryKeyConstraint('players_id', 'teams_id', name='players_teams_pkey')
    )
    op.create_table('arenas',
    sa.Column('location', sa.VARCHAR(length=150), autoincrement=False, nullable=False),
    sa.Column('name', sa.VARCHAR(length=200), server_default=sa.text("'none'::character varying"), autoincrement=False, nullable=True),
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('arena_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('team_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['team_id'], ['teams.id'], name='arenas_team_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='arena_pkey'),
    sa.UniqueConstraint('location', name='arena_location_key'),
    postgresql_ignore_search_path=False
    )
    op.create_table('games',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('home_team', sa.VARCHAR(length=50), autoincrement=False, nullable=True),
    sa.Column('away_team', sa.VARCHAR(length=50), autoincrement=False, nullable=True),
    sa.Column('winner', sa.VARCHAR(length=50), autoincrement=False, nullable=True),
    sa.Column('played_at', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['played_at'], ['arenas.id'], name='games_played_at_fkey'),
    sa.PrimaryKeyConstraint('id', name='game_pkey')
    )
    op.create_table('stats',
    sa.Column('ppg', postgresql.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True),
    sa.Column('avg_min_played', postgresql.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True),
    sa.Column('fg_percentage', postgresql.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True),
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.PrimaryKeyConstraint('id', name='stats_pkey')
    )
    # ### end Alembic commands ###