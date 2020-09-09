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
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.items (id, name, description, cost, category_id) VALUES (1, 'Combat training', 'Private mentoring', 50, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (2, 'Sanctuary', 'You can spend a day in home office', 1000, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (3, 'Time Travel', 'extend SI week assignment deadline by one day', 750, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (4, 'Circle of Sorcery', '60 min workshop by a mentor(s) of the chosen topic', 6000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (5, 'Summon Code Elemental', 'mentor joins a students'' team for a one hour', 2500, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (6, 'Tome of knowledge', 'Extra material for the current topic', 1500, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (7, 'Transform mentors', 'All mentors should dress up as pirates (or just funny) for the day', 5000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (8, 'Teleport', 'The whole course goes to an off-school program instead for a day', 30000, 4);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (9, 'Day off', 'You can have a day off without any consequences', 1000, 3);
INSERT INTO public.items (id, name, description, cost, category_id) VALUES (10, 'Karaoke', 'Mentors sing songs chosen by the students', 10000, 4);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.items_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

