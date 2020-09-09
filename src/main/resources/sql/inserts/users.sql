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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (1, 'Mateusz', 'Gołda', 'asd', 'mateusz@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (2, 'Piotr', 'Stępak', '123', 'piotr@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (3, 'Grzegorz', 'Matyja', '123', 'grzegorz@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (4, 'Alek', 'Jednaszewski', '123', 'alek@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (5, 'Jan', 'Kowalski', '123', 'jan@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (6, 'Jan', 'Nowak', '123', 'jannowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (7, 'Stanisław', 'Nowak', '123', 'stanislawnowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (8, 'Anna', 'Nowak', '123', 'annanowak@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (9, 'Anna', 'Kowalska', '123', 'annakowalska@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (10, 'Marta', 'Kwiecień', '123', 'martakwiecien@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (11, 'studentName0', 'studentSurname0', 'password0', 'student0@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (12, 'studentName1', 'studentSurname1', 'password1', 'student1@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (13, 'studentName2', 'studentSurname2', 'password2', 'student2@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (14, 'studentName3', 'studentSurname3', 'password3', 'student3@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (15, 'studentName4', 'studentSurname4', 'password4', 'student4@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (16, 'studentName5', 'studentSurname5', 'password5', 'student5@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (17, 'studentName6', 'studentSurname6', 'password6', 'student6@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (18, 'studentName7', 'studentSurname7', 'password7', 'student7@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (19, 'studentName8', 'studentSurname8', 'password8', 'student8@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (20, 'studentName9', 'studentSurname9', 'password9', 'student9@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (21, 'studentName10', 'studentSurname10', 'password10', 'student10@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (22, 'studentName11', 'studentSurname11', 'password11', 'student11@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (23, 'studentName12', 'studentSurname12', 'password12', 'student12@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (24, 'studentName13', 'studentSurname13', 'password13', 'student13@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (25, 'studentName14', 'studentSurname14', 'password14', 'student14@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (26, 'studentName15', 'studentSurname15', 'password15', 'student15@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (27, 'studentName16', 'studentSurname16', 'password16', 'student16@gmail.com', 1, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (28, 'studentName17', 'studentSurname17', 'password17', 'student17@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (29, 'studentName18', 'studentSurname18', 'password18', 'student18@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (30, 'studentName19', 'studentSurname19', 'password19', 'student19@gmail.com', 1, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (31, 'Dominik', 'Starzyk', '123', 'dominikstarzyk@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (32, 'Wojciech', 'Makieła', '123', 'wojciechmakiela@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (33, 'Marcin', 'Izworski', '123', 'marcinizworski@codecool.com', 2, true);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (34, 'Adam', 'Panasiuk', '123', 'adampanasiuk@gmail.com', 2, false);
INSERT INTO public.users (id, name, surname, password, email, id_role, is_active) VALUES (35, 'Creepy', 'Guy', '123', 'creepyguy@codecool.com', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psvvypnkwffifs
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- PostgreSQL database dump complete
--

