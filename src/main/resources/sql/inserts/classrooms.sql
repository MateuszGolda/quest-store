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
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.classrooms (id, name) VALUES (1, 'JavaOOP');
INSERT INTO public.classrooms (id, name) VALUES (2, 'Web with SQL');
INSERT INTO public.classrooms (id, name) VALUES (3, 'ProgBasic');
INSERT INTO public.classrooms (id, name) VALUES (4, 'Advanced');
INSERT INTO public.classrooms (id, name) VALUES (5, 'Web with python');


--
-- Name: classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.classroom_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

