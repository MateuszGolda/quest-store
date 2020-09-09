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
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.roles (id, name) VALUES (1, 'Student');
INSERT INTO public.roles (id, name) VALUES (2, 'Mentor');
INSERT INTO public.roles (id, name) VALUES (3, 'Admin');


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

