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
-- Data for Name: user_items; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (1, 1, 1, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (2, 2, 1, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (3, 1, 2, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (4, 1, 2, '2020-07-22', false);
INSERT INTO public.user_items (id, item_id, user_id, bought_date, is_used) VALUES (5, 1, 3, '2020-07-23', false);


--
-- Name: user_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.user_items_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

