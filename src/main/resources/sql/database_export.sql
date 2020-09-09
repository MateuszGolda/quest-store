--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Ubuntu 12.3-1.pgdg16.04+1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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
-- Name: balance; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.balance (
    user_id integer NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    total_earned integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.balance OWNER TO psvvypnkwffifs;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO psvvypnkwffifs;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.categories.id;


--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.classrooms (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.classrooms OWNER TO psvvypnkwffifs;

--
-- Name: classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classroom_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.classroom_id_seq OWNED BY public.classrooms.id;


--
-- Name: group_shopping; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.group_shopping (
    id integer NOT NULL,
    item_id integer NOT NULL,
    confirmed boolean NOT NULL,
    started_date date NOT NULL,
    is_paid boolean NOT NULL,
    paid_date date,
    is_used boolean DEFAULT false NOT NULL
);


ALTER TABLE public.group_shopping OWNER TO psvvypnkwffifs;

--
-- Name: group_shopping_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.group_shopping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_shopping_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: group_shopping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.group_shopping_id_seq OWNED BY public.group_shopping.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    cost integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.items OWNER TO psvvypnkwffifs;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: quests; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.quests (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    money integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.quests OWNER TO psvvypnkwffifs;

--
-- Name: quests_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.quests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quests_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.quests_id_seq OWNED BY public.quests.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO psvvypnkwffifs;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.sessions (
    session_id text NOT NULL,
    user_id integer NOT NULL,
    login_timestamp timestamp without time zone NOT NULL,
    logout_timestamp timestamp without time zone NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.sessions OWNER TO psvvypnkwffifs;

--
-- Name: students_shopping; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.students_shopping (
    user_id integer NOT NULL,
    shopping_id integer NOT NULL,
    confirmed_date date,
    confirmed boolean NOT NULL
);


ALTER TABLE public.students_shopping OWNER TO psvvypnkwffifs;

--
-- Name: user_classrooms; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.user_classrooms (
    classroom_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_classrooms OWNER TO psvvypnkwffifs;

--
-- Name: user_items; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.user_items (
    id integer NOT NULL,
    item_id integer NOT NULL,
    user_id integer NOT NULL,
    bought_date date NOT NULL,
    is_used boolean NOT NULL
);


ALTER TABLE public.user_items OWNER TO psvvypnkwffifs;

--
-- Name: user_items_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.user_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_items_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: user_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.user_items_id_seq OWNED BY public.user_items.id;


--
-- Name: user_quests; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.user_quests (
    id integer NOT NULL,
    quest_id integer NOT NULL,
    user_id integer NOT NULL,
    done_date date NOT NULL,
    accepted boolean NOT NULL
);


ALTER TABLE public.user_quests OWNER TO psvvypnkwffifs;

--
-- Name: user_quests_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.user_quests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_quests_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: user_quests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.user_quests_id_seq OWNED BY public.user_quests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: psvvypnkwffifs
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    id_role integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.users OWNER TO psvvypnkwffifs;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: psvvypnkwffifs
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO psvvypnkwffifs;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psvvypnkwffifs
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: classrooms id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.classrooms ALTER COLUMN id SET DEFAULT nextval('public.classroom_id_seq'::regclass);


--
-- Name: group_shopping id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.group_shopping ALTER COLUMN id SET DEFAULT nextval('public.group_shopping_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: quests id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.quests ALTER COLUMN id SET DEFAULT nextval('public.quests_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_items id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.user_items ALTER COLUMN id SET DEFAULT nextval('public.user_items_id_seq'::regclass);


--
-- Name: user_quests id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.user_quests ALTER COLUMN id SET DEFAULT nextval('public.user_quests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.balance (user_id, amount, total_earned) FROM stdin;
1	1000	2000
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.categories (id, name) FROM stdin;
1	basic-quest
2	extra-quest
3	basic-item
4	magic-item
\.


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.classrooms (id, name) FROM stdin;
1	JavaOOP
2	Web with SQL
3	ProgBasic
4	Advanced
5	Web with python
\.


--
-- Data for Name: group_shopping; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.group_shopping (id, item_id, confirmed, started_date, is_paid, paid_date, is_used) FROM stdin;
1	6	t	2020-07-22	t	2020-07-22	f
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.items (id, name, description, cost, category_id) FROM stdin;
1	Combat training	Private mentoring	50	3
2	Sanctuary	You can spend a day in home office	1000	3
3	Time Travel	extend SI week assignment deadline by one day	750	3
4	Circle of Sorcery	60 min workshop by a mentor(s) of the chosen topic	6000	4
5	Summon Code Elemental	mentor joins a students' team for a one hour	2500	4
6	Tome of knowledge	Extra material for the current topic	1500	4
7	Transform mentors	All mentors should dress up as pirates (or just funny) for the day	5000	4
8	Teleport	The whole course goes to an off-school program instead for a day	30000	4
9	Day off	You can have a day off without any consequences	1000	3
10	Karaoke	Mentors sing songs chosen by the students	10000	4
\.


--
-- Data for Name: quests; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.quests (id, name, description, money, category_id) FROM stdin;
1	Exploring a dungeon	Finishing a Teamwork week	100	1
2	Solving the magic puzzle	Finishing an SI assignment	100	1
3	Slaying a dragon	Passing a Checkpoint in the first attempt	500	1
4	Spot trap	Spot a major mistake in the assignment	50	2
5	Taming a pet	Doing a demo about a pet project	100	2
6	Recruiting some n00bs	Taking part in the student screening process	100	2
7	Forging weapons	Organizing a workshop for other students	400	2
8	Master the mornings	Attend 1 months without being late	300	2
9	Fast as an unicorn	deliver 4 consecutive SI week assignments on time	500	2
10	Achiever	set up a SMART goal accepted by a mentor, then achieve it	1000	2
11	Fortune	students choose the best project of the week. Selected team scores	500	2
12	Creating an enchanted scroll	Creating extra material for the current TW/SI topic (should be revised by mentors)	500	2
13	Enter the arena	Do a presentation on a meet-up	500	2
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.roles (id, name) FROM stdin;
1	Student
2	Mentor
3	Admin
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) FROM stdin;
V3WE?rN7RWcU3YsGCxdCdTfNt	1	2020-08-31 08:45:46.544	2020-08-31 08:55:50.023508	f
o.hk7wCJn3ndenLq0,zVcENTc	1	2020-08-31 09:34:36.603	2020-08-31 09:44:40.853266	f
JdV1HvClM3Ag,O!d31NU6gaQc	33	2020-08-31 09:35:32.928	2020-08-31 09:40:32.928	f
GcD?wgMlMzzR3fjq,nWuPgy3u	35	2020-08-31 09:36:27.952	2020-08-31 09:41:27.952	f
Q1PeCOU6ol.Mg0d8Vc7H4fq88	5	2020-08-31 11:28:39.371	2020-08-31 11:33:39.371	f
,h6Z5TLnxTzcx4?2iCN6yFM6S	31	2020-08-31 11:29:36.373	2020-08-31 11:34:36.373	f
oJt?WhhsfZpZjo,7NWwiojXdO	5	2020-08-31 11:29:40.989	2020-08-31 11:34:40.989	f
4QnyS2gGXK31AehK1SIlIPqx2	31	2020-08-31 12:04:21.751	2020-08-31 12:15:52.123675	t
yWerLhaXEvgb7OtYWJiz4h8RK	31	2020-08-31 12:04:25.432	2020-08-31 12:09:25.432	f
T4G80?TT?S2=S1U:TDC3	1	2020-08-21 12:27:59.65	2020-08-21 12:38:29.611468	f
YKWDE3SIOS9>Z3N:R1G;	1	2020-08-21 15:27:24.502	2020-08-21 15:32:24.502	f
PS;Y835F39SH44NFD>?T	1	2020-08-21 15:29:27.382	2020-08-21 15:43:01.924929	f
OQCM47SHCS7K7RJLAY>>	1	2020-08-21 15:32:56.755	2020-08-21 15:43:12.935402	f
zcHB8WbHi2v0i?REfSxp8sfvI	1	2020-08-31 11:43:19.201	2020-08-31 11:53:23.153869	f
T<;7=<E;CCDPUVFRK;Z4	1	2020-08-28 11:14:00.237	2020-08-28 11:19:00.237	f
W8=JQ:GLAXUAAYU0JJU4	1	2020-08-28 11:15:27.682	2020-08-28 11:20:27.682	f
9;@LY@04GT>RJ?UHB9MU	1	2020-08-28 11:13:26.504	2020-08-28 11:25:33.048376	f
RTQrdv4z7YgPEqheOC3UPxkzS	1	2020-08-31 12:06:15.036	2020-08-31 12:17:37.527826	f
pPtSmDwM?g,Hwfpwtm.hQl4bq	1	2020-08-31 11:46:04.184	2020-08-31 11:56:07.832953	f
nT13P2nm5hLZJI,B,spIjOzbT	35	2020-08-31 12:08:39.622	2020-08-31 12:13:39.622	f
mk6xfX6mC?mD!EfiqFB4xLqwT	1	2020-08-31 11:49:29.261	2020-08-31 12:19:24.91963	t
3sTkRVf?bhF?m!YOe?rfh2Rob	1	2020-08-31 12:02:42.229	2020-08-31 12:14:20.986082	f
dh5kQPnrwoKkRIov!McYa72??	1	2020-08-31 08:41:43.974	2020-08-31 08:51:47.576484	f
yp295apQZe.xs74SjWAwOnl!9	1	2020-08-31 08:45:13.31	2020-08-31 08:55:16.778177	f
ok0qWy6.lYvanh..0YopTce20	5	2020-08-31 11:48:48.494	2020-08-31 11:53:48.494	f
VM3!9F4H2qAC?mGNXmAxE?WQh	1	2020-08-31 11:53:09.278	2020-08-31 12:04:48.084655	f
B3HihDU1EaVzt,p,jCkKdX?Hm	5	2020-08-31 11:42:11.023	2020-08-31 11:56:34.696922	f
1fYyFnXv8GK,guP,l7NZROpOZ	5	2020-08-31 11:45:19.45	2020-08-31 11:56:38.487747	f
xt6J1ALK,sAyojLu1iHk00COk	5	2020-08-31 11:41:33.724	2020-08-31 11:56:42.558358	f
TAT2DCMQan1Rnhaa8tNbh2,fc	5	2020-08-31 11:46:31.255	2020-08-31 11:56:50.956165	f
,hTlo8PkqeA8,lxmAp27PYi8k	1	2020-08-31 11:54:36.017	2020-08-31 11:59:36.017	f
?l43l0a.,eah6m!OX.!,Viu2z	1	2020-08-31 11:55:10.151	2020-08-31 12:00:10.151	f
yYeSJK.ip!8.ajCmLA7BTtiym	1	2020-08-31 11:55:58.946	2020-08-31 12:00:58.946	f
j!Ol8DK2CEyr7kTUgVoq,1ChL	1	2020-08-31 11:56:24.296	2020-08-31 12:01:24.296	f
8tUMZZkUq6ahJoCie5I9jB!9r	1	2020-08-31 11:57:44.637	2020-08-31 12:02:44.637	f
7TVnUAj3R2VK9RpojXebhnRpf	1	2020-08-31 11:58:14.992	2020-08-31 12:03:14.992	f
I!ZJY2IQPGG?gl1Xiy,Bqpn2u	4	2020-08-31 12:09:48.807	2020-08-31 12:20:52.626713	f
9p?O20c6z4C,uTbcE,h2VLRWW	31	2020-08-31 12:15:07.977	2020-08-31 12:20:07.977	t
nPd,TaWSK!gv0b.U4S,2WNdV!	1	2020-08-31 11:52:38.189	2020-08-31 12:14:16.792886	f
\.


--
-- Data for Name: students_shopping; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.students_shopping (user_id, shopping_id, confirmed_date, confirmed) FROM stdin;
1	1	2020-07-22	t
2	1	2020-07-22	t
3	1	2020-07-22	t
4	1	2020-07-22	t
\.


--
-- Data for Name: user_classrooms; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.user_classrooms (classroom_id, user_id) FROM stdin;
2	1
2	2
2	3
2	4
1	5
1	6
1	7
1	8
1	9
1	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
4	18
4	19
4	20
4	21
4	22
4	23
4	24
4	25
4	26
4	27
1	31
1	32
1	33
4	31
3	32
2	33
2	31
\.


--
-- Data for Name: user_items; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.user_items (id, item_id, user_id, bought_date, is_used) FROM stdin;
1	1	1	2020-07-22	f
2	2	1	2020-07-22	f
3	1	2	2020-07-22	f
4	1	2	2020-07-22	f
5	1	3	2020-07-23	f
\.


--
-- Data for Name: user_quests; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.user_quests (id, quest_id, user_id, done_date, accepted) FROM stdin;
1	3	1	2020-06-04	t
2	3	2	2020-06-04	t
3	3	3	2020-06-04	t
4	3	4	2020-06-04	t
5	1	1	2020-06-04	f
6	1	2	2020-06-04	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

COPY public.users (id, name, surname, password, email, id_role, is_active) FROM stdin;
1	Mateusz	Gołda	asd	mateusz@gmail.com	1	t
2	Piotr	Stępak	123	piotr@gmail.com	1	t
3	Grzegorz	Matyja	123	grzegorz@gmail.com	1	t
4	Alek	Jednaszewski	123	alek@gmail.com	1	t
5	Jan	Kowalski	123	jan@gmail.com	1	t
6	Jan	Nowak	123	jannowak@gmail.com	1	t
7	Stanisław	Nowak	123	stanislawnowak@gmail.com	1	t
8	Anna	Nowak	123	annanowak@gmail.com	1	t
9	Anna	Kowalska	123	annakowalska@gmail.com	1	t
10	Marta	Kwiecień	123	martakwiecien@gmail.com	1	t
11	studentName0	studentSurname0	password0	student0@gmail.com	1	t
12	studentName1	studentSurname1	password1	student1@gmail.com	1	t
13	studentName2	studentSurname2	password2	student2@gmail.com	1	t
14	studentName3	studentSurname3	password3	student3@gmail.com	1	t
15	studentName4	studentSurname4	password4	student4@gmail.com	1	t
16	studentName5	studentSurname5	password5	student5@gmail.com	1	t
17	studentName6	studentSurname6	password6	student6@gmail.com	1	t
18	studentName7	studentSurname7	password7	student7@gmail.com	1	t
19	studentName8	studentSurname8	password8	student8@gmail.com	1	t
20	studentName9	studentSurname9	password9	student9@gmail.com	1	t
21	studentName10	studentSurname10	password10	student10@gmail.com	1	t
22	studentName11	studentSurname11	password11	student11@gmail.com	1	t
23	studentName12	studentSurname12	password12	student12@gmail.com	1	t
24	studentName13	studentSurname13	password13	student13@gmail.com	1	t
25	studentName14	studentSurname14	password14	student14@gmail.com	1	t
26	studentName15	studentSurname15	password15	student15@gmail.com	1	t
27	studentName16	studentSurname16	password16	student16@gmail.com	1	t
28	studentName17	studentSurname17	password17	student17@gmail.com	1	f
29	studentName18	studentSurname18	password18	student18@gmail.com	1	f
30	studentName19	studentSurname19	password19	student19@gmail.com	1	f
31	Dominik	Starzyk	123	dominikstarzyk@codecool.com	2	t
32	Wojciech	Makieła	123	wojciechmakiela@codecool.com	2	t
33	Marcin	Izworski	123	marcinizworski@codecool.com	2	t
34	Adam	Panasiuk	123	adampanasiuk@gmail.com	2	f
35	Creepy	Guy	123	creepyguy@codecool.com	3	t
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- Name: classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.classroom_id_seq', 5, true);


--
-- Name: group_shopping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.group_shopping_id_seq', 1, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.items_id_seq', 10, true);


--
-- Name: quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.quests_id_seq', 13, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: user_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.user_items_id_seq', 5, true);


--
-- Name: user_quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.user_quests_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- Name: balance balance_pk; Type: CONSTRAINT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (user_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: psvvypnkwffifs
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (session_id);


--
-- Name: balance_user_id_uindex; Type: INDEX; Schema: public; Owner: psvvypnkwffifs
--

CREATE UNIQUE INDEX balance_user_id_uindex ON public.balance USING btree (user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: psvvypnkwffifs
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO psvvypnkwffifs;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO psvvypnkwffifs;


--
-- PostgreSQL database dump complete
--

