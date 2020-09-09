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
-- Data for Name: quests; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.quests (id, name, description, money, category_id) VALUES (1, 'Exploring a dungeon', 'Finishing a Teamwork week', 100, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (2, 'Solving the magic puzzle', 'Finishing an SI assignment', 100, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (3, 'Slaying a dragon', 'Passing a Checkpoint in the first attempt', 500, 1);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (4, 'Spot trap', 'Spot a major mistake in the assignment', 50, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (5, 'Taming a pet', 'Doing a demo about a pet project', 100, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (6, 'Recruiting some n00bs', 'Taking part in the student screening process', 100, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (7, 'Forging weapons', 'Organizing a workshop for other students', 400, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (8, 'Master the mornings', 'Attend 1 months without being late', 300, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (9, 'Fast as an unicorn', 'deliver 4 consecutive SI week assignments on time', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (10, 'Achiever', 'set up a SMART goal accepted by a mentor, then achieve it', 1000, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (11, 'Fortune', 'students choose the best project of the week. Selected team scores', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (12, 'Creating an enchanted scroll', 'Creating extra material for the current TW/SI topic (should be revised by mentors)', 500, 2);
INSERT INTO public.quests (id, name, description, money, category_id) VALUES (13, 'Enter the arena', 'Do a presentation on a meet-up', 500, 2);


--
-- Name: quests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.quests_id_seq', 13, true);


--
-- PostgreSQL database dump complete
--

