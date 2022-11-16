--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: arenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arenas (
    location character varying(150) NOT NULL,
    name character varying(200) DEFAULT 'none'::character varying,
    id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.arenas OWNER TO postgres;

--
-- Name: arenas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arenas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arenas_id_seq OWNER TO postgres;

--
-- Name: arenas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arenas_id_seq OWNED BY public.arenas.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    home_team character varying(50) NOT NULL,
    away_team character varying(50) NOT NULL,
    winner character varying(50) NOT NULL,
    played_at integer NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    number integer NOT NULL,
    "position" character varying(200),
    id integer NOT NULL,
    stats_id integer
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO postgres;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.players.id;


--
-- Name: players_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players_teams (
    players_id integer NOT NULL,
    teams_id integer NOT NULL
);


ALTER TABLE public.players_teams OWNER TO postgres;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats (
    ppg double precision,
    avg_min_played double precision,
    fg_percentage double precision,
    id integer NOT NULL
);


ALTER TABLE public.stats OWNER TO postgres;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO postgres;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    name character varying(75) NOT NULL,
    location character varying(100) NOT NULL,
    mascot character varying(100),
    id integer NOT NULL,
    conference character varying(25) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: arenas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arenas ALTER COLUMN id SET DEFAULT nextval('public.arenas_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
06338f319ff6
\.


--
-- Data for Name: arenas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arenas (location, name, id, team_id) FROM stdin;
San Francisco	Chase Center	1	1
Los Angeles	Crypto.com Arena	2	2
Dallas	American Airlines Center	3	3
Brooklyn	Barclays Center	4	4
Memphis	FedExForum	5	5
Orlando	Amway Center	6	6
Detroit	Little Caesars Arena	7	7
Houston	Toyota Center	8	8
Miami	FTX Arena	9	9
Chicago	United Center	10	10
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, home_team, away_team, winner, played_at) FROM stdin;
1	Warriors	Lakers	Warriors	1
2	Pistons	Magic	Pistons	7
3	Warriors	Magic	Warriors	1
4	Lakers	Bulls	Bulls	2
5	Lakers	Grizzlies	Grizzlies	2
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (first_name, last_name, number, "position", id, stats_id) FROM stdin;
Lebron	James	6	SF	7	\N
Russell	Westbrook	0	PG	8	\N
Anthony	Davis	3	PF	9	\N
Patrick	Beverley	21	PG	10	\N
Thomas	Bryant	31	C	11	\N
Stephen	Curry	30	PG	1	1
Luka	Doncic	77	PG	12	\N
Tyler	Dorsey	5	G	13	\N
Spencer	Dinwiddie	26	PG	14	\N
Javale	McGee	0	C	15	\N
Tim	Hardaway Jr.	11	SF	16	\N
Ja	Morant	12	PG	17	\N
Steven	Adams	4	C	18	\N
Desmond	Bane	22	SG	19	\N
Danny	Green	14	SF	20	\N
Jaren	Jackson Jr.	13	PF	21	\N
Devin	Booker	1	SG	22	\N
Chris	Paul	3	PG	23	\N
Mikal	Bridges	25	SF	24	\N
Jae	Crowder	99	PF	25	\N
Deandrea	Ayton	22	C	26	\N
Kevon	Looney	5	C	3	3
Jordan	Poole	3	SG	4	4
Klay	Thompson	11	SG	5	5
Andrew	Wiggins	22	SF	6	6
Draymond	Green	23	PF	2	2
\.


--
-- Data for Name: players_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players_teams (players_id, teams_id) FROM stdin;
1	1
1	11
6	1
2	1
3	1
4	1
5	1
7	2
8	2
9	2
10	2
11	2
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stats (ppg, avg_min_played, fg_percentage, id) FROM stdin;
30.8	34.3	48	1
9.6	28.6	59.2	2
6	22.9	60	3
17.9	29.1	45.7	4
12.3	25	34.6	5
17.3	33.1	43.8	6
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (name, location, mascot, id, conference) FROM stdin;
Warriors	San Francisco	none	1	West
Lakers	Los Angeles	none	2	West
Mavericks	Dallas	MavsMan	3	West
Nets	Brooklyn	none	4	East
Grizzlies	Memphis	Grizz	5	West
Magic	Orlando	Stuff the Magic Dragon	6	East
Pistons	Detroit	Hooper	7	East
Rockets	Houston	Clutch	8	West
Heat	Miami	Burnie	9	East
Bulls	Chicago	Benny the Bull	10	East
Team Lebron	Allstar	none	11	N/A
Team Durant	Allstar	none	12	N/A
\.


--
-- Name: arenas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arenas_id_seq', 10, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 5, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 31, true);


--
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stats_id_seq', 6, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 12, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: arenas arena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arenas
    ADD CONSTRAINT arena_pkey PRIMARY KEY (id);


--
-- Name: games game_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: players player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: players_teams players_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_teams
    ADD CONSTRAINT players_teams_pkey PRIMARY KEY (players_id, teams_id);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: teams team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: arenas arenas_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arenas
    ADD CONSTRAINT arenas_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: games games_played_at_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_played_at_fkey FOREIGN KEY (played_at) REFERENCES public.arenas(id);


--
-- Name: players players_stats_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_stats_id_fkey FOREIGN KEY (stats_id) REFERENCES public.stats(id);


--
-- Name: players_teams players_teams_players_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_teams
    ADD CONSTRAINT players_teams_players_id_fkey FOREIGN KEY (players_id) REFERENCES public.players(id);


--
-- Name: players_teams players_teams_teams_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_teams
    ADD CONSTRAINT players_teams_teams_id_fkey FOREIGN KEY (teams_id) REFERENCES public.teams(id);


--
-- PostgreSQL database dump complete
--

