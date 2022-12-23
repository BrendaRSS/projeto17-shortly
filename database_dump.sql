--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer NOT NULL
);


--
-- Name: urls_and_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls_and_users (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: urls_and_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_and_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_and_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_and_users_id_seq OWNED BY public.urls_and_users.id;


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "confirmPassword" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: urls_and_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls_and_users ALTER COLUMN id SET DEFAULT nextval('public.urls_and_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '83cba4eb-6979-4ce7-9130-283ac03a1dcf', 2);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (15, 'https://www.npmjs.com/package/jsonwebtoken', 'd0290', 2);
INSERT INTO public.urls VALUES (18, 'https://ftw.usatoday.com/wp-content/uploads/sites/90/2017/05/spongebob.jpg?w=1000&h=600&crop=1', '5ac06', 0);
INSERT INTO public.urls VALUES (19, 'https://api.time.com/wp-content/uploads/2019/08/caveman-spongebob-spongegar.png', 'f2412', 0);
INSERT INTO public.urls VALUES (20, 'https://wealthofgeeks.com/wp-content/uploads/2022/07/spongebob-rainbow-meme-imagination.jpg', '17fb6', 1);
INSERT INTO public.urls VALUES (21, 'https://sm.ign.com/ign_br/screenshot/default/lula-molusco-bonitao_qnmc.jpg', '8a751', 0);
INSERT INTO public.urls VALUES (22, 'https://pbs.twimg.com/media/DxH5qkEXgAAr2rH.jpg:large', '14c85', 0);
INSERT INTO public.urls VALUES (23, 'https://i.pinimg.com/originals/71/0a/a7/710aa79a243c960afdd566b4f8701a61.jpg', '91eb1', 0);
INSERT INTO public.urls VALUES (24, 'https://i1.sndcdn.com/avatars-Z5cz2zr28WrxBHMf-qmzjJA-t500x500.jpg', '3dbc1', 0);
INSERT INTO public.urls VALUES (25, 'https://www.fatosdesconhecidos.com.br/wp-content/uploads/2016/05/05-8-600x450.jpg', 'b7af7', 0);
INSERT INTO public.urls VALUES (26, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn3Zj_IQst1hjIDGi6xIq_hNn5Bp5mh_Pa7g&usqp=CAU', 'cc349', 2);
INSERT INTO public.urls VALUES (27, 'https://cdn.dicionariopopular.com/imagens/meme-do-bob-esponja-cansado-og.jpg', '281b3', 0);
INSERT INTO public.urls VALUES (28, 'https://gcdn.lanetaneta.com/wp-content/uploads/2019/05/Bob-Esponja-a-20-10-memes-legendarios-inspirados-por-el.jpg', 'c5ee3', 0);
INSERT INTO public.urls VALUES (29, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi-avWHPJnQM-fwKO-whmptazrhq_SNOtDtw&usqp=CAU', '03ed4', 0);
INSERT INTO public.urls VALUES (16, 'https://www.npmjs.com/package/jsonwebtoken', '903a1', 2);
INSERT INTO public.urls VALUES (30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVHUDNV9_cGLg6LsGwK93gCbR8X-67kgUrqq1FbK0w9-GQNR0INGDBBanBlJ6x9-raYSY&usqp=CAU', '11e19', 1);
INSERT INTO public.urls VALUES (31, 'https://www.infoescola.com/wp-content/uploads/2007/08/mula-sem-cabeca_307510004.jpg', '3060f', 0);
INSERT INTO public.urls VALUES (14, 'https://www.youtube.com/watch?v=-B1u1wD8uJA&list=PLR8JXremim5BaPqraGKBPS4rFhywgUAvz&index=19', '6b097', 0);


--
-- Data for Name: urls_and_users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls_and_users VALUES (1, 14, 1);
INSERT INTO public.urls_and_users VALUES (2, 15, 1);
INSERT INTO public.urls_and_users VALUES (3, 16, 1);
INSERT INTO public.urls_and_users VALUES (5, 18, 3);
INSERT INTO public.urls_and_users VALUES (6, 19, 3);
INSERT INTO public.urls_and_users VALUES (7, 20, 3);
INSERT INTO public.urls_and_users VALUES (8, 21, 2);
INSERT INTO public.urls_and_users VALUES (9, 22, 2);
INSERT INTO public.urls_and_users VALUES (10, 23, 2);
INSERT INTO public.urls_and_users VALUES (11, 24, 2);
INSERT INTO public.urls_and_users VALUES (12, 25, 2);
INSERT INTO public.urls_and_users VALUES (13, 26, 2);
INSERT INTO public.urls_and_users VALUES (14, 27, 4);
INSERT INTO public.urls_and_users VALUES (15, 28, 4);
INSERT INTO public.urls_and_users VALUES (16, 29, 4);
INSERT INTO public.urls_and_users VALUES (17, 30, 4);
INSERT INTO public.urls_and_users VALUES (18, 31, 6);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Matheus', 'matheus@gmail.com', '$2b$10$w.tsKySEX8FNC02LcRTqHuGTfvTPJ3hh.v6Fum5gXkpQy5K3YlNQG', '$2b$10$w.tsKySEX8FNC02LcRTqHuGTfvTPJ3hh.v6Fum5gXkpQy5K3YlNQG', '2022-12-19 20:16:17.556837');
INSERT INTO public.users VALUES (2, 'Daniela', 'daniela@gmail.com', '$2b$10$GSsAe93w6GeQU6ri8SyBfOKyhskwtiuVIwk2TfyOX..y9/Gyrv0qC', '$2b$10$GSsAe93w6GeQU6ri8SyBfOKyhskwtiuVIwk2TfyOX..y9/Gyrv0qC', '2022-12-19 20:17:25.155141');
INSERT INTO public.users VALUES (3, 'Brenda Rayane', 'brenda@gmail.com', '$2b$10$10rwRYJtJzKXmgnAXibKj.CGzlNWYoDBlSXaUD2tYTo640f9GIAWy', '$2b$10$10rwRYJtJzKXmgnAXibKj.CGzlNWYoDBlSXaUD2tYTo640f9GIAWy', '2022-12-22 11:56:33.309225');
INSERT INTO public.users VALUES (4, 'Josy', 'josy@gmail.com', '$2b$10$zlMNej6lDKbYxcHq.A2dh.zzeFw4Dt0vagQP2DlPQX.rG9.pk8m0.', '$2b$10$zlMNej6lDKbYxcHq.A2dh.zzeFw4Dt0vagQP2DlPQX.rG9.pk8m0.', '2022-12-22 18:28:07.775279');
INSERT INTO public.users VALUES (5, 'Nina', 'nina@gmail.com', '$2b$10$5wQAgaDETLc7xOQIS3xYN.f6fF1rU5g9sObyq38Hj3fYly0DUrmfu', '$2b$10$5wQAgaDETLc7xOQIS3xYN.f6fF1rU5g9sObyq38Hj3fYly0DUrmfu', '2022-12-22 18:58:56.712051');
INSERT INTO public.users VALUES (6, 'Mula', 'mula@gmail.com', '$2b$10$oy4OZcALqPp6qFLL/nu1JO9PzY9onJEv2QrX3AWHEZGBBuIX8xuNe', '$2b$10$oy4OZcALqPp6qFLL/nu1JO9PzY9onJEv2QrX3AWHEZGBBuIX8xuNe', '2022-12-23 16:10:43.036362');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: urls_and_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_and_users_id_seq', 18, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 31, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls_and_users urls_and_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls_and_users
    ADD CONSTRAINT urls_and_users_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls_and_users urls_and_users_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls_and_users
    ADD CONSTRAINT "urls_and_users_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: urls_and_users urls_and_users_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls_and_users
    ADD CONSTRAINT "urls_and_users_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

