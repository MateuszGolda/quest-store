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

--
-- Data for Name: user_quests; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (1, 3, 1, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (2, 3, 2, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (3, 3, 3, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (4, 3, 4, '2020-06-04', true);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (5, 1, 1, '2020-06-04', false);
INSERT INTO public.user_quests (id, quest_id, user_id, done_date, accepted) VALUES (6, 1, 2, '2020-06-04', true);


--
-- Name: user_quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.user_quests_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

