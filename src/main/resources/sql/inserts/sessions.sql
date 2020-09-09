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
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: psvvypnkwffifs
--

INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('V3WE?rN7RWcU3YsGCxdCdTfNt', 1, '2020-08-31 08:45:46.544', '2020-08-31 08:55:50.023508', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('o.hk7wCJn3ndenLq0,zVcENTc', 1, '2020-08-31 09:34:36.603', '2020-08-31 09:44:40.853266', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('JdV1HvClM3Ag,O!d31NU6gaQc', 33, '2020-08-31 09:35:32.928', '2020-08-31 09:40:32.928', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('GcD?wgMlMzzR3fjq,nWuPgy3u', 35, '2020-08-31 09:36:27.952', '2020-08-31 09:41:27.952', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('Q1PeCOU6ol.Mg0d8Vc7H4fq88', 5, '2020-08-31 11:28:39.371', '2020-08-31 11:33:39.371', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES (',h6Z5TLnxTzcx4?2iCN6yFM6S', 31, '2020-08-31 11:29:36.373', '2020-08-31 11:34:36.373', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('oJt?WhhsfZpZjo,7NWwiojXdO', 5, '2020-08-31 11:29:40.989', '2020-08-31 11:34:40.989', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('4QnyS2gGXK31AehK1SIlIPqx2', 31, '2020-08-31 12:04:21.751', '2020-08-31 12:15:52.123675', true);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('yWerLhaXEvgb7OtYWJiz4h8RK', 31, '2020-08-31 12:04:25.432', '2020-08-31 12:09:25.432', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('T4G80?TT?S2=S1U:TDC3', 1, '2020-08-21 12:27:59.65', '2020-08-21 12:38:29.611468', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('YKWDE3SIOS9>Z3N:R1G;', 1, '2020-08-21 15:27:24.502', '2020-08-21 15:32:24.502', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('PS;Y835F39SH44NFD>?T', 1, '2020-08-21 15:29:27.382', '2020-08-21 15:43:01.924929', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('OQCM47SHCS7K7RJLAY>>', 1, '2020-08-21 15:32:56.755', '2020-08-21 15:43:12.935402', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('zcHB8WbHi2v0i?REfSxp8sfvI', 1, '2020-08-31 11:43:19.201', '2020-08-31 11:53:23.153869', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('T<;7=<E;CCDPUVFRK;Z4', 1, '2020-08-28 11:14:00.237', '2020-08-28 11:19:00.237', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('W8=JQ:GLAXUAAYU0JJU4', 1, '2020-08-28 11:15:27.682', '2020-08-28 11:20:27.682', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('9;@LY@04GT>RJ?UHB9MU', 1, '2020-08-28 11:13:26.504', '2020-08-28 11:25:33.048376', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('RTQrdv4z7YgPEqheOC3UPxkzS', 1, '2020-08-31 12:06:15.036', '2020-08-31 12:17:37.527826', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('pPtSmDwM?g,Hwfpwtm.hQl4bq', 1, '2020-08-31 11:46:04.184', '2020-08-31 11:56:07.832953', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('nT13P2nm5hLZJI,B,spIjOzbT', 35, '2020-08-31 12:08:39.622', '2020-08-31 12:13:39.622', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('mk6xfX6mC?mD!EfiqFB4xLqwT', 1, '2020-08-31 11:49:29.261', '2020-08-31 12:19:24.91963', true);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('3sTkRVf?bhF?m!YOe?rfh2Rob', 1, '2020-08-31 12:02:42.229', '2020-08-31 12:14:20.986082', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('dh5kQPnrwoKkRIov!McYa72??', 1, '2020-08-31 08:41:43.974', '2020-08-31 08:51:47.576484', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('yp295apQZe.xs74SjWAwOnl!9', 1, '2020-08-31 08:45:13.31', '2020-08-31 08:55:16.778177', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('ok0qWy6.lYvanh..0YopTce20', 5, '2020-08-31 11:48:48.494', '2020-08-31 11:53:48.494', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('VM3!9F4H2qAC?mGNXmAxE?WQh', 1, '2020-08-31 11:53:09.278', '2020-08-31 12:04:48.084655', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('B3HihDU1EaVzt,p,jCkKdX?Hm', 5, '2020-08-31 11:42:11.023', '2020-08-31 11:56:34.696922', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('1fYyFnXv8GK,guP,l7NZROpOZ', 5, '2020-08-31 11:45:19.45', '2020-08-31 11:56:38.487747', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('xt6J1ALK,sAyojLu1iHk00COk', 5, '2020-08-31 11:41:33.724', '2020-08-31 11:56:42.558358', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('TAT2DCMQan1Rnhaa8tNbh2,fc', 5, '2020-08-31 11:46:31.255', '2020-08-31 11:56:50.956165', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES (',hTlo8PkqeA8,lxmAp27PYi8k', 1, '2020-08-31 11:54:36.017', '2020-08-31 11:59:36.017', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('?l43l0a.,eah6m!OX.!,Viu2z', 1, '2020-08-31 11:55:10.151', '2020-08-31 12:00:10.151', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('yYeSJK.ip!8.ajCmLA7BTtiym', 1, '2020-08-31 11:55:58.946', '2020-08-31 12:00:58.946', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('j!Ol8DK2CEyr7kTUgVoq,1ChL', 1, '2020-08-31 11:56:24.296', '2020-08-31 12:01:24.296', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('8tUMZZkUq6ahJoCie5I9jB!9r', 1, '2020-08-31 11:57:44.637', '2020-08-31 12:02:44.637', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('7TVnUAj3R2VK9RpojXebhnRpf', 1, '2020-08-31 11:58:14.992', '2020-08-31 12:03:14.992', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('I!ZJY2IQPGG?gl1Xiy,Bqpn2u', 4, '2020-08-31 12:09:48.807', '2020-08-31 12:20:52.626713', false);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('9p?O20c6z4C,uTbcE,h2VLRWW', 31, '2020-08-31 12:15:07.977', '2020-08-31 12:20:07.977', true);
INSERT INTO public.sessions (session_id, user_id, login_timestamp, logout_timestamp, is_active) VALUES ('nPd,TaWSK!gv0b.U4S,2WNdV!', 1, '2020-08-31 11:52:38.189', '2020-08-31 12:14:16.792886', false);


--
-- PostgreSQL database dump complete
--

