--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Debian 15.5-1.pgdg110+1)
-- Dumped by pg_dump version 15.5 (Debian 15.5-1.pgdg110+1)

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

ALTER TABLE IF EXISTS ONLY "public"."active_storage_attachments" DROP CONSTRAINT IF EXISTS "fk_rails_c3b3935057";
ALTER TABLE IF EXISTS ONLY "public"."users" DROP CONSTRAINT IF EXISTS "fk_rails_b2bbf87303";
ALTER TABLE IF EXISTS ONLY "public"."likes" DROP CONSTRAINT IF EXISTS "fk_rails_b081767325";
ALTER TABLE IF EXISTS ONLY "public"."active_storage_variant_records" DROP CONSTRAINT IF EXISTS "fk_rails_993965df05";
ALTER TABLE IF EXISTS ONLY "public"."activities" DROP CONSTRAINT IF EXISTS "fk_rails_7e11bb717f";
ALTER TABLE IF EXISTS ONLY "public"."comments" DROP CONSTRAINT IF EXISTS "fk_rails_4a8da7c691";
ALTER TABLE IF EXISTS ONLY "public"."likes" DROP CONSTRAINT IF EXISTS "fk_rails_1e09b5dabf";
ALTER TABLE IF EXISTS ONLY "public"."comments" DROP CONSTRAINT IF EXISTS "fk_rails_03de2dc08c";
DROP INDEX IF EXISTS "public"."index_users_on_team_id";
DROP INDEX IF EXISTS "public"."index_users_on_reset_password_token";
DROP INDEX IF EXISTS "public"."index_users_on_email";
DROP INDEX IF EXISTS "public"."index_notifications_on_recipient";
DROP INDEX IF EXISTS "public"."index_notifications_on_read_at";
DROP INDEX IF EXISTS "public"."index_likes_on_user_id_and_activity_id";
DROP INDEX IF EXISTS "public"."index_likes_on_user_id";
DROP INDEX IF EXISTS "public"."index_likes_on_activity_id";
DROP INDEX IF EXISTS "public"."index_comments_on_user_id";
DROP INDEX IF EXISTS "public"."index_comments_on_activity_id";
DROP INDEX IF EXISTS "public"."index_activities_on_user_id";
DROP INDEX IF EXISTS "public"."index_active_storage_variant_records_uniqueness";
DROP INDEX IF EXISTS "public"."index_active_storage_blobs_on_key";
DROP INDEX IF EXISTS "public"."index_active_storage_attachments_uniqueness";
DROP INDEX IF EXISTS "public"."index_active_storage_attachments_on_blob_id";
DROP INDEX IF EXISTS "public"."index_action_text_rich_texts_uniqueness";
ALTER TABLE IF EXISTS ONLY "public"."users" DROP CONSTRAINT IF EXISTS "users_pkey";
ALTER TABLE IF EXISTS ONLY "public"."teams" DROP CONSTRAINT IF EXISTS "teams_pkey";
ALTER TABLE IF EXISTS ONLY "public"."schema_migrations" DROP CONSTRAINT IF EXISTS "schema_migrations_pkey";
ALTER TABLE IF EXISTS ONLY "public"."notifications" DROP CONSTRAINT IF EXISTS "notifications_pkey";
ALTER TABLE IF EXISTS ONLY "public"."likes" DROP CONSTRAINT IF EXISTS "likes_pkey";
ALTER TABLE IF EXISTS ONLY "public"."comments" DROP CONSTRAINT IF EXISTS "comments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."ar_internal_metadata" DROP CONSTRAINT IF EXISTS "ar_internal_metadata_pkey";
ALTER TABLE IF EXISTS ONLY "public"."activities" DROP CONSTRAINT IF EXISTS "activities_pkey";
ALTER TABLE IF EXISTS ONLY "public"."active_storage_variant_records" DROP CONSTRAINT IF EXISTS "active_storage_variant_records_pkey";
ALTER TABLE IF EXISTS ONLY "public"."active_storage_blobs" DROP CONSTRAINT IF EXISTS "active_storage_blobs_pkey";
ALTER TABLE IF EXISTS ONLY "public"."active_storage_attachments" DROP CONSTRAINT IF EXISTS "active_storage_attachments_pkey";
ALTER TABLE IF EXISTS ONLY "public"."action_text_rich_texts" DROP CONSTRAINT IF EXISTS "action_text_rich_texts_pkey";
ALTER TABLE IF EXISTS "public"."users" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."teams" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."notifications" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."likes" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."comments" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."activities" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."active_storage_variant_records" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."active_storage_blobs" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."active_storage_attachments" ALTER COLUMN "id" DROP DEFAULT;
ALTER TABLE IF EXISTS "public"."action_text_rich_texts" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
DROP TABLE IF EXISTS "public"."users";
DROP SEQUENCE IF EXISTS "public"."teams_id_seq";
DROP TABLE IF EXISTS "public"."teams";
DROP TABLE IF EXISTS "public"."schema_migrations";
DROP SEQUENCE IF EXISTS "public"."notifications_id_seq";
DROP TABLE IF EXISTS "public"."notifications";
DROP SEQUENCE IF EXISTS "public"."likes_id_seq";
DROP TABLE IF EXISTS "public"."likes";
DROP SEQUENCE IF EXISTS "public"."comments_id_seq";
DROP TABLE IF EXISTS "public"."comments";
DROP TABLE IF EXISTS "public"."ar_internal_metadata";
DROP SEQUENCE IF EXISTS "public"."activities_id_seq";
DROP TABLE IF EXISTS "public"."activities";
DROP SEQUENCE IF EXISTS "public"."active_storage_variant_records_id_seq";
DROP TABLE IF EXISTS "public"."active_storage_variant_records";
DROP SEQUENCE IF EXISTS "public"."active_storage_blobs_id_seq";
DROP TABLE IF EXISTS "public"."active_storage_blobs";
DROP SEQUENCE IF EXISTS "public"."active_storage_attachments_id_seq";
DROP TABLE IF EXISTS "public"."active_storage_attachments";
DROP SEQUENCE IF EXISTS "public"."action_text_rich_texts_id_seq";
DROP TABLE IF EXISTS "public"."action_text_rich_texts";
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."action_text_rich_texts" (
    "id" bigint NOT NULL,
    "name" character varying NOT NULL,
    "body" "text",
    "record_type" character varying NOT NULL,
    "record_id" bigint NOT NULL,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."action_text_rich_texts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."action_text_rich_texts_id_seq" OWNED BY "public"."action_text_rich_texts"."id";


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."active_storage_attachments" (
    "id" bigint NOT NULL,
    "name" character varying NOT NULL,
    "record_type" character varying NOT NULL,
    "record_id" bigint NOT NULL,
    "blob_id" bigint NOT NULL,
    "created_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."active_storage_attachments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."active_storage_attachments_id_seq" OWNED BY "public"."active_storage_attachments"."id";


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."active_storage_blobs" (
    "id" bigint NOT NULL,
    "key" character varying NOT NULL,
    "filename" character varying NOT NULL,
    "content_type" character varying,
    "metadata" "text",
    "service_name" character varying NOT NULL,
    "byte_size" bigint NOT NULL,
    "checksum" character varying,
    "created_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."active_storage_blobs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."active_storage_blobs_id_seq" OWNED BY "public"."active_storage_blobs"."id";


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."active_storage_variant_records" (
    "id" bigint NOT NULL,
    "blob_id" bigint NOT NULL,
    "variation_digest" character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."active_storage_variant_records_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."active_storage_variant_records_id_seq" OWNED BY "public"."active_storage_variant_records"."id";


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."activities" (
    "id" bigint NOT NULL,
    "distance" double precision,
    "competition" boolean,
    "description" "text",
    "photo" character varying,
    "user_id" bigint NOT NULL,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL,
    "hours" integer,
    "minutes" integer,
    "seconds" integer,
    "score" double precision
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."activities_id_seq" OWNED BY "public"."activities"."id";


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."ar_internal_metadata" (
    "key" character varying NOT NULL,
    "value" character varying,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."comments" (
    "id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    "activity_id" bigint NOT NULL,
    "content" "text",
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."comments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."comments_id_seq" OWNED BY "public"."comments"."id";


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."likes" (
    "id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    "activity_id" bigint NOT NULL,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."likes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."likes_id_seq" OWNED BY "public"."likes"."id";


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."notifications" (
    "id" bigint NOT NULL,
    "recipient_type" character varying NOT NULL,
    "recipient_id" bigint NOT NULL,
    "type" character varying NOT NULL,
    "params" "json",
    "read_at" timestamp(6) without time zone,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."notifications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."notifications_id_seq" OWNED BY "public"."notifications"."id";


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."schema_migrations" (
    "version" character varying NOT NULL
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."teams" (
    "id" bigint NOT NULL,
    "name" character varying,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."teams_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."teams_id_seq" OWNED BY "public"."teams"."id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."users" (
    "id" bigint NOT NULL,
    "email" character varying DEFAULT ''::character varying NOT NULL,
    "encrypted_password" character varying DEFAULT ''::character varying NOT NULL,
    "reset_password_token" character varying,
    "reset_password_sent_at" timestamp(6) without time zone,
    "remember_created_at" timestamp(6) without time zone,
    "created_at" timestamp(6) without time zone NOT NULL,
    "updated_at" timestamp(6) without time zone NOT NULL,
    "username" character varying,
    "team_id" bigint
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."action_text_rich_texts" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."action_text_rich_texts_id_seq"'::"regclass");


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_attachments" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."active_storage_attachments_id_seq"'::"regclass");


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_blobs" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."active_storage_blobs_id_seq"'::"regclass");


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_variant_records" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."active_storage_variant_records_id_seq"'::"regclass");


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."activities" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."activities_id_seq"'::"regclass");


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."comments" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."comments_id_seq"'::"regclass");


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."likes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."likes_id_seq"'::"regclass");


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."notifications" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."notifications_id_seq"'::"regclass");


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."teams" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."teams_id_seq"'::"regclass");


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."action_text_rich_texts" ("id", "name", "body", "record_type", "record_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."active_storage_attachments" ("id", "name", "record_type", "record_id", "blob_id", "created_at") FROM stdin;
1	image	User	1	1	2023-06-02 13:22:26.511233
20	image	Activity	8	20	2023-07-02 17:42:21.535448
21	image	Activity	9	21	2023-07-02 19:53:52.000957
22	image	Activity	10	22	2023-07-02 19:56:02.158855
23	image	Activity	11	23	2023-07-02 20:22:38.892174
24	image	Activity	12	24	2023-07-02 20:25:35.312485
25	image	Activity	13	25	2023-07-02 20:31:53.584352
26	image	Activity	14	26	2023-07-03 16:10:45.01169
27	image	Activity	15	27	2023-07-03 17:42:09.147076
28	image	Activity	16	28	2023-07-03 18:18:20.210752
29	image	Activity	17	29	2023-07-03 18:21:18.20793
30	image	Activity	18	30	2023-07-03 18:55:05.724208
32	image	Activity	20	32	2023-07-03 19:02:01.932801
33	image	Activity	21	33	2023-07-03 20:38:38.00518
34	image	Activity	22	34	2023-07-03 20:50:08.900138
35	image	Activity	23	35	2023-07-05 18:45:25.308504
36	image	Activity	24	36	2023-07-05 19:45:56.915338
37	image	Activity	25	37	2023-07-07 11:39:12.998905
38	image	Activity	26	38	2023-07-07 12:02:47.931775
39	image	Activity	27	39	2023-07-07 12:09:57.324083
40	image	Activity	28	40	2023-07-08 11:17:19.860794
41	image	Activity	29	41	2023-07-08 13:55:26.92882
42	image	Activity	30	42	2023-07-08 19:09:19.138938
43	image	Activity	31	43	2023-07-09 08:08:15.12483
44	image	Activity	32	44	2023-07-09 08:28:37.286778
45	image	Activity	33	45	2023-07-09 12:25:56.020433
46	image	Activity	34	46	2023-07-10 17:33:10.419707
47	image	Activity	35	47	2023-07-10 21:36:08.645469
48	image	Activity	36	48	2023-07-11 17:15:50.933962
49	image	Activity	37	49	2023-07-12 10:13:07.120613
50	image	Activity	38	50	2023-07-12 10:14:43.797162
51	image	Activity	39	51	2023-07-12 17:57:08.75842
52	image	Activity	40	52	2023-07-12 18:24:30.922778
53	image	Activity	41	53	2023-07-13 00:37:07.859916
54	image	Activity	42	54	2023-07-13 14:36:42.691749
55	image	Activity	43	55	2023-07-14 17:25:42.249855
56	image	Activity	44	56	2023-07-14 18:46:38.192042
57	image	Activity	45	57	2023-07-14 18:48:40.927919
58	image	Activity	46	58	2023-07-14 18:53:34.227187
59	image	Activity	47	59	2023-07-15 00:29:22.883587
60	image	Activity	48	60	2023-07-16 07:02:07.562723
61	image	Activity	49	61	2023-07-16 12:12:59.823796
62	image	Activity	50	62	2023-07-17 17:56:58.052924
63	image	Activity	51	63	2023-07-18 17:32:48.920626
64	image	Activity	52	64	2023-07-19 17:59:15.835872
65	image	Activity	53	65	2023-07-19 20:23:40.980421
66	image	Activity	54	66	2023-07-19 20:24:29.445919
67	image	Activity	55	67	2023-07-20 18:09:38.983721
68	image	Activity	56	68	2023-07-22 13:00:41.214468
69	image	Activity	57	69	2023-07-23 10:02:22.755866
70	image	Activity	58	70	2023-07-23 10:04:24.348131
71	image	Activity	59	71	2023-07-23 18:38:08.313575
72	image	Activity	60	72	2023-07-24 19:10:01.965481
73	image	Activity	61	73	2023-07-24 20:10:29.417012
74	image	Activity	62	74	2023-07-25 08:00:36.224857
75	image	Activity	63	75	2023-07-25 18:28:49.823655
76	image	Activity	64	76	2023-07-25 18:30:32.775118
77	image	Activity	65	77	2023-07-26 06:02:59.563569
78	image	Activity	66	78	2023-07-26 06:32:19.947486
79	image	Activity	67	79	2023-07-27 06:40:01.756569
80	image	Activity	68	80	2023-07-27 19:28:05.915378
81	image	Activity	69	81	2023-07-28 11:24:28.070722
82	image	Activity	70	82	2023-07-28 20:06:32.170025
83	image	Activity	71	83	2023-07-29 15:58:14.088092
84	image	Activity	72	84	2023-07-30 11:30:52.76085
85	image	Activity	73	85	2023-07-30 11:32:49.657167
86	image	Activity	74	86	2023-07-30 12:31:25.412277
87	image	Activity	75	87	2023-07-30 20:39:56.424102
88	image	Activity	76	88	2023-07-30 20:43:12.079547
89	image	Activity	77	89	2023-08-01 04:53:10.762437
90	image	Activity	78	90	2023-08-02 08:15:19.912288
91	image	Activity	79	91	2023-08-03 10:10:54.432057
92	image	Activity	80	92	2023-08-04 18:42:25.085708
93	image	Activity	81	93	2023-08-05 08:45:00.43236
94	image	Activity	82	94	2023-08-05 16:07:11.110752
95	image	Activity	83	95	2023-08-06 09:49:32.951221
96	image	Activity	84	96	2023-08-06 16:59:38.858575
97	image	Activity	85	97	2023-08-06 19:46:20.584456
98	image	Activity	86	98	2023-08-07 22:58:38.008739
99	image	Activity	87	99	2023-08-08 20:25:45.265674
100	image	Activity	88	100	2023-08-10 16:46:21.992862
101	image	Activity	89	101	2023-08-10 16:47:19.713321
102	image	Activity	90	102	2023-08-12 14:44:37.474008
103	image	Activity	91	103	2023-08-12 18:31:09.362625
104	image	Activity	92	104	2023-08-12 18:32:50.437313
105	image	Activity	93	105	2023-08-13 19:15:03.058914
106	image	Activity	94	106	2023-08-15 09:13:42.322989
107	image	Activity	95	107	2023-08-17 11:09:19.806832
108	image	Activity	96	108	2023-08-17 11:11:17.283412
109	image	Activity	97	109	2023-08-18 20:34:09.311879
110	image	Activity	98	110	2023-08-20 09:37:19.842652
111	image	Activity	99	111	2023-08-25 05:33:45.916328
112	image	Activity	100	112	2023-08-25 05:35:12.199023
113	image	Activity	101	113	2023-08-25 05:37:00.42189
114	image	Activity	102	114	2023-08-25 05:38:15.618565
115	image	Activity	103	115	2023-08-27 14:15:27.951712
116	image	Activity	104	116	2023-08-27 14:20:04.959413
117	image	Activity	105	117	2023-08-27 17:39:26.579771
118	image	Activity	106	118	2023-08-28 20:06:57.920438
119	image	Activity	107	119	2023-08-29 05:17:32.210878
120	image	Activity	108	120	2023-08-29 08:28:11.803738
121	image	Activity	109	121	2023-08-29 08:51:00.429576
122	image	Activity	110	122	2023-08-29 13:04:04.684448
123	image	Activity	111	123	2023-08-29 17:10:35.902649
124	image	Activity	112	124	2023-08-30 18:16:04.07806
125	image	Activity	113	125	2023-08-31 16:18:23.030981
126	image	Activity	114	126	2023-08-31 16:42:20.69682
127	image	Activity	115	127	2023-08-31 19:12:53.624587
128	image	Activity	116	128	2023-09-01 12:28:06.058434
129	image	Activity	117	129	2023-09-01 15:45:28.164758
130	image	Activity	118	130	2023-09-01 16:23:19.455473
131	image	Activity	119	131	2023-09-01 18:25:23.271239
133	image	Activity	120	133	2023-09-02 17:00:02.625592
134	image	Activity	121	134	2023-09-02 17:41:23.916123
135	image	Activity	122	135	2023-09-02 17:44:59.610735
136	image	Activity	123	136	2023-09-02 17:51:30.199469
137	image	Activity	124	137	2023-09-02 19:12:22.284893
138	image	Activity	125	138	2023-09-02 20:09:14.012109
139	image	Activity	126	139	2023-09-02 20:10:49.266022
140	image	Activity	127	140	2023-09-02 20:44:16.95087
141	image	Activity	128	141	2023-09-02 20:47:00.900932
143	image	Activity	129	143	2023-09-02 20:53:03.747697
144	image	Activity	130	144	2023-09-02 20:54:24.760486
145	image	Activity	131	145	2023-09-03 06:11:11.107838
146	image	Activity	132	146	2023-09-03 07:11:43.872509
147	image	Activity	133	147	2023-09-03 10:22:10.599206
148	image	Activity	134	148	2023-09-03 11:10:37.664108
149	image	Activity	135	149	2023-09-03 11:14:54.874684
150	image	Activity	136	150	2023-09-03 12:34:54.503625
151	image	Activity	137	151	2023-09-03 12:42:10.200316
152	image	Activity	138	152	2023-09-03 14:46:17.455631
153	image	Activity	139	153	2023-09-03 17:27:28.358714
154	image	Activity	140	154	2023-09-03 17:29:26.549047
155	image	Activity	141	155	2023-09-03 20:26:34.362506
156	image	Activity	142	156	2023-09-04 16:54:10.999786
157	image	Activity	143	157	2023-09-04 17:01:06.262909
158	image	Activity	144	158	2023-09-04 18:57:13.009348
159	image	Activity	145	159	2023-09-05 14:49:14.803881
160	image	Activity	146	160	2023-09-05 16:56:44.753986
161	image	Activity	147	161	2023-09-05 17:49:54.497062
162	image	Activity	148	162	2023-09-05 17:54:41.193636
163	image	Activity	149	163	2023-09-05 18:16:46.660328
164	image	Activity	150	164	2023-09-05 18:17:53.204529
165	image	Activity	151	165	2023-09-05 18:22:43.701913
166	image	Activity	152	166	2023-09-05 18:24:40.602837
167	image	Activity	153	167	2023-09-05 18:29:01.817547
168	image	Activity	154	168	2023-09-05 18:40:19.685618
169	image	Activity	155	169	2023-09-05 18:42:15.950849
170	image	Activity	156	170	2023-09-05 19:21:51.654296
171	image	Activity	157	171	2023-09-05 19:41:02.872705
172	image	Activity	158	172	2023-09-06 07:57:18.452995
173	image	Activity	159	173	2023-09-06 18:37:17.422138
174	image	Activity	160	174	2023-09-06 20:43:36.270342
175	image	Activity	161	175	2023-09-07 07:34:03.370867
176	image	Activity	162	176	2023-09-07 17:34:00.794809
177	image	Activity	163	177	2023-09-07 17:45:04.690211
179	image	Activity	164	179	2023-09-07 19:21:22.570354
180	image	Activity	165	180	2023-09-08 16:20:05.872418
181	image	Activity	166	181	2023-09-08 17:06:17.466538
182	image	Activity	167	182	2023-09-08 21:08:13.747805
183	image	Activity	168	183	2023-09-08 21:10:46.357629
184	image	Activity	169	184	2023-09-09 08:28:55.732153
185	image	Activity	170	185	2023-09-09 16:21:56.898765
186	image	Activity	171	186	2023-09-09 17:26:51.922629
187	image	Activity	172	187	2023-09-10 06:44:08.644625
188	image	Activity	173	188	2023-09-10 08:52:36.785623
189	image	Activity	174	189	2023-09-10 10:42:22.393582
190	image	Activity	175	190	2023-09-10 10:51:06.881747
191	image	Activity	176	191	2023-09-10 10:54:38.182645
192	image	Activity	177	192	2023-09-10 10:59:48.867352
193	image	Activity	178	193	2023-09-10 11:12:17.972716
194	image	Activity	179	194	2023-09-10 12:53:59.402394
195	image	Activity	180	195	2023-09-10 14:21:55.524166
196	image	Activity	181	196	2023-09-10 14:52:02.215295
197	image	Activity	182	197	2023-09-11 15:50:07.486532
198	image	Activity	183	198	2023-09-12 17:51:07.821674
199	image	Activity	184	199	2023-09-12 18:04:28.063307
200	image	Activity	185	200	2023-09-12 18:18:26.405395
201	image	Activity	186	201	2023-09-12 18:34:12.70503
202	image	Activity	187	202	2023-09-12 19:07:15.8624
203	image	Activity	188	203	2023-09-12 19:15:25.211479
204	image	Activity	189	204	2023-09-12 19:21:46.998328
205	image	Activity	190	205	2023-09-12 19:22:43.972554
206	image	Activity	191	206	2023-09-12 19:24:17.306543
207	image	Activity	192	207	2023-09-12 19:24:55.909074
208	image	Activity	193	208	2023-09-12 19:36:11.350371
209	image	Activity	194	209	2023-09-13 10:25:02.247364
210	image	Activity	195	210	2023-09-13 15:36:11.81351
211	image	Activity	196	211	2023-09-13 19:51:02.557772
212	image	Activity	197	212	2023-09-14 17:49:17.32503
213	image	Activity	198	213	2023-09-15 16:08:29.846844
214	image	Activity	199	214	2023-09-15 20:59:42.160928
215	image	Activity	200	215	2023-09-15 21:01:20.459443
216	image	Activity	201	216	2023-09-16 13:09:00.090564
217	image	Activity	202	217	2023-09-16 13:10:46.58335
218	image	Activity	203	218	2023-09-16 13:46:31.463903
219	image	Activity	204	219	2023-09-16 14:17:44.582688
220	image	Activity	205	220	2023-09-16 14:34:21.07157
221	image	Activity	206	221	2023-09-16 15:11:17.306876
222	image	Activity	207	222	2023-09-16 18:18:41.275904
223	image	Activity	208	223	2023-09-17 09:48:02.209073
224	image	Activity	209	224	2023-09-17 12:38:12.589976
225	image	Activity	210	225	2023-09-17 15:41:47.131187
226	image	Activity	211	226	2023-09-17 17:41:53.676086
227	image	Activity	212	227	2023-09-17 19:09:20.644442
228	image	Activity	213	228	2023-09-18 17:10:35.585585
229	image	Activity	214	229	2023-09-18 17:43:12.880196
230	image	Activity	215	230	2023-09-18 17:55:39.176644
231	image	Activity	216	231	2023-09-18 18:08:40.936203
232	image	Activity	217	232	2023-09-18 19:06:50.389866
233	image	Activity	218	233	2023-09-19 09:00:32.487103
234	image	Activity	219	234	2023-09-19 17:48:40.097473
235	image	Activity	220	235	2023-09-19 18:02:41.507129
236	image	Activity	221	236	2023-09-19 18:13:27.049489
237	image	Activity	222	237	2023-09-19 18:17:10.193271
238	image	Activity	223	238	2023-09-19 18:56:32.885304
239	image	Activity	224	239	2023-09-19 19:05:54.851432
240	image	Activity	225	240	2023-09-19 19:38:50.886598
241	image	Activity	226	241	2023-09-20 15:06:20.458103
242	image	Activity	227	242	2023-09-20 17:22:06.829007
243	image	Activity	228	243	2023-09-20 17:35:33.138133
244	image	Activity	229	244	2023-09-21 14:03:32.438302
245	image	Activity	230	245	2023-09-21 17:27:45.253802
246	image	Activity	231	246	2023-09-23 11:31:04.27442
247	image	Activity	232	247	2023-09-23 15:40:56.305386
248	image	Activity	233	248	2023-09-23 16:51:57.376032
249	image	Activity	234	249	2023-09-24 11:18:03.632733
250	image	Activity	235	250	2023-09-24 14:07:24.494866
251	image	Activity	236	251	2023-09-24 15:30:22.058265
252	image	Activity	237	252	2023-09-24 17:08:07.5955
253	image	Activity	238	253	2023-09-25 19:10:39.094258
254	image	Activity	239	254	2023-09-25 21:23:50.759509
255	image	Activity	240	255	2023-09-25 21:24:58.701168
256	image	Activity	241	256	2023-09-26 16:59:01.082821
257	image	Activity	242	257	2023-09-26 17:51:41.791644
258	image	Activity	243	258	2023-09-26 18:16:55.331576
259	image	Activity	244	259	2023-09-26 18:28:09.860878
260	image	Activity	245	260	2023-09-26 18:39:43.357396
261	image	Activity	246	261	2023-09-26 19:16:56.038467
262	image	Activity	247	262	2023-09-26 19:22:33.559282
263	image	Activity	248	263	2023-09-26 20:11:36.910911
264	image	Activity	249	264	2023-09-26 20:24:32.001548
265	image	Activity	250	265	2023-09-27 04:02:15.447388
266	image	Activity	251	266	2023-09-27 17:09:27.598355
267	image	Activity	252	267	2023-09-27 17:27:29.896989
268	image	Activity	253	268	2023-09-27 17:43:27.132449
269	image	Activity	254	269	2023-09-28 06:26:02.729194
270	image	Activity	255	270	2023-09-28 08:06:48.596736
271	image	Activity	256	271	2023-09-28 17:05:07.558896
272	image	Activity	257	272	2023-09-28 18:00:25.563895
273	image	Activity	258	273	2023-09-28 19:28:04.028758
274	image	Activity	259	274	2023-09-28 19:39:55.157496
275	image	Activity	260	275	2023-09-28 20:02:03.823771
276	image	Activity	261	276	2023-09-28 20:27:27.818472
277	image	Activity	262	277	2023-09-28 22:37:17.038169
278	image	Activity	263	278	2023-09-28 22:42:12.830665
279	image	Activity	264	279	2023-09-30 13:53:17.389085
280	image	Activity	265	280	2023-09-30 14:53:44.0207
281	image	Activity	266	281	2023-09-30 14:53:56.646165
282	image	Activity	267	282	2023-09-30 14:54:06.41675
283	image	Activity	268	283	2023-09-30 14:54:11.91455
284	image	Activity	269	284	2023-09-30 14:56:54.314066
285	image	Activity	270	285	2023-09-30 14:59:22.611718
286	image	Activity	271	286	2023-09-30 15:52:16.839531
287	image	Activity	272	287	2023-09-30 16:04:58.891669
288	image	Activity	273	288	2023-09-30 16:16:29.342015
289	image	Activity	274	289	2023-09-30 16:46:58.300312
290	image	Activity	275	290	2023-09-30 18:08:19.034145
291	image	Activity	276	291	2023-09-30 18:11:01.340856
292	image	Activity	277	292	2023-09-30 18:50:20.244479
293	image	Activity	278	293	2023-10-01 12:18:50.881619
294	image	Activity	279	294	2023-10-01 12:58:35.770355
295	image	Activity	280	295	2023-10-01 19:38:14.977849
296	image	Activity	281	296	2023-10-02 16:35:48.796896
297	image	Activity	282	297	2023-10-02 17:14:07.333853
298	image	Activity	283	298	2023-10-03 16:03:31.946374
299	image	Activity	284	299	2023-10-03 18:04:52.526019
300	image	Activity	285	300	2023-10-03 18:22:51.105364
301	image	Activity	286	301	2023-10-03 18:25:07.534019
302	image	Activity	287	302	2023-10-03 18:25:29.099284
303	image	Activity	288	303	2023-10-03 18:52:10.141366
304	image	Activity	289	304	2023-10-03 18:56:06.424795
305	image	Activity	290	305	2023-10-03 19:02:01.14448
306	image	Activity	291	306	2023-10-03 19:02:54.585006
307	image	Activity	292	307	2023-10-03 19:19:00.123626
308	image	Activity	293	308	2023-10-04 04:22:19.19775
309	image	Activity	294	309	2023-10-04 04:33:43.913557
310	image	Activity	295	310	2023-10-04 16:45:52.58169
311	image	Activity	296	311	2023-10-04 17:18:12.550852
312	image	Activity	297	312	2023-10-04 17:29:07.235209
314	image	Activity	298	314	2023-10-05 16:15:22.530828
315	image	Activity	299	315	2023-10-05 18:03:48.408386
316	image	Activity	300	316	2023-10-05 18:32:09.068531
317	image	Activity	301	317	2023-10-05 18:42:03.372423
318	image	Activity	302	318	2023-10-05 19:03:20.825156
319	image	Activity	303	319	2023-10-05 19:04:00.823536
320	image	Activity	304	320	2023-10-05 19:15:42.538837
321	image	Activity	305	321	2023-10-05 19:18:26.921767
322	image	Activity	306	322	2023-10-05 19:39:40.179163
323	image	Activity	307	323	2023-10-05 20:19:46.970971
324	image	Activity	308	324	2023-10-05 20:20:44.265976
325	image	Activity	309	325	2023-10-06 17:20:52.191215
326	image	Activity	310	326	2023-10-07 11:24:27.455282
327	image	Activity	311	327	2023-10-07 11:27:45.878596
328	image	Activity	312	328	2023-10-07 11:31:48.506537
329	image	Activity	313	329	2023-10-07 11:33:47.629342
330	image	Activity	314	330	2023-10-07 11:36:09.552606
331	image	Activity	315	331	2023-10-07 11:56:58.996742
332	image	Activity	316	332	2023-10-07 12:24:24.882361
333	image	Activity	317	333	2023-10-07 14:11:38.20631
334	image	Activity	318	334	2023-10-08 11:01:04.604798
335	image	Activity	319	335	2023-10-08 11:05:13.007542
336	image	Activity	320	336	2023-10-08 11:06:51.115376
337	image	Activity	321	337	2023-10-08 12:05:37.305627
338	image	Activity	322	338	2023-10-10 16:38:20.847869
339	image	Activity	323	339	2023-10-10 18:02:55.919824
340	image	Activity	324	340	2023-10-10 18:04:05.11842
341	image	Activity	325	341	2023-10-10 19:21:52.956834
342	image	Activity	326	342	2023-10-10 19:27:57.032375
344	image	Activity	327	344	2023-10-10 19:42:58.704711
345	image	Activity	328	345	2023-10-10 19:49:48.395775
346	image	Activity	329	346	2023-10-10 20:01:46.308251
347	image	Activity	330	347	2023-10-11 06:35:55.841807
348	image	Activity	331	348	2023-10-11 12:59:47.380244
349	image	Activity	332	349	2023-10-11 17:54:40.40404
350	image	Activity	333	350	2023-10-12 16:44:47.928768
351	image	Activity	334	351	2023-10-12 18:32:27.388172
352	image	Activity	335	352	2023-10-12 18:47:12.582124
353	image	Activity	336	353	2023-10-12 19:00:34.66892
354	image	Activity	337	354	2023-10-12 19:40:53.361247
355	image	Activity	338	355	2023-10-13 11:52:26.529221
356	image	Activity	339	356	2023-10-13 11:54:33.360782
357	image	Activity	340	357	2023-10-13 11:56:09.206722
358	image	Activity	341	358	2023-10-13 16:45:35.89874
359	image	Activity	342	359	2023-10-13 17:25:50.628312
360	image	Activity	343	360	2023-10-14 09:04:24.089552
361	image	Activity	344	361	2023-10-14 17:03:30.239694
362	image	Activity	345	362	2023-10-15 09:00:32.713609
363	image	Activity	346	363	2023-10-15 09:37:21.084935
364	image	Activity	347	364	2023-10-16 10:29:41.653346
365	image	Activity	348	365	2023-10-16 17:17:36.121988
366	image	Activity	349	366	2023-10-17 14:55:12.142884
367	image	Activity	350	367	2023-10-17 15:12:55.362895
368	image	Activity	351	368	2023-10-17 18:05:52.635768
369	image	Activity	352	369	2023-10-17 18:07:34.063807
370	image	Activity	353	370	2023-10-17 18:12:21.437655
371	image	Activity	354	371	2023-10-17 18:14:24.64011
372	image	Activity	355	372	2023-10-17 18:27:46.027726
373	image	Activity	356	373	2023-10-17 18:45:25.614065
374	image	Activity	357	374	2023-10-17 18:46:27.144619
375	image	Activity	358	375	2023-10-17 19:45:34.022322
376	image	Activity	359	376	2023-10-17 20:17:27.573382
377	image	Activity	360	377	2023-10-18 07:32:48.595602
378	image	Activity	361	378	2023-10-18 16:43:56.839873
379	image	Activity	362	379	2023-10-19 18:38:32.92507
380	image	Activity	363	380	2023-10-19 19:06:05.242879
381	image	Activity	364	381	2023-10-19 19:06:11.872317
383	image	Activity	365	383	2023-10-19 19:07:29.915336
384	image	Activity	366	384	2023-10-19 19:09:05.820003
385	image	Activity	367	385	2023-10-19 21:43:08.509881
386	image	Activity	368	386	2023-10-20 16:05:18.506375
387	image	Activity	369	387	2023-10-20 16:07:00.432714
388	image	Activity	370	388	2023-10-20 16:08:20.244271
389	image	Activity	371	389	2023-10-20 17:40:43.200517
390	image	Activity	372	390	2023-10-20 17:51:22.097096
391	image	Activity	373	391	2023-10-20 18:18:06.945881
392	image	Activity	374	392	2023-10-20 21:57:46.639718
393	image	Activity	375	393	2023-10-21 09:28:40.449913
394	image	Activity	376	394	2023-10-21 10:26:17.323754
395	image	Activity	377	395	2023-10-21 13:10:05.548322
396	image	Activity	378	396	2023-10-21 14:57:33.999692
397	image	Activity	379	397	2023-10-21 15:08:56.313981
398	image	Activity	380	398	2023-10-21 15:13:13.246907
399	image	Activity	381	399	2023-10-21 15:53:36.731984
400	image	Activity	382	400	2023-10-21 17:18:56.136959
401	image	Activity	383	401	2023-10-21 20:33:34.608941
402	image	Activity	384	402	2023-10-22 08:49:59.765488
403	image	Activity	385	403	2023-10-22 10:31:40.774931
404	image	Activity	386	404	2023-10-22 11:32:04.955001
407	image	Activity	389	407	2023-10-23 17:10:56.95551
408	image	Activity	387	408	2023-10-23 21:44:04.935787
409	image	Activity	388	409	2023-10-23 21:45:28.712507
410	image	Activity	390	410	2023-10-24 18:13:30.862302
411	image	Activity	391	411	2023-10-24 18:40:28.103614
412	image	Activity	392	412	2023-10-24 18:40:33.384366
413	image	Activity	393	413	2023-10-24 18:49:35.351379
414	image	Activity	394	414	2023-10-24 18:52:48.798208
415	image	Activity	395	415	2023-10-24 18:53:51.208945
416	image	Activity	396	416	2023-10-24 18:57:55.302917
417	image	Activity	397	417	2023-10-24 19:01:36.240228
418	image	Activity	398	418	2023-10-24 19:05:34.650564
419	image	Activity	399	419	2023-10-24 19:05:43.340353
420	image	Activity	400	420	2023-10-24 19:29:54.335651
421	image	Activity	401	421	2023-10-24 19:30:50.340991
422	image	Activity	402	422	2023-10-24 20:16:59.112673
423	image	Activity	403	423	2023-10-24 21:08:20.235111
424	image	Activity	404	424	2023-10-24 22:13:07.042329
425	image	Activity	405	425	2023-10-25 16:01:54.652725
426	image	Activity	406	426	2023-10-25 16:40:31.75239
427	image	Activity	407	427	2023-10-25 16:44:18.400666
428	image	Activity	408	428	2023-10-25 18:51:31.706579
429	image	Activity	409	429	2023-10-26 15:32:44.058923
430	image	Activity	410	430	2023-10-26 15:35:20.769481
431	image	Activity	411	431	2023-10-26 17:13:31.444162
432	image	Activity	412	432	2023-10-26 17:16:02.335541
433	image	Activity	413	433	2023-10-26 17:57:49.873743
434	image	Activity	414	434	2023-10-26 18:16:25.844875
435	image	Activity	415	435	2023-10-26 19:28:24.026781
436	image	Activity	416	436	2023-10-26 19:34:17.23193
437	image	Activity	417	437	2023-10-26 22:44:43.037029
438	image	Activity	418	438	2023-10-27 12:48:15.364513
439	image	Activity	419	439	2023-10-27 17:10:45.558565
440	image	Activity	420	440	2023-10-28 08:59:39.907163
441	image	Activity	421	441	2023-10-28 09:05:39.705389
442	image	Activity	422	442	2023-10-28 13:32:34.048208
443	image	Activity	423	443	2023-10-28 14:05:34.356989
444	image	Activity	424	444	2023-10-28 14:46:31.37017
445	image	Activity	425	445	2023-10-28 15:14:55.92895
446	image	Activity	426	446	2023-10-28 16:20:24.858341
447	image	Activity	427	447	2023-10-28 16:48:49.09965
448	image	Activity	428	448	2023-10-29 10:27:24.600256
449	image	Activity	429	449	2023-10-29 10:35:39.925748
450	image	Activity	430	450	2023-10-29 11:24:45.008295
451	image	Activity	431	451	2023-10-29 12:11:59.007728
452	image	Activity	432	452	2023-10-29 15:02:46.427062
453	image	Activity	433	453	2023-10-29 18:08:58.809129
454	image	Activity	434	454	2023-10-29 20:00:52.904103
455	image	Activity	435	455	2023-10-29 20:15:41.997093
456	image	Activity	436	456	2023-10-30 14:31:10.846784
457	image	Activity	437	457	2023-10-30 15:11:21.648403
458	image	Activity	438	458	2023-10-30 19:25:49.85484
459	image	Activity	439	459	2023-10-30 19:38:34.863733
460	image	Activity	440	460	2023-10-31 18:05:20.9013
461	image	Activity	441	461	2023-10-31 18:24:28.707918
462	image	Activity	442	462	2023-10-31 19:11:30.760886
463	image	Activity	443	463	2023-10-31 19:30:29.659448
464	image	Activity	444	464	2023-10-31 19:32:58.59338
465	image	Activity	445	465	2023-10-31 19:38:11.535694
466	image	Activity	446	466	2023-10-31 19:40:39.100062
467	image	Activity	447	467	2023-10-31 19:43:14.024004
468	image	Activity	448	468	2023-10-31 19:48:56.672493
469	image	Activity	449	469	2023-10-31 19:52:40.036625
470	image	Activity	450	470	2023-10-31 20:03:07.078085
471	image	Activity	451	471	2023-11-02 19:11:06.673698
472	image	Activity	452	472	2023-11-02 19:16:52.343103
473	image	Activity	453	473	2023-11-02 19:29:49.56557
474	image	Activity	454	474	2023-11-02 19:33:34.65938
475	image	Activity	455	475	2023-11-02 19:39:36.083986
476	image	Activity	456	476	2023-11-02 19:40:43.799684
477	image	Activity	457	477	2023-11-02 19:48:45.959689
478	image	Activity	458	478	2023-11-02 19:49:25.303649
479	image	Activity	459	479	2023-11-02 19:56:47.068876
480	image	Activity	460	480	2023-11-02 20:09:23.151206
481	image	Activity	461	481	2023-11-02 21:00:15.763799
482	image	Activity	462	482	2023-11-03 11:41:03.013778
483	image	Activity	463	483	2023-11-03 19:55:02.752976
484	image	Activity	464	484	2023-11-03 20:21:43.272859
485	image	Activity	465	485	2023-11-03 21:26:12.867087
486	image	Activity	466	486	2023-11-04 09:33:34.249097
487	image	Activity	467	487	2023-11-04 10:40:25.629431
488	image	Activity	468	488	2023-11-04 23:22:18.605916
489	image	Activity	469	489	2023-11-04 23:44:48.208173
490	image	Activity	470	490	2023-11-04 23:45:23.979163
491	image	Activity	471	491	2023-11-05 00:09:14.713376
492	image	Activity	472	492	2023-11-05 00:16:03.000353
493	image	Activity	473	493	2023-11-05 08:21:52.506987
494	image	Activity	474	494	2023-11-05 08:26:01.12618
495	image	Activity	475	495	2023-11-05 08:26:02.519478
496	image	Activity	476	496	2023-11-05 10:16:34.924077
497	image	Activity	477	497	2023-11-05 10:17:22.324287
498	image	Activity	478	498	2023-11-05 12:13:42.957103
499	image	Activity	479	499	2023-11-05 12:53:30.379198
500	image	Activity	480	500	2023-11-05 13:13:10.145211
501	image	Activity	481	501	2023-11-05 14:34:07.698663
502	image	Activity	482	502	2023-11-05 15:19:34.3033
503	image	Activity	483	503	2023-11-05 16:54:33.297126
504	image	Activity	484	504	2023-11-05 17:35:04.545131
505	image	Activity	485	505	2023-11-06 16:42:34.29692
506	image	Activity	486	506	2023-11-07 16:15:47.762409
507	image	Activity	487	507	2023-11-07 19:44:05.372406
508	image	Activity	488	508	2023-11-07 19:53:23.385669
509	image	Activity	489	509	2023-11-07 19:53:37.474064
510	image	Activity	490	510	2023-11-07 19:54:58.392814
511	image	Activity	491	511	2023-11-07 20:03:31.497997
512	image	Activity	492	512	2023-11-07 20:03:52.142064
513	image	Activity	493	513	2023-11-07 20:08:19.438015
514	image	Activity	494	514	2023-11-07 20:27:03.35669
515	image	Activity	495	515	2023-11-07 20:28:35.339733
516	image	Activity	496	516	2023-11-08 05:53:29.741847
517	image	Activity	497	517	2023-11-08 14:59:26.071943
518	image	Activity	498	518	2023-11-08 16:09:39.597633
519	image	Activity	499	519	2023-11-08 16:14:04.192468
520	image	Activity	500	520	2023-11-08 16:46:13.805571
521	image	Activity	501	521	2023-11-08 19:08:04.571181
522	image	Activity	502	522	2023-11-08 19:31:22.78426
523	image	Activity	503	523	2023-11-09 09:17:51.601406
524	image	Activity	504	524	2023-11-09 17:20:27.519482
525	image	Activity	505	525	2023-11-09 17:25:23.316313
526	image	Activity	506	526	2023-11-09 19:20:18.700917
527	image	Activity	507	527	2023-11-09 19:21:25.493592
528	image	Activity	508	528	2023-11-09 19:24:26.405911
529	image	Activity	509	529	2023-11-09 19:28:48.706484
530	image	Activity	510	530	2023-11-09 19:37:17.394082
531	image	Activity	511	531	2023-11-09 19:46:43.499607
532	image	Activity	512	532	2023-11-09 19:56:44.553916
533	image	Activity	513	533	2023-11-09 21:16:46.105861
534	image	Activity	514	534	2023-11-09 21:18:07.809439
535	image	Activity	515	535	2023-11-10 09:25:06.31206
536	image	Activity	516	536	2023-11-10 13:39:57.999253
537	image	Activity	517	537	2023-11-11 12:45:47.855722
538	image	Activity	518	538	2023-11-11 15:43:43.77588
539	image	Activity	519	539	2023-11-11 17:16:44.933414
540	image	Activity	520	540	2023-11-11 19:17:44.924492
541	image	Activity	521	541	2023-11-11 19:36:03.225471
542	image	Activity	522	542	2023-11-12 10:07:45.00743
543	image	Activity	523	543	2023-11-12 15:03:21.653216
544	image	Activity	524	544	2023-11-12 17:18:27.501138
546	image	Activity	526	546	2023-11-12 18:14:38.693783
547	image	Activity	527	547	2023-11-12 18:21:44.810936
548	image	Activity	525	548	2023-11-12 18:23:21.020378
549	image	Activity	528	549	2023-11-12 20:06:43.89529
550	image	Activity	529	550	2023-11-13 12:25:21.290077
551	image	Activity	530	551	2023-11-13 13:23:05.976028
552	image	Activity	531	552	2023-11-13 19:00:59.721379
553	image	Activity	532	553	2023-11-14 12:36:59.198161
554	image	Activity	533	554	2023-11-14 19:33:44.802113
555	image	Activity	534	555	2023-11-14 19:35:16.4024
556	image	Activity	535	556	2023-11-14 19:40:04.12369
557	image	Activity	536	557	2023-11-14 19:42:06.782592
558	image	Activity	537	558	2023-11-14 19:48:19.709962
559	image	Activity	538	559	2023-11-14 19:52:01.92197
560	image	Activity	539	560	2023-11-14 19:59:44.368262
561	image	Activity	540	561	2023-11-14 20:00:05.37575
562	image	Activity	541	562	2023-11-14 20:46:15.283943
563	image	Activity	542	563	2023-11-15 14:53:14.701507
564	image	Activity	543	564	2023-11-16 16:55:46.582355
565	image	Activity	544	565	2023-11-16 18:56:54.575218
566	image	Activity	545	566	2023-11-16 18:58:25.989279
567	image	Activity	546	567	2023-11-16 18:59:18.602477
568	image	Activity	547	568	2023-11-16 20:11:20.550585
569	image	Activity	548	569	2023-11-16 20:26:44.140574
570	image	Activity	549	570	2023-11-16 20:37:10.453444
571	image	Activity	550	571	2023-11-16 20:38:45.737369
572	image	Activity	551	572	2023-11-16 20:57:15.349512
573	image	Activity	552	573	2023-11-17 07:57:45.095731
574	image	Activity	553	574	2023-11-18 12:48:27.640868
575	image	Activity	554	575	2023-11-18 14:01:12.01221
576	image	Activity	555	576	2023-11-19 12:20:57.899912
577	image	Activity	556	577	2023-11-19 13:45:33.77533
578	image	Activity	557	578	2023-11-19 17:02:38.501466
580	image	Activity	558	580	2023-11-19 18:03:09.20492
581	image	Activity	559	581	2023-11-19 21:56:19.400951
582	image	Activity	560	582	2023-11-19 21:58:28.697074
583	image	Activity	561	583	2023-11-19 22:04:29.012634
584	image	Activity	562	584	2023-11-20 15:32:18.694571
585	image	Activity	563	585	2023-11-20 17:54:59.197441
586	image	Activity	564	586	2023-11-21 11:54:36.857299
587	image	Activity	565	587	2023-11-21 12:27:24.735307
588	image	Activity	566	588	2023-11-21 19:31:43.398996
589	image	Activity	567	589	2023-11-21 19:39:28.696345
590	image	Activity	568	590	2023-11-21 19:40:04.431916
591	image	Activity	569	591	2023-11-21 19:46:23.907937
592	image	Activity	570	592	2023-11-21 19:47:29.91225
593	image	Activity	571	593	2023-11-21 19:54:52.096036
594	image	Activity	572	594	2023-11-21 19:55:59.299465
595	image	Activity	573	595	2023-11-21 20:07:07.314229
596	image	Activity	574	596	2023-11-21 20:12:00.626554
597	image	Activity	575	597	2023-11-22 08:48:50.509681
598	image	Activity	576	598	2023-11-22 15:49:14.822498
599	image	Activity	577	599	2023-11-22 21:00:39.308763
600	image	Activity	578	600	2023-11-23 14:29:18.293875
601	image	Activity	579	601	2023-11-23 16:32:16.089705
602	image	Activity	580	602	2023-11-24 14:23:48.003573
603	image	Activity	581	603	2023-11-24 17:36:54.291472
604	image	Activity	582	604	2023-11-25 15:47:49.359627
605	image	Activity	583	605	2023-11-25 16:07:01.294768
606	image	Activity	584	606	2023-11-25 16:08:34.583841
607	image	Activity	585	607	2023-11-25 16:09:50.550681
608	image	Activity	586	608	2023-11-25 16:11:14.6653
609	image	Activity	587	609	2023-11-25 16:32:39.527703
610	image	Activity	588	610	2023-11-27 21:01:18.199533
611	image	Activity	589	611	2023-11-28 15:59:03.261042
612	image	Activity	590	612	2023-11-28 19:14:05.981084
613	image	Activity	591	613	2023-11-28 19:39:37.692455
614	image	Activity	592	614	2023-11-29 10:49:09.821296
615	image	Activity	593	615	2023-11-29 16:34:01.376025
616	image	Activity	594	616	2023-11-30 19:41:34.624636
617	image	Activity	595	617	2023-11-30 19:46:11.216983
618	image	Activity	596	618	2023-11-30 19:48:28.998114
619	image	Activity	597	619	2023-12-05 14:45:30.319811
620	image	Activity	598	620	2023-12-05 18:44:49.835836
621	image	Activity	599	621	2023-12-05 20:34:17.729722
622	image	Activity	600	622	2023-12-09 16:07:02.32523
623	image	Activity	601	623	2023-12-09 16:25:31.024246
624	image	Activity	602	624	2023-12-09 16:29:26.224176
625	image	Activity	603	625	2023-12-09 16:31:54.217418
626	image	Activity	604	626	2023-12-09 16:33:52.312536
627	image	Activity	605	627	2023-12-09 16:36:35.034447
628	image	Activity	606	628	2023-12-09 16:38:57.660725
629	image	Activity	607	629	2023-12-09 16:48:02.546352
630	image	Activity	608	630	2023-12-11 21:31:15.502723
631	image	Activity	609	631	2023-12-12 19:46:03.821369
632	image	Activity	610	632	2023-12-14 19:06:27.863028
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."active_storage_blobs" ("id", "key", "filename", "content_type", "metadata", "service_name", "byte_size", "checksum", "created_at") FROM stdin;
1	3kcbxjbicmk93j49n8x77jayrg0s	IMG_20201006_094128.jpg	image/jpeg	{"identified":true}	local	565746	sQVyE2SUd+FBycYIb0xY4A==	2023-06-02 13:22:26.415734
24	88syo8dvsc85wt3o6ooagty2c65e	20230527_084258.jpg	image/jpeg	{"identified":true,"width":3107,"height":2252,"analyzed":true}	cloudinary	4598234	4axUqSzOhUSnKNUR7J4fbw==	2023-07-02 20:25:35.308422
25	w111ciaos9nldlzch9ygbib4539a	20230627_184455.jpg	image/jpeg	{"identified":true,"width":1488,"height":2640,"analyzed":true}	cloudinary	5364608	GEtPqVtbwzm/QJe7AN0Bog==	2023-07-02 20:31:53.50534
26	ogp9kv5252uwv7m0e7x2qnruudks	20230703_162731.jpg	image/jpeg	{"identified":true,"width":2307,"height":1989,"analyzed":true}	cloudinary	2797818	YuBA7mECre0NCe/Ut1lf9Q==	2023-07-03 16:10:44.943266
8	yqacc3dkpkzic850oirjb7i9kdqt	Unsplash FO (15) 1.png	image/png	{"identified":true,"width":517,"height":620,"analyzed":true}	production_local	459314	8lNiG0JrZ+TpRFI8EN9SGA==	2023-06-29 06:27:35.161209
9	1pq55nk8aug20brqv7u1hbjp5sqv	IMG_20201006_094128.jpg	image/jpeg	{"identified":true}	dropbox	565746	sQVyE2SUd+FBycYIb0xY4A==	2023-06-30 10:51:07.237742
10	rl3muk6gsup6mpvj4rsbiugbndez	image 3.png	image/png	{"identified":true}	dropbox	35634	94LAycBsRvP5TwgYloHf+Q==	2023-06-30 10:59:20.968591
11	0rjs02py3g3tfgmz67nqzild9w7d	image 3.png	image/png	{"identified":true}	dropbox	35634	94LAycBsRvP5TwgYloHf+Q==	2023-06-30 11:21:13.305571
12	zyo48zlrdta3ea6zb2mboplt90zm	image 3.png	image/png	{"identified":true}	dropbox	35634	94LAycBsRvP5TwgYloHf+Q==	2023-06-30 11:33:56.213769
27	9jugjaeg68j9nvkvnwxf3jiqv9bs	Screenshot_20230703_193940_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	556777	SfXjDwEuUWiC2qdRqqgrLQ==	2023-07-03 17:42:09.144503
28	nnhyy338ynyeszoidjm8r6yhff1y	Screenshot_20230703_201426_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	464854	fliPTr44xfOpEukVGatvew==	2023-07-03 18:18:20.206153
20	tjotb0gxyocsngnca0318mhlo4ed	sporthealth-1-20230702-113758.jpg	image/jpeg	{"identified":true,"width":912,"height":1018,"analyzed":true}	cloudinary	168957	2gqt5adLZ+LLMTgohLchyQ==	2023-07-02 17:42:21.532926
21	oa4kc6fhjtvmv930frpdhrevmrkc	IMG_0251.jpeg	image/jpeg	{"identified":true,"width":1600,"height":1067,"analyzed":true}	cloudinary	747456	T+FdDlfG2a55VTzECwBcog==	2023-07-02 19:53:51.998503
22	fk62cc3a5uoh6iopet32sv8swp1y	IMG_0329.jpeg	image/jpeg	{"identified":true,"width":583,"height":428,"analyzed":true}	cloudinary	76531	kf84xVGDpb7WQlpcqTYigA==	2023-07-02 19:56:02.15677
23	pjzvq2rzj7142xp2sfwdvlvk9ufw	20230624_111350.jpg	image/jpeg	{"identified":true,"width":4000,"height":2252,"analyzed":true}	cloudinary	4037175	VmRzsZX7WO9qDkfEyzpGYQ==	2023-07-02 20:22:38.889716
29	66w7ieh7vmajy6q0jajeoteqanjo	Screenshot_20230703_201340_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	465487	u/lkmyWx/hmQJsMNwEFlsA==	2023-07-03 18:21:18.20503
30	t7x7igf6ph384x1pjqs46xy0ttw5	a63bd8a5642fe6afe1e91669cb2438d4 (1).jpg	image/jpeg	{"identified":true,"width":743,"height":615,"analyzed":true}	cloudinary	126196	Lt6OaUw5+qDY+Az0aG55dQ==	2023-07-03 18:55:05.720936
32	f5y8go8kxozo3da99lkx061wmzks	Screenshot_20230703-205206~2.png	image/png	{"identified":true,"width":964,"height":948,"analyzed":true}	cloudinary	1240026	MSmlzh0Z6VzGG7KXK7KqEg==	2023-07-03 19:02:01.913197
33	p0iyh50mzhq5ig3ik2l7uk1okqe5	20230703_223354.jpg	image/jpeg	{"identified":true,"width":951,"height":768,"analyzed":true}	cloudinary	274587	ew8MGIz22HQ8iNM4O+gkAg==	2023-07-03 20:38:38.00305
34	obvb1gp73d6iwdx81n60cclr1kom	IMG-20230703-WA0000.jpg	image/jpeg	{"identified":true,"width":1599,"height":1200,"analyzed":true}	cloudinary	339099	kf5zG1N4+e6xCjDv7PBapA==	2023-07-03 20:50:08.893092
35	q7khh1g1445nia4z5f6lba1ra3gy	sporthealth-3-20230705-204421.jpg	image/jpeg	{"identified":true,"width":912,"height":1018,"analyzed":true}	cloudinary	141702	GcvkuX/mV5Hk9SdvIg2b7g==	2023-07-05 18:45:25.247642
36	h5b7hxmmkjcslyy02xrxz2einkss	sporthealth-0-20230705-204942.jpg	image/jpeg	{"identified":true,"width":888,"height":1006,"analyzed":true}	cloudinary	392480	IeDN7FEVxnQ6uuq3QLfArg==	2023-07-05 19:45:56.911554
37	0t79ivqkqs1mbqvxhbi5q9v1453y	IMG-20230705-WA0001.jpg	image/jpeg	{"identified":true,"width":1600,"height":1187,"analyzed":true}	cloudinary	153045	U4iCrAUboC65+LV1tB+fkA==	2023-07-07 11:39:12.994884
38	5wy5fpyyb44y0lezbxk7x0k70j0r	Screenshot_20230707_133444.jpg	image/jpeg	{"identified":true,"width":1080,"height":1047,"analyzed":true}	cloudinary	241732	EkElvHEqGqInV+AfXNTzzg==	2023-07-07 12:02:47.929158
39	oxbtdr0vcvm509grtvdgco66kp3y	Screenshot_20230707_133532.jpg	image/jpeg	{"identified":true,"width":1080,"height":1051,"analyzed":true}	cloudinary	282232	y0xoXuQHkMrhIt3W2UxyAQ==	2023-07-07 12:09:57.319746
40	a97jxhkmtzgjdz9l1414hj8pg0it	IMG_0540.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	385434	PSqIkupPg6t8OQQiSV8uNg==	2023-07-08 11:17:19.857931
41	2dxihdk12xbpm19bdor8uy1c28np	Screenshot_20230708_094137_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	307945	8cJXRPrAywLW7nBw3dTMRQ==	2023-07-08 13:55:26.920199
42	8da9o4frrjeo9ou9x7lgckr5d1e8	sporthealth-1-20230708-210153.jpg	image/jpeg	{"identified":true,"width":912,"height":1018,"analyzed":true}	cloudinary	156404	DSOwRZrsnq/7eaOpsbruTQ==	2023-07-08 19:09:19.135378
43	4viml2ymix5yqjqlld7bec2631f0	20230709_092157.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	2407163	2XT1QZlaiZJEYkrYrU+X0w==	2023-07-09 08:08:15.122322
44	1h72c77tdfoc30x6rr0wzzwuq6r8	20230709_082740.jpg	image/jpeg	{"identified":true,"width":1980,"height":2640,"analyzed":true}	cloudinary	1390970	bKHwj9n2AmQZTNc0amK5aA==	2023-07-09 08:28:37.284167
45	de1mv05f05kautyqd9k9lwvlpkv1	Screenshot_20230709-134910~3.png	image/png	{"identified":true,"width":959,"height":961,"analyzed":true}	cloudinary	1380602	uRXEPcE88NQ5OtMLnqy6WA==	2023-07-09 12:25:56.017193
46	ncrj4715ju3q64mvp6m0djpmlxx7	IMG_0541.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	200329	LuxT6w9+fgUJOn7U82aAgQ==	2023-07-10 17:33:10.416539
47	nigaihgrqjn07huhkdy6nxfvqxfo	Screenshot_20230710_231424.jpg	image/jpeg	{"identified":true,"width":1080,"height":280,"analyzed":true}	cloudinary	26296	b0uPK3xyl9A+xajf5hbJGA==	2023-07-10 21:36:08.643202
48	jlq4rfmrz7wz2ihsxgcdi6sn9i5e	IMG_0543.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	213298	XBDGR4EJBsG63Y9MvZohvg==	2023-07-11 17:15:50.928794
49	krblw1gvxznmvf9cx7bpgpl9ssig	Screenshot_20230712_115206_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	382381	nTpNK7pWsoJhVdNLgcEvlA==	2023-07-12 10:13:07.112981
50	eno3d0mus8q1jf1jpl9ckilc4ftz	Screenshot_20230712_115216_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	390515	6iXuZwGQ+QdqnXcOTckY7Q==	2023-07-12 10:14:43.787516
51	70ipmlodnboouj1uglytgwirx409	IMG_0545.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	195366	4MlxGtZrNDEgxmDhh1EI2A==	2023-07-12 17:57:08.75595
52	kacdlex2oyxv9g83orujxabxu6y8	GarminConnect_20230712-201813.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	407820	UI8798KE/Qkd2yI4AYWc3A==	2023-07-12 18:24:30.919958
53	5mw9nnndwbe8cqve8h4z26nm9mjd	sporthealth-0-20230713-023421.jpg	image/jpeg	{"identified":true,"width":888,"height":1006,"analyzed":true}	cloudinary	391123	WJIUvQxG/hLZetL5zVGGOw==	2023-07-13 00:37:07.857733
54	griahi4odtxykl6cda0qfas0dq89	20230713_122946.jpg	image/jpeg	{"identified":true,"width":2448,"height":3264,"analyzed":true}	cloudinary	1603501	EaOkX1pWcRTK7m49vAOQjQ==	2023-07-13 14:36:42.689803
55	vuhh4nwfgowb6ihn6iuw7ya8pjtw	IMG_0546.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	202902	OPxMpYoeK40gq1+aBmV18A==	2023-07-14 17:25:42.246775
56	s9spcsw5yer9dpv68zssycflor3o	share_1689359848752.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	221483	ZgeoHZzNjHNJZRPeudorPw==	2023-07-14 18:46:38.189635
57	42hg9d1m9yw98i6pexj21jhgtwke	share_1689359890033.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	108676	gghuovnONMdXVys7d3Psbg==	2023-07-14 18:48:40.925781
58	7zwxnh41iayaqus6amtorgnpwo6x	IMG-20230714-WA0002.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	311193	cAryIJ9mZv13flECrGwWBA==	2023-07-14 18:53:34.225027
59	y4z7wueu40cgo054spyyp8omjhbm	Screenshot_20230715_010429.jpg	image/jpeg	{"identified":true,"width":1080,"height":1207,"analyzed":true}	cloudinary	326095	ItCR0l8letZvnvILVrFcWA==	2023-07-15 00:29:22.876605
60	6cxaee9zul4owcdlsouwlqlpyyop	IMG_0547.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	3264080	yqtQLpuVKKccf6CFCJzBMg==	2023-07-16 07:02:07.560041
61	jh89od22mm7gsgt7zw1e8qqh4vom	Screenshot_20230716-141134~2.png	image/png	{"identified":true,"width":1080,"height":1009,"analyzed":true}	cloudinary	250709	YKh61TCJvvTKlUGYdpNpDw==	2023-07-16 12:12:59.817579
62	c8s83ddndiy2z0kz13hvomlpw6p3	20230717_185829.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3587349	/GEQ8KT9wR4xdp6YdiYNtA==	2023-07-17 17:56:58.049512
63	1f4pwd4r3oupirxum86mglivjoqc	IMG_0548.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	199595	99Hp8xzBT0vPW0yrPR4jtw==	2023-07-18 17:32:48.845492
64	83lwnoy5n59boqbfxtii4xaqdcfw	IMG_0549.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	213581	9BGD3/PHzu2CFUMyUUcpRw==	2023-07-19 17:59:15.833268
65	gi3g2pkafs7g6ie3efanw9ck5k46	74c83ec0.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	165042	j7thVJcKVSk/wp+9DB8LBg==	2023-07-19 20:23:40.978253
66	0hr4wed3tr1ijj6eq6og86whg2xb	e2a8aa14.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	142803	YW7NBfSToRHhX6mJONbnUw==	2023-07-19 20:24:29.381392
67	wyy0pqqzaaryct50q6qh3wv2n3p0	IMG-20230720-WA0000.jpg	image/jpeg	{"identified":true,"width":2048,"height":1154,"analyzed":true}	cloudinary	270224	uNl4OftCB8AgcuCQfb0vnw==	2023-07-20 18:09:38.981542
68	bqkyyvlsx3v6aowo3q6wu5vk6ldq	Screenshot_20230722-144826~3.png	image/png	{"identified":true,"width":1080,"height":1298,"analyzed":true}	cloudinary	293873	dp/MjkF3Pv60IHJkVB1zrw==	2023-07-22 13:00:41.209383
69	umw8kw7fwfzgfa3ba4nigb7p42qh	GarminConnect_20230709-100957.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	554089	6+gQdMljKvLnQH+T6Y4f9g==	2023-07-23 10:02:22.753883
70	8o2v7tirhfl8103v4kdxknih79t7	GarminConnect_20230723-100531.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	587975	aC80aubMSnuNccdamAKzKg==	2023-07-23 10:04:24.345962
71	ax9at2o9ch7a5dux67wa9dqub015	4e720298.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	143543	CNhuyWSQFao9DgJkUESUtg==	2023-07-23 18:38:08.251506
72	cbtshm628252zxbtlzghlhc90ey2	20230724_192401.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	4026755	OdkOnRZjruNTAvkgLh8kCA==	2023-07-24 19:10:01.95942
73	90cpc5zhoz6w5oinso371ad3htks	Screenshot_20230724-212202~2.png	image/png	{"identified":true,"width":938,"height":950,"analyzed":true}	cloudinary	1228117	1HXVU1BwVw2RDqOibA3QVw==	2023-07-24 20:10:29.353178
74	ed7c1je7e1zqp5se7hoym6vdf1ac	sporthealth-0-20230725-095808.jpg	image/jpeg	{"identified":true,"width":888,"height":1006,"analyzed":true}	cloudinary	544545	x6SOCOv9aZBFiNESrymd1Q==	2023-07-25 08:00:36.220231
75	x1xqst0g96sujgnx2jurjwgf1ndt	Screenshot_20230725_104959_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	402040	RCnSzrC9QT6mxIFCg83hgw==	2023-07-25 18:28:49.821072
76	ilv9b0b3ozwc8eipu3cmit886bjr	Screenshot_20230725_105013_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	371798	ei1p2QhJ1tdQ1iXozEcjww==	2023-07-25 18:30:32.77266
77	wzmsjk255wrj0urt555rus42xuw1	20230725_185517.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	5103100	49OfNHXGA6Q6HUTRFslfxA==	2023-07-26 06:02:59.559842
78	02fkzh2x3g13d9cn1dlbeio5g43l	Screenshot_20230726_082503.jpg	image/jpeg	{"identified":true,"width":1080,"height":1227,"analyzed":true}	cloudinary	218284	wyfUpL0AOEuN2T3esdqYvA==	2023-07-26 06:32:19.868725
79	buc8idtb5l0l8w1st719lag9d72w	Screenshot_20230727_083837.jpg	image/jpeg	{"identified":true,"width":1080,"height":1036,"analyzed":true}	cloudinary	200782	oG4tyOzM3G9ZnRWdJP4yxA==	2023-07-27 06:40:01.752907
80	ym4o31w0cpr0uuq5t90atqlsjjqr	IMG_0021.jpeg	image/jpeg	{"identified":true,"width":1170,"height":1241,"analyzed":true}	cloudinary	230642	QpV/Kce1JTdmX2yrtI7DTA==	2023-07-27 19:28:05.841013
81	y3fi2jt2st4dlefpivzjcqmlq7k8	Screenshot_20230728_131902_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	370380	gyH7H0T8ZNcZuAvkpCRnBQ==	2023-07-28 11:24:28.069391
82	nyic4hgpybi9olau5ce3vush6iv6	Screenshot_20230728-220313~2.png	image/png	{"identified":true,"width":815,"height":888,"analyzed":true}	cloudinary	174545	T336p0608QPRmKcPfbvZ/w==	2023-07-28 20:06:32.167438
83	gzg6dv1qoug65iwk6codh8p8cea4	Screenshot_20230729-174434~2.png	image/png	{"identified":true,"width":1080,"height":694,"analyzed":true}	cloudinary	64288	GoPCDj01RAQ3npOT1BlR/g==	2023-07-29 15:58:14.084666
84	o9jh6nqngn94rdnu82f3ghw71xa2	Screenshot_20230730_132051_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	817384	oi2GgfjlU8YJcfVGRrGgVQ==	2023-07-30 11:30:52.758845
85	l8vnlc7zry7d1e3aio1rffj3vj5k	Screenshot_20230730_132216_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	722270	41SSgOHoaWp60aYC65L5rA==	2023-07-30 11:32:49.653927
86	nhzlcavm41zo5yykp9yp3j05v2yn	Screenshot_20230730-141112~2.png	image/png	{"identified":true,"width":1027,"height":1083,"analyzed":true}	cloudinary	986028	Vck6tuYxiI220UHQQfOHeg==	2023-07-30 12:31:25.314055
87	y0apxyml77l29xac9zye50yamfo8	20230730_223753.jpg	image/jpeg	{"identified":true,"width":1134,"height":1367,"analyzed":true}	cloudinary	362769	gLRffrYWi1neZEs69T4WGQ==	2023-07-30 20:39:56.421331
88	xw240i8uw96g3ud0tyvftk8zuq8k	20230730_204806.jpg	image/jpeg	{"identified":true,"width":1980,"height":2640,"analyzed":true}	cloudinary	1317460	gZ7aK2J5GOJsn5lUi1iIqg==	2023-07-30 20:43:12.075931
89	76as5jj9dc551yu7egum755u9aai	IMG_0046.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	157681	MVZhmVBnTTccL5XNRMbxDw==	2023-08-01 04:53:10.73415
90	30mtt5pg5cw6tvn0b6s6af62plqk	20230802_083442.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3550344	dM3BdHD0h/raqOHgOICq8Q==	2023-08-02 08:15:19.909586
91	znv3luhxkjq3t5iy8h8t5uj61j8r	Screenshot_20230803_120629_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	729234	tsRC1pIcHwDv5gcoo/vsJw==	2023-08-03 10:10:54.429591
92	lwrqe3hut2tr214q4j34q9ic5egq	sporthealth-0-20230804-203245.jpg	image/jpeg	{"identified":true,"width":888,"height":1006,"analyzed":true}	cloudinary	483064	1tzEK6WvoiJrwNYuVE4b3g==	2023-08-04 18:42:25.082882
93	5o2a1boo94hb3l22swq5cgw2yipl	Screenshot_20230805_103707_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	710590	NSya6cqm38X0HwtR+BFESA==	2023-08-05 08:45:00.430533
94	532lazppj1b6dfumejv3ea5b6uc2	Screenshot_20230805-175858.png	image/png	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	306238	Efl7a1TlUhamOtl8ZccKkA==	2023-08-05 16:07:11.107155
95	3te9nn5kuzboq7tvlhfv452miwzq	IMG_0081.jpeg	image/jpeg	{"identified":true,"width":870,"height":866,"analyzed":true}	cloudinary	229294	LdsaMOLS/ZEDDJ/hZCmZmA==	2023-08-06 09:49:32.949443
96	jsflome4wreo8w59jcy7u46rycnk	20230806_181937.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	2461545	IjZVGaHZ4nwZD00Rx/cqKw==	2023-08-06 16:59:38.856684
97	z64ab7v6c3c17kvg02zk9wqtguh1	20230806_202356.jpg	image/jpeg	{"identified":true,"width":1980,"height":2640,"analyzed":true}	cloudinary	1222893	UFAkELMiHskCcH88BCK+cA==	2023-08-06 19:46:20.503225
98	jp2wecjxb3wn57n2bzmzwc8ylx5z	Screenshot_20230808_005812_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	696777	4J1eeMyVlC+z7fpOu3tOXQ==	2023-08-07 22:58:37.951522
99	6e78hnw0vv1b981s9je9unf26q4n	Screenshot_20230808_222012_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	710393	Q+krYRi62X2+LwYHEwIxpQ==	2023-08-08 20:25:45.182757
100	95vqjzfjgq79ueyg04bx568f34su	Screenshot_20230810_184446_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	703003	3ku8wYq+eqBOMB4V45BR1Q==	2023-08-10 16:46:21.937815
101	21562bp43nz0cithtw6sajcj17wa	Screenshot_20230810_184509_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	700686	O43J3G4lNfT3jaK1633G5Q==	2023-08-10 16:47:19.688902
102	787o5li2k606nl1svpsqjqri7fnv	Screenshot_20230812-164133~2.png	image/png	{"identified":true,"width":950,"height":967,"analyzed":true}	cloudinary	300584	Hi1264OMNFrWLvQ3lCMGVA==	2023-08-12 14:44:37.472545
103	sinpxd3a4cndd81uvgh3741214ds	Screenshot_20230812_200442_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	661620	Le4a9ssW6j+sd3JYPwJuFw==	2023-08-12 18:31:09.35936
104	2mzwrnq5de0y2r2587zb8emzc9dp	Screenshot_20230812_200414_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	696818	SzOhwkXGSGB83SsC6UrLAw==	2023-08-12 18:32:50.241606
105	1ajhei6ni3pw8j7i05mmqao7byh2	Screenshot_20230813-210956~3.png	image/png	{"identified":true,"width":973,"height":896,"analyzed":true}	cloudinary	213100	hXOys5G8wLANkd32TrrJGA==	2023-08-13 19:15:03.057462
106	troa26advtq4onxj92mrga80wg0v	Screenshot_20230815-111124~3.png	image/png	{"identified":true,"width":946,"height":966,"analyzed":true}	cloudinary	1367140	j4Y+8z8cWuHgHo1adN0b5w==	2023-08-15 09:13:42.303779
107	te1q6tty1u38v6jkl1bthf50sxf2	Screenshot_20230817_125951_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	371853	atmB3e+s5PeG7SzW1jMF3Q==	2023-08-17 11:09:19.800382
108	y9l8eoyewp3fmjscxno8a6kwxelg	Screenshot_20230817_130043_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	363368	QBWk95D1WU3xhMbxh5kIvA==	2023-08-17 11:11:17.281784
109	sfnqfnjqc75yjlw4jiwbklj41bwv	IMG-20230818-WA0003.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	306542	qFuaupnwZzkytSweWtxx5g==	2023-08-18 20:34:09.231449
110	vbqalyflzb5bcmhdeaakdsf7e1po	Screenshot_20230820-101835~3.png	image/png	{"identified":true,"width":625,"height":775,"analyzed":true}	cloudinary	281327	52uUH1Qu+nPtX5VH/rf99Q==	2023-08-20 09:37:19.801461
111	zppqufsfmqg4cofwe4it64skpt1n	IMG-20230511-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1108,"analyzed":true}	cloudinary	759798	dNbVDeJ2SSjTxov3oP395Q==	2023-08-25 05:33:45.914932
112	8hz8nk7ocoajpmi3znwozc91nepg	IMG-20230511-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1108,"analyzed":true}	cloudinary	759798	dNbVDeJ2SSjTxov3oP395Q==	2023-08-25 05:35:12.19656
113	b4nvbhdoluxqd0jiacpmxt555rko	IMG-20230511-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1108,"analyzed":true}	cloudinary	759798	dNbVDeJ2SSjTxov3oP395Q==	2023-08-25 05:37:00.420181
114	inpg5ne5hf5csc392lsjxdbdgbwo	IMG-20230511-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1108,"analyzed":true}	cloudinary	759798	dNbVDeJ2SSjTxov3oP395Q==	2023-08-25 05:38:15.617171
115	nyva6mvvvkaae7yxspgoeanjt0t3	Screenshot_20230827-161357~2.png	image/png	{"identified":true,"width":872,"height":847,"analyzed":true}	cloudinary	844110	jUhKmGPBM7zL9lbZezx8hg==	2023-08-27 14:15:27.95006
116	rdy95sebiobohysa1h24ltkd7w9x	VID_20780312_134424_686.mp4	video/mp4	{"identified":true,"width":1080.0,"height":1920.0,"duration":2.966633,"audio":false,"video":true,"analyzed":true}	cloudinary	2802282	FTluVwNCmXT66U8ods3iuA==	2023-08-27 14:20:04.947516
117	bxm9gd0wzyx569z722f6whju2i6z	IMG_0566.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	150217	CZiSFCcbge3XTAWgG15woA==	2023-08-27 17:39:26.578425
118	5fj8kx47rbtfpj94pz89d7tf16hq	IMG-20230828-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	184707	iW7Y/QeqMdgwu18iHm/kIQ==	2023-08-28 20:06:57.918113
119	g1gc0ge5p7of1wsh0tyxtbnkfwso	20230828_190140(1).jpg	image/jpeg	{"identified":true,"width":2448,"height":3264,"analyzed":true}	cloudinary	2634892	kgI0stkjKArfUNuf+X3TCA==	2023-08-29 05:17:32.133559
120	ff0zghir67ye2o8oujcajfinekws	IMG-20230829-WA0001.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	270502	5rWQHtn2enssanKQb72r1g==	2023-08-29 08:28:11.725201
121	r7vqchnt5uzm9fdvfzt6q67aubhm	Screenshot_20230829-104851~4.png	image/png	{"identified":true,"width":635,"height":783,"analyzed":true}	cloudinary	484014	3cusoSN0d4aqp9K4xk2DOA==	2023-08-29 08:51:00.424719
122	tsm76qovblulqubvu8tmme3vpzf5	Screenshot_20230829_150311_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	369746	5mmjwm75imoMWTDLj7cyFg==	2023-08-29 13:04:04.677262
123	vn0hbfdkfunqtg0liv8pv1m18emj	IMG_0568.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	164959	NaE2wAxX1TZXabL+GKzSEQ==	2023-08-29 17:10:35.899404
124	cuvavir5er6slpba94ws3bvx8m3a	IMG_0569.jpeg	image/jpeg	{"identified":true,"width":3024,"height":3024,"analyzed":true}	cloudinary	1229821	SHS5Li3cUWQeR2ROl0SVtA==	2023-08-30 18:16:04.076413
125	6g0ch9huuy65noz2lncc2rw2s3ti	IMG_0570.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	624292	ESWp09duyeTT4n5v0hZUUQ==	2023-08-31 16:18:23.029079
126	y37n2epih6f16im7f4r1s3gt2rue	Screenshot_20230831_181527.jpg	image/jpeg	{"identified":true,"width":1080,"height":1038,"analyzed":true}	cloudinary	231686	tWBgweUSczeY2bkzZD62KQ==	2023-08-31 16:42:20.695073
127	2snrbpru1gsb5cczcyn6xh6myhqy	received_1356794404873979.jpeg	image/jpeg	{"identified":true,"width":1536,"height":2048,"analyzed":true}	cloudinary	256112	OKUEKJvFkOvotg4Q7zMo/g==	2023-08-31 19:12:53.622761
128	f26rha2ne3srn24hz9eojssytw2b	IMG_0572.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	174541	9CZNXHU95htQYYpj4IZEuQ==	2023-09-01 12:28:06.057052
129	31h7g4rnjeos7zicdyxnwwi122yd	345B3C61-D051-4CA1-AE62-3941491008A1.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	326312	TBifsDVJ9DKCsrWBvHegHA==	2023-09-01 15:45:28.162315
130	fbwnotw2aunr93edgsvngls63pnl	a1ca40c42ac8cd7e904298ebf45e9b.jpg	image/jpeg	{"identified":true,"width":1440,"height":1800,"analyzed":true}	cloudinary	292987	iCTRgQTBMygXywwHiLVndw==	2023-09-01 16:23:19.454231
131	ismqry0ry09pc4g0jbt5es0qoiuy	IMG_0245.jpeg	image/jpeg	{"identified":true,"width":2304,"height":3072,"analyzed":true}	cloudinary	764294	FciH0sSNWGXj79w0hlutgg==	2023-09-01 18:25:23.269795
135	6ww5qbyd14e6hv4abzncksu2v6wq	Screenshot_20230902_194246.jpg	image/jpeg	{"identified":true,"width":1080,"height":1176,"analyzed":true}	cloudinary	127569	QxNFYyzQmGEmpISIrN+nGw==	2023-09-02 17:44:59.608485
133	blpdzgbugt118589jz29pzw8afxr	Screenshot_20200612-220026.png	image/png	{"identified":true,"width":720,"height":1560,"analyzed":true}	cloudinary	978975	nv/l1qslBikPB/WkeJ/UCA==	2023-09-02 17:00:02.623664
134	tznhauha47g7mhshxgo8g812plbc	Screenshot_20230902_193656.jpg	image/jpeg	{"identified":true,"width":1080,"height":1048,"analyzed":true}	cloudinary	243766	kGXG5IJtOYGZbTdBKlrt3A==	2023-09-02 17:41:23.913964
136	ovczc82no6hxq2gjl7jk4nz7ri7h	FB_IMG_1693676723966.jpg	image/jpeg	{"identified":true,"width":1080,"height":1657,"analyzed":true}	cloudinary	279762	14LDnXEdSP+K3747tb5R7Q==	2023-09-02 17:51:30.196568
137	mna4r1u3x4lmmmyeegrv12gcg5p3	IMG_20230902_211151_181.webp	image/webp	{"identified":true,"width":1080,"height":1920,"analyzed":true}	cloudinary	540212	21hxPlpV4lU1fAjqGVi9Lg==	2023-09-02 19:12:22.283314
138	gomy2cqeuzlzer8ud78i5qw5vw78	165F0F2A-E81D-47E8-92AF-B2D0ABB035CE.jpeg	image/jpeg	{"identified":true,"width":960,"height":960,"analyzed":true}	cloudinary	259708	nLfd/2+ObgnAXTeCUs5+IQ==	2023-09-02 20:09:14.010531
139	9y7u49yvgr5oevbby22hqtj3hn2b	IMG-20230902-WA0007.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	416916	p2k1vZ0WKxLrzOpTdwPKkg==	2023-09-02 20:10:49.263688
140	bbp1vzm8sd7zveyzyd9c9hsry644	IMG-20230902-WA0005.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	416916	p2k1vZ0WKxLrzOpTdwPKkg==	2023-09-02 20:44:16.949374
141	djc1ge4ivgou6xwh2apc0zmq85n3	received_651559033612307.jpeg	image/jpeg	{"identified":true,"width":1536,"height":2048,"analyzed":true}	cloudinary	396298	ndk9eY4sAgMpFpZFAPRaVw==	2023-09-02 20:47:00.899789
143	w8jyowig0jb066lfe6o4rw8pvfa8	Screenshot_20230902_223859_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	287294	15MsMg+gsg2F0pr/a5iCHg==	2023-09-02 20:53:03.72002
144	7xxk9y0fajgs6fvmnvrnq41lpz8i	Screenshot_20230902_224021_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	259318	epONHlORSZLImXzXZdnsjw==	2023-09-02 20:54:24.748156
145	kf2fm0vzixla2gesqsl01wmkbfur	20230902_192821.jpg	image/jpeg	{"identified":true,"width":1488,"height":2640,"analyzed":true}	cloudinary	5674105	LtaYvgXTaxRgWS0noy3/1g==	2023-09-03 06:11:11.104483
146	iipgyxfyhtpreeunn8at7d1xn6gg	20230722_135420_Burst01.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	3032394	31CuJT92GRmnpZRm7HiUNw==	2023-09-03 07:11:43.870527
147	fp760x7ecptqv10geqtmeaiko17a	Screenshot_20230903-121523~2.png	image/png	{"identified":true,"width":759,"height":1325,"analyzed":true}	cloudinary	1268185	W77whHW4ZuRlL3iGxU14dQ==	2023-09-03 10:22:10.597466
148	9kvw5x8kv9meof34smrqxrne8l8d	IMG-20230903-WA0001.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	178105	W9eSfv0BZJ4VG7plf6YHVg==	2023-09-03 11:10:37.66199
149	m99pdq6w8dla7uqiw2jwa1tjfr94	IMG-20230903-WA0001.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	199573	2DsKdLf9D5vjL1wIPn51PA==	2023-09-03 11:14:54.872006
150	pk8nws9egbff1luyc6986ilj36r2	IMG_0580.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	674359	bQByDD8MCp4j8wy+nQYY2w==	2023-09-03 12:34:54.502157
151	p3h7gnsgw1a69evh5e48qihivc97	IMG-20230903-WA0005.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	433969	/md2j2a+MLAhbbj2B8KloA==	2023-09-03 12:42:10.198548
152	d93p82nxsfj9vqrulxgtfdcfkbmq	996FBB48-50E0-4C05-ADBF-D2CD0EBA7CFE.jpeg	image/jpeg	{"identified":true,"width":1512,"height":2016,"analyzed":true}	cloudinary	690228	0vIBljhdm5/ZNkiXbq81tA==	2023-09-03 14:46:17.454027
153	yit9oxhtksf8qrvphbo8fj488hss	IMG-20230902-WA0008.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	286657	8SiiWwMeFo84GTUR+uvZGg==	2023-09-03 17:27:28.357235
154	nv4h9563v8bjqbsblnatzdc2xp7y	IMG-20230903-WA0001.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	178105	W9eSfv0BZJ4VG7plf6YHVg==	2023-09-03 17:29:26.54706
155	a8whffk9k293m8hppov6hhb7j8sv	Screenshot_20230903_212310_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	583670	XU4+RpAhdbK8tc9KX+EWMQ==	2023-09-03 20:26:34.360622
156	5unbm2uqsx13r1q9wswqgpsihvv2	IMG-20230904-WA0004.jpg	image/jpeg	{"identified":true,"width":1440,"height":1800,"analyzed":true}	cloudinary	210104	nB0EJM4HVzr7c3i1r/iWdA==	2023-09-04 16:54:10.997791
157	5lml4feb35qkxild6dywd19zoayd	20230901_173409.jpg	image/jpeg	{"identified":true,"width":3585,"height":2252,"analyzed":true}	cloudinary	3336719	VYbCcNjrFVtGw5SYoEkSRA==	2023-09-04 17:01:06.179165
158	4xqdv811bxp5gum7itpxyc40kiyf	IMG_0269.jpeg	image/jpeg	{"identified":true,"width":2304,"height":3072,"analyzed":true}	cloudinary	617652	JpPekMZTmCVOOXjrh8bhDg==	2023-09-04 18:57:12.931179
159	h5yfqnkjqaamtbxmfk8udbzzrgk1	Screenshot_20230905_154503_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	588577	O7pazo4fTqmjb+/8eWo5qA==	2023-09-05 14:49:14.800647
160	d0q4kj3z8in6c3b9y8nse86rsvlf	IMG_0581.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	165758	FsdkTpgYR3x9oiuFu6vSXA==	2023-09-05 16:56:44.667801
161	shrb4iojil3f04mmlepq12p7tzh8	1777DC06-D0D1-4230-9865-C2893FD875E5.jpeg	image/jpeg	{"identified":true,"width":3303,"height":3303,"analyzed":true}	cloudinary	1299427	cYkntkPRgI+gfrHDSeNRhQ==	2023-09-05 17:49:54.494834
162	od2m1f2i4fcgdpgxngj8qh00mn9u	Screenshot_20230905_194851.jpg	image/jpeg	{"identified":true,"width":1080,"height":1258,"analyzed":true}	cloudinary	322225	hsyB5BHquwMxAgi7zXGulw==	2023-09-05 17:54:41.191679
163	7355imqht0n5xd2i6uxunngns01t	20230905_201140.jpg	image/jpeg	{"identified":true,"width":1421,"height":1400,"analyzed":true}	cloudinary	230545	8nPTaHoEgSLFu3RaIpQDsw==	2023-09-05 18:16:46.658479
164	a5540zdpi9gkshcbq68cam3c85ri	20230905_201102.jpg	image/jpeg	{"identified":true,"width":1419,"height":1419,"analyzed":true}	cloudinary	247578	Ekrh2wJacO1l9XFGL87o+w==	2023-09-05 18:17:53.201992
165	6hyyc6fbujdm7viyejrxc25eo4ux	IMG-20230905-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1101,"analyzed":true}	cloudinary	196029	6ON7SekTR4DpkRy916KhhQ==	2023-09-05 18:22:43.69969
166	byy2t04knweqkmypn111ib7618dg	Screenshot_20230905_202028_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	434802	T7saEW2DNM3S7o31FA/OYg==	2023-09-05 18:24:40.600953
167	mjinujmbxk5po0z0o5ysb61r9i4q	IMG-20230905-WA0005.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	320730	AFiccCArso0JWKg3pKDLFw==	2023-09-05 18:29:01.815611
168	fbnzm6wftbmhqqpueddpw7jzda36	Screenshot_20230905_194707_Huawei Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	540216	tmqbpEtghR5KwviqOU5GdA==	2023-09-05 18:40:19.683808
169	fgwlgmqw18a8xdtr8zrv0pqhv86q	IMG-20230905-WA0003.jpg	image/jpeg	{"identified":true,"width":1600,"height":1101,"analyzed":true}	cloudinary	196029	6ON7SekTR4DpkRy916KhhQ==	2023-09-05 18:42:15.949108
170	99svbuhuvwnmqjosvxrw6v46w7ft	GridArt_20230905_211730562.jpg	image/jpeg	{"identified":true,"width":4096,"height":4096,"analyzed":true}	cloudinary	5223279	tJudvJ4ToWrhpvKyTPnf0w==	2023-09-05 19:21:51.572684
171	hjk8uwjx7wb7uk7n67kb7d4en58x	IMG-20230905-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1101,"analyzed":true}	cloudinary	196029	6ON7SekTR4DpkRy916KhhQ==	2023-09-05 19:41:02.868684
172	2inqozjsaytafinxc7bvlq3o92n7	A471909D-E15C-4100-A5E6-BE332C0C6DF1.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	358981	06jOh6WUwZqVlNmj5m7utw==	2023-09-06 07:57:18.45127
173	zoye95j05p6g2buufcwbxwnemukc	Screenshot_20230906-203318~2.png	image/png	{"identified":true,"width":1080,"height":1334,"analyzed":true}	cloudinary	398751	NK6O5p51OPbVQxTjbo7Dgg==	2023-09-06 18:37:17.42018
174	r3tivbsb5sca9qf1bq9cd6pwarua	Screenshot_20230906_224015_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	446401	ueesnElVY0F5BI9D/tqg+w==	2023-09-06 20:43:36.268452
175	5nmoxtxvzofla877pz76u34frele	5D31642B-1D58-4EA0-8722-1DD1F6F34CA5.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	273300	n1SyWwp1Voe2dpnhwQDvlg==	2023-09-07 07:34:03.368522
176	wcmba91zhszri6f7rrgzdynim2pg	Screenshot_20230907_192749_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	427062	uDiHNgPiVqgSw0LVIrHPRg==	2023-09-07 17:34:00.716309
177	97m7deeh15ats5o9d9cqhw06wlyt	IMG_0582.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	150197	b7whNjmJk2/O7oyLFjIBpA==	2023-09-07 17:45:04.688806
179	323jqbhrhes4lbcuczrlxs2l8yl1	Screenshot_20230907_200726_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	487672	DCHBAbceocT/yLYzvaoN9Q==	2023-09-07 19:21:22.568438
180	rlml9c9dvyza532gdq4untbvsyjh	IMG_0583.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	623644	lnifVjyDbi/lwdnqiqHYpA==	2023-09-08 16:20:05.870497
181	ki89q2svhg03mp1r0kxumwe37a6b	Screenshot_20200612-220026.png	image/png	{"identified":true,"width":720,"height":1560,"analyzed":true}	cloudinary	978975	nv/l1qslBikPB/WkeJ/UCA==	2023-09-08 17:06:17.464483
182	961wd2k5bx2r9tvfec68k1e3vble	Screenshot_20230908_230701_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	361195	Ir1Vb4u7ltVo69Md9s8YFQ==	2023-09-08 21:08:13.745798
183	jxplavgqjh1q0m0lr4ry58asl7xl	Screenshot_20230908_230937_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	398615	Wjz9LypCM6hvCb1cakBy/g==	2023-09-08 21:10:46.355245
184	vkmy5ykpqtetwkt02u2bhwnbtgzs	Screenshot_20230909_102335_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	287697	pOiN6Lbh0ck70k/jmIvVEQ==	2023-09-09 08:28:55.73023
185	mkwwq0t3obyanvmp8024rlp0fshh	Screenshot_20230909_171820_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	581716	ZEXJCDHEV1MVtq9y7o3CmA==	2023-09-09 16:21:56.896096
186	kj3vo90ah5y1cn56q7m3asiovur8	20230724_094933_Burst01.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	3184921	I9biNDKAYiaq91BpFNBaTA==	2023-09-09 17:26:51.920435
187	qzrrdzj7osrdq4vcb1vegfirhcu2	IMG-20230910-WA0000.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	371537	7Y+H/T3D9dF+t+hDJ2Cc9Q==	2023-09-10 06:44:08.643064
188	z967s7mnphnvpf36vf7hj6bompsx	IMG_0584.jpeg	image/jpeg	{"identified":true,"width":1140,"height":700,"analyzed":true}	cloudinary	170477	ZrMw1moKCxlALgz0mTHXHg==	2023-09-10 08:52:36.783233
189	95usuen6kxtpl80rxvgqt439wu80	IMG-20230910-WA0014.jpg	image/jpeg	{"identified":true,"width":1440,"height":1800,"analyzed":true}	cloudinary	246611	i2yZWjnicstKzwXTJyx8gw==	2023-09-10 10:42:22.391123
190	ueqylyseishnb7aafbjpv7dg5kh9	IMG-20230910-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1200,"analyzed":true}	cloudinary	354431	X+CyVg6Igcx/GnATcF8FfQ==	2023-09-10 10:51:06.879623
191	c37c569qahl7v6x4a0benu2m3fuc	IMG-20230910-WA0004.jpg	image/jpeg	{"identified":true,"width":1600,"height":1200,"analyzed":true}	cloudinary	353087	QNsemhpqQsiJpRUUCZXoew==	2023-09-10 10:54:38.178368
192	fbxl75crjiymji1ztcgth6husior	IMG_0296.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	cloudinary	4025562	p1Y2GOVUGIZ16s2wVHu/iQ==	2023-09-10 10:59:48.783638
193	qxyjeihs6ngt3lfqybk28mh0eunn	ueqylyseishnb7aafbjpv7dg5kh9.jpg	image/jpeg	{"identified":true,"width":1600,"height":1200,"analyzed":true}	cloudinary	354431	X+CyVg6Igcx/GnATcF8FfQ==	2023-09-10 11:12:17.970109
194	b2oa2fjxetqpca3epo3ny289r02m	IMG_20230910_132806.png	image/png	{"identified":true,"width":1074,"height":786,"analyzed":true}	cloudinary	1356175	hoh/ATixjYTw6u0+2QgtcA==	2023-09-10 12:53:59.401113
195	10baju6hryoudwe2ucxwhc2w104f	Screenshot_20230910-094927~4.png	image/png	{"identified":true,"width":1047,"height":1107,"analyzed":true}	cloudinary	466846	NcFR8dEMBrPhAj07IVHSjQ==	2023-09-10 14:21:55.522154
196	5ug2jyauv4yzar4u7fq6fid5qrdp	20230910_165123.jpg	image/jpeg	{"identified":true,"width":1439,"height":1416,"analyzed":true}	cloudinary	429800	kaCdsmrKcMi1bRaUlMWoAA==	2023-09-10 14:52:02.212651
197	h2tlmisrytue29dkyt5lldzrtsl6	GarminConnect_20230911-164824.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1114424	tX/yXtW+ZZdJ2K6415i5bg==	2023-09-11 15:50:07.481091
198	0vbxsiq6k2xd6d163l51l6nfh77d	IMG_0596.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	158404	PmlIJDWbLBYgtNeuaI6nWg==	2023-09-12 17:51:07.820215
199	0dryib0t5l74m5mya464eptt1spg	naklejka-biegacz-01.jpg	image/jpeg	{"identified":true,"width":1500,"height":1500,"analyzed":true}	cloudinary	29724	sTXRvYsbdqCgy+ZrTZcvJA==	2023-09-12 18:04:28.06183
200	kh77wt381jbap0wzjuczlwamxykj	GarminConnect_20230912-185035.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	850590	bjFHKEqYSiNJ6u3Ny7MnoQ==	2023-09-12 18:18:26.404026
201	nqmc8ciixstt6t1utmc19ie80827	20230912_203001.jpg	image/jpeg	{"identified":true,"width":938,"height":760,"analyzed":true}	cloudinary	223906	uhQ0vK/I/gCA9LClCLyrPg==	2023-09-12 18:34:12.699723
202	zx577owj3jthsl4xour4xoh87hn5	FB_IMG_1694545424166.jpg	image/jpeg	{"identified":true,"width":1080,"height":756,"analyzed":true}	cloudinary	161903	2myPnF8wWY3tvmZ3SKXwGQ==	2023-09-12 19:07:15.861166
203	3k1s6ph8vimmuqdb9mj471d7lz09	E5C3673F-C420-4FDC-9B85-36FA30BA7D09.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	361513	RGKnFNZ6MWAQBUCieRencQ==	2023-09-12 19:15:25.203741
204	59378ga4r892f7az04izz21r2ipf	IMG-20230912-WA0003.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	360035	t+LDNt3o/LjMUCVKS9a3dw==	2023-09-12 19:21:46.953637
205	8hh0tid17g9o9shiz3426sfz65l4	Screenshot_20230912_211844.jpg	image/jpeg	{"identified":true,"width":1080,"height":1026,"analyzed":true}	cloudinary	552435	ZIFh5ZfzfR1j5gbhBRgg1Q==	2023-09-12 19:22:43.971137
206	mnw556xfaquss242k3vg1zovf2lw	20230912_173532.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3788519	1/uGnOZIrIynRiyFFfXYVg==	2023-09-12 19:24:17.304961
207	ll9htym46x9tqxv1c7tr12fwxsx3	Screenshot_20230912_211411.jpg	image/jpeg	{"identified":true}	cloudinary	187894	0A+sHcV/WtdB14HUgUDlYw==	2023-09-12 19:24:55.516859
208	b6tsf5l8edoap0gs2vlrq0d94zwm	IMG-20230912-WA0002.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	123714	ztPu7f1a/0UuJmAHqUe3Pw==	2023-09-12 19:36:11.348055
209	xcxjox5knzn36mgllha8focf8ysx	20230913_114425.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	6481852	+YGeI9pYn5DPVrRXeKMdnA==	2023-09-13 10:25:02.244878
210	wjxsm12y2bubxbv5l16hc4i0f4gc	GarminConnect_20230913-163510.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	850376	LwXMRn0dS+KMDSDj1iZIGg==	2023-09-13 15:36:11.812027
211	545erqkc00amf401ui816hw0undo	IMG_0310.jpeg	image/jpeg	{"identified":true,"width":2304,"height":3072,"analyzed":true}	cloudinary	530612	Cgio1XbMO/ew3MV13Bnr1w==	2023-09-13 19:51:02.555629
212	wujbxcarn3iksapx3rtuy32equ2h	IMG_0598.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	150798	0KaT2NbbSqZtBLVBIptSfw==	2023-09-14 17:49:17.323431
213	fo904swhgly6yvicwd2wpdc9y5mu	20230915_180144.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	4100578	sPV5PNR+vDuT1k+coSjqiQ==	2023-09-15 16:08:29.769666
214	6zole33ibd91ph0qw538lkpc9s82	Screenshot_20230915_225400_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	385898	gQk1sfNEn1GSJbD6K/A7Kg==	2023-09-15 20:59:42.159312
215	zdk74natyvccqfofunai9usrq2lz	Screenshot_20230915_225504_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	395934	MNjf7kxC2xbrm8Ml2j/ZxA==	2023-09-15 21:01:20.458044
216	u96xmj6r0l535d98m6l0yepqku59	IMG-20230916-WA0000.jpg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	cloudinary	155497	98A5Z6DH60nATEcmU5aJTQ==	2023-09-16 13:09:00.089268
217	jnpbv34gwjchotfdcuh2fx63r2mo	Screenshot_20230916_150615.jpg	image/jpeg	{"identified":true,"width":1080,"height":1049,"analyzed":true}	cloudinary	418183	d6omvIdtBk+Upy1xr3TDrg==	2023-09-16 13:10:46.580779
218	k4sc7awyhz68da4g784blfdngqxb	IMG-20230916-WA0004.jpg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	cloudinary	150499	IXBdj0ohwyRyqfjl+wWyYg==	2023-09-16 13:46:31.462398
219	cma3sko6ia3t8s5tazodsxpied8q	IMG-20230916-WA0005.jpg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	cloudinary	155497	98A5Z6DH60nATEcmU5aJTQ==	2023-09-16 14:17:44.580982
220	2javapm131x0ninwcl3lh4wsxd2d	Screenshot_20230916_162947_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	288022	qsZE9tDn3+m2DqCH9w00eg==	2023-09-16 14:34:21.069548
221	tm8uhaynpqttpsueify1hgnbmrr9	IMG_0604.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	354245	80mWunw9doecoBWURon68A==	2023-09-16 15:11:17.304301
222	skkgoxffoy13cb5axxhq9f839s6n	IMG-20230916-WA0004.jpg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	cloudinary	150499	IXBdj0ohwyRyqfjl+wWyYg==	2023-09-16 18:18:41.274353
223	tveqcfwn1tn9vb7vc2gz39sevi2l	Screenshot_20230917-103750_adidas Running.jpg	image/jpeg	{"identified":true,"width":1440,"height":1441,"analyzed":true}	cloudinary	1225512	Jt6pV3Pf6CZWlJtInefUmQ==	2023-09-17 09:48:02.206946
224	og6azepalc25cxqdfdzz9jeie0b2	IMG_0605.jpeg	image/jpeg	{"identified":true,"width":3024,"height":3024,"analyzed":true}	cloudinary	1591567	bGuzO+DoKlAOtp41aYPR/w==	2023-09-17 12:38:12.587989
225	q5m1vejmxzll3577xqyrtf6k35x0	Screenshot_20230917-171943~2.png	image/png	{"identified":true,"width":1080,"height":970,"analyzed":true}	cloudinary	402520	y5ztwvOD0qLJgEsRrPAqOQ==	2023-09-17 15:41:47.128414
226	x84u8k07tujj3829ayqq02pa6uva	GarminConnect_20230917-184034.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	650095	qUBdakhhJ71wR4NZXDHpJQ==	2023-09-17 17:41:53.674393
227	vylejwl11l4c2blgx6nembiycbts	IMG-20230917-WA0000.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	367168	enBBtoZtr4NNP9kBo/7HDA==	2023-09-17 19:09:20.600601
228	xgctuswg0b3k4azbsay677k1xthu	IMG_0606.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	302159	2zcn5yBkFmoGeHpm0Uc88Q==	2023-09-18 17:10:35.583749
229	spfqf6r3phsknba8yd3ngd9s3ars	GarminConnect_20230918-184211.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	700911	ihi29DF09V0/CA/EYX0SDA==	2023-09-18 17:43:12.878744
230	jckuv089e6ittollk2pva3w61w89	20230918_195123.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	2453740	F0hRdo14hlGraBJEFiuq4A==	2023-09-18 17:55:39.098572
231	onpnzpuwoq5jwgliqff47dt09zut	Screenshot_20230918_200452_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	463023	w+5idPaHf9pRsWP1MIigHg==	2023-09-18 18:08:40.934837
232	y34eg5660fbsjmd17611ugju8fwk	IMG_0351.jpeg	image/jpeg	{"identified":true,"width":2304,"height":3072,"analyzed":true}	cloudinary	450111	Z+ZvoZTEvhcq31wc/jCQmA==	2023-09-18 19:06:50.387812
233	6uo0xqgro5gqjs5f26tyxustific	Screenshot_20230919_105948_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	382463	rcl/azS7X8zrDsSBeo9E5w==	2023-09-19 09:00:32.484613
234	fujhgrw2cmwivuqfjxbbgwqd95qj	Screenshot_20230919_194600.jpg	image/jpeg	{"identified":true,"width":1080,"height":1669,"analyzed":true}	cloudinary	301526	r4TRJ2vRnjyLAv2cJANK8A==	2023-09-19 17:48:40.094802
235	51ufl10lqek4l1yq8216ddd0ra1n	Screenshot_2023-09-19-19-59-00-048_com.stt.android.suunto.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	547029	eEBMPqc0di3us1TTrs1mFw==	2023-09-19 18:02:41.505063
236	wgqoc1toq1e0ytv5jk2knags0ql0	IMG-20230919-WA0000.jpg	image/jpeg	{"identified":true,"width":727,"height":1024,"analyzed":true}	cloudinary	97429	YOx55RwrnWKmjAa8aC2ZYA==	2023-09-19 18:13:27.047424
237	h05i0pjb0l33udfhzqtkfvahdelc	195D7564-4E9F-4F1A-A652-631903D72B1B.jpeg	image/jpeg	{"identified":true,"width":4362,"height":4362,"analyzed":true}	cloudinary	1905893	IJrm07aodYhAOmgfE5tXfA==	2023-09-19 18:17:10.116163
238	rli8hbqc1ntyygauubis1ld3juz8	IMG-20230919-WA0000.jpg	image/jpeg	{"identified":true,"width":727,"height":1024,"analyzed":true}	cloudinary	97429	YOx55RwrnWKmjAa8aC2ZYA==	2023-09-19 18:56:32.883806
239	3ze1sn9aen54cnspz1nr98h1s04l	IMG-20230919-WA0004.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	155230	TIPxa2n08VAlWPKRLZHTdg==	2023-09-19 19:05:54.850329
240	rufc4g41c01nxzfg8q7lodymz3aq	IMG-20230919-WA0011.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	338815	TUm0SCLe2qidVh4g/0oJBg==	2023-09-19 19:38:50.883863
241	xnman4d1cfd9gxzfncigmcvegbav	GarminConnect_20230920-160525.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	773401	c3fGuS2O2LnvwsoheQSfCA==	2023-09-20 15:06:20.455451
242	jak9tdmwsynu9nhgtokbed6s2cco	IMG_0607.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	143605	oFS2dpT6UF8mJggULQz1KQ==	2023-09-20 17:22:06.748954
243	78jodkzf9mbs3kyep75ma8iqtbg5	20230920_191641.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3146261	Ti+3eLQTGreGY0zGD7Stcw==	2023-09-20 17:35:33.136412
244	4n0cmcr4n49j19latyug8f38029q	GarminConnect_20230921-150111.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	697301	89DSBGzYF5zJAKVnIAdoFA==	2023-09-21 14:03:32.436153
245	oaorb5prfsnwt9fouss243dh300h	IMG_0608.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	166523	Li1+tn9/nOPsI5J7Q6/r4A==	2023-09-21 17:27:45.251664
246	7k4w9wcwsc7lvylp3o087oljqo7m	IMG_0609.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	152951	dULFNPVgpQ6BuoksLzFDZQ==	2023-09-23 11:31:04.27214
247	k0fmd2ahqtxml8yjty71qtxz00ju	Screenshot_2023-09-23-17-25-52-963_com.stt.android.suunto.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	345179	j+QGtvfcK5ep3x04ZjpUCw==	2023-09-23 15:40:56.303382
248	satkr3jc0b07xhn4z5huvnzvjvf1	Screenshot_20230923_185109_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	431642	IVpqjVY0lkgl0viimWOtjA==	2023-09-23 16:51:57.302719
249	dfv8ui5t5eqm1d2aaqnftxev350r	IMG_0610.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	148902	ezIfNg6w0Ry853ird3appA==	2023-09-24 11:18:03.629668
250	l0u6c1jwo9nady8k4iw7x8vhdygx	f378cc3c9326ddeecfed828ecb96f87.jpg	image/jpeg	{"identified":true,"width":1200,"height":1500,"analyzed":true}	cloudinary	497556	XnXLN3cGNLvHCwmd64h5Hg==	2023-09-24 14:07:24.492714
251	mdkc4zg5edps7pt3ij3ntjz91e06	FB_IMG_1695569362102.jpg	image/jpeg	{"identified":true,"width":1440,"height":1440,"analyzed":true}	cloudinary	163774	5jU6ekRJRZEZNs35tJg9mw==	2023-09-24 15:30:22.055746
252	0r0t1b9ha0jaq5vj78anbqseiqod	20230924_185147.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	4388973	2tHaGpAXNkO2i05OJe1NdQ==	2023-09-24 17:08:07.592823
253	s8j3vv3w7ii84ley4w5eigog4s37	IMG-20230925-WA0000.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	324634	cY6VkQihDzNGwrSnEZCFsA==	2023-09-25 19:10:39.005979
254	fz93g14c1x0jdplat6cq3688udvk	Screenshot_20230925_232107_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	417677	zstq3uyQjWoSmI0w30hb9w==	2023-09-25 21:23:50.75701
255	h4bsuceqwgicsa7ve84k6914110m	Screenshot_20230925_232134_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	394247	KqIpWjU8zDVrICdXhFRsGg==	2023-09-25 21:24:58.698631
256	f7yzoga0g2kdaankmt4ygz2ny5uo	IMG_0612.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	141182	wlLVzgqy/ttDxxSH0arWsg==	2023-09-26 16:59:01.080542
257	9tvij3120dvf9f30w432q0mktfk2	16957506450892295560238349186199.jpg	image/jpeg	{"identified":true,"width":3840,"height":5120,"analyzed":true}	cloudinary	6417766	3Se1Po+mjKpDsAyjxhGUFw==	2023-09-26 17:51:41.714216
258	o8ai7p6m1czduj8x15h6tkge1tqo	IMG-20230926-WA0008.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	110914	WBhyp9J04lTOsQ23YIlGtQ==	2023-09-26 18:16:55.329261
259	bt1qntf3eu4ankvplb7616ze0o4l	12ecdaea-cf8d-498b-9b5c-1740acf35636.jpeg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	116660	dj75Hwgcce6bnSmz2y0CPQ==	2023-09-26 18:28:09.859093
260	76wrn1nidbxt4ue1a12m1ez4jml7	IMG_20230926_203736.jpg	image/jpeg	{"identified":true,"width":1917,"height":1588,"analyzed":true}	cloudinary	763817	CXssJamp9lYBe+a9njwt2w==	2023-09-26 18:39:43.355577
261	q31vrk23kq7koulg47srwyq1zr8m	Screenshot_20230926_211056.jpg	image/jpeg	{"identified":true,"width":1080,"height":1051,"analyzed":true}	cloudinary	422553	YgrFteIf37/oOPSAn8gMeg==	2023-09-26 19:16:56.036636
262	1n9oivqwnu0qg9xeaqa1epvnirgb	IMG-20230926-WA0025.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	141474	fRw7gt+zRG/lK/1j3MYZJw==	2023-09-26 19:22:33.545185
263	8vvwds8lm9s81dogxe51cpx2muv4	GridArt_20230926_202521201.jpg	image/jpeg	{"identified":true,"width":4096,"height":4096,"analyzed":true}	cloudinary	4077672	L5T0Czy19/YDtnHHEfEFrw==	2023-09-26 20:11:36.908849
264	lmo7hwe3ee8jwcxvul6t4ss31ocy	6BD061CA-DFB5-4DA6-8399-0EE2C3086BEB.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	406473	/s74SYfkEY0W+noE8ZzUQA==	2023-09-26 20:24:31.93572
265	zke5wnk69t1450pvhg7c5xl8hgfr	20230926_203821.jpg	image/jpeg	{"identified":true,"width":1435,"height":1428,"analyzed":true}	cloudinary	452410	rFlonM+RgtSbs37Rq5E5DA==	2023-09-27 04:02:15.445757
266	ql8ymd0ps2uowh8qwl9x72osr8w9	GarminConnect_20230927-190649.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	77418	d6x/WOJ4bdmBnaClh1COIQ==	2023-09-27 17:09:27.595699
267	37jffgepncfvurzvsg3e4o1x07ja	20230927_191553.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3160715	jdDYz8PyLLs3cP61soL8aQ==	2023-09-27 17:27:29.895068
268	sizk5o0zvw78ckrqo3q3ndalut5y	Screenshot_20230927-193827~2.png	image/png	{"identified":true,"width":1080,"height":1318,"analyzed":true}	cloudinary	464753	EzXgRPS5Ph6M+G2v8TQYrg==	2023-09-27 17:43:27.130899
269	u0aslezpbkhm3gfi8m1zavycuodu	IMG-20230928-WA0000.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	323426	9BQ+qG8a58hcnYv3a5XxuQ==	2023-09-28 06:26:02.726761
270	apn6a4avht9ezefjtr6kecm4yx2r	GarminConnect_20230928-100113.jpg	image/jpeg	{"identified":true,"width":1024,"height":1023,"analyzed":true}	cloudinary	858357	vNcmh4K8nDl2fS2jvgee4g==	2023-09-28 08:06:48.594582
271	9216f7n3gq3fzui40joqtpmiv5os	IMG_0613.jpeg	image/jpeg	{"identified":true,"width":750,"height":750,"analyzed":true}	cloudinary	109815	fownq/NuOcHld3dGzj257Q==	2023-09-28 17:05:07.556598
272	n4eehyaz8s5zwonqdyupap4zh1n3	GarminConnect_20230928-195746.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	635179	/ElKeaxcNCT6oJsCZadN1w==	2023-09-28 18:00:25.488883
273	9e7s3fukm62z4t9i1qanmr9ixj2z	IMG-20230928-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	141797	CiEotWWCN+386imP0Qf2UQ==	2023-09-28 19:28:04.026932
274	2613lhllrj0khomppcgebsygej6n	IMG-20230928-WA0000.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	141797	CiEotWWCN+386imP0Qf2UQ==	2023-09-28 19:39:55.155805
275	ogdqxc7btjiu44tlsz2ppjjbi6o1	20230928_190801.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3573284	AP4vI8RQqbcAF2TNWMqNuA==	2023-09-28 20:02:03.821986
276	x46iphhb3uu8dvllsmaf1m60qfod	IMG_20230928_222544_755.webp	image/webp	{"identified":true,"width":1080,"height":1920,"analyzed":true}	cloudinary	273642	Uol0NRZN31U5NmmXk0xOnQ==	2023-09-28 20:27:27.816357
277	5uclft7r1h5rp6dc5y1isbqs2tmd	Screenshot_20230929_003057_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	351312	755q54xBLKe7ZjLRcW4Mfg==	2023-09-28 22:37:17.035852
278	vx2v69vjnlfr4z7b0z0z2sinwg8r	Screenshot_20230929_003135_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	391512	9FuvfcyPRU/tTlQQ+aTPVA==	2023-09-28 22:42:12.828894
279	6scx1qmv6wwi56piivkfmghc8sby	IMG_20230930_134319.jpg	image/jpeg	{"identified":true,"width":3840,"height":5120,"analyzed":true}	cloudinary	5987638	/2i42DWP/UcjG+rQH4KCDQ==	2023-09-30 13:53:17.384299
280	tkcxcjaekpqi8xm561nie2y0eo46	IMG-20230930-WA0018.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	245749	ceCY0XTGeXFLpFnQaSFGyQ==	2023-09-30 14:53:44.018414
281	r24vwrai7m0whe0x2cgtsa9zddjj	Screenshot_20230930_095517_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	289445	URbtkhJW/nWkocItat+5wQ==	2023-09-30 14:53:56.644461
282	yfmw9sgg7r4kvhxqm2l055q7lxbb	20230930_102737.jpg	image/jpeg	{"identified":true,"width":2736,"height":3648,"analyzed":true}	cloudinary	3009401	QQWbsgQvCMvkV1+k1/CElQ==	2023-09-30 14:54:06.414278
283	b2z8krmey82o8y4pssua97yc43yd	IMG-20230930-WA0014.jpg	image/jpeg	{"identified":true,"width":2016,"height":1134,"analyzed":true}	cloudinary	363117	A9QKepIzeuUOJlYA1g8feg==	2023-09-30 14:54:11.820508
284	3636xuw1ojx4t7myr7f715w8hluz	IMG-20230930-WA0066.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	265625	oowgN3MpEb2L19wa1oT4Gg==	2023-09-30 14:56:54.289761
285	00vbbz2hm9cxkuy0zyvnetoe5512	20230930_165837.jpg	image/jpeg	{"identified":true,"width":1440,"height":1371,"analyzed":true}	cloudinary	284353	shhJP37m0AeaEgGMhYLVQg==	2023-09-30 14:59:22.609901
286	o4ctupfzn45b34nhmwcyubjeh59b	20230930_111631.jpg	image/jpeg	{"identified":true,"width":2448,"height":3264,"analyzed":true}	cloudinary	6742661	amPcSjEqFJjC2dJUHqg1Rw==	2023-09-30 15:52:16.83777
287	1xtxhb9pbdyn2avj2glu0l3mh8aq	d8c45f6a-632b-4e21-a406-0f9411020454.jpeg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	581134	oEfqLQZ3MWrAM90eHTeMEQ==	2023-09-30 16:04:58.798779
288	q9gkyqryew4482aas5og8hfummjm	received_24765974506334853.jpeg	image/jpeg	{"identified":true,"width":1530,"height":2040,"analyzed":true}	cloudinary	532319	fnuNlvKgN6sj9QrMedpgCg==	2023-09-30 16:16:29.340243
289	dw4n6dfdqkcyleuomu61z2dj2gsy	IMG-20230930-WA0005.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	282475	bYTyLu2EDOCcawV/KPxyOA==	2023-09-30 16:46:58.297999
290	5lgqkxxhww3m7kyon1994zy6upxg	Screenshot_20230930_200340.jpg	image/jpeg	{"identified":true,"width":1080,"height":1027,"analyzed":true}	cloudinary	473950	ynzrHxnB2thYI1pHt7wnAQ==	2023-09-30 18:08:19.03179
291	s86wpqtk120341ptvj0h1o046yer	20230930_135127.jpg	image/jpeg	{"identified":true,"width":827,"height":1359,"analyzed":true}	cloudinary	374578	VXkrr5es8eZNsWIdncCcrQ==	2023-09-30 18:11:01.338946
292	11i4xgycpq7ar824whor9on04ohu	GarminConnect_20230930-183202.jpg	image/jpeg	{"identified":true,"width":1024,"height":1023,"analyzed":true}	cloudinary	631345	W39kUS0ndZYKN19qSV9FIA==	2023-09-30 18:50:20.241893
293	qjizli4wogdeowh1b7ilxssafybt	IMG_0616.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	1665272	LFaDp1UwHCNm2dyr9xny6w==	2023-10-01 12:18:50.879691
294	hakm8usgrncmgb39zp7sy6stx6tv	Screenshot_20231001-145747_Facebook.jpg	image/jpeg	{"identified":true,"width":1439,"height":1440,"analyzed":true}	cloudinary	471228	qwRe/9GGuEwjkoVk4WIzpw==	2023-10-01 12:58:35.768518
295	9c5mjsk8m8hkiln7b816748q4jc5	20231001_200148.jpg	image/jpeg	{"identified":true,"width":4000,"height":2252,"analyzed":true}	cloudinary	2759447	TxCWfkK2sWTksmPfvOiIDw==	2023-10-01 19:38:14.976108
296	etzib2vl0vn2z5qoe4i5loaauu7j	Screenshot_20231002-182247~3.png	image/png	{"identified":true,"width":589,"height":974,"analyzed":true}	cloudinary	267598	eXYyNC4r1XLpkEJgt5Dzmg==	2023-10-02 16:35:48.794397
297	p7v8ybcdqreqtivhucnvs12q3qxx	20231002_190211.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3058412	E3WMNAs35mRaIRertmHyig==	2023-10-02 17:14:07.253443
298	q0hnwetzf13ibfxdsrc28dtq1dbu	GarminConnect_20231003-170053.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	582437	DP15IBTxla29+g/U0Kf61w==	2023-10-03 16:03:31.943854
299	r00fvj7mkv7l0rspcbtf0wgr9z8e	Screenshot_20231003_200053.jpg	image/jpeg	{"identified":true,"width":1080,"height":1054,"analyzed":true}	cloudinary	165697	J98Sg3WhnZp5AcYkgL68fw==	2023-10-03 18:04:52.524259
300	vk4iyq5zkus9qp771lcokhjnfun9	IMG-20231003-WA0014.jpg	image/jpeg	{"identified":true,"width":1280,"height":1600,"analyzed":true}	cloudinary	145900	92ggoJq1/bIxB3Zmyhulow==	2023-10-03 18:22:51.10355
301	yrd8zfayxbcijju7cot93rjdaa61	IMG-20231003-WA0007.jpg	image/jpeg	{"identified":true,"width":1536,"height":2048,"analyzed":true}	cloudinary	321466	pXsLObQIpRinXSvdKqs1dw==	2023-10-03 18:25:07.530798
302	wo236rvew37gswu63zme5kjaxi75	IMG-20231003-WA0015.jpg	image/jpeg	{"identified":true,"width":1440,"height":1800,"analyzed":true}	cloudinary	212293	YAsWYdBSBOm3yUDM7W24JA==	2023-10-03 18:25:29.097617
303	ell8qkowz54s1vmpddwli8fm734z	16963590394308260767806897841883.jpg	image/jpeg	{"identified":true,"width":3840,"height":5120,"analyzed":true}	cloudinary	7320593	IL8/rSs5PTiQ3BW0lMjdBw==	2023-10-03 18:52:10.139579
304	n585d2nuuu6g5y08mmsjwws4skhz	925BDD2C-4ED4-4471-BB15-1B9CCED31337.jpeg	image/jpeg	{"identified":true,"width":960,"height":960,"analyzed":true}	cloudinary	185330	/srVWOOwtI7u8EZ2kWrTbg==	2023-10-03 18:56:06.372164
305	hk0utmvtwdy0ujg0iwbl4dzpjug2	IMG-20231003-WA0007.jpg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	cloudinary	224666	vxc9rkP1Zt7V07Gki0nQ0w==	2023-10-03 19:02:01.142329
306	7svhvnwi35g00zotvuwyx5l66a02	IMG-20231003-WA0004.jpg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	cloudinary	224666	vxc9rkP1Zt7V07Gki0nQ0w==	2023-10-03 19:02:54.583147
307	aerobj67fin8hp6v7d12bz4z3s2q	IMG_20231003_211533.png	image/png	{"identified":true,"width":1080,"height":843,"analyzed":true}	cloudinary	1179607	i5HjVSNge1nfZxJUlG9Xtg==	2023-10-03 19:19:00.101753
308	mdy4elfwa1p1i6v213r8xf8w1icx	IMG-20231003-WA0007.jpg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	cloudinary	237632	Jzx452h3t/cx7fxBQMf0Zw==	2023-10-04 04:22:19.194711
309	hz6gsowqmvbcta3k95nabpfwx0rg	IMG_0401.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	cloudinary	2726365	r75X7s8A1nDE4LwXEycSYw==	2023-10-04 04:33:43.911456
310	mnku1e5kgsc0zw3eads9vnfo58ts	Screenshot_20231004-184057~2.png	image/png	{"identified":true,"width":1035,"height":1232,"analyzed":true}	cloudinary	225412	IaXNR7y9wtG7HzADqpxiUw==	2023-10-04 16:45:52.579375
311	a0uo541j37ihhyy1tko2evjy2k4m	Screenshot_20231004_191711_Gallery.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	268060	HewVoFX27ODbLlhxvyUSvQ==	2023-10-04 17:18:12.548858
312	p4kp7ft6gf54f37ya61nk255l3pz	GarminConnect_20231004-182812.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	571864	i4wcA5bP/pfy1Xo3TY/GOg==	2023-10-04 17:29:07.232576
314	ndbki42ugcxhv0rx7f0dvvyjen9j	IMG-20231005-WA0004.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	342618	siNc7q1retqxjf8tm9BVNg==	2023-10-05 16:15:22.528362
315	5vmyha9f6kwm7zulzno3raa7opt3	Screenshot_20231005_195916.jpg	image/jpeg	{"identified":true,"width":1080,"height":1054,"analyzed":true}	cloudinary	356837	DIKs6peI8Dxy3M1noVLOmg==	2023-10-05 18:03:48.406775
316	72yqvwxdkxj29eytghkco0pf2zvk	IMG-20231005-WA0005.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	183904	oWW1kwoTRsAuzrkBzba9xA==	2023-10-05 18:32:09.009779
317	w8nfrujs3jgh7p0lav13cu4cefgy	Screenshot_20231005_203755_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	573768	lWknaHarOJrOIn7qGloC5w==	2023-10-05 18:42:03.369907
318	sui720o27yovm15c4h2xo90ze6dq	1e4a8a57-b62c-4360-a34a-a592305746c4.jpeg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	143659	yfRMXq6ECVZNS8ek8h3lcA==	2023-10-05 19:03:20.743693
319	tzszt6kwqia61zdqxsrp4wci850s	62CC8919-1E43-4A88-B153-EB4B7F1D756D.jpeg	image/jpeg	{"identified":true,"width":3600,"height":3600,"analyzed":true}	cloudinary	1404215	AKXLqltTdfb2JjjarPxh0Q==	2023-10-05 19:04:00.821903
320	l5q8cml5mo2qhtk3fizw9zx7tfhq	IMG-20231005-WA0008.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	183904	oWW1kwoTRsAuzrkBzba9xA==	2023-10-05 19:15:42.537007
321	9ct3ln60tz6fwpkpwxkkhiwr16tf	GarminConnect_20231005-201625.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	575089	er4FlZL8iUxK/nyMLiz1Xg==	2023-10-05 19:18:26.917865
322	riegl237kq0colqrzt2et53dgeea	IMG-20231005-WA0006.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	177677	KmvHRR3C6URI2n7YONKggA==	2023-10-05 19:39:40.176968
323	4idgjeglhiofec2h11sgzaru7zax	IMG-20231005-WA0007.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	143467	KGO94ZKcE7BFkc5y47ffSw==	2023-10-05 20:19:46.891405
324	zaqhi8sn0j891ckwjnlx3gk551oz	IMG-20231005-WA0007.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	143467	KGO94ZKcE7BFkc5y47ffSw==	2023-10-05 20:20:44.263943
325	bdjtqa5omqemw2useobdufewq4lp	GarminConnect_20231006-181833.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	991822	1OXkcz7AfY0bsOhLkt2IHg==	2023-10-06 17:20:52.189359
326	dm96zepyclu8p8e6nbnbnd2dyrjm	GarminConnect_20231007-122222.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1123772	Z5rMsF6wzfdzOOtx4Fjthw==	2023-10-07 11:24:27.452628
327	jwrw7dfhu7xrbtppa96cvtj5b0n7	Screenshot_20231007_132323_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	676722	Gxpej5jACqiiz8mh5Qz/cg==	2023-10-07 11:27:45.87653
328	xjoy55eh96rd0hn41f6voebt2r9e	Screenshot_20231007_132346_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	675626	nE4i35zDBLyrJiRFmEEGLw==	2023-10-07 11:31:48.5041
329	1y8f9s2xbedapkk8utxxusp3pl1k	Screenshot_20231007_132400_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	675760	YYHqZJ/XxJE+rwvVqE7apg==	2023-10-07 11:33:47.627092
330	4qh9yq9ddjli2pxchl9sq5ab5cfx	Screenshot_20231007_132412_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	674111	eBLeVcvLu6EiyoygG6yCRg==	2023-10-07 11:36:09.508024
331	5l4xknw9scf5h806sgb7ouudcg17	IMG_0644.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	285152	2Y2h/1uIa6HbQyh9NFh5bw==	2023-10-07 11:56:58.994296
332	rfi8c0o660part34ptwcmw98zf7c	20231007_133234.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3326904	xWgVwC/KZg/LjBYL6H9JVQ==	2023-10-07 12:24:24.879993
333	si1ppd2am65ztuwvy6k5xw7i9kyp	Screenshot_20231003-174436_adidas Running.jpg	image/jpeg	{"identified":true,"width":1440,"height":1377,"analyzed":true}	cloudinary	997877	WuayQmjEt3n2aiLNa1xHeg==	2023-10-07 14:11:38.204051
334	fvc81qdeem4ym0hjy594qq4svnxb	IMG_0430.jpeg	image/jpeg	{"identified":true,"width":2304,"height":3072,"analyzed":true}	cloudinary	945087	HZS+w/jbtxoy5TkI8XicOA==	2023-10-08 11:01:04.60143
335	yimbboccqt0bhjvzf119iw2kbyu2	20231008_125044.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	4516015	KZPrXEcHKdayL0BWHYEqFw==	2023-10-08 11:05:13.005737
336	pfzb4pec8bx6m4uxtftohiy499u5	IMG-20231008-WA0004.jpg	image/jpeg	{"identified":true,"width":1440,"height":1800,"analyzed":true}	cloudinary	203762	kI+2/bromZ/s4OnysdZdtw==	2023-10-08 11:06:51.113001
337	3ogws5en0hqb32cv2uf1wajbg4ge	Screenshot_20231008-140428_Facebook.jpg	image/jpeg	{"identified":true,"width":1439,"height":1440,"analyzed":true}	cloudinary	717564	WGD3/7rMoUw4/fr526hRPQ==	2023-10-08 12:05:37.303011
338	budoj5yb8f7tv07c8xxj2nr55fpx	IMG_0645.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	159048	iCYhXRdqNtarwTkpeZI5sA==	2023-10-10 16:38:20.837176
339	gw51631c8ow0sug95i85lxc2cl20	EF11FEDF-9BEF-4222-ACAC-5176E94455E2.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	308806	PKkEOMesvd5yZsyIZp1RJw==	2023-10-10 18:02:55.91768
340	xghqzdunf2i9kikdkgji2vls7rif	Screenshot_20231010_200255.jpg	image/jpeg	{"identified":true,"width":1080,"height":1038,"analyzed":true}	cloudinary	246408	CQdoRApUmurvVBGXIUcNKA==	2023-10-10 18:04:05.116429
341	fda7m1gmvk4p8o28498xiyjlx2mx	Screenshot_20231010_211941.jpg	image/jpeg	{"identified":true,"width":1080,"height":1032,"analyzed":true}	cloudinary	164400	9YYpR5UcuPHlj83cT5T9xA==	2023-10-10 19:21:52.9551
342	jamzphzhv0jc82x0od3rpej5yblo	Screenshot_20231010_212520.jpg	image/jpeg	{"identified":true,"width":1080,"height":204,"analyzed":true}	cloudinary	12844	d0A4DtTN/slNPobs5EsKSg==	2023-10-10 19:27:57.030728
349	6fxb3fbwcz02536uudi7d8pr99c6	IMG-20231011-WA0002.jpg	image/jpeg	{"identified":true,"width":1280,"height":1600,"analyzed":true}	cloudinary	117420	Pbli138sYpXRv1DXgU5rLg==	2023-10-11 17:54:40.401426
344	th97au4fz53w85vn6g6b6eb0ub14	IMG-20231010-WA0000.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	91796	KDXJsl4cbmoeSKPJQBHfhA==	2023-10-10 19:42:58.703124
345	obipuvrkcyah4lba5fnbnccsuk02	Screenshot_20231010-213725~3.png	image/png	{"identified":true,"width":1080,"height":1028,"analyzed":true}	cloudinary	253231	Or3YYf15EMoWOuNtnz56jg==	2023-10-10 19:49:48.307524
346	pd8nywc7hkea7guf4m2cxu3x3ggj	IMG_20231010_215938.png	image/png	{"identified":true,"width":1067,"height":1025,"analyzed":true}	cloudinary	1036286	H7wRDKUbcBUa1x9Z4COMjA==	2023-10-10 20:01:46.306275
347	ua5ffz02e8qyxr26lequq63cs42i	IMG-20231011-WA0001.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	325797	cENdKA8aheMFFensO9nEKA==	2023-10-11 06:35:55.838798
348	n7tpl945ytmqzqyuw12jqdhilyh9	20231011_095415_01.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	2356675	/moGweAe8JyI40vq1dyteA==	2023-10-11 12:59:47.37812
350	c4m35dibf0w8o3nh7x04raz4qzm9	IMG_0646.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	143949	5kLYh1Lf/tFpG3MNkIU9pA==	2023-10-12 16:44:47.926195
351	cxtra6x1eoyi32xu21mirztzaalu	Screenshot_20231012_202815.jpg	image/jpeg	{"identified":true,"width":1080,"height":237,"analyzed":true}	cloudinary	21143	znu+PW2YNUk6N5Gl48crGQ==	2023-10-12 18:32:27.386198
352	mm0rx582ljry91kqm6am4vesmokn	9E1F5A99-ABE0-4080-82A3-FCC9344548BB.jpeg	image/jpeg	{"identified":true,"width":2304,"height":2304,"analyzed":true}	cloudinary	682080	snCgrLxfKFt58IkcvBJdWw==	2023-10-12 18:47:12.579584
353	itvvum19l6qh7ngk0tuckdaxcgix	IMG-20231012-WA0001.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	92605	DaZzMPBt+zduMaVq/oJEHA==	2023-10-12 19:00:34.664451
354	1v8jn73waj103fpcwwguql9rl2vj	IMG-20231012-WA0001.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	92605	DaZzMPBt+zduMaVq/oJEHA==	2023-10-12 19:40:53.359264
355	ivfhnzb0e7j1fw9kzsepcnt7g0o2	Screenshot_20231013_134944_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	672165	r3sKp+H9QY+/SRj1A+tgLg==	2023-10-13 11:52:26.52771
356	m9kfm8le0g8jniisfn7hkam8t0yq	Screenshot_20231013_135352_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	668504	izHSCml9DCoz34NG+nAtIw==	2023-10-13 11:54:33.359178
357	0l3bju9p5t4n6brz5y5sbo6jkzx5	Screenshot_20231013_135546_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	668367	pQgtp5ScpqTMmyG3nfQ6dA==	2023-10-13 11:56:09.205274
358	u1eua0plcyu9k1r5e7948lhnodg3	Screenshot_20231013_184419_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	521822	IEGLFh9XMGaDv6+V19kSsA==	2023-10-13 16:45:35.896498
359	gl9l5s9x2civl5tmkndp4vrbsye2	20231013_183723.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	2373838	KjlU/fOD3L/AiGAhrBa4vQ==	2023-10-13 17:25:50.626092
360	ovs2lfi44c89j0nwieutdi0xym44	GarminConnect_20231014-110136.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	909674	FMFbzcv4PGBMjZPxvhYh2A==	2023-10-14 09:04:24.082225
361	ugo2bmlp7lxwlg8evju9hi0dadhc	IMG_0648.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	159744	EBNg64ci3/DolykqgGp2Hw==	2023-10-14 17:03:30.237932
362	v4a40h2tpuc8ouqihp3ah387nrag	GarminConnect_20231015-105817.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	750937	IQjryjt8X7bdILxOOS0vuA==	2023-10-15 09:00:32.711843
363	cpyrg3xvt76crjha2hmwvbenbdx6	20231015_091241.jpg	image/jpeg	{"identified":true,"width":2736,"height":3648,"analyzed":true}	cloudinary	2642812	ICVXtEO5n+An/Uw+dDJg1w==	2023-10-15 09:37:21.011879
364	0c7su99q26xtxlacgkdy20jnd300	GarminConnect_20231016-122629.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	625004	/0JiHuLC0nd2+rJyqjWN+Q==	2023-10-16 10:29:41.576539
365	o83fvotphsah1eu1hfjq4os0eydb	IMG_0649.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	118836	pGZ/eQ1w/ANO6NHEU5UOfA==	2023-10-16 17:17:36.119252
366	00ubkim2d0pd4pdvt5gq9a8cr4ni	826F3B0F-D366-4551-8C1A-B3B5D6B1C524.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	466465	ZrKOw2JrNCJ1l8AO03aW/w==	2023-10-17 14:55:12.140971
367	c1s8b40i4h4q0wh5n91wj5ipt03o	5A853AB4-0633-4FC0-B103-FE2EF0A4AA23.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	338298	1H2nczBwtRQ4QohjCtSqnQ==	2023-10-17 15:12:55.360997
368	vt3gwpe5cw679zs37oj8iebih74s	Screenshot_20231017_200125_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	524218	4Q8rCdliMtfDG8THaz5/EQ==	2023-10-17 18:05:52.633255
369	bbru4ec4hcny7pcxkvx4hc2r9vcn	64494cd3b0b1a15c44ea22701b3d3.jpg	image/jpeg	{"identified":true,"width":782,"height":977,"analyzed":true}	cloudinary	195747	5Tfvq17dLybzsJVT8J1ZSg==	2023-10-17 18:07:34.06213
370	38989p482t3z4n4asuqh186yepyn	20231017_184742.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3157216	MvukCEnJ+rb645UFua6qJw==	2023-10-17 18:12:21.435313
371	oc0lmi4wx8boto2yfi9xjheyr3c2	IMG-20231017-WA0004.jpg	image/jpeg	{"identified":true,"width":782,"height":1734,"analyzed":true}	cloudinary	123001	814ppea/PG4bbMUfBvBqDg==	2023-10-17 18:14:24.63807
372	imfbkg7vnid3vxgct27yxfrhelsv	Screenshot_20231017_202453_Huawei Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	546656	bKcv/roW8FAyReFR/M36lQ==	2023-10-17 18:27:46.025765
373	elhpyk8bxaiwoypgnmwgvsldvu0y	Screenshot_20231017_203745.jpg	image/jpeg	{"identified":true,"width":1080,"height":242,"analyzed":true}	cloudinary	31303	2rizkJ/3iRQoTjaaLAnb4A==	2023-10-17 18:45:25.612329
374	yno13utwf73iy8ge3ctmvw0r11hg	E2AFC233-16B7-4DD0-8A84-87DA11493DBC.jpeg	image/jpeg	{"identified":true,"width":2346,"height":2346,"analyzed":true}	cloudinary	829497	ienYp1SkVLOd+LgG8CWbKQ==	2023-10-17 18:46:27.142944
375	4fpp9aev5r1ylz7xvv38s0gqwbqj	IMG_20231017_214330_145.webp	image/webp	{"identified":true,"width":1080,"height":1920,"analyzed":true}	cloudinary	212092	2VGfRo91cmFrf4xkF687MQ==	2023-10-17 19:45:34.020025
376	hecbw7yrvplg0rzoqnqr3otc6rh5	161457d7-a41c-4846-92f7-1665d60ae287.jpeg	image/jpeg	{"identified":true,"width":1734,"height":782,"analyzed":true}	cloudinary	117117	SgpIWlGGaz1ZOko7UXiNtQ==	2023-10-17 20:17:27.571584
377	ukgkhudagyn0tc3clo85v0afss93	20231017_163342.jpg	image/jpeg	{"identified":true,"width":2208,"height":2944,"analyzed":true}	cloudinary	2562984	Tm1zp4vaeqVZZxJ9LBY0JQ==	2023-10-18 07:32:48.507862
378	ue066qabhikyjmuoubzmduwvf9o1	IMG_0654.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	343496	rbOIAKkyHATyse0bZxPOPg==	2023-10-18 16:43:56.837416
379	2xipf5m16z70f1pq2k5pqp4qzk46	Screenshot_20231019_203508.jpg	image/jpeg	{"identified":true,"width":1080,"height":1049,"analyzed":true}	cloudinary	306119	Gz6azaNIgvfnfd1aKU5ETA==	2023-10-19 18:38:32.922958
380	sxqpdj54hxngxuh9ugt3h4rti4uq	IMG-20231019-WA0002.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	82161	I7IvMexj7UlDWe5Fw1Utow==	2023-10-19 19:06:05.240647
381	y5z2lzof55k2wbck7fn01gle8vkv	4B0DBE6A-8BB4-4631-B3CF-0E2EF414FCE9.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	275192	39OeANvmKs9SpI9VuxhuSg==	2023-10-19 19:06:11.870717
386	8pptzg0h3yv4zypboajc58y49hdq	Screenshot_20231020_180152_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	339911	hU9oxSQmJKSDvPa/6YwaHA==	2023-10-20 16:05:18.504296
383	0grpyam68ufbb88ocop9uxsdt56q	received_168688722976433.jpeg	image/jpeg	{"identified":true,"width":914,"height":1920,"analyzed":true}	cloudinary	48901	84eSeQiLBwmjnyI2BmMapA==	2023-10-19 19:07:29.913587
384	ab6raftyjhn7boghqgl2faf3dyj0	F2B0D556-DD67-493E-9D79-3F276B5D380E.jpeg	image/jpeg	{"identified":true,"width":960,"height":960,"analyzed":true}	cloudinary	139550	UpvoHHFTQQ4EsiJiQf1V6g==	2023-10-19 19:09:05.800312
385	lraerqtrfptulhurzvrf02pkhgk7	IMG-20231019-WA0002.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	82161	I7IvMexj7UlDWe5Fw1Utow==	2023-10-19 21:43:08.5075
387	zogo0wsyf1pn3opcisfdoe0r9a2d	Screenshot_20231020_180219_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	671585	CD5eXA3OJjck8Is9eH4gHA==	2023-10-20 16:07:00.430177
388	lab5cqzcwmwmb2l217pzt2y5qqn5	Screenshot_20231020_180236_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	668711	64mfee8ut7PV9kwngpYTPw==	2023-10-20 16:08:20.242224
389	i75e0j31chrijbslzdjnd7x94oth	Screenshot_20231020_193409_Huawei Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	504175	Mj+gBT5X3jIV2XE8tCiJXw==	2023-10-20 17:40:43.197417
390	akt1cgdrmc77zxqqk31hz0l17l3k	Screenshot_20231020_194312_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	504836	5VA6eb5oa/9dOVHriKdFtQ==	2023-10-20 17:51:22.094382
391	7lhsma4kdkcna13oj71mgzzpnepy	Screenshot_20231020_194240.jpg	image/jpeg	{"identified":true,"width":1080,"height":1033,"analyzed":true}	cloudinary	230480	8UF3UczTxXybaVITMv6+sA==	2023-10-20 18:18:06.943927
392	pib0zil076xjqlzt1rtzzil896vc	IMG-20231020-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":1600,"analyzed":true}	cloudinary	119539	NZuVV8GU+7nZeo4aMXYOSw==	2023-10-20 21:57:46.637092
393	3gtefqinfepjlvp0pgcyd234fi3s	IMG-20231021-WA0001.jpg	image/jpeg	{"identified":true,"width":1080,"height":720,"analyzed":true}	cloudinary	124252	HyALxk41ehoosKVk6N2vrg==	2023-10-21 09:28:40.37821
394	cgvli62myx3hscqnsha833tiofkn	Screenshot_20231021_121331_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	603831	aV2OVJ2WOaHeVgGWkG7Cig==	2023-10-21 10:26:17.25384
395	r1m3wbtklqq3g4hahcm0fyc84pcx	IMG_20231021_134810.jpg	image/jpeg	{"identified":true,"width":3840,"height":5120,"analyzed":true}	cloudinary	6554063	fLLUFtzwHWoMfzd6C4SAKA==	2023-10-21 13:10:05.463473
396	b3l24qsnt6ccm18fh5r1v8k9g9at	IMG_20231021_134340377~6.jpg	image/jpeg	{"identified":true,"width":1905,"height":2088,"analyzed":true}	cloudinary	1380089	R2L3+2S9Jj64KQYMUsyeuA==	2023-10-21 14:57:33.924462
397	evm5hq56i3wc1jy7eld5ijs9vwyw	IMG_0657.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	123127	Un0W6GTnKy8uC1Er/EWjPg==	2023-10-21 15:08:56.311936
398	hvupezom78kzejvnr350uegsjwo9	IMG-20231021-WA0004.jpg	image/jpeg	{"identified":true,"width":1080,"height":720,"analyzed":true}	cloudinary	95423	IFarlk9Lb7lt2b/bRKQJxw==	2023-10-21 15:13:13.24447
399	2q973ugkiy2n05pa24uif3zs9k89	GarminConnect_20231021-175054.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	269512	49yQbVHIouiW6D2xZ5q4ZQ==	2023-10-21 15:53:36.730103
400	n0z1iv1d68mg9dgew7loi0qckz9p	IMG_20231021_191731_806.webp	image/webp	{"identified":true,"width":1080,"height":1920,"analyzed":true}	cloudinary	108568	hZebv3Fu7woKY1e+d0HqXQ==	2023-10-21 17:18:56.134999
401	jhhjpwg2gaf052j0pzhwjawuek8l	IMG_20231021_222000.jpg	image/jpeg	{"identified":true,"width":860,"height":1528,"analyzed":true}	cloudinary	350290	S9oJUuHfZ2NamFhdvHcyKw==	2023-10-21 20:33:34.60682
402	0l1fom7bpvlibfd8jqns3sgfsjm9	Screenshot_20231022-101746~2.png	image/png	{"identified":true,"width":1080,"height":476,"analyzed":true}	cloudinary	545836	jjn9TJCCIGyGjZpfaCRe+A==	2023-10-22 08:49:59.763159
403	bqs9b18yhmkbcazqmi9axx2fynzu	GarminConnect_20231022-122752.jpg	image/jpeg	{"identified":true,"width":1024,"height":1023,"analyzed":true}	cloudinary	837020	TrcjEFAGDSQu+xGNDoyUrg==	2023-10-22 10:31:40.764441
404	yiu936fft6b8ucyu23eq98lqj89x	IMG_0659.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2195946	Zlxe31PpHOUHjrJt3iRh3Q==	2023-10-22 11:32:04.952263
410	asrkxhdmbz0oinxw13h82w3zwo9m	Screenshot_20231024_200734.jpg	image/jpeg	{"identified":true,"width":1080,"height":1042,"analyzed":true}	cloudinary	344195	9kWaSKb8hrGP7w4bIPIB6w==	2023-10-24 18:13:30.859321
407	896ig3z540kuy6b4ngbf2ir97n0h	Screenshot_20231023-190811~2.png	image/png	{"identified":true,"width":932,"height":957,"analyzed":true}	cloudinary	899778	zE8stfjV8L3lIeMfKmvz3Q==	2023-10-23 17:10:56.953235
408	csf0ywf0dc2f8fh7epobae934wpp	Screenshot_20231023_233804_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	452714	EgUhBZyG8OaHEs1aE5GiJA==	2023-10-23 21:44:04.932384
409	7xeq09pbtrpjlc6dzate0cdi87bh	Screenshot_20231023_233747_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	472286	0Q79uUoRrBxdf5XJrMb7ig==	2023-10-23 21:45:28.710188
411	2uxreljugi8yiq3wdiu5w99wft25	IMG-20231024-WA0000.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	153135	d9QAq3LqrXrI98zP7vLFUA==	2023-10-24 18:40:28.10071
412	gm9t78ylx7z86vxl4ho2muiu41pk	1000011865_1698172531.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	203515	aptwbvXbrKj+yCqC26PYhQ==	2023-10-24 18:40:33.382208
413	5r0taxkz0oh3c82x2mqv20bqsp14	IMG-20231024-WA0002.jpg	image/jpeg	{"identified":true,"width":2048,"height":2048,"analyzed":true}	cloudinary	371793	NxrXxO86dUesDxHfbR3xmw==	2023-10-24 18:49:35.348676
414	jrp132aiacp3xtc03pb01pkrvrgp	IMG_0523.jpeg	image/jpeg	{"identified":true,"width":1170,"height":1254,"analyzed":true}	cloudinary	884990	5qZ0EH4GMPRTYQ1gzvaRsQ==	2023-10-24 18:52:48.795802
415	8zegs3wogixg06vt5d30mz7s2kmj	IMG_0524.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	282494	f8JlrDRFzMbVYFGtPVBV2A==	2023-10-24 18:53:51.206909
416	kil8yelo5u7ky1rmgvqe6g0ndulp	8943E577-E90B-46C3-A3A0-C6938E0ADD7C.jpeg	image/jpeg	{"identified":true,"width":960,"height":960,"analyzed":true}	cloudinary	204330	GYrNUPPc53n8k3ppqIwmRQ==	2023-10-24 18:57:55.300817
417	yhjhv9ijoh34xmq8yum04k0dqrc8	Screenshot_20231024-205355~2.png	image/png	{"identified":true,"width":1080,"height":1042,"analyzed":true}	cloudinary	246002	oc+iO43+ziQTf8PKFTgd7A==	2023-10-24 19:01:36.237449
418	lx2ariwk3gv6uy2wcaxn87jdjyci	Screenshot_20231024_210156_Huawei Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2316,"analyzed":true}	cloudinary	549355	aKGfsU+o9tV5M9RyMtUBqA==	2023-10-24 19:05:34.648043
419	i0y5bdflp38m080z7o4wt8iliejk	IMG-20231024-WA0003.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	395307	oxz2ZUKZYXXj/jlBVmkNFg==	2023-10-24 19:05:43.336066
420	a6hit2cdih8scj7q9zact3bfgku3	FB_IMG_1698175722077.jpg	image/jpeg	{"identified":true,"width":1440,"height":1440,"analyzed":true}	cloudinary	185325	euywtVXnfevcvlsBpOdzbQ==	2023-10-24 19:29:54.286465
421	mvej8n1s0qeym214q0yiohw76ggt	Screenshot_20231024-212725_adidas Running.jpg	image/jpeg	{"identified":true,"width":1438,"height":1440,"analyzed":true}	cloudinary	1145740	xBNd08ArTrrd8jI0XRQkXg==	2023-10-24 19:30:50.33805
422	ejy8pd0p9vhu7k0ipkfl4t3m1esx	Screenshot_20231024_221448_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	667232	0lrCvQ8K8CZ1DcT848Yokw==	2023-10-24 20:16:59.110706
423	uie89i1beo6jrtlzqf2lsf3ncysb	Screenshot_2023-10-24-23-05-11-559_com.stt.android.suunto-edit.jpg	image/jpeg	{"identified":true,"width":1064,"height":1097,"analyzed":true}	cloudinary	737052	Ype5yLRExChONOu2uLpflQ==	2023-10-24 21:08:20.232882
424	9fy0r9ih25aihb24ubk37hjtfblh	IMG-20231024-WA0001(1).jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	154546	Nv3PyZgUhvHhQkhHd4SW0w==	2023-10-24 22:13:07.039743
425	l3zii6epdpsyp71uhwaj3is7geq4	20231025_174819.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	2828401	c9nSwrRal6V3dPFflfGqUQ==	2023-10-25 16:01:54.650888
426	3p3jju2l31wvs87cxmm0qtl4vb1t	IMG_0665.jpeg	image/jpeg	{"identified":true,"width":750,"height":500,"analyzed":true}	cloudinary	146505	rk+X7OmFHmeU+DTaXoQ7kA==	2023-10-25 16:40:31.749855
427	f9m344s64vd1hovlv8se0d4p32y8	Screenshot_20231025_184151_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	463367	rruNzwOEcOB3W4YAVyHEOQ==	2023-10-25 16:44:18.398398
428	bygkofs7yzr4fb3zj8jkap49b0lc	GarminConnect_20231025-194723.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	535355	SewgaAs5SsAZXluXVhmoyQ==	2023-10-25 18:51:31.703821
429	eom5fyd28aore0q4x5laxm4sty01	4F0C7785-661D-4396-8A77-FA2DD0127B82.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	407526	STiEPc62YtC2ymu/NOnaCw==	2023-10-26 15:32:44.056419
430	k76ujiip81v18cps6ifpo4wuy88r	5A3B4E00-9196-4064-BBD4-217B844FA2F9.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	536042	QcQjt0UTgWfxK4P8H1CYVA==	2023-10-26 15:35:20.76682
431	ew55w97ov4chfzm1gimig8og16ro	Screenshot_20231026_191050_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	665887	Q3BS5Mc+Oag/XO1x7cI0lQ==	2023-10-26 17:13:31.442505
432	1efrwgxx64l2kywydaohq08tlnn0	Screenshot_20231026_191115_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	666237	ptaGK2bYYOk3lGWTHbgwMg==	2023-10-26 17:16:02.259849
433	vlyq0xff8wtsfp14eb6322a3omo5	IMG-20231026-WA0001.jpg	image/jpeg	{"identified":true,"width":1599,"height":1200,"analyzed":true}	cloudinary	145212	Oe0ttSjInF9k+lXi9I05RQ==	2023-10-26 17:57:49.871877
434	8skhs0xr4ywy64dw7rxc7sd5zyit	IMG-20231026-WA0001.jpg	image/jpeg	{"identified":true,"width":1599,"height":1200,"analyzed":true}	cloudinary	145212	Oe0ttSjInF9k+lXi9I05RQ==	2023-10-26 18:16:25.842484
435	mq1olqnxaed6ob40duxywsy0bf0h	IMG-20231026-WA0001.jpg	image/jpeg	{"identified":true,"width":1599,"height":1200,"analyzed":true}	cloudinary	145212	Oe0ttSjInF9k+lXi9I05RQ==	2023-10-26 19:28:24.024276
436	g9e48jhgavd1s0sy4zx2mwlfevz9	E621FA4C-22A8-4026-BAE4-75C52C884676.jpeg	image/jpeg	{"identified":true,"width":3600,"height":3600,"analyzed":true}	cloudinary	1068030	P9g7XkyGZ85u9o5oeu4HXQ==	2023-10-26 19:34:17.228661
437	l6lkun63umtp3p5852eyxfsbuwxv	IMG-20231026-WA0001.jpg	image/jpeg	{"identified":true,"width":1599,"height":1200,"analyzed":true}	cloudinary	145212	Oe0ttSjInF9k+lXi9I05RQ==	2023-10-26 22:44:42.95718
438	2rmq82qvmshl6ju7xb9w2saxrc8d	Screenshot_20231027_144429_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	449140	JWxN9cfUyJe0K7zvSxG6Rg==	2023-10-27 12:48:15.362241
439	ag2hvf643y8iy2lvtkm8xbrudfv8	Screenshot_20231027-190819~2.png	image/png	{"identified":true,"width":1080,"height":1203,"analyzed":true}	cloudinary	284129	QlBH1hIv5r6wgr1cwQFjTw==	2023-10-27 17:10:45.556655
440	ujx8jpvcpffqmx84wibpabs5oro8	20231027_192302.jpg	image/jpeg	{"identified":true,"width":1427,"height":1189,"analyzed":true}	cloudinary	402083	Y4B/BPaPzZMR8tvDQM+oYA==	2023-10-28 08:59:39.905187
441	ez2rd2mme9x2f84rjumf4d14pi3n	IMG-20211108-WA0001.jpg	image/jpeg	{"identified":true,"width":1080,"height":852,"analyzed":true}	cloudinary	77848	S5BoDEp41wY2UZmrsUUqnw==	2023-10-28 09:05:39.7032
442	9lwc0583zmgw6uduopwzp2dorzl3	Screenshot_20231027_230256_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	674255	82FyuVWIJm3SRqJFoAMXZQ==	2023-10-28 13:32:34.0461
443	hfouar2mlyznknio6413lyrbd2cz	1698486114427.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	179726	u4VJfLz2s/XDJlTTemHleA==	2023-10-28 14:05:34.29976
444	2j4f77k869gjw84xybtauona9l6u	Screenshot_20231028_164542_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	413054	y9/PL4X84gdotkGIKIMKDQ==	2023-10-28 14:46:31.368312
445	pzaq0kp13lp85hm1chm1byvqcza8	Screenshot_20231028_171133_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	470487	o+xUmGbQjSvA0wmV5yZzeQ==	2023-10-28 15:14:55.926705
446	shse71rlkpdnhwzauz7skc1nwqq0	CD63FC2C-948B-4136-BE27-AE6DB06D6B90.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	311115	Ser+fWBap0Ox5UpX7VtNUw==	2023-10-28 16:20:24.780778
447	ija1rmjbmjuvn2zn9786gbje8jld	GarminConnect_20231028-174519.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	830069	o3gBEuJyyCnYSDDNb+vh5A==	2023-10-28 16:48:49.097318
448	de23eo9ye0wjxuqx3ap4fcfmq63b	Screenshot_20231029-112639_Facebook.jpg	image/jpeg	{"identified":true,"width":1440,"height":2960,"analyzed":true}	cloudinary	742681	K0Nd/x8fhb7jOg9RVSbR0g==	2023-10-29 10:27:24.598009
449	hwsgcj9egvp5kxe65tilm2c8cr6x	Screenshot_20231029_111809_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	377527	hxuApLvWzp312n3mBkH/OQ==	2023-10-29 10:35:39.923731
450	ii4zw5vzjrvwdlsj5fi6sq4qx8jg	Screenshot_20231029-121002~2.png	image/png	{"identified":true,"width":1080,"height":1574,"analyzed":true}	cloudinary	368158	A6YqjiDQsIWWQlIWb5QjWg==	2023-10-29 11:24:45.005959
451	fz5o3wnocoyih7sgbovzu26cpd26	IMG_0667.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	390056	a3a0eQ9x5duXq9uG33lnVw==	2023-10-29 12:11:59.005172
452	o1uuspa07m5bsf329t2kpo4bdqef	received_239051298891124.jpeg	image/jpeg	{"identified":true,"width":2000,"height":1500,"analyzed":true}	cloudinary	197045	qURRPfzRNsMB/twTzriioA==	2023-10-29 15:02:46.4229
453	lt3w2rud2mi1d16ly7zu4lbef43i	Screenshot_20231029_190722_Suunto.jpg	image/jpeg	{"identified":true,"width":1071,"height":1230,"analyzed":true}	cloudinary	218626	LTBIKWN+p5EcM41Lh/B0MA==	2023-10-29 18:08:58.806895
454	ch8dl428933p0rpeg5zv5mkzewkj	Screenshot_20231029_205013.jpg	image/jpeg	{"identified":true,"width":1080,"height":1180,"analyzed":true}	cloudinary	114029	bdAX/Zk8Beiin3/6RqWC7g==	2023-10-29 20:00:52.899511
455	26yu881caad8n7awy3j0ce46fxie	GarminConnect_20231029-201434.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	706923	KUc16kh2cOORlSNOvbR14g==	2023-10-29 20:15:41.99387
456	zxgn6zn9mmqsc606tihdp1xrqus5	GarminConnect_20231030-143013.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	897592	5vJ3BOX3wCXbLnYbelBnoQ==	2023-10-30 14:31:10.843807
457	ofgir0tryuq3qbrkvwycfgqxhs6o	Screenshot_20231030_160458_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	465809	9X7RSs6EtXOmjx2nif/zeg==	2023-10-30 15:11:21.6463
458	h2sgoybn8wsbv8tyjx0kptdn8l5f	IMG-20211108-WA0001.jpg	image/jpeg	{"identified":true,"width":1080,"height":852,"analyzed":true}	cloudinary	77848	S5BoDEp41wY2UZmrsUUqnw==	2023-10-30 19:25:49.851305
459	yaesypouwhdcuv16kkvi0jnvd6mj	1698694528768.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	288900	daFRLsg0OfBjBz5XoOPwmA==	2023-10-30 19:38:34.86123
460	u25omc349zdh7jbeuo1e96w8fqys	GarminConnect_20231031-180217.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	704169	Dwp6KchLl2GRxU8JZNZnBw==	2023-10-31 18:05:20.826113
461	znswarnpcdi79881j2b8u2yrqt4m	Screenshot_20231031_192124_Sportractive.jpg	image/jpeg	{"identified":true,"width":1080,"height":2408,"analyzed":true}	cloudinary	438853	1uOUrGCug2LT+kOQpWm0/w==	2023-10-31 18:24:28.705728
462	f3ju1icwi9h4x4xxlvjuw3cv62bz	Screenshot_20231031_200908.jpg	image/jpeg	{"identified":true,"width":1080,"height":1036,"analyzed":true}	cloudinary	223165	8zqRxloVrR47styLo4/7gw==	2023-10-31 19:11:30.758277
463	dawtbex4ltylilz4ldrwm354gcek	8608AE8A-8106-4BE8-8AB1-3D63492ABFFE.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	235133	GygGsySRBb5xDtNtr2wp9A==	2023-10-31 19:30:29.656633
464	asq90ubmp8lvx1gcpwykgfu54opc	Screenshot_20231031-203209_Facebook.jpg	image/jpeg	{"identified":true,"width":1438,"height":1440,"analyzed":true}	cloudinary	1001217	C3qH/LBup+BgLrOPiQDU3w==	2023-10-31 19:32:58.503152
465	hbcjijhudhhd4zwm83boyshvsg5l	IMG-20231031-WA0002.jpg	image/jpeg	{"identified":true,"width":1600,"height":900,"analyzed":true}	cloudinary	170717	RKTpZgR12nF+yuYCSGH87A==	2023-10-31 19:38:11.533965
466	1i5isxkp59dnadg6zbz86j8zszu6	IMG_0556.jpeg	image/jpeg	{"identified":true,"width":1170,"height":1335,"analyzed":true}	cloudinary	847728	kTt4Rl2Ht5gpjxvgmSG0Xg==	2023-10-31 19:40:39.09787
467	9dbxdueut92wz664z8frb3xhlhb4	IMG-20231031-WA0002.jpg	image/jpeg	{"identified":true,"width":1600,"height":900,"analyzed":true}	cloudinary	170717	RKTpZgR12nF+yuYCSGH87A==	2023-10-31 19:43:14.021834
468	5czu94q6pwtfze43w5sjrt2u4a3g	IMG_20231031_204739.png	image/png	{"identified":true,"width":1079,"height":1351,"analyzed":true}	cloudinary	1361413	LzxFxsWAZwLZxW7DntBaKQ==	2023-10-31 19:48:56.670123
469	a1wpb9lijamkj1034gfl0n2mx1pb	Screenshot_20231031-205034~3.png	image/png	{"identified":true,"width":1080,"height":799,"analyzed":true}	cloudinary	230229	Ac5eDMMvDV0uPU5ICjBJfQ==	2023-10-31 19:52:40.034757
470	n8qjfqs1u9k78i8mibqkhj3rkijl	ACD12577-C47C-48AF-B6C6-7A0455E300AB.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	cloudinary	3413187	SeTp6CrO6a9wPUQWIGWVLA==	2023-10-31 20:03:07.075344
471	w2zulv7jd9o6c5czswmrph6zy8u5	3674573C-1A36-4B16-BC57-E632C93088AA.jpeg	image/jpeg	{"identified":true,"width":2274,"height":2274,"analyzed":true}	cloudinary	655623	mGnPHjUFkbHkZYs3uvsnog==	2023-11-02 19:11:06.671963
472	41q054sr4iybb0v7rxpsoajagtni	Screenshot_20231102_201417_Suunto.jpg	image/jpeg	{"identified":true,"width":874,"height":1078,"analyzed":true}	cloudinary	238633	zaKVN3CxjPhhrEbOeB295Q==	2023-11-02 19:16:52.341417
473	1d2jjakgvhvnjj4tp8cpaskuprpi	IMG-20231102-WA0002.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	306826	hRO5n+pXY+ytV4xpkTdZuw==	2023-11-02 19:29:49.563831
474	qunfbg5pq3hsw6azvvfwone40apb	Screenshot_20231102_195249_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2340,"analyzed":true}	cloudinary	517974	5WDggB2PH36KcCXR7pWbjQ==	2023-11-02 19:33:34.656951
475	z6y3czdbfia7mdo4lwd7z5yaisym	Screenshot_20231102_203215.jpg	image/jpeg	{"identified":true,"width":1080,"height":1293,"analyzed":true}	cloudinary	84374	cQ5MW0x/0V+lGa0fnfO1zQ==	2023-11-02 19:39:36.082236
476	melam8rn5kf6d6971ie1mab7zunr	Screenshot_20231102_202908.jpg	image/jpeg	{"identified":true,"width":1080,"height":755,"analyzed":true}	cloudinary	44693	x8b2RGCATBdK+LWK/CGcug==	2023-11-02 19:40:43.798017
477	d0ruk6faek9dd1ur2cn6vmxw2nx1	Screenshot_20231102-200536_adidas Running.jpg	image/jpeg	{"identified":true,"width":1438,"height":1440,"analyzed":true}	cloudinary	1073894	dhj7cfmY3WS5q1UElQ7fIw==	2023-11-02 19:48:45.957982
478	ct6jr07krxh97ctqx4xfl4gl7uwl	Screenshot_20231102_195204_com.huawei.health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2160,"analyzed":true}	cloudinary	237225	GInWh9lp9zcBAAZSSHfsTA==	2023-11-02 19:49:25.301932
479	b91hojht42a2xmez3b61m91xucwe	IMG_20231102_205210.jpg	image/jpeg	{"identified":true,"width":900,"height":885,"analyzed":true}	cloudinary	289553	KQJu0939k8xsTGmSyeHvhg==	2023-11-02 19:56:47.067067
480	0y9dqepdu4fmbuobhaugfc1epf5q	IMG-20231102-WA0004.jpg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	124371	tySEVugzhgqfBdBj58eVoA==	2023-11-02 20:09:23.148364
481	eluvlp6n81nrqqqf1hjnhdb8znf8	1698958439328.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	288674	eBfq5kz7mfH/xjTPcLQ5bg==	2023-11-02 21:00:15.761372
482	n46a5bx3qh12u9ggptfy66ycw8t2	100832A1-0944-49E0-8F5E-64E7DEDD13BB.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	289242	qH5GQV0DVePRrvq0lMlAMA==	2023-11-03 11:41:03.011557
483	elbpvqcmpgy5j1x98j2lqorxh67j	IMG_0566.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	199456	JLObLN6bPIVK1QpycUlpfw==	2023-11-03 19:55:02.749622
484	ehrf6imz5279g0oki8fzpwcbwnns	GarminConnect_20231103-202040.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1163836	Mws3rPR4KxcgKlW23JbMIw==	2023-11-03 20:21:43.270974
485	xwnqumejfkew2ebcjrwphl3srqab	1699046480263.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	284961	djXSXqUo87QkZVL4adxM/w==	2023-11-03 21:26:12.864271
486	bu73bede4bzxtpsfbm89fz359gra	1699089954874.jpg	image/jpeg	{"identified":true,"width":1080,"height":1080,"analyzed":true}	cloudinary	815729	W8cKu6uJ6gozFOM4DFcZYg==	2023-11-04 09:33:34.24717
487	7ct8y6cwceslhiflegb2y15eh5bk	Screenshot_20231104_113021_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	431269	Dngn87wUPsue2Hp2hiHNsQ==	2023-11-04 10:40:25.626915
488	jpg7w306vzjwaq66abcowa1nwd50	CCF1E6D2-4853-4FC6-AE37-89BBE795DADD.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	314603	R0x3iMQESFpCUzfOIhR/ZQ==	2023-11-04 23:22:18.603979
489	rz3utu3tmye9p8gaq9bniktlsib3	received_939912567468233.jpeg	image/jpeg	{"identified":true,"width":960,"height":1280,"analyzed":true}	cloudinary	110157	2lAw3k6lRYOc39CNYji0aQ==	2023-11-04 23:44:48.205451
490	z503ysfzvif8u0udq1u2j6s0omnr	IMG-20231104-WA0011~3.jpg	image/jpeg	{"identified":true,"width":705,"height":838,"analyzed":true}	cloudinary	231837	aNVNfnWf0/kfA3erTF9FcQ==	2023-11-04 23:45:23.977255
491	upehjqx41kufppwqyiliii95esdf	7c126fc2115f385debbaaae064a227ad (1).jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	144602	O96aM4rNMGZAZ/ppQXS1qQ==	2023-11-05 00:09:14.710614
492	uxmgmzhyx40jl1lm6g6do01w7znv	FB_IMG_1699142599051.jpg	image/jpeg	{"identified":true,"width":720,"height":575,"analyzed":true}	cloudinary	64232	6tg32EbQ68INeQWmXrSxYA==	2023-11-05 00:16:02.976189
493	6t9ivx7knea08k4k1j8ns4y1gaw3	D2D2C010-0D1E-4A5B-B0BA-6B4CA1992913.jpeg	image/jpeg	{"identified":true,"width":5727,"height":5727,"analyzed":true}	cloudinary	2899653	zi11TpYt33OFJqiKw+jPcQ==	2023-11-05 08:21:52.504148
494	y3jsyd4dq088gt2u32txqyud90a3	IMG-20231104-WA0003.jpg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	cloudinary	59353	LlyHE0xUErI54HEg3NKAww==	2023-11-05 08:26:01.124033
495	9rky14so0wh0vzlvn6ylsyu2mbkr	SAVE_20231104_234829.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	cloudinary	289197	L5wbBkHm+6a2+b2AxAUBdQ==	2023-11-05 08:26:02.517743
496	yyzqw39tz5g1iw92fwvlfcqzr17b	Screenshot_20231105-110744_adidas Running.jpg	image/jpeg	{"identified":true,"width":1438,"height":1439,"analyzed":true}	cloudinary	1074742	OwufzLvbnzr2/9l2qMyAGA==	2023-11-05 10:16:34.922013
497	q3pdgfl5pfdqb2kq80g4x8os53ew	Screenshot_20231105-111533_Facebook.jpg	image/jpeg	{"identified":true,"width":1438,"height":1439,"analyzed":true}	cloudinary	1024341	VlcWNOECJPHjNDWu0OnSyQ==	2023-11-05 10:17:22.322204
498	fefapr3ozvlrym6eom09b5ax62iu	Screenshot_20231105-130054~3.png	image/png	{"identified":true,"width":1055,"height":846,"analyzed":true}	cloudinary	231205	acg98r4fEN318j1366dgPA==	2023-11-05 12:13:42.954679
499	sbxfc9l8kuhl446libv5afkqrfx0	GarminConnect_20231105-124333.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	917334	WdbcSSE5VcTjjlV+xB9Uew==	2023-11-05 12:53:30.376623
500	xarxwh24xlfmtsphbdwj97g1yunx	IMG-20211108-WA0001.jpg	image/jpeg	{"identified":true,"width":1080,"height":852,"analyzed":true}	cloudinary	77848	S5BoDEp41wY2UZmrsUUqnw==	2023-11-05 13:13:10.113202
501	dztvgwadjoym8ycgowkia6wpaohb	Screenshot_20231105_153136.jpg	image/jpeg	{"identified":true,"width":1080,"height":1059,"analyzed":true}	cloudinary	270873	31piQcONVHqTejSIDe4UOg==	2023-11-05 14:34:07.69631
502	cd1i0b1ehgkjc6zr6al22w0vd287	received_717734946442581.jpeg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	cloudinary	167698	vO3wGB3A6iKr4aTJ1Cj6pg==	2023-11-05 15:19:34.300554
503	ytqqk54km4jk4lu7abubjg712exb	IMG-20231105-WA0001.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	307069	u53b9RdYpYaBfyIbOGBTog==	2023-11-05 16:54:33.293315
504	p78j5c3iaaa74n62c9c1oai8auwb	Screenshot_20231105-183206~2.png	image/png	{"identified":true,"width":1080,"height":1203,"analyzed":true}	cloudinary	212463	kVrPJ5giejUEYkkINWT6dg==	2023-11-05 17:35:04.530514
505	0k7vaudqoa0ia7eu5ibk0jkt3kl9	Screenshot_20231106_173731.jpg	image/jpeg	{"identified":true,"width":1080,"height":1413,"analyzed":true}	cloudinary	210748	jBLHXJ0esGA4JBkSEBFfhQ==	2023-11-06 16:42:34.295159
506	22wtoyb6utgmog6vcm8yj371mqy1	GarminConnect_20231107-161343.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1249042	LjcUcPXEdoFT7/tuUYV8DQ==	2023-11-07 16:15:47.760074
507	zqhawvivm8tl1lg0dl9z3rs70479	Screenshot_20231107_204307.jpg	image/jpeg	{"identified":true,"width":1080,"height":1874,"analyzed":true}	cloudinary	173203	rYPYL1C5meQAlFdVxXfGuQ==	2023-11-07 19:44:05.347274
508	ohdkotflj5hgiv2ue6uiiqfyniau	EA3A4455-0DE1-4D4E-9DBE-82A617E8DDB6.jpeg	image/jpeg	{"identified":true,"width":3402,"height":3402,"analyzed":true}	cloudinary	1179600	/C5GjtRYbb1AfiUk9es0Fw==	2023-11-07 19:53:23.383855
509	95ulujg2hc0cetqb95he9ac686jz	Screenshot_20231107_204928_Suunto.jpg	image/jpeg	{"identified":true,"width":830,"height":1049,"analyzed":true}	cloudinary	234771	Ya3vxzv/noiKCYP880iXsA==	2023-11-07 19:53:37.410181
510	93k9tbkmezjb481jxyorzt0ds5er	IMG-20231107-WA0004.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	171651	RcUeuTKHWM0h0BVNlfSSZA==	2023-11-07 19:54:58.390584
511	1epjxhjqzsj4f9n6ea95hyhjinl7	IMG-20231107-WA0004.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	277020	njTmMLXu0wkj1jrf3jrcdQ==	2023-11-07 20:03:31.496271
512	bwq36teft65ut66h69o903n2ectl	Screenshot_20231107_210157.jpg	image/jpeg	{"identified":true,"width":1080,"height":1047,"analyzed":true}	cloudinary	237936	EpAthRkIhgWKHb3pHz8cow==	2023-11-07 20:03:52.140305
513	fyc8y1b9po5jek95mre4ojo0pudc	Screenshot_20231107_210656_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	484278	uA/3+7gY95Y5K35oVhN1xQ==	2023-11-07 20:08:19.436154
514	ybo8uyaajxjjtomtk7u1qqnoiv7r	IMG-20231107-WA0007.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	333379	2eIiKtiQWwebbnyaFismbg==	2023-11-07 20:27:03.354842
515	x9e4tezg6jpf3ac299ue4ptjcuxp	IMG-20231107-WA0003.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	146648	fhYi0Wg7f1xOzOV8PJknLw==	2023-11-07 20:28:35.338042
516	703lnst881zt2gmvrsukbe9mqgg0	IMG-20231107-WA0004.jpg	image/jpeg	{"identified":true,"width":1134,"height":2016,"analyzed":true}	cloudinary	221925	Rpachb9llR5GMIEb0UiqZg==	2023-11-08 05:53:29.73976
517	vhco4ixn95541qzhdhhxt23hxe3r	GarminConnect_20231108-145632.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1119235	qG5p3vU6QUbRq+6r/PXKNw==	2023-11-08 14:59:26.069807
518	mszd26qjyiwx8ooiql6trni88hti	20231108_170136.jpg	image/jpeg	{"identified":true,"width":1440,"height":1428,"analyzed":true}	cloudinary	380151	EmKcNgz7kGE1WcZAe7hMIg==	2023-11-08 16:09:39.594886
519	znab2tuwbvg466fu0n63gtjqozrk	Screenshot_20231108-170207~2.png	image/png	{"identified":true,"width":1080,"height":1169,"analyzed":true}	cloudinary	170743	XZVZ/sCgHmPxP6DBXFBAGw==	2023-11-08 16:14:04.111319
520	ozr95p87hvaowr5ucw6meonh69u8	Screenshot_20231108_174344_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	674642	ISa/aSFbPKjF0+mIkkJTnA==	2023-11-08 16:46:13.8028
521	s4s7zc01c3h01mr3asciqki8epjp	F65D51B3-1205-4486-A478-4151B91ED683.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	317933	UrRYiPOMIk9UNlishauRsg==	2023-11-08 19:08:04.568614
522	ra7cnhfki6rbbrgxuu3gks9bvspq	IMG_0672.jpeg	image/jpeg	{"identified":true,"width":1024,"height":683,"analyzed":true}	cloudinary	430772	EZ+W64R3LGqALpwkBQ74Lg==	2023-11-08 19:31:22.782152
523	8hc55hvhpuzwff0tqukpt4ot1r85	Screenshot_20231109_100622.jpg	image/jpeg	{"identified":true,"width":1080,"height":1437,"analyzed":true}	cloudinary	203693	kiVHa3zhAhAFvRJVRo5XUQ==	2023-11-09 09:17:51.5989
524	wvztxyzo89z92b8kspxywbjpegi8	IMG-20231109-WA0001.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	379056	r+PnNQRtFmgypQB7/0xGIg==	2023-11-09 17:20:27.517572
525	6sabag9n6vy9mqku39eqhz199928	GarminConnect_20231109-172353.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	998620	u0WFCy6kTY0G+jkGpzru7g==	2023-11-09 17:25:23.313014
526	v0bkrvvck7ldhew2jm3e1njvogbx	AC7AE864-CC3D-4ED4-9202-DF35E5D8D020.jpeg	image/jpeg	{"identified":true,"width":1029,"height":1029,"analyzed":true}	cloudinary	279822	DVpsQDzGYe1M7BD9SlRw1w==	2023-11-09 19:20:18.698894
527	g4dr3rt1i3mb3l9p6xlzfkt1n8s8	IMG-20231109-WA0001.jpg	image/jpeg	{"identified":true,"width":2048,"height":1536,"analyzed":true}	cloudinary	426110	YzpeUhMdeLSr+iFLMM18QQ==	2023-11-09 19:21:25.462568
528	10g67j0my8qtgm9z7el2xltddzxe	4F014529-B9BD-4BC7-9DFB-0A8A909CACB3.jpeg	image/jpeg	{"identified":true,"width":960,"height":1987,"analyzed":true}	cloudinary	598800	FYHSrtmqmgSMry8SEqhrkw==	2023-11-09 19:24:26.403931
529	t3ganhnby502wjx392sigpve4a76	IMG-20231109-WA0000.jpg	image/jpeg	{"identified":true,"width":1600,"height":1200,"analyzed":true}	cloudinary	225290	0x4PnivTx2G/Dg5a4aC7Cg==	2023-11-09 19:28:48.704757
530	vb9sg3ij9idkhfxax3t72vnjmyfc	Screenshot_20231109-203448~2.png	image/png	{"identified":true,"width":1080,"height":1249,"analyzed":true}	cloudinary	275632	0y8yNbQYZmRU+gKFqZ1nhA==	2023-11-09 19:37:17.39249
531	0qxgcdnlxan7e58qgq23i82gb7yr	Screenshot_20231109-204523_Photo Editor.jpg	image/jpeg	{"identified":true,"width":1433,"height":1473,"analyzed":true}	cloudinary	598029	nA9SLnl+4HQCb+lkYhQEFQ==	2023-11-09 19:46:43.497206
532	eu6h742uvakx0fnhw3yvuz3kitg9	IMG_0578.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	171276	ENYBVyiAtawKfqc32lCH+A==	2023-11-09 19:56:44.551943
533	2cgc1f398ss7ndx91ndt7pi9h742	Screenshot_20231109_210405.jpg	image/jpeg	{"identified":true,"width":1080,"height":1042,"analyzed":true}	cloudinary	198761	W/tTNy8VIOaD0mFPdniodA==	2023-11-09 21:16:46.103955
534	x9wid5bfju35cde2qzjo8afz4syc	Screenshot_20231109_210041.jpg	image/jpeg	{"identified":true,"width":1080,"height":1029,"analyzed":true}	cloudinary	325990	GnmFZ9jLXNirOndwcIgouA==	2023-11-09 21:18:07.807323
535	0jif9anbxqrvxlmm2ffi003dbl34	Screenshot_20231110_102035.jpg	image/jpeg	{"identified":true,"width":1080,"height":1301,"analyzed":true}	cloudinary	217449	Dc+RyUvgozsSMnl8Ot/qNw==	2023-11-10 09:25:06.253657
536	80yijp7f0c8z8msljjhfidg3nu57	IMG-20231108-WA0002.jpg	image/jpeg	{"identified":true,"width":1448,"height":2048,"analyzed":true}	cloudinary	226706	M4G0qLFWuKxVUPpiEtY9sQ==	2023-11-10 13:39:57.997509
537	0ls92ugxnl6uj7chbcjwiuuxztlf	IMG_0675.jpeg	image/jpeg	{"identified":true,"width":2320,"height":3088,"analyzed":true}	cloudinary	1003048	zNG7jVcLVK3wSdxxpPT/kA==	2023-11-11 12:45:47.853457
538	wx4n2j5zqprxhqky9x0ttygng5p2	Screenshot_20231111-163734~3.png	image/png	{"identified":true,"width":1080,"height":1222,"analyzed":true}	cloudinary	454094	vLKPtZlr6FLDtTAHE18fAQ==	2023-11-11 15:43:43.773743
539	egz6hpq1h05xuj42ur2noskey15k	GarminConnect_20231111-171527.jpg	image/jpeg	{"identified":true,"width":512,"height":512,"analyzed":true}	cloudinary	211172	rwdTYnyfLocsYmWFjOC/7w==	2023-11-11 17:16:44.870337
540	di9n2ih3w46ryb7en626285ljdrs	IMG_20231111_163720.jpg	image/jpeg	{"identified":true,"width":4224,"height":5632,"analyzed":true}	cloudinary	5700745	1+uKhX6N0CBIQn+33Lagfg==	2023-11-11 19:17:44.921332
541	52yluho9uzlulxtzc2xtzxryl9y7	Screenshot_20231111_202724.jpg	image/jpeg	{"identified":true,"width":1080,"height":1036,"analyzed":true}	cloudinary	307189	0PN9jhPwJNbnDUH85fRA3A==	2023-11-11 19:36:03.222834
542	xfs0lzdbp1ar674dh1wcz5q7fetg	Screenshot_20231112-110531_Facebook.jpg	image/jpeg	{"identified":true,"width":1438,"height":1379,"analyzed":true}	cloudinary	722009	P3FnQZn2UnpX5cTzQtryLA==	2023-11-12 10:07:45.004521
543	i26ey39fmlod2ch4xpp2l77yg36p	received_1021648665729920.jpeg	image/jpeg	{"identified":true,"width":2000,"height":1500,"analyzed":true}	cloudinary	175857	+kkknOXlCioTptitSPvqEA==	2023-11-12 15:03:21.650986
544	sotewu8owhq31wrhzlqxbegf1pat	Screenshot_20231112_180335.jpg	image/jpeg	{"identified":true,"width":1080,"height":1045,"analyzed":true}	cloudinary	348113	hN5nEvWZ8rHm7J4rPoqbQg==	2023-11-12 17:18:27.499217
551	5zsnzjpzgv5i93sj7yp50zz5yhlv	Screenshot_20231113-140451~4.png	image/png	{"identified":true,"width":1080,"height":1321,"analyzed":true}	cloudinary	421859	eOaPKRaHhT8TfFQf9On5UQ==	2023-11-13 13:23:05.973863
546	wsyestk1x42b8pgubgvdekwr9n3c	IMG-20231108-WA0002.jpg	image/jpeg	{"identified":true,"width":1448,"height":2048,"analyzed":true}	cloudinary	226706	M4G0qLFWuKxVUPpiEtY9sQ==	2023-11-12 18:14:38.604706
547	l2xnkbybyi39ixndtbnkq09ib3zv	Screenshot_20231112_191108_Suunto.jpg	image/jpeg	{"identified":true,"width":1062,"height":1015,"analyzed":true}	cloudinary	134287	1kHihN/xRXzWnQDd+SOSOw==	2023-11-12 18:21:44.808627
548	ul8meybaz4snozwqgdh7kfjn76nn	received_847278567134136.jpeg	image/jpeg	{"identified":true,"width":1500,"height":2000,"analyzed":true}	cloudinary	459282	lfzCLoeXpDKh44JVP+/lTw==	2023-11-12 18:23:21.016564
549	otfe7djqxrol2ld1573wygodishu	IMG_20231112_210140.jpg	image/jpeg	{"identified":true,"width":2537,"height":3440,"analyzed":true}	cloudinary	3706941	aLyOb62yO4U+rrb8JtJxfQ==	2023-11-12 20:06:43.893011
550	nr2ar401wz0nl49nfqx23m9hiv3o	20231113_130953.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	204764	qUhtaL/B39iOKZ2tlZy2tw==	2023-11-13 12:25:21.287466
552	2kcqfcxj58cy1y28rkoksw1ri4z2	IMG_0583.jpeg	image/jpeg	{"identified":true,"width":1170,"height":1116,"analyzed":true}	cloudinary	811738	bPwWia+49GxKxLQUzT1diA==	2023-11-13 19:00:59.719495
553	mov7zxjd70y5ibn149tjhqgokdg0	GarminConnect_20231114-123514.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1266853	KdCEXlWd+R97hKgGkIlJ4w==	2023-11-14 12:36:59.195648
554	t5p1umncjb33a21zkk4k8yeb0c2b	Screenshot_20231114-202707_adidas Running.jpg	image/jpeg	{"identified":true,"width":1440,"height":1441,"analyzed":true}	cloudinary	1426086	0Wu/pR2XBVm5g5YdH18Oxw==	2023-11-14 19:33:44.800152
555	1sfb2eios4sy07bw4moqvhho28vi	IMG_0681.png	image/png	{"identified":true,"width":750,"height":1334,"analyzed":true}	cloudinary	344195	1+t+aIx8oogI3nexAk9DpA==	2023-11-14 19:35:16.400026
556	la1g7hqe0y4xgtk37uaq9gzvxsjr	IMG-20231114-WA0005.jpg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	137579	sBn+k4oo8TGB7RoVMnOuTQ==	2023-11-14 19:40:04.122166
557	jdw7c2usypsvwlslrbrz01ynvbae	Screenshot_20231114_203344_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	544576	JnJDczev9MfpqSLYXXXX7w==	2023-11-14 19:42:06.780425
558	caa6lrcrero261kxmuz0ro8jl23x	IMG-20231114-WA0005.jpg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	137579	sBn+k4oo8TGB7RoVMnOuTQ==	2023-11-14 19:48:19.70795
559	6bxqz99utlf0lzxjidz1xvph87xq	IMG_0589.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	224927	79foA+VpOMz88m3lNtFD0Q==	2023-11-14 19:52:01.920012
560	gxa5sahwhl5kpgk767z2wwecymzf	IMG-20231114-WA0003~3.jpg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	229491	2azLgz+R6HPoTCZsAaY+1g==	2023-11-14 19:59:44.366627
561	mulrj8qhh8t5y3t1asj8wufyyleu	49742f95-3be4-4b02-ad82-09dceb3e25e5.jpeg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	143168	eUX05Ad+Xf3VwLRXs677Cw==	2023-11-14 20:00:05.374055
562	b5t3m0talq2oxy62wm24kw2p05na	Screenshot_20231114_211531.jpg	image/jpeg	{"identified":true,"width":1080,"height":1065,"analyzed":true}	cloudinary	334446	DbqTrhT7e8O2E3KwZdZIcg==	2023-11-14 20:46:15.243538
563	iip1i9pi0550w9m58x8ex1al9vvn	GarminConnect_20231115-144107.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	585800	AdyTz158/JLDpcDtzG0YAw==	2023-11-15 14:53:14.69981
564	zbku2fevemh03utja0n2m3xikj09	GarminConnect_20231116-165328.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1061714	I5qcJkDsgDGcmqnLi4MOtA==	2023-11-16 16:55:46.580427
565	4n2wslslgoisigwfkvqs0tu2nahr	IMG_20231116_190221.jpg	image/jpeg	{"identified":true,"width":4224,"height":5632,"analyzed":true}	cloudinary	7613793	N+oOYS4978xjoJ7PTy2Sfw==	2023-11-16 18:56:54.49236
566	wx0av0dupq31m8ljw1j68zjjx6t2	Screenshot_20231116_195550_Suunto.jpg	image/jpeg	{"identified":true,"width":854,"height":1089,"analyzed":true}	cloudinary	197629	z9qzYzUDoRmYrIR1xv4fZQ==	2023-11-16 18:58:25.987206
567	4iw1qkg69eg7uu63ws5i445m9mku	Screenshot_20231114_202957_Suunto.jpg	image/jpeg	{"identified":true,"width":1078,"height":825,"analyzed":true}	cloudinary	687925	5AZfBD1vHc6b0BmOLEAXUg==	2023-11-16 18:59:18.601116
568	6cb3wt6g3h18gcubhet88orowgd2	Screenshot_20231116-210720~2.png	image/png	{"identified":true,"width":1041,"height":1083,"analyzed":true}	cloudinary	216656	FWXtuxBFr7nobAWxqX6Oww==	2023-11-16 20:11:20.548379
569	s9hqim6qt0iay48c99trmg8ntws1	IMG-20231116-WA0002.jpg	image/jpeg	{"identified":true,"width":1536,"height":2048,"analyzed":true}	cloudinary	236672	zz+f8NIItQjoOV/PIzWXJg==	2023-11-16 20:26:44.138665
570	an2k0011k8pbpjx35d24zpxpmqgo	IMG-20231114-WA0042.jpg	image/jpeg	{"identified":true,"width":900,"height":1600,"analyzed":true}	cloudinary	148897	u70eHThQzsApvLeNkyfQBg==	2023-11-16 20:37:10.450876
571	35byzjcpbes4pjqvqe53bqlv1o9a	IMG-20231116-WA0002.jpg	image/jpeg	{"identified":true,"width":1536,"height":2048,"analyzed":true}	cloudinary	234724	iVNKgS5zcK+8ioSewnOUzQ==	2023-11-16 20:38:45.734831
572	q0zviqvfw0h0sg9uwqnxp744weg9	received_2007151606315062.jpeg	image/jpeg	{"identified":true,"width":1079,"height":1755,"analyzed":true}	cloudinary	89463	od4M4gfkDLzpdlhtHpe4wQ==	2023-11-16 20:57:15.347717
573	es1prqtyrcvhb1nmfdlpvfv7bexy	IMG-20231117-WA0000.jpg	image/jpeg	{"identified":true,"width":720,"height":720,"analyzed":true}	cloudinary	301072	WGdTEAiLPFTq1p6elTECKA==	2023-11-17 07:57:45.093872
574	hvjfgownk9x7t6mita2qo5qvluj4	IMG_0684.jpeg	image/jpeg	{"identified":true,"width":2048,"height":1365,"analyzed":true}	cloudinary	423681	It7ShPVv8dTDBkDfOSEsYg==	2023-11-18 12:48:27.638541
575	k048trea6goxbx7yzwdvdie8yjhj	20231118_140230.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	3661040	4ou06bdtUVTsJZlJLw22qw==	2023-11-18 14:01:11.938465
576	67o6d9gvsyir8d6csfavf42s6yw5	20231119_114345.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	cloudinary	5757570	Uc945LX7B+noirKY/ELFRw==	2023-11-19 12:20:57.897392
577	cjyvnk5ruhxlp8nksubr12ir3fe6	Screenshot_20231119-144343_Facebook.jpg	image/jpeg	{"identified":true,"width":1438,"height":1439,"analyzed":true}	cloudinary	1685418	D2N1HBlIPA9Yph6gLmbkgg==	2023-11-19 13:45:33.771765
578	72jf321czrtoq3l8zpb7wx5f2u3f	Screenshot_20231119_175748_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	390791	E5LYD/3L95hHKafWn/1W9A==	2023-11-19 17:02:38.499999
580	yere6ur37jk49qfe6t6s0mvhzmx6	Screenshot_20231119-174019~3.png	image/png	{"identified":true,"width":1026,"height":1059,"analyzed":true}	cloudinary	359864	rLcOtqeYYmODNZqJf1gsqg==	2023-11-19 18:03:09.203069
581	cl434ggcfjhdrw2sgicq9th1wcwp	Screenshot_20231119_225412_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	645661	Nf8ntT6XIt9YlCilSi6AVg==	2023-11-19 21:56:19.398792
582	gxz5wkxm9m4n9pv02cbc5paypk3y	Screenshot_20231119_225433_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	706664	Y0CR/IKWvjbaTXAMDBLWgw==	2023-11-19 21:58:28.69471
583	vybaxeb77n70az8s5j0wfpzadp2o	Screenshot_20231119_225445_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	677569	hhMaWDaZI0XyvFwH9otfHw==	2023-11-19 22:04:29.000627
584	6zymmjni851whnvk30t3ioyjdjzv	GarminConnect_20231120-153100.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	747046	bNrgjVsaz+FSw+6cwiwxLg==	2023-11-20 15:32:18.606163
585	3gasin6gk5ngontg04ew9kc4m3sd	Screenshot_20231120_184646_com.runtastic.android_edit_342403326927440.jpg	image/jpeg	{"identified":true,"width":1080,"height":1073,"analyzed":true}	cloudinary	345042	3NhqZ1P/IiVfI9NuSEQQbw==	2023-11-20 17:54:59.195419
586	urnipj4azj8bo9ihzhm93snwjiiu	Screenshot_20231121-125146~2.png	image/png	{"identified":true,"width":962,"height":961,"analyzed":true}	cloudinary	523518	jZPbkdW2HL69Ok9UozNuAA==	2023-11-21 11:54:36.854738
587	jue6zqjr9x6enjn5w0ev5nhs301g	GarminConnect_20231121-122527.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	972071	FwMeos8qkhNP4gO/Oce3kw==	2023-11-21 12:27:24.732943
588	cu6fewtnf4unyis0vicah5e4qvob	IMG-20231121-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	189804	MnO1GUGmva1hcE2dKjPf8Q==	2023-11-21 19:31:43.326213
589	dlaveye1r0fwrzgdab04i89yj2iz	Screenshot_20231121_202256.jpg	image/jpeg	{"identified":true,"width":1080,"height":1051,"analyzed":true}	cloudinary	267547	oCJnepHCpYJVmjxTkFr/1g==	2023-11-21 19:39:28.693945
590	b6be3lbzttluazov5brpj0zvrojk	IMG-20231121-WA0000.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	189804	MnO1GUGmva1hcE2dKjPf8Q==	2023-11-21 19:40:04.416921
591	yuu82w0dmg4xghz9xdzuopsrqs0k	GarminConnect_20231121-204159.jpg	image/jpeg	{"identified":true,"width":947,"height":947,"analyzed":true}	cloudinary	424896	mZvG5glXAMbsu9s6O12WUQ==	2023-11-21 19:46:23.90041
592	td3dzyqw71j2vdmskfwhbipzsd1r	IMG-20231121-WA0000.jpg	image/jpeg	{"identified":true,"width":1200,"height":1599,"analyzed":true}	cloudinary	189804	MnO1GUGmva1hcE2dKjPf8Q==	2023-11-21 19:47:29.909903
593	eptbhtmtaf7b8lmptatm34agz2j2	Screenshot_20231121_205132_Suunto.jpg	image/jpeg	{"identified":true,"width":821,"height":1076,"analyzed":true}	cloudinary	244387	tmU6s85qqfifA2vL2N+7zQ==	2023-11-21 19:54:52.041632
594	hznxepqe6936j9a2vg7ymdua79dg	57558065-5FF4-4944-9F8B-DEB79602FC20.jpeg	image/jpeg	{"identified":true,"width":3600,"height":3600,"analyzed":true}	cloudinary	1441397	vr4Vu3OzCo83YarqWl/DRQ==	2023-11-21 19:55:59.297333
595	xau1b3w3aeokwzd6j3fnk78232o5	IMG-20231108-WA0002.jpg	image/jpeg	{"identified":true,"width":1448,"height":2048,"analyzed":true}	cloudinary	226706	M4G0qLFWuKxVUPpiEtY9sQ==	2023-11-21 20:07:07.310486
596	d9j1th7ng5axgm5j2tep4rqd9g2l	IMG_0599.jpeg	image/jpeg	{"identified":true,"width":870,"height":1065,"analyzed":true}	cloudinary	236685	H2BFTj9ZTFVFxZhrockF8g==	2023-11-21 20:12:00.624876
597	verdovmi3fy66rekc2vfo3j0vnzy	Screenshot_20231122-094317_Connect.jpg	image/jpeg	{"identified":true,"width":1438,"height":1449,"analyzed":true}	cloudinary	1279041	5DN/ZH7EWj5PzELDUnu1zg==	2023-11-22 08:48:50.50636
598	y9grdr2apfl5uhxhaiq1qt6mfmwi	GarminConnect_20231122-154557.jpg	image/jpeg	{"identified":true,"width":1022,"height":1024,"analyzed":true}	cloudinary	984484	WzlEbnvWXHjIMIsn+Xgwbg==	2023-11-22 15:49:14.820241
599	j2yder4dapgg67yftq9gnd8xltpl	IMG_20231121_221400.png	image/png	{"identified":true,"width":1079,"height":1359,"analyzed":true}	cloudinary	1571844	TUNQaRK0Y+sjhafNS/DbWg==	2023-11-22 21:00:39.30672
600	2e5s4mmr1llgrp6qqgagnrdpn0gi	GarminConnect_20231123-142416.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	622387	SAw/FWH/49TxA4PcRJB2lg==	2023-11-23 14:29:18.206832
601	q8s7mkaqyrmb75smqruqavbhiinh	Screenshot_20231123-171803~3.png	image/png	{"identified":true,"width":949,"height":930,"analyzed":true}	cloudinary	1430663	Z3cswsyE7a7I2ammsgk9EQ==	2023-11-23 16:32:16.087509
602	1hshfpyg7kdxfwc02gvqmylkd202	Screenshot_20231124-152207~2.png	image/png	{"identified":true,"width":945,"height":967,"analyzed":true}	cloudinary	328957	F2+Gw+ZH2VWaOYNsrQti3A==	2023-11-24 14:23:48.001242
603	7pqvwfswg0h8fwx1ufpjbp8ivc72	GarminConnect_20231124-173559.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	558927	nF4YKRnypUO7jkZTK0Jo+g==	2023-11-24 17:36:54.288426
604	2eb1ziqhron0lnd548u9dxfo6heb	Screenshot_20231125_163550.jpg	image/jpeg	{"identified":true,"width":1080,"height":1038,"analyzed":true}	cloudinary	321213	eoD71S42B/kDCg+K0l61bg==	2023-11-25 15:47:49.357998
605	6z00oc4u0uheya4l8j4cwcjqj8yh	Screenshot_20231125_170351_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	711676	syApci14KS7AL36onYuT+A==	2023-11-25 16:07:01.292594
606	yts4v58h6xyfqrcfldzlmne2zv7a	Screenshot_20231125_170408_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	708117	6PQRHy/nQGHdBSyzsZMNwA==	2023-11-25 16:08:34.582274
607	caflsjb0c58mddnyyvzf20gxtm78	Screenshot_20231125_170419_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	684516	Otc3cwOd0EqP+gd+iTbmnA==	2023-11-25 16:09:50.475602
608	yjg5ij9ru7s8ddptrffaogyn0ee7	Screenshot_20231125_170442_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	677509	vwQIaAsYrx0YGP6q00gIBw==	2023-11-25 16:11:14.66331
609	5aif3wfelrio04x1o4jdt4uv5fm3	Screenshot_20231125-172547~3.png	image/png	{"identified":true,"width":969,"height":962,"analyzed":true}	cloudinary	484948	k5+Ck+sMTvrl3H5RSWDKtg==	2023-11-25 16:32:39.526135
610	o83dsm4qj7ctyo5dg9ggppesfr1x	Screenshot_20231127-163756_adidas Running.jpg	image/jpeg	{"identified":true,"width":1440,"height":1440,"analyzed":true}	cloudinary	1198180	2B/1ROFrxSsLsHl4n0Q7ag==	2023-11-27 21:01:18.197462
611	chvfn01acsnrf1gf4f2ijpg9ae04	Screenshot_20231128-164836~2.png	image/png	{"identified":true,"width":740,"height":1412,"analyzed":true}	cloudinary	2042460	dg+s7UuY5xbtpe5WOL4EJA==	2023-11-28 15:59:03.259304
612	5fbgarm9rkgs2e9si8ct0nyt2sw9	Screenshot_20231128_200603_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	469680	Vteh3SGA1Ou8mYVp2jbQxQ==	2023-11-28 19:14:05.979294
613	g7get1y90v2bm76jm0uk1vywjhvk	Screenshot_20231128_202916.jpg	image/jpeg	{"identified":true,"width":1080,"height":1054,"analyzed":true}	cloudinary	485512	C/veYI3/RThfz135Yovh6Q==	2023-11-28 19:39:37.682268
614	b3y7frxg8wlitlf5grf7lyfz10yc	GarminConnect_20231129-104726.jpg	image/jpeg	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	1027345	zQPHw6KQx2DVDyLovZuf7Q==	2023-11-29 10:49:09.818708
615	1bojqr46ogrbpn9z7rwe0w6dh00y	Screenshot_20231129-173018~2.png	image/png	{"identified":true,"width":972,"height":971,"analyzed":true}	cloudinary	301954	wCc9XiVYFKm+NU6U4IEIQQ==	2023-11-29 16:34:01.373167
616	apei8x5rzusfkv084x0gehrjpli7	Screenshot_20231130_202246.jpg	image/jpeg	{"identified":true,"width":1080,"height":1045,"analyzed":true}	cloudinary	294469	OvMYXUgZGIRDpUIuEqsr6A==	2023-11-30 19:41:34.617526
617	5xhnjuyk0ws79kicar1iawa2pxwv	Screenshot_20231130_201534_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	419113	+4KHzZ0DDF37DsqOFps7aA==	2023-11-30 19:46:11.21499
618	j5gpjb322a9wdxpc4gyszy9fknsz	Screenshot_20231130_201222_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	424932	HJa/NtI/M31mHjaX/+PWJg==	2023-11-30 19:48:28.995884
619	7hi19v70zvkmlsuy2dumtn7ldbu8	Screenshot_20231205_154150.jpg	image/jpeg	{"identified":true,"width":1080,"height":1048,"analyzed":true}	cloudinary	273438	UQ8F4jHd6LSnPif9Ajp74w==	2023-12-05 14:45:30.317556
620	d19tijfu0gh2sx1bi2e835m05odb	Screenshot_20231205_193741_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	455798	5GDVrc6zOHcDrCn91K7clA==	2023-12-05 18:44:49.83427
621	8coygcdouy9odt2vzksrfapxh83i	IMG_0677.jpeg	image/jpeg	{"identified":true,"width":2316,"height":3088,"analyzed":true}	cloudinary	1553160	JVTEE9ZQhF/jBSQT4Nr+Kg==	2023-12-05 20:34:17.728584
622	0mbquu888twx13dymi0wphp1flpi	Screenshot_20231209_170553_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	646342	6hriME6TWodI1hpBHfJf1g==	2023-12-09 16:07:02.322093
623	f04z24dns7s60at058e4f7j9kqpo	Screenshot_20231209_172252_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	708720	Y6sMUTH4Tp/CBv3Pwcf6vQ==	2023-12-09 16:25:31.022971
624	i0tqd9nd86e7uixuyzlzcf15a643	Screenshot_20231209_172901_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	706067	JANW2XxJfwTWrPmyMCtizQ==	2023-12-09 16:29:26.222921
625	qd4e6wktha41n5d1dwqvbpnvfh3n	Screenshot_20231209_173032_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	708878	rl8h3ggp+666VdRmd7f72w==	2023-12-09 16:31:54.210781
626	1g3osc0f7x5y1ejxjfi2x76nrlbb	Screenshot_20231209_173237_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	688808	2EQ4LGqLCM6Zp+z5yd8EIQ==	2023-12-09 16:33:52.310291
627	9ls7xl4vvqgnkk32cvtavi7cc6s1	Screenshot_20231209_173450_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	646415	sHzWfT5bOpL9EqFKpo4f5g==	2023-12-09 16:36:35.033599
628	8pcm2u0wt56df78gkwzurx0o0xek	Screenshot_20231209_173730_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	681184	TsAs/Ga7x+qT8Wg4RVDRfA==	2023-12-09 16:38:57.659823
629	8hjet7jprl9ugaopxl145y2p4ghz	Screenshot_20231209_174015_Samsung Health.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	688422	lzyCmAxtMAamBaEfqNmMNA==	2023-12-09 16:48:02.545462
630	85neeb63cy98y52b5anvcfe6khdp	Screenshot_20231211_222804_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	499255	G2m90q+zNrdccI/HSxqccQ==	2023-12-11 21:31:15.461585
631	oz2ooyzogxp2anzgflv6z9tkqwdi	IMG-20231212-WA0001.jpg	image/jpeg	{"identified":true,"width":1600,"height":1200,"analyzed":true}	cloudinary	144844	umyFSS7KsSpA0qjH//myWw==	2023-12-12 19:46:03.820331
632	14t35xfrvdymn47l2hl4tgsd8jpq	Screenshot_20231214_200228_Connect.jpg	image/jpeg	{"identified":true,"width":1080,"height":2400,"analyzed":true}	cloudinary	515916	K1rNBOxiAm/E8/K9mmNRbQ==	2023-12-14 19:06:27.861211
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."active_storage_variant_records" ("id", "blob_id", "variation_digest") FROM stdin;
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."activities" ("id", "distance", "competition", "description", "photo", "user_id", "created_at", "updated_at", "hours", "minutes", "seconds", "score") FROM stdin;
27	10.14	f	✳️ Just like that ✳️	\N	11	2023-07-07 12:09:57.228199	2023-07-07 12:09:57.409811	0	57	53	\N
28	18	f	Kruszwicki bieg południowy 🌝	\N	4	2023-07-08 11:17:19.848739	2023-07-08 11:17:19.86324	1	44	24	\N
29	20.33	f	Kruszwica - Maszenice 	\N	14	2023-07-08 13:55:26.815828	2023-07-08 13:55:26.932013	2	6	36	\N
30	11	f	🔥🔥🔥 Interwały:\r\n2km trucht\r\n5x 400/400\r\n1x 800/800\r\n4x 150/150\r\n2km z hakiem trucht\r\n💪	\N	1	2023-07-08 19:09:19.04492	2023-07-08 19:09:19.141808	0	57	9	\N
31	5.12	f	Poranny rozruch😂	\N	5	2023-07-09 08:08:15.001238	2023-07-09 08:08:15.126843	0	31	16	\N
32	10	f	Niedzielne poranne bieganie 😊	\N	3	2023-07-09 08:28:37.225925	2023-07-09 08:28:37.288274	0	54	7	\N
33	10.36	f	.	\N	9	2023-07-09 12:25:55.933592	2023-07-09 12:25:56.026663	0	59	8	\N
34	10.25	f	Trening Dzień 1\r\nRozgrzewka + interwałki \r\n	\N	4	2023-07-10 17:33:10.403953	2023-07-10 17:33:10.426588	0	59	7	\N
35	20.11	f	Bieg wyczerpujący : /	\N	11	2023-07-10 21:36:08.635221	2023-07-10 21:36:08.647414	2	5	13	\N
8	8	f	Niedzielny trening + rozruch na siłce	\N	1	2023-07-02 10:18:04.556137	2023-07-02 17:42:21.537624	0	40	54	\N
9	20.6	f	Sobótka 	\N	4	2023-07-02 19:53:51.992151	2023-07-02 19:53:52.087712	1	57	47	\N
10	14.4	f	Niedzielka	\N	4	2023-07-02 19:56:02.151534	2023-07-02 19:56:02.160567	1	23	34	\N
11	10	f	😉💪	\N	6	2023-07-02 20:22:38.799117	2023-07-02 20:22:38.895012	0	47	24	\N
12	10	f	Potruchtane😉	\N	6	2023-07-02 20:25:35.282076	2023-07-02 20:25:35.326801	0	51	24	\N
13	16	f	Niedziela😉	\N	7	2023-07-02 20:31:53.490868	2023-07-02 20:31:53.586492	1	23	44	\N
14	10	f	😉😉	\N	6	2023-07-03 16:10:44.85817	2023-07-03 16:10:45.016876	0	49	38	\N
15	6.29	f	Poniedziałkowy trening 	\N	2	2023-07-03 17:42:09.059186	2023-07-03 17:42:09.148738	0	39	27	\N
16	5.03	f	Bieganie 01.07	\N	5	2023-07-03 18:18:20.196797	2023-07-03 18:18:20.215266	0	35	57	\N
17	7.02	f	Przebieżka  dzisiaj	\N	5	2023-07-03 18:21:18.194575	2023-07-03 18:21:18.211113	0	45	7	\N
18	6.66	f	Trening 	\N	8	2023-07-03 18:55:05.656138	2023-07-03 18:55:05.817438	0	42	14	\N
20	8.02	f	Bożena Chmielecka 	\N	9	2023-07-03 19:02:01.832096	2023-07-03 19:02:01.943559	0	52	59	\N
21	7	f	Trening z Rozbieganą	\N	3	2023-07-03 20:38:37.989375	2023-07-03 20:38:38.006866	0	41	7	\N
22	7	f	W grupie siła 💪	\N	10	2023-07-03 20:50:08.866056	2023-07-03 20:50:08.906517	0	44	13	\N
23	12	f	Truchtanko z Rozbieganą 	\N	1	2023-07-05 18:45:25.176487	2023-07-05 18:45:25.313681	1	13	57	\N
36	11.65	f	Trening 2 Dzień \r\nRozgrzewka + skipy A/C	\N	4	2023-07-11 17:15:50.844985	2023-07-11 17:15:50.965425	1	12	13	\N
24	10.02	f	Środowy trening 	\N	2	2023-07-05 19:45:56.618431	2023-07-05 19:46:31.297702	1	3	37	\N
25	10	f	Środowy trening w deszczu🏃‍♂️🏃‍♀️	\N	10	2023-07-07 11:39:12.954657	2023-07-07 11:39:13.03744	1	4	0	\N
26	15.1	f	Super przebieżka z Ekipą ⚡    	\N	11	2023-07-07 12:02:47.832101	2023-07-07 12:02:47.933899	1	31	52	\N
37	12.95	f	Kruszwica 	\N	14	2023-07-12 10:13:07.028505	2023-07-12 10:13:07.131395	1	17	9	\N
38	7.8	f	Kruszwica 	\N	14	2023-07-12 10:14:43.756315	2023-07-12 10:14:43.799541	0	47	27	\N
39	12.2	f	Trening Dzień 3\r\nRozbieganie + WT (wytrzymałość tempowa)\r\n+schłodzenie 	\N	4	2023-07-12 17:57:08.659362	2023-07-12 17:57:08.76135	1	6	0	\N
40	5.06	f	Pobiegane	\N	5	2023-07-12 18:24:30.910293	2023-07-12 18:24:30.924806	0	30	52	\N
41	6	f	Środowy trening 	\N	2	2023-07-13 00:37:07.851489	2023-07-13 00:37:07.861767	0	37	1	\N
42	7	f	😊	\N	3	2023-07-13 14:36:42.683227	2023-07-13 14:36:42.693366	0	35	29	\N
43	13.1	f	Dzień 4\r\nRozbieganko + interwałki + schłodzenie 	\N	4	2023-07-14 17:25:42.229855	2023-07-14 17:25:42.252357	1	14	40	\N
44	8.01	f	Lipiec 	\N	12	2023-07-14 18:46:38.172227	2023-07-14 18:46:38.19414	1	5	34	\N
45	6.5	f	Lipiec cd	\N	12	2023-07-14 18:48:40.920597	2023-07-14 18:48:40.982762	0	39	16	\N
46	7.01	f	Lipiec cd 	\N	12	2023-07-14 18:53:34.218889	2023-07-14 18:53:34.231058	0	38	49	\N
47	21.3	f	Mimo wszystko :) 	\N	11	2023-07-15 00:29:22.85857	2023-07-15 00:29:22.887686	2	10	21	\N
48	18.1	f	Dzień 5\r\nWybiegania „Złodziejską” ps nasz odcinek to max 13km (to info dla wtajemniczonych) 😎	\N	4	2023-07-16 07:02:07.550435	2023-07-16 07:02:07.565346	1	43	40	\N
49	8.1	f	💚	\N	9	2023-07-16 12:12:59.768973	2023-07-16 12:12:59.828063	0	52	57	\N
50	5.37	f	Lipiec 	\N	12	2023-07-17 17:56:57.953865	2023-07-17 17:56:58.056518	0	33	20	\N
51	10.4	f	Dzień 6 \r\nRozbieganie + interwałki	\N	4	2023-07-18 17:32:48.837379	2023-07-18 17:32:48.923232	0	58	50	\N
52	12	f	Dzień 7\r\nRozbieganie-skipy/wieloskoki	\N	4	2023-07-19 17:59:15.824526	2023-07-19 17:59:15.839119	1	13	35	\N
53	5.4	f	Poniedziałkowy trening 	\N	10	2023-07-19 20:23:40.967364	2023-07-19 20:23:40.983695	0	33	4	\N
54	8	f	Środowy trening 	\N	10	2023-07-19 20:24:29.359413	2023-07-19 20:24:29.448387	0	46	49	\N
55	10.24	f	Lipiec cd.	\N	12	2023-07-20 18:09:38.975599	2023-07-20 18:09:38.985448	0	58	0	\N
56	7	f	Dziś schody i podbiegi	\N	9	2023-07-22 13:00:41.127317	2023-07-22 13:00:41.218565	0	52	31	\N
57	5.02	f	 Bieganko z 17 .07	\N	5	2023-07-23 10:02:22.74441	2023-07-23 10:02:22.757433	0	33	5	\N
58	8.02	f	Pobiegane	\N	5	2023-07-23 10:04:24.258921	2023-07-23 10:04:24.350359	0	49	41	\N
59	10	f	Niedzielne bieganie 	\N	10	2023-07-23 18:38:08.229472	2023-07-23 18:38:08.316508	0	58	40	\N
60	10.01	f	Lipiec	\N	12	2023-07-24 19:10:01.947232	2023-07-24 19:10:01.978407	0	58	42	\N
61	8.71	f	Trening Rozbieganej 	\N	9	2023-07-24 20:10:29.227692	2023-07-24 20:10:29.425523	0	57	35	\N
62	5.01	f	Poniedziałkowy trening 	\N	2	2023-07-25 08:00:36.189448	2023-07-25 08:00:36.314245	0	31	35	\N
63	8.92	f	Kruszwica 	\N	14	2023-07-25 18:28:49.796191	2023-07-25 18:28:49.843475	1	3	21	\N
64	10.49	f	Kruszwica 	\N	14	2023-07-25 18:30:32.685936	2023-07-25 18:30:32.777324	1	1	51	\N
65	4.02	f	Lipiec cd.	\N	12	2023-07-26 06:02:59.471877	2023-07-26 06:02:59.566127	0	22	45	\N
66	5	f	Piątka 🖐 po Tabacie. Nogi już nie podawały 😉	\N	1	2023-07-26 06:32:19.860916	2023-07-26 06:32:19.95012	0	25	21	\N
67	18.25	f	Przebieżka 	\N	11	2023-07-27 06:40:01.661609	2023-07-27 06:40:01.759276	1	50	51	\N
68	10	f	Dziś płuca wywrócone na lewą stronę 😁	\N	1	2023-07-27 19:28:05.820278	2023-07-27 19:28:05.92299	0	48	38	\N
69	6.06	f	Bukowina Tatrzańska 	\N	14	2023-07-28 11:24:28.045104	2023-07-28 11:24:28.071824	0	42	36	\N
70	8.43	f	Biegam bo lubię.	\N	9	2023-07-28 20:06:32.096299	2023-07-28 20:06:32.171986	0	52	10	\N
71	1.94	f	Bieg po schodach\r\n 22×4 piętro. Nie wiem czy to można zaliczyć do biegania 🤔😊	\N	9	2023-07-29 15:58:13.998462	2023-07-29 15:58:14.09092	0	22	45	\N
72	6.51	f	Bukowina Tatrzańska 	\N	14	2023-07-30 11:30:52.75365	2023-07-30 11:30:52.762898	0	53	3	\N
73	6.51	f	Bukowina Tatrzańska 	\N	14	2023-07-30 11:32:49.575776	2023-07-30 11:32:49.658927	0	35	14	\N
74	16.52	f	Niedzielny trening.	\N	9	2023-07-30 12:31:25.22427	2023-07-30 12:31:52.921938	1	38	45	\N
75	7	f	Trening Rozbieganej	\N	3	2023-07-30 20:39:56.321349	2023-07-30 20:39:56.426692	0	43	52	\N
76	7	f	+1km niezapisany \r\n😊	\N	3	2023-07-30 20:43:12.061863	2023-07-30 20:43:12.081949	0	35	21	\N
77	12	f	Parszywa dwunastka 😉	\N	1	2023-08-01 04:53:10.644822	2023-08-01 04:53:10.770767	1	3	3	\N
78	7.01	f	Sierpień 	\N	12	2023-08-02 08:15:19.900492	2023-08-02 08:15:19.91477	0	41	9	\N
79	7.57	f	Kruszwica 	\N	14	2023-08-03 10:10:54.343026	2023-08-03 10:10:54.434361	0	43	10	\N
80	5	f	Pobiegane 	\N	2	2023-08-04 18:42:25.005209	2023-08-04 18:42:25.087665	0	31	47	\N
81	20.32	f	Bieg Bachorce, Maszenice, Piaski, Kruszwica 	\N	14	2023-08-05 08:45:00.424019	2023-08-05 08:45:00.433901	1	59	38	\N
103	6.2	f	💚	\N	9	2023-08-27 14:15:27.871264	2023-08-27 14:15:27.953164	0	39	33	\N
104	8.14	f	💚	\N	9	2023-08-27 14:20:04.861402	2023-08-27 14:20:04.963689	0	48	12	\N
83	6	f	6stka + streetworkout	\N	1	2023-08-06 09:49:32.943927	2023-08-06 09:49:32.952775	0	29	48	\N
84	7	f	Sierpień 	\N	12	2023-08-06 16:59:38.850808	2023-08-06 16:59:38.860138	0	38	59	\N
85	10.01	f	😊	\N	3	2023-08-06 19:46:20.49812	2023-08-06 19:46:20.585771	0	49	46	\N
86	9.24	f	Kruszwica 	\N	14	2023-08-07 22:58:37.945131	2023-08-07 22:58:38.010597	0	52	35	\N
87	10.37	f	Trening poranny 🏃	\N	14	2023-08-08 20:25:45.176808	2023-08-08 20:25:45.267603	0	59	41	\N
88	10.31	f	Trening Kruszwica 	\N	14	2023-08-10 16:46:21.923187	2023-08-10 16:46:21.998404	1	1	4	\N
89	9.93	f	Trening Kruszwica 	\N	14	2023-08-10 16:47:19.685887	2023-08-10 16:47:19.716057	0	59	39	\N
90	12.72	f	💚	\N	9	2023-08-12 14:44:37.467237	2023-08-12 14:44:37.475145	1	19	2	\N
91	10.39	f	Kruszwica 	\N	14	2023-08-12 18:31:09.351317	2023-08-12 18:31:09.367235	1	1	46	\N
92	20.34	f	Kruszwica - Maszenice 	\N	14	2023-08-12 18:32:50.136987	2023-08-12 18:32:50.439016	2	6	53	\N
93	8.4	f	💚	\N	9	2023-08-13 19:15:02.982461	2023-08-13 19:15:03.060146	0	51	47	\N
94	7.51	f	💚	\N	9	2023-08-15 09:13:42.225831	2023-08-15 09:13:42.326912	0	45	7	\N
82	18	t	18 km.\r\n 1300 metrów  ,przewyższeń , 40 przeszkód.	\N	9	2023-08-05 16:07:11.085954	2023-08-15 09:15:12.53804	3	44	54	\N
95	5.87	f	Kruszwica 	\N	14	2023-08-17 11:09:19.779279	2023-08-17 11:09:19.811465	0	35	8	\N
96	6.37	f	Kruszwica 	\N	14	2023-08-17 11:11:17.276697	2023-08-17 11:11:17.284881	0	37	57	\N
97	5.02	f	Szybka 5	\N	3	2023-08-18 20:34:09.227606	2023-08-18 20:34:09.313763	0	24	21	\N
98	12.6	f	💚	\N	9	2023-08-20 09:37:19.793223	2023-08-20 09:37:19.845444	1	19	4	\N
99	4.56	f	Sierpień 	\N	12	2023-08-25 05:33:45.832785	2023-08-25 05:33:45.917502	0	28	32	\N
100	7.2	f	Sierpień 	\N	12	2023-08-25 05:35:12.145494	2023-08-25 05:35:12.201612	0	48	13	\N
101	8	f	Sierpień 	\N	12	2023-08-25 05:37:00.41594	2023-08-25 05:37:00.423022	0	47	4	\N
102	8	f	Sierpień 	\N	12	2023-08-25 05:38:15.612584	2023-08-25 05:38:15.619731	0	45	44	\N
105	28	f	Obowiązkowe truchtanko 	\N	4	2023-08-27 17:39:26.573961	2023-08-27 17:39:26.580931	2	45	24	\N
106	10.32	f	Bieganko	\N	5	2023-08-28 20:06:57.910355	2023-08-28 20:06:57.922756	1	6	51	15
107	9.38	f	Sierpień 	\N	12	2023-08-29 05:17:32.116074	2023-08-29 05:17:32.214214	1	0	56	13.5
108	10	f	😊	\N	3	2023-08-29 08:28:11.672636	2023-08-29 08:28:11.811291	1	1	13	15
109	8.18	f	💙	\N	9	2023-08-29 08:51:00.404016	2023-08-29 08:51:00.430854	0	51	59	12
110	10.53	f	Kruszwica 	\N	14	2023-08-29 13:04:04.634256	2023-08-29 13:04:04.6965	1	4	0	15
111	13.2	f	Podbiegi	\N	4	2023-08-29 17:10:35.889738	2023-08-29 17:10:35.905935	1	17	42	26
112	16.1	f	WT	\N	4	2023-08-30 18:16:03.985536	2023-08-30 18:16:04.079194	1	24	15	40
113	14	f	Rozbieganie WT przed wałkami	\N	4	2023-08-31 16:18:23.001942	2023-08-31 16:18:23.032737	1	16	6	35
114	8.12	f	..to już nie te lata 🤫	\N	11	2023-08-31 16:42:20.681578	2023-08-31 16:42:20.737118	0	44	56	16
115	5.05	f	Bieganko	\N	5	2023-08-31 19:12:53.608781	2023-08-31 19:12:53.62584	0	33	8	5
116	14	f	Wałki +wiatr = moc 🤪	\N	4	2023-09-01 12:28:06.051858	2023-09-01 12:28:06.059618	1	17	6	28
117	8.01	f	Rodzinnie	\N	21	2023-09-01 15:45:28.077726	2023-09-01 15:45:28.166849	0	47	33	16
118	5	f	🍊	\N	8	2023-09-01 16:23:19.432205	2023-09-01 16:23:19.456642	0	29	4	10
119	12.03	f	Żarty na bok 😈	\N	1	2023-09-01 18:25:23.263757	2023-09-01 18:25:23.27257	0	59	41	36
124	7	t	Sobotni trening	\N	18	2023-09-02 19:12:22.278783	2023-09-02 19:12:22.36269	0	46	32	28
125	6	t	Bieganko truchtanko! Dzięki rozbiegana ekipo! 	\N	13	2023-09-02 20:09:14.00474	2023-09-02 20:09:14.063499	0	42	35	24
120	12.046	f	Trening indywidualny.	\N	19	2023-09-02 10:36:44.030292	2023-09-02 17:00:05.043025	1	13	7	18
121	7	t	Treningowo.. 	\N	11	2023-09-02 17:41:23.907167	2023-09-02 17:41:44.82151	0	46	8	28
122	1	f	Dobiegnięcie 😱	\N	11	2023-09-02 17:44:59.599204	2023-09-02 17:44:59.612999	0	5	27	2.5
123	7.13	t	Sobota 	\N	2	2023-09-02 17:51:30.09922	2023-09-02 17:51:30.201792	0	46	32	28
128	3	f	Przebieżka z Brunem	\N	5	2023-09-02 20:47:00.895117	2023-09-02 20:47:00.90197	0	18	43	4.5
126	8	t	Trening Rozbieganej	\N	10	2023-09-02 20:10:49.220756	2023-09-02 20:11:28.316061	0	52	26	32
127	6	t	Wspólne bieganko	\N	5	2023-09-02 20:44:16.891783	2023-09-02 20:44:16.952021	0	40	48	24
130	5.06	f	Kruszwica 	\N	14	2023-09-02 20:54:24.647977	2023-09-02 20:54:24.846637	0	34	0	5
129	15.37	f	Kruszwica 	\N	14	2023-09-02 20:52:28.85088	2023-09-02 20:53:03.759479	1	30	50	30
132	8.054	f	Trening indywidualny.	\N	19	2023-09-03 07:11:43.862224	2023-09-03 07:11:43.87423	0	49	19	12
131	6	t	Sobota🤩	\N	7	2023-09-03 06:11:11.014308	2023-09-03 06:13:08.480042	0	41	10	24
133	10.4	f	💙\r\n Pozdrawiam całą Rozbiegną ❤️	\N	9	2023-09-03 10:22:10.5045	2023-09-03 10:22:10.600522	0	56	25	25
134	12	t	Niedzielne wybieganie 	\N	10	2023-09-03 11:10:37.602614	2023-09-03 11:11:11.663825	1	16	0	48
135	11	t	Wybieganie	\N	5	2023-09-03 11:14:54.860797	2023-09-03 11:14:54.876757	1	10	22	44
136	20	f	Relax po ciężkim tygodniu	\N	4	2023-09-03 12:34:54.496747	2023-09-03 12:34:54.505119	1	59	1	40
137	11	t	Trening z Rozbieganą	\N	3	2023-09-03 12:42:10.128932	2023-09-03 12:42:10.20174	1	18	51	44
138	13	t	Rozbiegana w Giżewie	\N	21	2023-09-03 14:46:17.44924	2023-09-03 14:46:17.457091	1	22	9	52
139	7.73	t	Sierpień 	\N	12	2023-09-03 17:27:28.351152	2023-09-03 17:27:28.360134	0	51	50	28
140	12.23	t	Wrzesień 	\N	12	2023-09-03 17:29:26.460233	2023-09-03 17:29:26.550936	1	18	38	48
141	11.11	f	Kurde, ciężko tak po wakacjach 😊	\N	6	2023-09-03 20:26:34.353421	2023-09-03 20:26:34.36416	0	58	20	27.5
142	5.5	f	Żona z mężem oglądają horror. Nagle pojawia się straszny potwór.\r\n- O matko! - krzyczy żona.\r\n- Teściowa? Faktycznie podobna.	\N	8	2023-09-04 16:54:10.901125	2023-09-04 16:54:11.001321	0	32	22	10
143	15	f	Rozpędzamy się pomarańczowi 😜💪💪	\N	6	2023-09-04 17:01:06.17212	2023-09-04 17:01:06.264795	1	21	25	37.5
144	6.02	f	Szybkie 6 + drążki	\N	1	2023-09-04 18:57:12.923915	2023-09-04 18:57:13.01214	0	29	40	18
145	13.03	f	🧡💪	\N	6	2023-09-05 14:49:14.710637	2023-09-05 15:17:42.62231	1	7	52	32.5
146	12	f	Rozgrzewka + wałki	\N	4	2023-09-05 16:56:44.559233	2023-09-05 16:56:44.756985	1	5	21	30
147	8	t	💪🔥👍	\N	13	2023-09-05 17:49:54.413924	2023-09-05 17:49:54.498971	0	54	10	32
148	7.02	t	Nie ma to jak wspólne bie🏃‍♂️🏃‍♀️ganko 😄	\N	11	2023-09-05 17:54:41.186204	2023-09-05 17:54:41.195469	0	56	32	28
149	4	t	Trawa1🤣	\N	7	2023-09-05 18:16:46.65288	2023-09-05 18:16:46.688611	0	37	54	16
150	3	t	Trawa2😉	\N	7	2023-09-05 18:17:53.122806	2023-09-05 18:17:53.206742	0	18	12	12
151	8.01	t	Bieganko	\N	5	2023-09-05 18:22:43.693627	2023-09-05 18:22:43.703846	0	54	26	32
152	4.12	f	Przebieżka z pieskiem	\N	5	2023-09-05 18:24:40.594968	2023-09-05 18:24:40.604499	0	25	37	6
153	8	t	💙	\N	3	2023-09-05 18:29:01.808235	2023-09-05 18:29:01.819307	1	7	58	32
154	8	t	Moje pierwsze punkty😄	\N	17	2023-09-05 18:40:19.678839	2023-09-05 18:40:19.687267	1	3	35	32
155	7.82	t	Piękne niebieskie niebo 😁	\N	12	2023-09-05 18:42:15.944201	2023-09-05 18:42:15.952471	0	50	59	28
156	5.04	f	🍀	\N	18	2023-09-05 19:21:51.554926	2023-09-05 19:21:51.657778	0	29	31	10
157	8	t	Trening	\N	10	2023-09-05 19:41:02.787845	2023-09-05 19:41:02.875299	0	55	9	32
158	6	f	Dla Zielonych\r\nBoso po piachu i w cywilkach	\N	21	2023-09-06 07:57:18.379561	2023-09-06 07:57:18.454386	0	37	9	9
159	6.15	f	💙	\N	9	2023-09-06 18:37:17.413737	2023-09-06 18:37:17.423873	0	34	43	12
160	5.03	f	Wieczorne bieganiez Brunem	\N	5	2023-09-06 20:43:36.262023	2023-09-06 20:43:36.272355	0	32	10	7.5
161	6	f	Dla Zielonych\r\nLecimy Lecimy	\N	21	2023-09-07 07:34:03.281455	2023-09-07 07:34:03.37264	0	39	2	6
162	3.03	f	Przebieżka z pieskiem😊	\N	5	2023-09-07 17:34:00.698788	2023-09-07 17:34:00.798699	0	19	3	4.5
163	15	f	WT bo pomarańczowe to najsłodsze 🍊	\N	4	2023-09-07 17:45:04.683477	2023-09-07 17:45:04.691403	1	20	6	37.5
166	14.045	f	Trening indywidualny.	\N	19	2023-09-08 17:06:17.380251	2023-09-08 17:06:17.468121	1	21	4	28
164	11.11	f	🧡💪	\N	6	2023-09-07 19:14:05.367577	2023-09-07 19:21:22.571796	0	52	43	33
165	11	f	🍊	\N	4	2023-09-08 16:20:05.783432	2023-09-08 16:20:05.874003	1	3	33	22
167	6.32	f	Kruszwica 	\N	14	2023-09-08 21:08:13.72302	2023-09-08 21:08:13.749497	0	35	52	12
168	9.76	f	Kruszwica 	\N	14	2023-09-08 21:10:46.347779	2023-09-08 21:10:46.359612	1	3	17	13.5
169	20.34	f	Kruszwica - Bachorce - Maszenice 	\N	14	2023-09-09 08:28:55.722706	2023-09-09 08:28:55.733646	2	7	39	30
170	10.01	f	Kurde gorąco 😜🧡	\N	6	2023-09-09 16:21:56.886799	2023-09-09 16:21:56.900809	0	48	20	30
171	10.511	f	Trening indywidualny.	\N	19	2023-09-09 17:26:51.912946	2023-09-09 17:26:51.924127	1	2	10	20
172	10.01	f	💙	\N	3	2023-09-10 06:44:08.637733	2023-09-10 06:44:08.646009	0	53	19	25
173	34	f	Kto z rana biega jest piękny jak 🍊	\N	4	2023-09-10 08:52:36.774035	2023-09-10 08:52:36.787827	3	12	54	68
174	6.66	f	Diabelsko mi ciężko 	\N	8	2023-09-10 10:42:22.380287	2023-09-10 10:42:22.395636	0	41	57	9
175	14	t	Niedzielne bieganie	\N	10	2023-09-10 10:51:06.871002	2023-09-10 10:51:06.883735	1	33	59	56
176	14	t	Wrzesień 	\N	12	2023-09-10 10:54:38.115662	2023-09-10 10:54:38.18885	1	33	59	56
177	14	t	Wybieganie z Rozbieganą 😁	\N	1	2023-09-10 10:59:48.778652	2023-09-10 10:59:48.869775	1	34	0	56
178	14	t	Terenowa wyprawa😊	\N	5	2023-09-10 11:12:17.91811	2023-09-10 11:12:17.974894	1	34	0	56
179	14	t	💚 dziękuję za dziś Rozbiegani 😊	\N	18	2023-09-10 12:53:59.396965	2023-09-10 12:53:59.403533	1	34	0	56
180	12.4	f	💙🔵💙	\N	9	2023-09-10 14:21:55.514322	2023-09-10 14:21:55.525976	1	12	15	24
181	16	f	Niedziela🏃‍♂️	\N	7	2023-09-10 14:52:02.128884	2023-09-10 14:52:02.217182	1	30	55	32
182	20	f	Jesiennie juz	\N	6	2023-09-11 15:50:07.464256	2023-09-11 15:50:07.494313	1	45	13	50
184	8.22	t	.	\N	8	2023-09-12 18:04:28.057284	2023-09-12 18:04:28.064588	0	52	22	32
185	11.11	f	Deszczowo 😀	\N	6	2023-09-12 18:18:26.341743	2023-09-12 18:18:26.406556	0	56	32	27.5
187	9	t	Biegowy wtorek	\N	10	2023-09-12 19:07:15.857717	2023-09-12 19:07:15.863549	0	56	56	36
183	15	f	Wałki 🍊	\N	4	2023-09-12 17:51:07.815619	2023-09-12 18:28:18.556865	1	21	34	37.5
186	8	t	Wtorek😎	\N	7	2023-09-12 18:34:12.636574	2023-09-12 18:34:12.711113	0	52	53	32
188	10	t	Zieloni góra	\N	21	2023-09-12 19:15:25.19245	2023-09-12 19:15:25.213375	1	6	0	40
189	9.01	t	💙🏃🏃‍♀️💙	\N	3	2023-09-12 19:21:46.943371	2023-09-12 19:21:47.002075	0	57	33	36
190	8	t	🏃‍♀️	\N	11	2023-09-12 19:22:43.967385	2023-09-12 19:22:43.973548	0	48	46	32
192	3.01	f	I skromniutko po treningu 🌡️	\N	11	2023-09-12 19:24:55.183646	2023-09-12 19:24:56.0051	0	18	17	4.5
193	9.34	t	Bieganko	\N	5	2023-09-12 19:36:11.343333	2023-09-12 19:36:11.351642	0	58	55	36
191	8.02	f	Wrzesień 	\N	12	2023-09-12 19:24:17.300076	2023-09-12 19:28:30.30004	0	42	46	20
194	12.01	f	Wrzesień z 💙💙💙	\N	12	2023-09-13 10:25:02.159628	2023-09-13 10:25:02.249307	1	8	3	24
195	10	f	Lecim🧡	\N	6	2023-09-13 15:36:11.806592	2023-09-13 15:36:11.814747	0	48	1	30
196	10	f	Spokojniejsza dyszka + 15 minut drążków 	\N	1	2023-09-13 19:51:02.548335	2023-09-13 19:51:02.559738	0	52	42	25
197	20	f	WT + 🍊	\N	4	2023-09-14 17:49:17.317176	2023-09-14 17:49:17.326759	1	42	44	50
198	6.65	f	Wrzesień 💙💙💙	\N	12	2023-09-15 16:08:29.764132	2023-09-15 16:08:29.848828	0	35	17	15
199	11.92	f	Kruszwica 	\N	14	2023-09-15 20:59:42.152673	2023-09-15 20:59:42.162534	1	11	30	22
200	6.37	f	Kruszwica 	\N	14	2023-09-15 21:01:20.45271	2023-09-15 21:01:20.460751	0	38	41	9
201	14	t	Sobotnie wybieganie 	\N	10	2023-09-16 13:09:00.085355	2023-09-16 13:09:00.091745	1	24	58	56
202	14.28	t	🔥⚡🔥	\N	11	2023-09-16 13:10:46.510119	2023-09-16 13:10:46.584968	1	26	35	56
203	14.07	t	Bieganko	\N	5	2023-09-16 13:46:31.45742	2023-09-16 13:46:31.465258	1	27	30	56
204	14.17	t	Wrzesień 💙💪	\N	12	2023-09-16 14:17:44.575455	2023-09-16 14:17:44.584115	1	26	31	56
205	20.34	f	Maszenice - Piaski - Bachorce - Kruszwica 	\N	14	2023-09-16 14:34:21.024204	2023-09-16 14:34:21.073179	1	54	37	40
206	12.2	f	Wałki 🍊	\N	4	2023-09-16 15:11:17.242458	2023-09-16 15:11:17.308837	1	4	53	30
207	14.02	t	Sobota 💪😃🌞 	\N	18	2023-09-16 18:18:41.19051	2023-09-16 18:18:41.277248	1	24	35	56
208	16	f	Niedziela 🏃‍♂️	\N	7	2023-09-17 09:48:02.199969	2023-09-17 09:48:02.210867	1	27	41	40
209	25	f	Dzisiaj eco 🍊	\N	4	2023-09-17 12:38:12.58129	2023-09-17 12:38:12.591701	2	21	3	50
210	16.04	f	💙🔵💙	\N	9	2023-09-17 15:41:47.12007	2023-09-17 15:41:47.133699	1	35	24	32
211	10	f	Dla zdrowotności 😜🧡	\N	6	2023-09-17 17:41:53.668122	2023-09-17 17:41:53.677541	0	48	48	30
212	11.01	f	⬆️✌	\N	3	2023-09-17 19:09:20.591772	2023-09-17 19:09:20.646472	0	58	42	27.5
213	10	f	Odpoczynek dla nóg po ciężkim week 🍊	\N	4	2023-09-18 17:10:35.512464	2023-09-18 17:10:35.587044	0	58	30	20
214	18.09	f	💪💪🧡	\N	6	2023-09-18 17:43:12.857711	2023-09-18 17:43:12.881333	1	34	59	45
215	8.03	f	Z motywacją dla niebieskich 💙	\N	12	2023-09-18 17:55:39.094768	2023-09-18 17:55:39.178092	0	42	21	20
216	5.13	f	Pobiegane z Brunem	\N	5	2023-09-18 18:08:40.931378	2023-09-18 18:08:40.977443	0	31	13	7.5
217	10	f	Interwały zamknięte w pięć zero	\N	1	2023-09-18 19:06:50.380422	2023-09-18 19:06:50.391371	0	49	31	30
218	6.31	f	Kruszwica 	\N	14	2023-09-19 09:00:32.40245	2023-09-19 09:00:32.489661	0	33	55	15
219	5.01	f	Spóźniona 🍊	\N	2	2023-09-19 17:48:40.010914	2023-09-19 17:48:40.100903	0	31	15	7.5
220	8.26	t	🍊	\N	8	2023-09-19 18:02:41.496317	2023-09-19 18:02:41.508865	0	53	43	32
221	6.06	t	Podbiegi	\N	5	2023-09-19 18:13:27.04063	2023-09-19 18:13:27.051291	0	39	21	24
222	6	t	Podbiegi 💪🔥💙	\N	13	2023-09-19 18:17:10.109652	2023-09-19 18:17:10.195753	0	39	50	24
229	20	f	🔥Dla zdrowotności 😉	\N	6	2023-09-21 14:03:32.429405	2023-09-21 14:03:32.43996	1	46	51	50
223	8	t	Podbiegi	\N	10	2023-09-19 18:56:32.807354	2023-09-19 18:57:05.146822	0	51	11	32
224	8.02	t	Wrzesień 	\N	12	2023-09-19 19:05:54.847018	2023-09-19 19:05:54.852386	0	51	55	32
225	7	t	💙	\N	3	2023-09-19 19:38:50.805771	2023-09-19 19:38:50.888451	0	45	55	28
226	11.11	f	😉😉	\N	6	2023-09-20 15:06:20.433827	2023-09-20 15:06:20.505477	0	54	26	33
227	16	f	OWB1+BC2+trucht=🍊	\N	4	2023-09-20 17:22:06.742571	2023-09-20 17:22:06.831445	1	22	30	40
228	11.02	f	💙💙💙	\N	12	2023-09-20 17:35:33.129465	2023-09-20 17:35:33.139667	0	59	32	27.5
230	11.2	f	Podbiegi z 🍊	\N	4	2023-09-21 17:27:45.244492	2023-09-21 17:27:45.255801	1	3	26	22
231	13.15	f	Interwałki 🍊	\N	4	2023-09-23 11:31:04.185316	2023-09-23 11:31:04.276329	1	11	18	32.5
232	5	f	🍊	\N	8	2023-09-23 15:40:56.29606	2023-09-23 15:40:56.370935	0	29	22	10
233	5.02	f	Pobiegane	\N	5	2023-09-23 16:51:57.29567	2023-09-23 16:51:57.379078	0	31	20	7.5
234	17.15	f	WT z 🍊	\N	4	2023-09-24 11:18:03.553188	2023-09-24 11:18:03.634946	1	30	38	42.5
235	8	f	🍊🌞💚💛❤️	\N	8	2023-09-24 14:07:24.484113	2023-09-24 14:07:24.496807	0	46	10	16
236	18	f	🏃‍♂️🏃‍♂️	\N	7	2023-09-24 15:30:22.048651	2023-09-24 15:30:22.060291	1	36	36	45
237	8.04	f	💙💙💙	\N	12	2023-09-24 17:08:07.584686	2023-09-24 17:08:07.67301	0	43	10	20
238	7.01	f	💙🏃😊	\N	3	2023-09-25 19:10:38.99791	2023-09-25 19:10:39.194478	0	38	35	14
239	2.03	f	Zakopane przy Krokwi 2km pod górę 	\N	14	2023-09-25 21:23:50.708058	2023-09-25 21:23:50.761557	0	10	6	6
240	6.34	f	Kruszwica 	\N	14	2023-09-25 21:24:58.599803	2023-09-25 21:24:58.703347	0	36	27	12
241	11	f	Wałki 🍊	\N	4	2023-09-26 16:59:01.071968	2023-09-26 16:59:01.084867	0	59	25	27.5
242	6.02	t	🍊	\N	2	2023-09-26 17:51:41.707045	2023-09-26 17:51:41.79387	0	38	4	24
243	8.29	t	Pobiegane	\N	5	2023-09-26 18:16:55.322202	2023-09-26 18:16:55.333538	0	52	39	32
244	7.3	t	Trening z Rozbieganą + drążki 😁	\N	1	2023-09-26 18:28:09.852382	2023-09-26 18:28:09.862466	0	46	4	28
245	6.28	t	🍂wtorkowy trening🍂	\N	18	2023-09-26 18:39:43.34847	2023-09-26 18:39:43.359095	0	38	31	24
246	10.14	t	Super przebieżka 🏃‍♂️🏃‍♀️🏃‍♂️	\N	11	2023-09-26 19:16:56.02998	2023-09-26 19:16:56.040084	1	3	54	40
247	6	t	🧡🧡🧡	\N	10	2023-09-26 19:22:33.536375	2023-09-26 19:22:33.564791	0	38	28	24
248	10.11	t	👊🍊	\N	8	2023-09-26 20:11:36.89988	2023-09-26 20:11:36.912781	1	3	4	40
250	6	t	🏃‍♂️😉	\N	7	2023-09-27 04:02:15.43907	2023-09-27 04:02:15.448942	0	42	10	24
249	6.02	t	Zieloni góra 	\N	21	2023-09-26 20:24:31.928978	2023-09-26 20:24:47.000943	0	37	23	24
251	11	f	Po kruszwicku dziś 😜	\N	6	2023-09-27 17:09:27.5099	2023-09-27 17:09:27.600426	0	55	34	27.5
252	8.66	f	💙💙💙	\N	12	2023-09-27 17:27:29.808855	2023-09-27 17:27:29.898514	0	50	20	16
253	7.22	f	🩵💙🩵💙	\N	9	2023-09-27 17:43:27.124404	2023-09-27 17:43:27.133919	0	40	25	14
254	6.01	f	Interwałki + 20min siłowni\r\n🥵	\N	3	2023-09-28 06:26:02.718819	2023-09-28 06:26:02.731292	0	33	21	12
255	10	f	🧡💪	\N	6	2023-09-28 08:06:48.503038	2023-09-28 08:06:48.598378	0	48	34	30
256	12.3	f	Takie tam na koniec m-ca\r\n🍊	\N	4	2023-09-28 17:05:07.475722	2023-09-28 17:05:07.560698	1	6	28	30
257	8	t	W grupie raźniej 💪🧡	\N	6	2023-09-28 18:00:25.483114	2023-09-28 18:01:09.20135	0	48	4	32
258	8	t	Treningowo🧡💙💚	\N	10	2023-09-28 19:28:04.020829	2023-09-28 19:28:04.030302	0	59	9	32
259	7.01	t	Pobiegane	\N	5	2023-09-28 19:39:55.149811	2023-09-28 19:39:55.159051	0	44	19	28
260	9.04	t	Wrzesień 💙	\N	12	2023-09-28 20:02:03.813821	2023-09-28 20:02:03.825436	0	55	48	36
261	8.15	t	No i fajnie ☺️💪😉💚💙🧡	\N	18	2023-09-28 20:27:27.809903	2023-09-28 20:27:27.820135	0	49	16	32
262	5.37	f	Kruszwica 	\N	14	2023-09-28 22:37:16.990971	2023-09-28 22:37:17.039975	0	29	36	10
263	6.31	f	Kruszwica 	\N	14	2023-09-28 22:42:12.769922	2023-09-28 22:42:12.832246	0	36	18	12
264	10	t	Warszawa 	\N	2	2023-09-30 13:53:17.375502	2023-09-30 13:53:17.394378	1	3	50	40
265	10	t	Biegnij Warszawo yeeeaaaa 💪😃☺️ 	\N	18	2023-09-30 14:53:43.970405	2023-09-30 14:53:44.022476	0	56	55	40
266	20.34	f	Kruszwica Bachorce Maszenice 	\N	14	2023-09-30 14:53:56.637755	2023-09-30 14:53:56.647787	1	54	29	40
267	10	t	Biegnij Warszawo 	\N	5	2023-09-30 14:54:06.328004	2023-09-30 14:54:06.418517	0	58	45	40
268	5	t	Pod napięciem Radziejów 2023	\N	10	2023-09-30 14:54:11.815641	2023-09-30 14:54:11.916595	0	34	12	20
270	8	f	Interwały	\N	7	2023-09-30 14:59:22.604362	2023-09-30 14:59:22.613644	0	56	30	8
290	7	t	Październik 	\N	12	2023-10-03 19:02:01.049738	2023-10-03 19:02:01.146517	0	48	3	28
269	10	t	Biegnij Warszawo 2023	\N	19	2023-09-30 14:56:54.282396	2023-09-30 15:28:54.655193	0	54	4	40
271	5	t	Żegnam wrzesień 💙	\N	12	2023-09-30 15:52:16.746506	2023-09-30 15:52:16.841071	0	34	12	20
272	5	t	7. Cross "Pod napięciem"	\N	1	2023-09-30 16:04:58.792316	2023-09-30 16:04:58.893689	0	30	8	20
273	5	t	Cross Radziejów😊	\N	3	2023-09-30 16:16:29.291868	2023-09-30 16:16:29.34389	0	30	8	20
274	10	t	🍊	\N	8	2023-09-30 16:46:58.214312	2023-09-30 16:46:58.302188	0	56	6	40
275	10	t	Biegnij Warszawo 2023	\N	11	2023-09-30 18:08:18.963975	2023-09-30 18:08:19.036183	0	57	3	40
276	5	t	😜🏃‍♂️🏃‍♂️	\N	7	2023-09-30 18:11:01.332976	2023-09-30 18:11:01.342845	0	45	0	20
277	11	f	👍💪🧡	\N	6	2023-09-30 18:50:20.169542	2023-09-30 18:50:20.246635	0	54	41	33
278	50.4	t	Sru Chorzów ultra 🤣🍊	\N	4	2023-10-01 12:18:50.873334	2023-10-01 12:18:50.883309	4	28	41	200
279	16	f	🏃‍♂️😜	\N	7	2023-10-01 12:58:35.760663	2023-10-01 12:58:35.772019	1	26	48	40
280	10	f	Na dobry początek 😜	\N	6	2023-10-01 19:38:14.967004	2023-10-01 19:38:15.051573	0	51	47	25
281	8.25	f	💚🍀💚	\N	9	2023-10-02 16:35:48.716041	2023-10-02 16:35:48.798904	0	47	13	16
282	14.02	f	Październik 💙	\N	12	2023-10-02 17:14:07.247239	2023-10-02 17:14:07.336298	1	19	29	28
291	8	t	💙💙💙💙	\N	10	2023-10-03 19:02:54.577803	2023-10-03 19:02:54.586489	0	51	56	32
283	22	f	Niby zielono 😉ale jesiennie juz😊😜	\N	6	2023-10-03 16:03:31.934683	2023-10-03 16:03:59.006567	1	57	51	55
284	8.17	t	🏃‍♀️	\N	11	2023-10-03 18:04:52.518507	2023-10-03 18:04:52.527735	0	53	40	32
285	7.02	t	💚🍀🧟✅	\N	8	2023-10-03 18:22:51.098073	2023-10-03 18:23:12.401758	0	46	3	28
286	8.04	t	Nocne bieganko	\N	5	2023-10-03 18:25:07.524971	2023-10-03 18:25:07.535764	0	52	55	32
287	3.03	f	✅	\N	8	2023-10-03 18:25:28.997919	2023-10-03 18:25:29.100607	0	22	5	3
288	7.01	t	Trening 	\N	2	2023-10-03 18:52:10.132907	2023-10-03 18:52:10.142958	0	46	19	28
292	8.23	t	💙☺️	\N	18	2023-10-03 19:19:00.095326	2023-10-03 19:19:00.125655	0	49	39	32
289	8.13	t	🧡	\N	13	2023-10-03 18:56:06.365972	2023-10-03 18:57:47.780987	0	53	6	32
293	7	t	Teraz nie mogę się ruszać 	\N	17	2023-10-04 04:22:19.112942	2023-10-04 04:22:19.200368	0	55	7	28
294	8.3	t	Oficjalny trening😀 ... I drążki na dokładkę	\N	1	2023-10-04 04:33:43.904769	2023-10-04 04:33:43.915279	0	53	1	32
295	7.22	f	💚🍀💚	\N	9	2023-10-04 16:45:52.526785	2023-10-04 16:45:52.583721	0	41	54	14
296	5.02	f	Przebieżka z pieskiem	\N	5	2023-10-04 17:18:12.542689	2023-10-04 17:18:12.552684	0	29	51	10
297	17	f	👍💚	\N	6	2023-10-04 17:29:07.220742	2023-10-04 17:29:07.237458	1	29	20	42.5
304	9.2	t	💙	\N	12	2023-10-05 19:15:42.531072	2023-10-05 19:15:42.540626	1	2	34	36
298	8	f	🧡	\N	3	2023-10-05 16:13:35.040645	2023-10-05 16:15:24.430882	0	41	49	20
299	9.04	t	🏃‍♂️	\N	11	2023-10-05 18:03:48.401678	2023-10-05 18:03:48.409877	0	59	2	36
300	8.06	t	Podbiegi	\N	5	2023-10-05 18:32:09.004273	2023-10-05 18:32:09.09309	0	52	41	32
301	9	t	💙	\N	2	2023-10-05 18:42:03.302213	2023-10-05 18:42:03.374383	1	0	41	36
305	10	f	💪💚	\N	6	2023-10-05 19:18:26.911483	2023-10-05 19:18:26.923357	0	48	52	30
302	7.5	t	W grupie pomarańczy 😉	\N	4	2023-10-05 19:03:20.736769	2023-10-05 19:03:39.523665	0	49	19	28
303	7.02	t	🧡	\N	13	2023-10-05 19:04:00.796473	2023-10-05 19:04:00.825062	0	46	25	28
306	9.15	t	💙	\N	18	2023-10-05 19:39:40.169855	2023-10-05 19:39:40.181122	0	55	56	36
307	9	t	💙💙💙	\N	10	2023-10-05 20:19:46.882551	2023-10-05 20:19:46.974244	1	10	0	36
308	9	t	💙💙💙	\N	10	2023-10-05 20:20:44.258386	2023-10-05 20:20:44.26773	1	10	0	36
309	11.11	f	Zielono dziś 😉	\N	6	2023-10-06 17:20:52.182262	2023-10-06 17:20:52.192841	0	55	9	33
310	15	f	💪	\N	6	2023-10-07 11:24:27.364371	2023-10-07 11:24:27.457356	1	18	15	37.5
311	6.42	f	Kruszwica 	\N	14	2023-10-07 11:27:45.869571	2023-10-07 11:27:45.880467	0	36	15	12
312	6.29	f	Kruszwica 	\N	14	2023-10-07 11:31:48.496834	2023-10-07 11:31:48.594444	0	32	27	15
313	6.17	f	Kruszwica 	\N	14	2023-10-07 11:33:47.618703	2023-10-07 11:33:47.631299	0	33	47	15
314	6.17	f	Kruszwica 	\N	14	2023-10-07 11:36:09.500372	2023-10-07 11:36:09.55497	0	33	47	15
315	13	f	Z wiatrem i pod wiatr na pomarańczowo 🍊	\N	4	2023-10-07 11:56:58.956942	2023-10-07 11:56:58.998663	1	12	6	26
316	11.13	f	Z wiatrem i pod wiatr😄\r\nDla 💙💙💙	\N	12	2023-10-07 12:24:24.867995	2023-10-07 12:24:24.884241	1	1	22	22
317	8	f	Mazury🏃‍♂️🏃‍♂️	\N	7	2023-10-07 14:11:38.196109	2023-10-07 14:11:38.208173	0	47	20	16
318	11.01	f	Nierówna walka z wiatrem	\N	1	2023-10-08 11:01:04.520579	2023-10-08 11:01:04.608488	0	58	55	27.5
319	11.01	f	Z motywacją dla 💙	\N	12	2023-10-08 11:05:13.000241	2023-10-08 11:05:13.009367	1	1	43	22
320	5	f	.	\N	8	2023-10-08 11:06:51.101658	2023-10-08 11:06:51.117545	0	30	28	7.5
321	16	f	Niedziela 	\N	7	2023-10-08 12:05:37.22363	2023-10-08 12:05:37.307499	1	27	21	40
322	11.4	f	Podbiegi na 🍊	\N	4	2023-10-10 16:38:20.822339	2023-10-10 16:38:20.914095	1	3	0	22
323	10.27	t	💪💪💪	\N	21	2023-10-10 18:02:55.909616	2023-10-10 18:02:55.921688	1	3	27	40
324	7.01	t	Wtorek	\N	2	2023-10-10 18:04:05.10897	2023-10-10 18:04:42.355607	0	43	10	28
325	9.04	t	🏃‍♀️⚡🏃‍♂️⚡🏃‍♂️	\N	11	2023-10-10 19:21:52.948225	2023-10-10 19:21:52.958419	0	59	2	36
326	1	f	A co tam, każdy pkt liczy się 😄	\N	11	2023-10-10 19:27:57.024173	2023-10-10 19:27:57.035095	0	4	59	3
355	8.04	t	Super bieg!!	\N	17	2023-10-17 18:27:46.020412	2023-10-17 18:27:46.029411	0	56	28	32
356	9.06	t	🏃‍♂️⚡🏃‍♂️⚡🏃‍♂️⚡	\N	11	2023-10-17 18:45:25.605322	2023-10-17 18:45:25.6158	0	57	21	36
327	10	t	💚	\N	9	2023-10-10 19:40:25.099956	2023-10-10 19:44:08.696503	1	2	23	40
328	1.1	f	💚	\N	9	2023-10-10 19:49:48.301271	2023-10-10 19:49:48.39768	0	6	47	1.5
329	9.01	t	Z Rozbieganą Rodzinką 😃	\N	18	2023-10-10 20:01:46.280748	2023-10-10 20:01:46.310151	0	55	38	36
330	10.01	t	🧡	\N	3	2023-10-11 06:35:55.778991	2023-10-11 06:35:55.848435	1	3	36	40
331	6.01	f	Pobiegane po górach	\N	5	2023-10-11 12:59:47.297956	2023-10-11 12:59:47.382092	0	38	31	9
332	9.27	f	✅	\N	8	2023-10-11 17:54:40.392239	2023-10-11 17:54:40.406166	0	56	2	13.5
333	13.35	f	Wałki na 🍊	\N	4	2023-10-12 16:44:47.842089	2023-10-12 16:44:47.930881	1	10	35	32.5
334	9.12	t	🏃‍♀️🌀🏃‍♀️🌀🏃‍♀️	\N	11	2023-10-12 18:32:27.377462	2023-10-12 18:32:27.389971	0	58	8	36
335	7.07	t	🧡🔥💪	\N	13	2023-10-12 18:47:12.570771	2023-10-12 18:47:12.584245	0	45	11	28
336	9.16	t	Czwarteczek ✌️☺️👌	\N	18	2023-10-12 19:00:34.588997	2023-10-12 19:00:34.672965	0	55	40	36
337	9.02	t	Październik 💙💙💙	\N	12	2023-10-12 19:40:53.352011	2023-10-12 19:40:53.363126	1	2	0	36
338	6.28	f	Kruszwica 	\N	14	2023-10-13 11:52:26.512888	2023-10-13 11:52:26.530678	0	34	52	12
339	6.33	f	Kruszwica 	\N	14	2023-10-13 11:54:33.354188	2023-10-13 11:54:33.362391	0	34	40	15
340	6.32	f	Kruszwica 	\N	14	2023-10-13 11:56:09.200859	2023-10-13 11:56:09.208195	0	34	10	15
341	5.01	f	💚Skromne moje punkciki 	\N	2	2023-10-13 16:45:35.888571	2023-10-13 16:45:35.900882	0	32	12	7.5
342	6.02	f	Podbiegi i zbiegi 😊	\N	5	2023-10-13 17:25:50.61852	2023-10-13 17:25:50.630321	0	37	39	9
343	13	f	😉😉💚	\N	6	2023-10-14 09:04:23.990536	2023-10-14 09:04:24.092271	1	3	32	39
344	16.1	f	OWB1+RT=🍊	\N	4	2023-10-14 17:03:30.231026	2023-10-14 17:03:30.241433	1	24	6	40
345	10	f	👍💪💚	\N	6	2023-10-15 09:00:32.706054	2023-10-15 09:00:32.715241	0	48	51	30
346	15.1	f	Ciągłe podbiegi🏃‍♀️	\N	5	2023-10-15 09:37:21.00525	2023-10-15 09:37:21.087754	1	38	0	22.5
347	11.11	f	💪💚😜	\N	6	2023-10-16 10:29:41.570513	2023-10-16 10:29:41.656819	0	54	17	33
348	13.13	f	BC2 🍊🫣	\N	4	2023-10-16 17:17:36.037259	2023-10-16 17:17:36.124398	1	5	5	39
349	8	f	Biegamy !!!!!!!	\N	21	2023-10-17 14:55:12.133462	2023-10-17 14:55:12.144475	0	43	21	20
350	10	t	Trening z czwartku	\N	21	2023-10-17 15:12:55.352975	2023-10-17 15:12:55.3645	1	3	42	40
351	8	t	💚	\N	2	2023-10-17 18:05:52.624862	2023-10-17 18:05:52.63835	0	51	38	32
352	9	t	Trenio	\N	10	2023-10-17 18:07:34.057423	2023-10-17 18:07:34.065313	10	56	24	36
353	4.01	f	Październik 	\N	12	2023-10-17 18:12:21.427692	2023-10-17 18:12:21.439319	0	21	21	10
354	9.02	t	💙💙💙	\N	12	2023-10-17 18:14:24.631222	2023-10-17 18:14:24.641827	0	58	30	36
357	9.05	t	🧡🧡🧡	\N	13	2023-10-17 18:46:27.13818	2023-10-17 18:46:27.146239	0	57	14	36
358	9.25	t	💙	\N	18	2023-10-17 19:45:33.981761	2023-10-17 19:45:34.024394	0	56	20	36
359	9.02	t	Trening z Rozbieganą	\N	1	2023-10-17 20:17:27.565505	2023-10-17 20:17:27.575204	0	57	9	36
360	7.02	f	Podbiegi	\N	5	2023-10-18 07:32:48.499738	2023-10-18 07:32:48.597854	0	41	42	14
361	11	f	Takie tam 🍊	\N	4	2023-10-18 16:43:56.759627	2023-10-18 16:43:56.841621	0	59	11	27.5
362	9	t	🌀	\N	11	2023-10-19 18:38:32.916605	2023-10-19 18:38:32.926954	0	57	0	36
363	9	t	Trening 	\N	10	2023-10-19 19:06:05.232416	2023-10-19 19:06:05.244831	0	56	2	36
364	9	t	💪💪💪	\N	21	2023-10-19 19:06:11.865977	2023-10-19 19:06:11.873819	0	58	15	36
370	10.5	f	Kruszwica 	\N	14	2023-10-20 16:08:20.233643	2023-10-20 16:08:20.246087	0	56	46	25
365	8.11	t	💚	\N	2	2023-10-19 19:07:06.22271	2023-10-19 19:07:29.916972	0	48	30	32
366	8.06	t	🧡	\N	13	2023-10-19 19:09:05.793915	2023-10-19 19:09:05.822154	0	52	2	32
367	8.11	t	💙🏃‍♀️	\N	18	2023-10-19 21:43:08.498945	2023-10-19 21:43:08.593917	0	48	30	32
368	5.39	f	Kruszwica 	\N	14	2023-10-20 16:05:18.497474	2023-10-20 16:05:18.593841	0	28	5	12.5
369	6.35	f	Kruszwica 	\N	14	2023-10-20 16:07:00.353502	2023-10-20 16:07:00.434756	0	34	22	15
371	5.08	t	Padał deszcz🌧, było ciężko 💪ale warto ❤️	\N	17	2023-10-20 17:40:43.113851	2023-10-20 17:40:43.202716	0	32	44	20
372	5.01	t	💚	\N	2	2023-10-20 17:51:22.035654	2023-10-20 17:51:22.099364	0	31	15	20
373	5	t	💦⚡🏃‍♂️💦⚡🏃‍♂️💦⚡🏃‍♀️	\N	11	2023-10-20 18:18:06.93724	2023-10-20 18:18:06.947763	0	27	19	20
374	5	t	💙💙💙	\N	12	2023-10-20 21:57:46.544827	2023-10-20 21:57:46.641716	0	27	11	20
375	5	t	Bieg o zachodzie słońca 	\N	8	2023-10-21 09:28:40.371142	2023-10-21 09:28:40.452591	0	26	39	20
376	20.39	f	Kruszwica - Maszenice 	\N	14	2023-10-21 10:26:17.246401	2023-10-21 10:26:17.326436	2	1	31	40
377	4	t	💚	\N	2	2023-10-21 13:10:05.455595	2023-10-21 13:10:05.551132	0	30	23	16
380	10.02	f	Zdjęcie wczorajsze, trening dzisiejszy. 💙💙💙	\N	12	2023-10-21 15:13:13.237511	2023-10-21 15:13:13.248805	0	57	50	20
378	4	t	Zawody💚💚	\N	9	2023-10-21 14:57:33.91624	2023-10-21 14:59:15.463254	0	25	18	16
379	5.15	f	🍊	\N	4	2023-10-21 15:08:56.305014	2023-10-21 15:08:56.315889	0	26	27	12.5
381	10	f	Mgliscie😉	\N	6	2023-10-21 15:53:36.712573	2023-10-21 15:53:36.733685	0	51	48	25
382	4	t	☺️🐷🐗🤗 taka sobota ✌️	\N	18	2023-10-21 17:18:56.127379	2023-10-21 17:18:56.138707	0	30	26	16
383	4	t	.. no i zaje***** 🏃‍♂️🍄🏃‍♀️🌲🍄🏃‍♂️☘️🌱	\N	11	2023-10-21 20:33:34.598791	2023-10-21 20:33:34.611015	0	30	19	16
384	5	t	Zawody 💚	\N	9	2023-10-22 08:49:59.755566	2023-10-22 08:49:59.767405	0	26	9	20
385	11.11	f	💪💚💪	\N	6	2023-10-22 10:31:40.689917	2023-10-22 10:31:40.778453	0	57	39	27.5
386	42.38	t	🍊	\N	4	2023-10-22 11:32:04.869636	2023-10-22 11:32:04.957483	3	27	35	168
388	13.9	f	Trening indywidualny (23.10).	\N	22	2023-10-23 12:48:13.676875	2023-10-23 21:45:28.79412	1	20	54	26
387	7.76	f	Trening indywidualny (21.10).	\N	22	2023-10-23 12:46:22.943731	2023-10-23 21:44:04.938209	0	46	26	14
389	6.03	f	💚🍀💚	\N	9	2023-10-23 17:10:56.865698	2023-10-23 17:10:56.957303	0	36	30	9
390	10.14	t	✔️	\N	11	2023-10-24 18:13:30.849017	2023-10-24 18:13:30.86445	1	3	45	40
391	6.23	t	💚	\N	2	2023-10-24 18:40:28.000806	2023-10-24 18:40:28.105915	0	38	57	24
392	10	t	💙💙💙	\N	10	2023-10-24 18:40:33.376663	2023-10-24 18:40:33.38624	1	6	0	40
393	10.17	t	Pobiegane	\N	5	2023-10-24 18:49:35.34075	2023-10-24 18:49:35.353929	1	5	5	40
394	5	f	Trening przed treningiem 😉	\N	1	2023-10-24 18:52:48.73713	2023-10-24 18:52:48.800326	0	24	17	15
395	10.24	t	Trening oficjalny 	\N	1	2023-10-24 18:53:51.201517	2023-10-24 18:53:51.210777	1	3	59	40
396	10.17	t	🧡	\N	13	2023-10-24 18:57:55.294653	2023-10-24 18:57:55.304951	1	4	52	40
419	8.05	f	💚	\N	9	2023-10-27 17:10:45.548143	2023-10-27 17:10:45.560696	0	47	45	16
397	9.03	t	💚🍀💚	\N	9	2023-10-24 19:01:36.217035	2023-10-24 19:01:52.453982	0	59	50	36
398	8	t	Super ekipa	\N	17	2023-10-24 19:05:34.637552	2023-10-24 19:05:34.652533	0	54	46	32
399	11	t	🧡	\N	3	2023-10-24 19:05:43.296216	2023-10-24 19:05:43.345948	1	8	51	44
400	15	f	Niedziela 🏃‍♂️🏃‍♂️	\N	7	2023-10-24 19:29:54.277472	2023-10-24 19:29:54.338993	1	25	50	30
401	11	t	Wtorek🏃‍♂️🏃‍♂️	\N	7	2023-10-24 19:30:50.257787	2023-10-24 19:30:50.343335	1	15	50	44
402	10.5	f	Kruszwica 	\N	14	2023-10-24 20:16:59.103017	2023-10-24 20:16:59.114477	0	57	54	20
403	7	t	.	\N	8	2023-10-24 21:08:20.166024	2023-10-24 21:08:20.236976	0	45	11	28
404	10.07	t	👣💙	\N	18	2023-10-24 22:13:07.031392	2023-10-24 22:13:07.11808	1	2	35	40
405	6.5	f	Z przerwami, że złym pomiarem aplikacji ale jest💙💙💙	\N	12	2023-10-25 16:01:54.644825	2023-10-25 16:01:54.654413	0	38	11	12
406	10.55	f	Truchtem na 🍊	\N	4	2023-10-25 16:40:31.67327	2023-10-25 16:40:31.754849	1	0	47	20
407	10.09	f	Trening indywidualny.	\N	22	2023-10-25 16:44:18.296617	2023-10-25 16:44:18.402644	0	59	32	20
408	11	f	💪💚	\N	6	2023-10-25 18:51:31.689812	2023-10-25 18:51:31.708751	0	54	38	33
409	10.3	t	💪💪💪	\N	21	2023-10-26 15:32:43.979191	2023-10-26 15:32:44.061022	1	4	0	40
410	8	f	Podbiegi	\N	21	2023-10-26 15:35:20.759353	2023-10-26 15:35:20.771924	0	54	20	8
411	5.29	f	Kruszwica 	\N	14	2023-10-26 17:13:31.436888	2023-10-26 17:13:31.445722	0	29	33	10
412	4.9	f	Kruszwica 	\N	14	2023-10-26 17:16:02.253614	2023-10-26 17:16:02.337986	0	25	23	10
413	7.03	t	💚	\N	2	2023-10-26 17:57:49.865319	2023-10-26 17:57:49.8755	0	45	33	28
414	7.01	t	Pobiegane w deszczu	\N	5	2023-10-26 18:16:25.756872	2023-10-26 18:16:25.846883	0	46	9	28
415	7	t	💙💙💙	\N	10	2023-10-26 19:28:23.963221	2023-10-26 19:28:24.029095	0	46	35	28
416	7.06	t	🧡	\N	13	2023-10-26 19:34:17.193293	2023-10-26 19:34:17.234006	0	47	4	28
417	7.44	t	☔🌧️🌂💙	\N	18	2023-10-26 22:44:42.947322	2023-10-26 22:44:43.040155	0	45	9	28
418	14.56	f	Trening indywidualny.	\N	22	2023-10-27 12:48:15.340231	2023-10-27 12:48:15.366642	1	25	3	28
420	7	f	Podbiegi	\N	7	2023-10-28 08:59:39.896603	2023-10-28 08:59:39.90887	0	45	0	10.5
421	9.04	f	Wczorajszy trening.\r\nMiałem problemy techniczne 💙	\N	12	2023-10-28 09:05:39.625884	2023-10-28 09:05:39.707212	0	51	4	18
422	10.71	f	Kruszwica 	\N	14	2023-10-28 13:32:34.039375	2023-10-28 13:32:34.050052	0	59	38	20
423	20.38	f	Maszenice 	\N	14	2023-10-28 14:05:34.286004	2023-10-28 14:05:34.364059	1	56	12	40
424	5.07	f	W deszczyku bieganko	\N	5	2023-10-28 14:46:31.362427	2023-10-28 14:46:31.381676	0	30	14	10
433	10	f	Niedzielne bieganie w ciemnosciach	\N	10	2023-10-29 18:08:58.799094	2023-10-29 18:08:58.81107	0	55	50	20
425	10.67	f	Trening indywidualny.	\N	22	2023-10-28 15:14:55.91779	2023-10-28 15:15:44.90056	1	2	51	20
426	10	f	🏃🏃🏃🏃🏃	\N	21	2023-10-28 16:20:24.774182	2023-10-28 16:20:24.860694	0	59	30	20
427	16	f	😉😉	\N	6	2023-10-28 16:48:49.033663	2023-10-28 16:48:49.101661	1	24	22	40
428	16	f	Niedziela	\N	7	2023-10-29 10:27:24.591335	2023-10-29 10:27:24.602137	1	22	46	40
429	8.08	f	Przebieżka z Brunem w deszczyku	\N	5	2023-10-29 10:35:39.917678	2023-10-29 10:35:39.92754	0	49	21	12
430	16.03	f	🍀💚	\N	9	2023-10-29 11:24:44.942063	2023-10-29 11:24:45.010321	1	35	19	32
431	20.1	f	🍊	\N	4	2023-10-29 12:11:58.998034	2023-10-29 12:11:59.093556	1	52	20	40
432	2.55	f	Przed morsowaniem	\N	5	2023-10-29 15:02:46.408834	2023-10-29 15:02:46.429167	0	17	23	2
434	2	f	,🌡️	\N	11	2023-10-29 20:00:52.889098	2023-10-29 20:00:52.906581	0	13	34	2
435	10	f	Różowo ale dla zielonych 😉😜	\N	6	2023-10-29 20:15:41.982413	2023-10-29 20:15:41.999403	0	48	55	30
436	10	f	Mokro dziś 😉	\N	6	2023-10-30 14:31:10.758575	2023-10-30 14:31:10.848786	0	45	55	30
437	10.28	f	Trening indywidualny.	\N	22	2023-10-30 15:11:21.636383	2023-10-30 15:11:21.650332	1	0	5	20
438	11.02	f	Październik 💙	\N	12	2023-10-30 19:25:49.838048	2023-10-30 19:25:49.857346	1	3	14	22
439	10.5	f	Kruszwica 	\N	14	2023-10-30 19:38:34.853155	2023-10-30 19:38:34.86582	0	56	9	25
440	10	f	Halołynowo🎃	\N	6	2023-10-31 18:05:20.818612	2023-10-31 18:05:20.903672	0	49	14	30
441	7.57	f	Trening indywidualny.	\N	22	2023-10-31 18:24:28.697942	2023-10-31 18:24:28.793482	0	45	32	10.5
442	10	f	✔️	\N	11	2023-10-31 19:11:30.668735	2023-10-31 19:11:30.762806	1	0	49	15
443	10.11	t	💪💪💪	\N	21	2023-10-31 19:30:29.640277	2023-10-31 19:30:29.661513	1	1	58	40
444	11	t	Wtorek 🏃‍♂️🏃‍♂️	\N	7	2023-10-31 19:32:58.49542	2023-10-31 19:32:58.596061	1	11	13	44
445	10.03	t	💙💙💙	\N	12	2023-10-31 19:38:11.52875	2023-10-31 19:38:11.537254	1	3	41	40
446	11	t	Oficjalny	\N	1	2023-10-31 19:40:39.070024	2023-10-31 19:40:39.102359	1	7	24	44
447	10	t	💙💙💙	\N	10	2023-10-31 19:43:14.015948	2023-10-31 19:43:14.025789	1	2	46	40
448	10.29	t	💪💙	\N	18	2023-10-31 19:48:56.661326	2023-10-31 19:48:56.67471	1	2	55	40
449	10.2	t	💚🍀💚	\N	9	2023-10-31 19:52:40.02902	2023-10-31 19:52:52.538173	1	4	23	40
450	3	f	💪💪	\N	21	2023-10-31 20:03:07.065263	2023-10-31 20:03:07.080233	0	17	47	6
451	9	t	🧡🔥💪	\N	13	2023-11-02 19:11:06.665541	2023-11-02 19:11:06.675184	0	57	5	36
452	10	t	🫡💙💪	\N	10	2023-11-02 19:16:52.33684	2023-11-02 19:17:16.512638	1	3	59	40
453	8	t	🏃‍♀️🧡😊	\N	3	2023-11-02 19:29:49.557342	2023-11-02 19:29:49.567103	0	52	9	32
454	8.02	t	💚	\N	2	2023-11-02 19:33:34.649953	2023-11-02 19:33:34.661102	0	51	4	32
455	8	t	✔️	\N	11	2023-11-02 19:39:36.075492	2023-11-02 19:39:36.085592	0	45	0	32
482	2.06	f	Przebieżka przed morsowaniem 	\N	5	2023-11-05 15:19:34.236228	2023-11-05 15:19:34.391067	0	13	38	2
456	5	f	✔️	\N	11	2023-11-02 19:40:43.792701	2023-11-02 19:41:41.887193	0	29	50	10
457	9	t	Pomarańcze🤣🤣	\N	7	2023-11-02 19:48:45.951146	2023-11-02 19:48:45.961503	1	2	33	36
458	8.48	t	Czwartek	\N	23	2023-11-02 19:49:25.295388	2023-11-02 19:49:25.305183	0	55	20	32
459	8	t	💙	\N	18	2023-11-02 19:56:47.061431	2023-11-02 19:56:47.070503	0	51	41	32
460	9.05	t	Pobiegane	\N	5	2023-11-02 20:09:23.065714	2023-11-02 20:09:23.153435	0	57	30	36
483	10.01	f	😊🧡	\N	3	2023-11-05 16:54:33.268447	2023-11-05 16:54:33.340017	0	53	5	25
461	10.31	f	Kruszwica 	\N	14	2023-11-02 21:00:15.751022	2023-11-02 21:01:02.861819	0	56	55	20
462	10.5	f	🏃🏃🏃🏃	\N	21	2023-11-03 11:41:03.002881	2023-11-03 11:41:03.015839	0	56	45	25
463	10	f	Ulubiona pogoda na bieganie 😀	\N	1	2023-11-03 19:55:02.666268	2023-11-03 19:55:02.755354	0	49	17	30
464	12	f	👽👽	\N	6	2023-11-03 20:21:43.264738	2023-11-03 20:21:43.274748	0	58	52	36
465	10.21	f	Kruszwica 	\N	14	2023-11-03 21:26:12.77872	2023-11-03 21:26:12.869238	0	57	20	20
466	20.37	f	Maszenice Kruszwica 	\N	14	2023-11-04 09:33:34.239606	2023-11-04 09:33:34.250765	1	58	55	40
467	2.03	f	Rozruch przed nocnym startem	\N	5	2023-11-04 10:40:25.617445	2023-11-04 10:40:25.631525	0	14	3	2
468	5	t	Odlotowa 5💪💪💪💪	\N	21	2023-11-04 23:22:18.596849	2023-11-04 23:22:18.693456	0	25	28	20
469	5	t	Odlotowa 5	\N	5	2023-11-04 23:44:48.196661	2023-11-04 23:44:48.210434	0	28	1	20
470	5	t	💚🍀	\N	9	2023-11-04 23:45:23.971689	2023-11-04 23:45:23.980864	0	27	35	20
471	5	t	Odlotowa 5 nocą 	\N	10	2023-11-05 00:09:14.700474	2023-11-05 00:09:14.716521	0	26	36	20
472	5	t	💙💙💙	\N	12	2023-11-05 00:16:02.967649	2023-11-05 00:16:03.002674	0	26	12	20
473	5	t	🧡🔥💪	\N	13	2023-11-05 08:21:52.493388	2023-11-05 08:21:52.509357	0	27	45	20
474	5	t	Była moc w nogach! 	\N	23	2023-11-05 08:26:01.117602	2023-11-05 08:26:01.194496	0	27	42	20
475	5	t	🛬	\N	8	2023-11-05 08:26:02.51202	2023-11-05 08:26:02.521148	0	27	43	20
476	5	t	Odlotowa5	\N	7	2023-11-05 10:16:34.914707	2023-11-05 10:16:34.925719	0	29	11	20
477	16	f	Niedziela🏃‍♂️🏃‍♂️🏃‍♂️	\N	7	2023-11-05 10:17:22.314377	2023-11-05 10:17:22.326103	1	23	11	40
478	5	t	💚	\N	9	2023-11-05 12:13:42.943843	2023-11-05 12:13:42.958984	0	28	48	20
479	20	f	🍁😁👽	\N	6	2023-11-05 12:53:30.36479	2023-11-05 12:53:30.381175	1	45	31	50
480	7.1	f	Niestety plan treningowy przegrał z chorobą 😉\r\nTylko 7☹️	\N	12	2023-11-05 13:13:10.105809	2023-11-05 13:13:10.147445	0	40	53	14
481	2.01	f	✔️	\N	11	2023-11-05 14:34:07.613889	2023-11-05 14:34:07.700656	0	13	19	2
484	2.09	f	Rozgrzewka przed biegiem 	\N	9	2023-11-05 17:35:04.510804	2023-11-05 17:35:04.618768	0	12	56	3
496	8	t	💙🏃‍♀️	\N	18	2023-11-08 05:53:29.730302	2023-11-08 05:53:29.743471	0	51	31	32
485	5.1	f	 ( ͡~ ͜ʖ ͡°)\r\n	\N	23	2023-11-06 16:42:34.286565	2023-11-06 20:51:31.611844	0	30	30	10
486	13	f	👽💪	\N	6	2023-11-07 16:15:47.753294	2023-11-07 16:15:47.764373	1	3	47	39
487	8.03	t	✔️	\N	11	2023-11-07 19:44:05.340641	2023-11-07 19:44:05.374366	0	52	16	32
488	9	t	🧡	\N	13	2023-11-07 19:53:23.378021	2023-11-07 19:53:23.387344	0	57	37	36
489	9	t	💙	\N	10	2023-11-07 19:53:37.404363	2023-11-07 19:53:37.476149	0	58	44	36
497	11	f	👽💪	\N	6	2023-11-08 14:59:26.062066	2023-11-08 14:59:26.073765	0	54	5	33
490	8	t	💚	\N	2	2023-11-07 19:54:58.349218	2023-11-07 19:55:50.80961	0	51	27	32
491	9	t	Pobiegane	\N	5	2023-11-07 20:03:31.489971	2023-11-07 20:03:31.499578	0	58	5	36
492	5	f	🏃‍♂️	\N	11	2023-11-07 20:03:52.13468	2023-11-07 20:03:52.143532	0	26	54	12.5
493	2.03	f	Dobiegane z Brunem	\N	5	2023-11-07 20:08:19.429031	2023-11-07 20:08:19.439908	0	12	55	3
494	10	t	😊	\N	3	2023-11-07 20:27:03.349414	2023-11-07 20:27:03.358473	1	5	21	40
495	9	t	💙	\N	12	2023-11-07 20:28:35.332393	2023-11-07 20:28:35.341323	0	58	58	36
498	10.04	t	Wtoreczek	\N	7	2023-11-08 16:09:39.509318	2023-11-08 16:09:39.599651	1	6	47	40
499	6.2	f	💚🍀💚	\N	9	2023-11-08 16:14:04.103786	2023-11-08 16:14:04.194964	0	35	57	12
500	9.2	f	Bieganko 	\N	14	2023-11-08 16:46:13.73797	2023-11-08 16:46:13.808099	1	4	21	9
501	8	f	👌👌👌👌	\N	21	2023-11-08 19:08:04.561248	2023-11-08 19:08:04.573059	0	45	33	16
502	10	t	Gniewkowo 🍊	\N	4	2023-11-08 19:31:22.775185	2023-11-08 19:31:22.78618	0	45	3	40
506	10.17	t	💪💪💪💪	\N	21	2023-11-09 19:20:18.617113	2023-11-09 19:20:18.702671	1	3	49	40
503	4.07	f	Kolejny raz muszę powtórzyć że z rana to nie dla mnie:) 	\N	23	2023-11-09 09:17:51.589574	2023-11-09 10:31:37.299232	0	24	14	8
504	7	f	🏃‍♀️🚴‍♂️😊🧡	\N	3	2023-11-09 17:20:27.510604	2023-11-09 17:20:27.521231	0	37	42	17.5
505	10	f	Skromna dyszka 😊😉👽	\N	6	2023-11-09 17:25:23.29728	2023-11-09 17:25:23.320271	0	49	44	30
507	9.02	t	Pobiegane	\N	5	2023-11-09 19:21:25.455771	2023-11-09 19:21:25.495968	0	57	55	36
508	9.03	t	🧡🧡🧡	\N	13	2023-11-09 19:24:26.397307	2023-11-09 19:24:26.407793	0	57	54	36
509	10	t	💙	\N	10	2023-11-09 19:28:48.699739	2023-11-09 19:28:48.793649	1	1	46	40
510	10.08	t	💚🍀💚	\N	9	2023-11-09 19:37:17.386272	2023-11-13 16:29:47.825215	1	5	31	40
511	10	t	Czwaetek	\N	7	2023-11-09 19:46:43.408518	2023-11-09 19:46:43.501616	1	6	54	40
512	10	t	Official !🍊	\N	1	2023-11-09 19:56:44.545201	2023-11-09 19:56:44.555457	1	2	15	40
513	9.06	t	✔️🏃‍♂️	\N	11	2023-11-09 21:16:46.096298	2023-11-09 21:16:46.107748	0	58	50	36
514	8.16	f	✔️🏃‍♂️	\N	11	2023-11-09 21:18:07.799795	2023-11-09 21:18:07.811181	0	47	45	16
515	5.01	f	💚	\N	2	2023-11-10 09:25:06.246315	2023-11-10 09:25:06.313961	0	31	9	7.5
516	14.1	f	💙💙💙	\N	12	2023-11-10 13:39:57.93899	2023-11-10 13:39:58.09344	1	18	9	28
517	10	t	Dla Niepodległej POZnań	\N	4	2023-11-11 12:45:47.846027	2023-11-11 12:45:47.857507	0	43	57	40
518	10.33	f	💚	\N	9	2023-11-11 15:43:43.742766	2023-11-11 15:43:43.777693	1	0	56	20
519	11.11	f	Fotka z Poznania, 2018😉	\N	6	2023-11-11 17:16:44.85543	2023-11-11 17:16:44.935417	0	56	5	27.5
520	2	f	💚	\N	2	2023-11-11 19:17:44.841276	2023-11-11 19:17:44.926386	0	13	0	2
521	2	f	🇵🇱 🏃‍♀️🏃‍♂️🏃‍♀️🏃‍♂️	\N	11	2023-11-11 19:36:03.15203	2023-11-11 19:36:03.227462	0	12	55	3
522	16.02	f	😎🏃‍♂️🏃‍♂️	\N	7	2023-11-12 10:07:44.995274	2023-11-12 10:07:45.00952	1	23	8	40
523	2.06	f	🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️	\N	5	2023-11-12 15:03:21.64415	2023-11-12 15:03:21.655225	0	14	23	2
524	2.03	f	✔️	\N	11	2023-11-12 17:18:27.427209	2023-11-12 17:18:27.50291	0	14	16	2
526	10	f	💙💙💙	\N	12	2023-11-12 18:14:38.597323	2023-11-12 18:14:38.696112	0	55	0	20
527	11	f	💙	\N	10	2023-11-12 18:21:44.748306	2023-11-12 18:21:44.812822	1	1	47	22
525	2	f	💚	\N	2	2023-11-12 17:19:16.90726	2023-11-12 18:23:21.022471	0	14	15	2
528	10	f	💙💪taka sobie skromna życióweczka przy niedzieli 😜✌️😁	\N	18	2023-11-12 20:06:43.801328	2023-11-12 20:06:43.89709	0	56	34	20
529	5.01	f	🧡🏃‍♀️+🏋	\N	3	2023-11-13 12:25:21.253023	2023-11-13 12:25:21.291986	0	24	15	15
530	9.09	f	💚🍀💚	\N	9	2023-11-13 13:23:05.896111	2023-11-13 13:23:05.978137	0	56	19	13.5
531	8	f	Trening indywidualny + drążki💪	\N	1	2023-11-13 19:00:59.713523	2023-11-13 19:00:59.723083	0	39	32	24
532	18	f	Jesień w pełni 🍁	\N	6	2023-11-14 12:36:59.121467	2023-11-14 12:36:59.200907	1	37	7	45
533	11.04	t	Wtorek	\N	7	2023-11-14 19:33:44.79265	2023-11-14 19:33:44.803691	1	11	56	44
534	13	f	Zaległy z 2IX 🍊 	\N	4	2023-11-14 19:35:16.392507	2023-11-14 19:35:16.404415	1	10	40	32.5
535	10.01	t	Pobiegane	\N	5	2023-11-14 19:40:04.117796	2023-11-14 19:40:04.125312	1	6	58	40
536	2.35	f	Małe kółko z Brunem w deszczu	\N	5	2023-11-14 19:42:06.766443	2023-11-14 19:42:06.784405	0	16	6	2
537	6	t	💚	\N	2	2023-11-14 19:48:19.70318	2023-11-14 19:48:19.711315	0	38	32	24
538	11	t	Pobiegane w deszczyku🍊	\N	1	2023-11-14 19:52:01.912894	2023-11-14 19:52:01.923541	1	10	32	44
539	9.21	t	💚🟢🍀	\N	9	2023-11-14 19:59:44.361008	2023-11-14 19:59:44.370204	0	58	52	36
540	12	t	Z deszczykiem z grupą na 🍊	\N	4	2023-11-14 20:00:05.369164	2023-11-14 20:00:05.377424	1	16	10	48
541	12	t	✔️🏃‍♂️	\N	11	2023-11-14 20:46:15.238466	2023-11-14 20:46:15.286401	1	16	24	48
542	17	f	Bieganie z kibicami 😉	\N	6	2023-11-15 14:53:14.659771	2023-11-15 14:53:14.703018	1	29	37	42.5
543	19	f	🍁🍁🍁🍁💚	\N	6	2023-11-16 16:55:46.573287	2023-11-16 16:55:46.583968	1	41	11	47.5
544	7.01	t	💚	\N	2	2023-11-16 18:56:54.484938	2023-11-16 18:56:54.577623	0	43	41	28
545	7	t	🌧	\N	10	2023-11-16 18:58:25.98104	2023-11-16 18:58:25.990893	0	43	31	28
546	11	t	🌧🩵	\N	10	2023-11-16 18:59:18.596956	2023-11-16 18:59:18.692956	1	9	38	44
547	8.15	t	💚🍀	\N	9	2023-11-16 20:11:20.539158	2023-11-16 20:11:20.552411	0	56	37	32
548	9.18	t	Bieganie w deszczu	\N	5	2023-11-16 20:26:44.131364	2023-11-16 20:26:44.142236	0	58	59	36
549	11	t	Wtorkowy 🌧️💙💪	\N	18	2023-11-16 20:37:10.439474	2023-11-16 20:37:10.45748	1	6	40	44
550	7	t	💙	\N	18	2023-11-16 20:38:45.706749	2023-11-16 20:38:45.739234	0	43	41	28
551	2.12	f	Bruno 🏃‍♀️	\N	5	2023-11-16 20:57:15.340551	2023-11-16 20:57:15.351138	0	12	28	4
552	7.01	t	🧡	\N	3	2023-11-17 07:57:45.085946	2023-11-17 07:57:45.097271	0	47	59	28
553	17	f	🍊	\N	4	2023-11-18 12:48:27.629908	2023-11-18 12:48:27.642794	1	33	10	42.5
554	12	f	💙💙💙	\N	12	2023-11-18 14:01:11.931466	2023-11-18 14:01:12.014785	1	7	40	24
555	8.09	f	Dzisiaj zdążyłem przed opadami😉💙💙💙	\N	12	2023-11-19 12:20:57.816641	2023-11-19 12:20:57.901571	0	45	52	16
556	16.02	f	Niedziela 🌨❄❄	\N	7	2023-11-19 13:45:33.68945	2023-11-19 13:45:33.777462	1	21	11	40
557	2.17	f	Błotko🏃‍♀️	\N	5	2023-11-19 17:02:38.495139	2023-11-19 17:02:38.502807	0	15	17	2
561	6.42	f	Kruszwica 	\N	14	2023-11-19 22:04:28.902301	2023-11-19 22:04:29.014721	0	37	44	12
558	11.08	f	🟢💚🟢	\N	9	2023-11-19 17:59:35.110778	2023-11-19 18:03:09.206505	1	22	46	11
559	5.26	f	Kruszwica 	\N	14	2023-11-19 21:56:19.326621	2023-11-19 21:56:19.402726	0	29	12	10
560	10.08	f	Kruszwica 	\N	14	2023-11-19 21:58:28.59634	2023-11-19 21:58:28.699302	1	0	44	15
562	11	f	💚👽	\N	6	2023-11-20 15:32:18.598744	2023-11-20 15:32:18.69667	0	54	42	33
563	7	f	Milutko dziś było :) 	\N	23	2023-11-20 17:54:59.109084	2023-11-20 17:54:59.199285	0	44	53	10.5
564	8.02	f	💚🍀💚	\N	9	2023-11-21 11:54:36.845966	2023-11-21 11:54:36.859382	0	55	41	8
565	15	f	👽👽🍁	\N	6	2023-11-21 12:27:24.725497	2023-11-21 12:27:24.737139	1	18	48	37.5
566	10	t	Super trening. Zimno	\N	17	2023-11-21 19:31:43.319747	2023-11-21 19:31:43.40786	1	4	15	40
567	11.14	t	🏃‍♀️✔️	\N	11	2023-11-21 19:39:28.602463	2023-11-21 19:39:28.698344	1	11	33	44
568	10.35	t	Pierwszy mrozik😊	\N	5	2023-11-21 19:40:04.397438	2023-11-21 19:40:04.436073	1	8	0	40
569	9.13	t	Wtorek	\N	7	2023-11-21 19:46:23.880458	2023-11-21 19:46:23.916026	0	59	13	36
571	10	t	💙	\N	10	2023-11-21 19:54:52.036642	2023-11-21 19:54:52.099756	1	3	53	40
570	10.01	t	💚	\N	2	2023-11-21 19:47:29.897074	2023-11-21 19:47:51.904664	1	4	56	40
572	10.1	t	🧡	\N	13	2023-11-21 19:55:59.199906	2023-11-21 19:55:59.301217	1	6	0	40
573	11.03	t	💙💙💙	\N	12	2023-11-21 20:07:07.258282	2023-11-21 20:07:07.319892	1	12	3	44
574	10	t	🍊	\N	1	2023-11-21 20:12:00.619938	2023-11-21 20:12:00.627928	1	4	51	40
575	3	f	Egzamin na złotą odznakę sprawności fizycznej 💪💪😁	\N	7	2023-11-22 08:48:50.423652	2023-11-22 08:48:50.512159	0	13	14	9
576	20	f	🍁👽	\N	6	2023-11-22 15:49:14.812223	2023-11-22 15:49:14.824542	1	55	50	40
577	10	t	Wtorek 💙	\N	18	2023-11-22 21:00:39.299628	2023-11-22 21:00:39.31033	1	4	15	40
578	12	f	Lecimy z tym koksem 👽👽	\N	6	2023-11-23 14:29:18.198472	2023-11-23 14:29:18.296157	0	58	40	36
579	3.01	f	🟢🟢	\N	9	2023-11-23 16:32:16.000942	2023-11-23 16:32:16.091445	0	22	31	3
580	3.12	f	💚🟢💚	\N	9	2023-11-24 14:23:47.833962	2023-11-24 14:23:48.005468	0	18	11	6
581	11	f	Małe rozbieganie po dzisiejszych wojażach	\N	6	2023-11-24 17:36:54.204741	2023-11-24 17:36:54.293542	0	59	32	27.5
582	12.36	f	⚡🏃‍♀️⚡	\N	11	2023-11-25 15:47:49.352648	2023-11-25 15:47:49.361205	1	11	2	24
583	10.48	f	Kruszwica 	\N	14	2023-11-25 16:07:01.264771	2023-11-25 16:07:01.296511	0	58	27	20
584	10.47	f	Kruszwica 	\N	14	2023-11-25 16:08:34.576577	2023-11-25 16:08:34.585473	1	2	58	15
585	10.5	f	Kruszwica 	\N	14	2023-11-25 16:09:50.468791	2023-11-25 16:09:50.552885	1	8	8	15
586	6.06	f	Kruszwica 	\N	14	2023-11-25 16:11:14.658188	2023-11-25 16:11:14.667122	0	39	47	6
587	10.09	f	💚🍀💚	\N	9	2023-11-25 16:32:39.519911	2023-11-25 16:32:39.529074	0	58	46	20
588	10.56	f	Mrągowo🏃‍♂️🏃‍♂️	\N	7	2023-11-27 21:01:18.096419	2023-11-27 21:01:18.201001	1	3	38	15
589	7.07	f	💚🟢💚	\N	9	2023-11-28 15:59:03.253477	2023-11-28 15:59:03.262677	0	48	50	7
590	9	f	Pobiegane 	\N	5	2023-11-28 19:14:05.972661	2023-11-28 19:14:05.982683	0	58	17	13.5
591	10.14	f	♨️	\N	11	2023-11-28 19:39:37.676072	2023-11-28 19:39:37.694208	0	55	37	25
592	10	f	To tyle z mojej strony 😉👽	\N	6	2023-11-29 10:49:09.810862	2023-11-29 10:49:09.823225	0	49	29	30
593	4.45	f	💚💚	\N	9	2023-11-29 16:34:01.287097	2023-11-29 16:34:01.377914	0	26	42	6
594	10.04	t	🔥	\N	11	2023-11-30 19:41:34.527679	2023-11-30 19:41:34.628551	1	3	12	40
595	8.04	t	Bieganko	\N	5	2023-11-30 19:46:11.20539	2023-11-30 19:46:11.219048	0	53	31	32
596	2.15	f	Przebieżka z Brunem	\N	5	2023-11-30 19:48:28.988903	2023-11-30 19:48:28.999963	0	12	22	4
597	10.08	t	KONIN  🔥 XXXII Bieg o lampkę górniczą	\N	11	2023-12-05 14:45:30.308981	2023-12-05 14:45:30.322519	0	55	3	40
598	5.04	t	Przebieżka z Brunem	\N	5	2023-12-05 18:44:49.827113	2023-12-05 18:44:49.837081	0	33	32	20
599	14	f	niedzielne wybieganko po śniegu ❄️	\N	1	2023-12-05 20:34:17.724923	2023-12-05 20:34:17.730799	1	15	51	35
600	5.46	f	Kruszwica 	\N	14	2023-12-09 16:07:02.313049	2023-12-09 16:07:02.326586	0	30	53	10
601	10.53	f	Kruszwica 	\N	14	2023-12-09 16:25:31.018362	2023-12-09 16:25:31.025259	1	7	14	15
602	10.5	f	Kruszwica 	\N	14	2023-12-09 16:29:26.218783	2023-12-09 16:29:26.225253	1	9	44	10
603	10.48	f	Kruszwica 	\N	14	2023-12-09 16:31:54.126772	2023-12-09 16:31:54.218489	1	8	18	10
604	10.39	f	Kruszwica 	\N	14	2023-12-09 16:33:52.225586	2023-12-09 16:33:52.313834	1	7	8	15
605	5.35	f	Kruszwica 	\N	14	2023-12-09 16:36:35.030979	2023-12-09 16:36:35.035225	0	34	57	5
609	10.03	f	🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️	\N	5	2023-12-12 19:46:03.816266	2023-12-12 19:46:03.822287	1	11	57	10
606	6.33	f	Kruszwica 	\N	14	2023-12-09 16:38:57.657238	2023-12-09 16:39:23.294502	0	36	39	12
607	10.54	f	Kruszwica 	\N	14	2023-12-09 16:48:02.54289	2023-12-09 16:48:02.547179	1	7	11	15
608	5	f	Nocne bieganko z Brunem 🏃‍♀️	\N	5	2023-12-11 21:31:15.420952	2023-12-11 21:31:15.506772	0	32	56	5
610	7.05	f	🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️	\N	5	2023-12-14 19:06:27.776079	2023-12-14 19:06:27.864321	0	44	28	10.5
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."ar_internal_metadata" ("key", "value", "created_at", "updated_at") FROM stdin;
environment	production	2023-06-02 13:17:29.158757	2023-06-02 13:17:29.158757
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."comments" ("id", "user_id", "activity_id", "content", "created_at", "updated_at") FROM stdin;
1	1	9	... foto takie niedzisiejsze ;)	2023-07-02 19:56:31.797463	2023-07-02 19:56:31.797463
2	1	18	diabelski dystans	2023-07-03 19:50:02.857268	2023-07-03 19:50:02.857268
3	11	14	Spoko tempo 💪	2023-07-07 11:32:36.155576	2023-07-07 11:32:36.155576
4	1	27	co to za wizje na zdjęciu ? 	2023-07-07 13:19:23.565955	2023-07-07 13:19:23.565955
5	11	27	screen'y z gier 😄	2023-07-08 08:00:01.969809	2023-07-08 08:00:01.969809
6	1	32	🔥	2023-07-09 16:04:25.228063	2023-07-09 16:04:25.228063
7	1	116	pierwsze konkursowe punkty💪	2023-09-01 13:03:13.278598	2023-09-01 13:03:13.278598
8	10	133	Pozdrawiamy 	2023-09-03 18:29:34.150254	2023-09-03 18:29:34.150254
9	2	142	😂	2023-09-05 07:21:01.590419	2023-09-05 07:21:01.590419
10	19	165	👍😉👍	2023-09-08 18:56:18.813581	2023-09-08 18:56:18.813581
11	1	190	piękny kruszwicki wodospad😁	2023-09-12 19:40:44.998326	2023-09-12 19:40:44.998326
12	11	197	Super ⚡	2023-09-16 13:08:38.407818	2023-09-16 13:08:38.407818
13	11	196	Najs 🔥	2023-09-16 13:09:04.710152	2023-09-16 13:09:04.710152
14	11	201	Extra 🔥	2023-09-16 13:09:45.85287	2023-09-16 13:09:45.85287
15	1	278	Wow! Szacun 💪💪	2023-10-01 12:30:21.889051	2023-10-01 12:30:21.889051
16	12	278	Rewelacja 	2023-10-02 09:27:53.329591	2023-10-02 09:27:53.329591
17	5	328	Bożenka 10 km za mało podałaś	2023-10-11 15:58:52.285472	2023-10-11 15:58:52.285472
18	5	328	A nie to jest w innej punktacji😊	2023-10-11 16:01:06.713928	2023-10-11 16:01:06.713928
19	9	332	💪💪	2023-10-12 05:53:09.201284	2023-10-12 05:53:09.201284
20	9	331	👍💪👏	2023-10-12 05:53:29.815879	2023-10-12 05:53:29.815879
21	11	377	Oj dżaga z Ciebie ♥️	2023-10-21 20:25:01.920069	2023-10-21 20:25:01.920069
22	1	386	Wow ale czas!!	2023-10-22 11:54:06.243875	2023-10-22 11:54:06.243875
23	23	483	Pięknie wyglądasz laska! 	2023-11-06 18:52:25.551448	2023-11-06 18:52:25.551448
24	1	502	Tęskniliśmy 🍊🍊🍊	2023-11-08 21:19:57.014966	2023-11-08 21:19:57.014966
25	6	514	To wygląda jakbyś u mnie był 😉	2023-11-10 09:08:58.703501	2023-11-10 09:08:58.703501
26	9	532	👏🟢👏	2023-11-14 19:40:59.009069	2023-11-14 19:40:59.009069
27	6	532	A dziękuję 😉	2023-11-15 14:54:22.568674	2023-11-15 14:54:22.568674
28	9	542	💪	2023-11-16 10:05:40.248709	2023-11-16 10:05:40.248709
29	3	552	Sorki Gośka że uciełam Ci głowę	2023-11-17 07:58:49.40217	2023-11-17 07:58:49.40217
30	5	579	Ale masz ładną zimę,a u nas wieje 😁Pozdrawiam😘	2023-11-23 17:11:25.882642	2023-11-23 17:11:25.882642
31	11	590	Bravo 🔥	2023-11-28 19:32:22.662212	2023-11-28 19:32:22.662212
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."likes" ("id", "user_id", "activity_id", "created_at", "updated_at") FROM stdin;
7	4	8	2023-07-02 19:49:37.399535	2023-07-02 19:49:37.399535
8	1	9	2023-07-02 19:55:58.658696	2023-07-02 19:55:58.658696
9	1	10	2023-07-02 19:56:46.409893	2023-07-02 19:56:46.409893
10	3	10	2023-07-02 20:21:13.50639	2023-07-02 20:21:13.50639
11	3	9	2023-07-02 20:21:19.220838	2023-07-02 20:21:19.220838
12	3	8	2023-07-02 20:21:22.906128	2023-07-02 20:21:22.906128
13	1	11	2023-07-02 20:33:48.954918	2023-07-02 20:33:48.954918
14	1	12	2023-07-02 20:33:52.476186	2023-07-02 20:33:52.476186
15	1	13	2023-07-02 20:34:04.111975	2023-07-02 20:34:04.111975
16	2	13	2023-07-03 04:20:48.854784	2023-07-03 04:20:48.854784
17	2	12	2023-07-03 04:20:51.853277	2023-07-03 04:20:51.853277
18	2	11	2023-07-03 04:20:54.696277	2023-07-03 04:20:54.696277
19	2	10	2023-07-03 04:20:57.763644	2023-07-03 04:20:57.763644
20	2	9	2023-07-03 04:21:01.247056	2023-07-03 04:21:01.247056
21	2	8	2023-07-03 04:21:05.117682	2023-07-03 04:21:05.117682
22	1	14	2023-07-03 16:19:13.286022	2023-07-03 16:19:13.286022
23	2	14	2023-07-03 17:42:36.52157	2023-07-03 17:42:36.52157
24	2	17	2023-07-03 18:47:42.807946	2023-07-03 18:47:42.807946
25	2	16	2023-07-03 18:47:51.102974	2023-07-03 18:47:51.102974
26	1	15	2023-07-03 19:12:02.036562	2023-07-03 19:12:02.036562
27	1	16	2023-07-03 19:12:05.723631	2023-07-03 19:12:05.723631
28	1	17	2023-07-03 19:12:09.038861	2023-07-03 19:12:09.038861
29	1	18	2023-07-03 19:12:12.059195	2023-07-03 19:12:12.059195
30	1	20	2023-07-03 19:12:15.911927	2023-07-03 19:12:15.911927
32	3	20	2023-07-03 20:36:12.855949	2023-07-03 20:36:12.855949
33	3	18	2023-07-03 20:36:17.115795	2023-07-03 20:36:17.115795
34	3	17	2023-07-03 20:36:33.247805	2023-07-03 20:36:33.247805
35	3	16	2023-07-03 20:36:39.189487	2023-07-03 20:36:39.189487
36	3	15	2023-07-03 20:37:02.435765	2023-07-03 20:37:02.435765
37	3	14	2023-07-03 20:37:04.833151	2023-07-03 20:37:04.833151
38	3	13	2023-07-03 20:37:11.452323	2023-07-03 20:37:11.452323
39	3	12	2023-07-03 20:37:13.551441	2023-07-03 20:37:13.551441
40	3	11	2023-07-03 20:37:19.168015	2023-07-03 20:37:19.168015
41	1	21	2023-07-03 20:39:56.410748	2023-07-03 20:39:56.410748
42	1	22	2023-07-04 08:51:52.094461	2023-07-04 08:51:52.094461
43	2	23	2023-07-05 18:48:33.84382	2023-07-05 18:48:33.84382
44	2	22	2023-07-06 04:46:08.193722	2023-07-06 04:46:08.193722
45	2	21	2023-07-06 04:46:10.652019	2023-07-06 04:46:10.652019
46	2	20	2023-07-06 04:46:13.75838	2023-07-06 04:46:13.75838
47	2	18	2023-07-06 04:46:18.242712	2023-07-06 04:46:18.242712
48	1	24	2023-07-06 19:29:16.109806	2023-07-06 19:29:16.109806
49	11	24	2023-07-07 11:31:26.453204	2023-07-07 11:31:26.453204
50	11	23	2023-07-07 11:31:29.728281	2023-07-07 11:31:29.728281
51	11	22	2023-07-07 11:31:31.593852	2023-07-07 11:31:31.593852
52	11	21	2023-07-07 11:31:37.529287	2023-07-07 11:31:37.529287
53	11	20	2023-07-07 11:31:43.60945	2023-07-07 11:31:43.60945
55	11	18	2023-07-07 11:31:48.724092	2023-07-07 11:31:48.724092
56	11	17	2023-07-07 11:31:53.021768	2023-07-07 11:31:53.021768
57	11	16	2023-07-07 11:31:56.227581	2023-07-07 11:31:56.227581
58	11	15	2023-07-07 11:32:00.895965	2023-07-07 11:32:00.895965
59	11	14	2023-07-07 11:32:04.696971	2023-07-07 11:32:04.696971
60	11	25	2023-07-07 12:08:02.928101	2023-07-07 12:08:02.928101
61	1	27	2023-07-07 13:18:52.400116	2023-07-07 13:18:52.400116
62	1	26	2023-07-07 13:18:55.117384	2023-07-07 13:18:55.117384
63	1	25	2023-07-07 13:18:58.805911	2023-07-07 13:18:58.805911
64	2	26	2023-07-07 18:47:31.223411	2023-07-07 18:47:31.223411
65	2	27	2023-07-07 18:47:34.77384	2023-07-07 18:47:34.77384
66	2	29	2023-07-08 16:21:07.743283	2023-07-08 16:21:07.743283
67	1	29	2023-07-08 17:06:34.740425	2023-07-08 17:06:34.740425
68	1	28	2023-07-08 17:06:42.333592	2023-07-08 17:06:42.333592
70	4	29	2023-07-08 17:57:33.15991	2023-07-08 17:57:33.15991
71	4	27	2023-07-08 17:57:39.434543	2023-07-08 17:57:39.434543
72	4	26	2023-07-08 17:57:42.944442	2023-07-08 17:57:42.944442
73	4	25	2023-07-08 17:57:46.916181	2023-07-08 17:57:46.916181
74	4	24	2023-07-08 17:57:51.113001	2023-07-08 17:57:51.113001
75	4	23	2023-07-08 17:57:55.236079	2023-07-08 17:57:55.236079
76	4	22	2023-07-08 17:57:58.592096	2023-07-08 17:57:58.592096
77	4	21	2023-07-08 17:58:01.996934	2023-07-08 17:58:01.996934
78	4	20	2023-07-08 17:58:05.296677	2023-07-08 17:58:05.296677
79	1	31	2023-07-09 08:20:45.8184	2023-07-09 08:20:45.8184
81	3	30	2023-07-09 08:26:28.138579	2023-07-09 08:26:28.138579
82	3	29	2023-07-09 08:26:31.305508	2023-07-09 08:26:31.305508
83	3	28	2023-07-09 08:26:37.162266	2023-07-09 08:26:37.162266
84	3	27	2023-07-09 08:26:40.258658	2023-07-09 08:26:40.258658
85	3	26	2023-07-09 08:26:42.959785	2023-07-09 08:26:42.959785
86	3	25	2023-07-09 08:26:45.51715	2023-07-09 08:26:45.51715
87	3	24	2023-07-09 08:26:47.569042	2023-07-09 08:26:47.569042
88	3	23	2023-07-09 08:26:49.184725	2023-07-09 08:26:49.184725
89	3	22	2023-07-09 08:26:51.17375	2023-07-09 08:26:51.17375
90	3	31	2023-07-09 08:27:12.282664	2023-07-09 08:27:12.282664
91	1	33	2023-07-09 16:03:49.426214	2023-07-09 16:03:49.426214
92	1	32	2023-07-09 16:03:55.529043	2023-07-09 16:03:55.529043
93	2	33	2023-07-10 11:53:00.46447	2023-07-10 11:53:00.46447
94	2	32	2023-07-10 11:53:03.834607	2023-07-10 11:53:03.834607
95	2	31	2023-07-10 11:53:19.432119	2023-07-10 11:53:19.432119
96	2	30	2023-07-10 11:53:24.447609	2023-07-10 11:53:24.447609
97	2	28	2023-07-10 11:53:31.623785	2023-07-10 11:53:31.623785
98	4	33	2023-07-10 17:29:27.0232	2023-07-10 17:29:27.0232
99	4	32	2023-07-10 17:29:32.646705	2023-07-10 17:29:32.646705
100	4	31	2023-07-10 17:29:38.830459	2023-07-10 17:29:38.830459
101	4	30	2023-07-10 17:29:43.105101	2023-07-10 17:29:43.105101
102	1	34	2023-07-10 19:49:52.75025	2023-07-10 19:49:52.75025
103	4	35	2023-07-11 05:00:39.036986	2023-07-11 05:00:39.036986
104	2	34	2023-07-11 11:07:11.739058	2023-07-11 11:07:11.739058
106	1	35	2023-07-11 20:13:13.275437	2023-07-11 20:13:13.275437
107	1	36	2023-07-11 20:13:16.340711	2023-07-11 20:13:16.340711
108	2	38	2023-07-12 12:43:04.064033	2023-07-12 12:43:04.064033
109	2	37	2023-07-12 12:43:07.465435	2023-07-12 12:43:07.465435
110	2	36	2023-07-12 12:43:16.031539	2023-07-12 12:43:16.031539
111	4	38	2023-07-12 17:53:15.941577	2023-07-12 17:53:15.941577
112	4	37	2023-07-12 17:53:25.327414	2023-07-12 17:53:25.327414
113	1	40	2023-07-12 18:32:19.767748	2023-07-12 18:32:19.767748
114	1	39	2023-07-12 18:32:25.732046	2023-07-12 18:32:25.732046
115	1	38	2023-07-12 18:32:32.40608	2023-07-12 18:32:32.40608
116	1	37	2023-07-12 18:32:42.993832	2023-07-12 18:32:42.993832
118	4	40	2023-07-12 18:47:57.924567	2023-07-12 18:47:57.924567
119	2	39	2023-07-13 00:32:53.998039	2023-07-13 00:32:53.998039
120	2	40	2023-07-13 00:33:11.085332	2023-07-13 00:33:11.085332
121	4	41	2023-07-13 04:33:42.74801	2023-07-13 04:33:42.74801
122	1	41	2023-07-13 04:40:02.057885	2023-07-13 04:40:02.057885
123	1	42	2023-07-14 06:49:23.800764	2023-07-14 06:49:23.800764
124	4	42	2023-07-14 17:23:24.537257	2023-07-14 17:23:24.537257
125	4	47	2023-07-15 12:16:36.409706	2023-07-15 12:16:36.409706
127	4	46	2023-07-15 12:17:28.700412	2023-07-15 12:17:28.700412
128	4	45	2023-07-15 12:17:50.304761	2023-07-15 12:17:50.304761
129	4	44	2023-07-15 12:17:55.02518	2023-07-15 12:17:55.02518
130	1	47	2023-07-15 18:34:46.811935	2023-07-15 18:34:46.811935
131	1	46	2023-07-15 18:34:56.685286	2023-07-15 18:34:56.685286
132	1	45	2023-07-15 18:34:59.446726	2023-07-15 18:34:59.446726
133	1	44	2023-07-15 18:35:02.065698	2023-07-15 18:35:02.065698
134	4	49	2023-07-17 12:53:53.54198	2023-07-17 12:53:53.54198
135	1	49	2023-07-17 16:10:05.154964	2023-07-17 16:10:05.154964
136	1	48	2023-07-17 16:10:14.957253	2023-07-17 16:10:14.957253
137	2	50	2023-07-17 20:51:03.002249	2023-07-17 20:51:03.002249
138	2	49	2023-07-17 20:51:08.385057	2023-07-17 20:51:08.385057
139	2	48	2023-07-17 20:51:56.045277	2023-07-17 20:51:56.045277
140	2	47	2023-07-17 20:52:04.021275	2023-07-17 20:52:04.021275
141	2	46	2023-07-17 20:52:15.535035	2023-07-17 20:52:15.535035
142	2	45	2023-07-17 20:52:25.213777	2023-07-17 20:52:25.213777
143	2	44	2023-07-17 20:52:33.204417	2023-07-17 20:52:33.204417
144	2	43	2023-07-17 20:52:41.406394	2023-07-17 20:52:41.406394
145	2	42	2023-07-17 20:52:44.997395	2023-07-17 20:52:44.997395
146	4	50	2023-07-18 05:47:18.238328	2023-07-18 05:47:18.238328
147	4	53	2023-07-20 05:04:45.692771	2023-07-20 05:04:45.692771
148	4	54	2023-07-20 05:04:50.781821	2023-07-20 05:04:50.781821
149	2	54	2023-07-20 10:02:46.719296	2023-07-20 10:02:46.719296
150	2	53	2023-07-20 10:02:58.350976	2023-07-20 10:02:58.350976
151	2	52	2023-07-20 10:03:07.385248	2023-07-20 10:03:07.385248
152	2	51	2023-07-20 10:03:13.538373	2023-07-20 10:03:13.538373
154	9	54	2023-07-22 12:58:52.448907	2023-07-22 12:58:52.448907
155	9	55	2023-07-22 12:58:54.670706	2023-07-22 12:58:54.670706
156	1	61	2023-07-25 07:47:41.296977	2023-07-25 07:47:41.296977
157	1	60	2023-07-25 07:47:44.056842	2023-07-25 07:47:44.056842
158	1	59	2023-07-25 07:47:48.586909	2023-07-25 07:47:48.586909
159	1	58	2023-07-25 07:47:50.639192	2023-07-25 07:47:50.639192
160	1	57	2023-07-25 07:47:52.90843	2023-07-25 07:47:52.90843
161	1	56	2023-07-25 07:48:16.533079	2023-07-25 07:48:16.533079
162	1	55	2023-07-25 07:48:18.882263	2023-07-25 07:48:18.882263
163	1	54	2023-07-25 07:48:21.058132	2023-07-25 07:48:21.058132
164	1	53	2023-07-25 07:48:24.039893	2023-07-25 07:48:24.039893
165	1	52	2023-07-25 07:48:26.611554	2023-07-25 07:48:26.611554
166	1	65	2023-07-26 06:32:35.149355	2023-07-26 06:32:35.149355
167	1	64	2023-07-26 06:32:40.902465	2023-07-26 06:32:40.902465
168	1	63	2023-07-26 06:32:47.42848	2023-07-26 06:32:47.42848
169	1	62	2023-07-26 06:32:53.96731	2023-07-26 06:32:53.96731
170	2	66	2023-07-26 19:42:07.819789	2023-07-26 19:42:07.819789
171	2	65	2023-07-26 19:42:11.300638	2023-07-26 19:42:11.300638
172	2	64	2023-07-26 19:42:17.531232	2023-07-26 19:42:17.531232
173	2	63	2023-07-26 19:42:28.928816	2023-07-26 19:42:28.928816
174	2	61	2023-07-26 19:42:40.384825	2023-07-26 19:42:40.384825
175	2	60	2023-07-26 19:42:42.987399	2023-07-26 19:42:42.987399
176	2	59	2023-07-26 19:42:45.721205	2023-07-26 19:42:45.721205
177	2	58	2023-07-26 19:42:48.548494	2023-07-26 19:42:48.548494
178	2	57	2023-07-26 19:42:51.086067	2023-07-26 19:42:51.086067
179	11	66	2023-07-27 06:40:23.344512	2023-07-27 06:40:23.344512
180	11	65	2023-07-27 06:40:26.010132	2023-07-27 06:40:26.010132
181	11	64	2023-07-27 06:40:34.053084	2023-07-27 06:40:34.053084
182	11	63	2023-07-27 06:40:38.55156	2023-07-27 06:40:38.55156
183	11	62	2023-07-27 06:40:41.052822	2023-07-27 06:40:41.052822
184	11	61	2023-07-27 06:40:43.613841	2023-07-27 06:40:43.613841
185	11	60	2023-07-27 06:40:46.52151	2023-07-27 06:40:46.52151
186	11	59	2023-07-27 06:40:53.872858	2023-07-27 06:40:53.872858
187	11	58	2023-07-27 06:41:04.092022	2023-07-27 06:41:04.092022
188	1	67	2023-07-27 19:26:17.027318	2023-07-27 19:26:17.027318
189	1	74	2023-07-30 20:25:33.859306	2023-07-30 20:25:33.859306
190	1	73	2023-07-30 20:25:49.450012	2023-07-30 20:25:49.450012
191	1	72	2023-07-30 20:25:55.815261	2023-07-30 20:25:55.815261
192	1	68	2023-07-30 20:26:12.203269	2023-07-30 20:26:12.203269
193	1	69	2023-07-30 20:26:17.118107	2023-07-30 20:26:17.118107
194	1	70	2023-07-30 20:26:24.39572	2023-07-30 20:26:24.39572
195	1	71	2023-07-30 20:26:44.026184	2023-07-30 20:26:44.026184
196	1	76	2023-08-01 04:51:47.12352	2023-08-01 04:51:47.12352
197	1	75	2023-08-01 04:51:58.71512	2023-08-01 04:51:58.71512
198	2	79	2023-08-04 18:44:16.975555	2023-08-04 18:44:16.975555
199	2	78	2023-08-04 18:44:19.809794	2023-08-04 18:44:19.809794
200	2	77	2023-08-04 18:44:22.704629	2023-08-04 18:44:22.704629
201	2	76	2023-08-04 18:44:26.584103	2023-08-04 18:44:26.584103
202	2	75	2023-08-04 18:44:35.571611	2023-08-04 18:44:35.571611
204	2	74	2023-08-04 18:44:42.663201	2023-08-04 18:44:42.663201
205	2	73	2023-08-04 18:44:46.244601	2023-08-04 18:44:46.244601
206	2	72	2023-08-04 18:44:55.021914	2023-08-04 18:44:55.021914
208	2	71	2023-08-04 18:45:04.113166	2023-08-04 18:45:04.113166
209	1	82	2023-08-06 09:47:22.130605	2023-08-06 09:47:22.130605
210	1	81	2023-08-06 09:47:31.149468	2023-08-06 09:47:31.149468
211	1	80	2023-08-06 09:47:39.170928	2023-08-06 09:47:39.170928
212	1	79	2023-08-06 09:47:47.613866	2023-08-06 09:47:47.613866
213	1	78	2023-08-06 09:47:53.822886	2023-08-06 09:47:53.822886
214	3	84	2023-08-06 19:42:55.010845	2023-08-06 19:42:55.010845
215	3	83	2023-08-06 19:43:00.202591	2023-08-06 19:43:00.202591
216	3	82	2023-08-06 19:43:10.090663	2023-08-06 19:43:10.090663
217	3	81	2023-08-06 19:43:14.777715	2023-08-06 19:43:14.777715
218	3	80	2023-08-06 19:43:17.673132	2023-08-06 19:43:17.673132
219	3	79	2023-08-06 19:43:23.61155	2023-08-06 19:43:23.61155
220	3	78	2023-08-06 19:43:26.501958	2023-08-06 19:43:26.501958
221	3	77	2023-08-06 19:43:30.000356	2023-08-06 19:43:30.000356
222	1	85	2023-08-10 07:43:40.577733	2023-08-10 07:43:40.577733
223	1	86	2023-08-10 07:43:42.989156	2023-08-10 07:43:42.989156
224	1	94	2023-08-16 10:27:05.56292	2023-08-16 10:27:05.56292
225	1	93	2023-08-16 10:27:07.956247	2023-08-16 10:27:07.956247
226	1	92	2023-08-16 10:27:10.71276	2023-08-16 10:27:10.71276
227	1	91	2023-08-16 10:27:13.891579	2023-08-16 10:27:13.891579
228	1	90	2023-08-16 10:27:17.157953	2023-08-16 10:27:17.157953
229	1	89	2023-08-16 10:27:20.658964	2023-08-16 10:27:20.658964
230	1	88	2023-08-16 10:27:24.15094	2023-08-16 10:27:24.15094
231	1	87	2023-08-16 10:27:28.144032	2023-08-16 10:27:28.144032
232	1	96	2023-08-17 11:26:39.677093	2023-08-17 11:26:39.677093
233	1	97	2023-08-18 21:16:06.52224	2023-08-18 21:16:06.52224
234	1	98	2023-08-22 06:03:00.514023	2023-08-22 06:03:00.514023
235	1	105	2023-08-27 18:20:38.477042	2023-08-27 18:20:38.477042
236	1	104	2023-08-27 18:20:41.518264	2023-08-27 18:20:41.518264
237	1	103	2023-08-27 18:20:46.345505	2023-08-27 18:20:46.345505
238	1	102	2023-08-27 18:20:50.155917	2023-08-27 18:20:50.155917
239	1	101	2023-08-27 18:20:52.230544	2023-08-27 18:20:52.230544
240	1	100	2023-08-27 18:20:54.887906	2023-08-27 18:20:54.887906
241	1	99	2023-08-27 18:20:57.479898	2023-08-27 18:20:57.479898
242	5	105	2023-08-28 20:05:23.709127	2023-08-28 20:05:23.709127
243	5	104	2023-08-28 20:05:24.814819	2023-08-28 20:05:24.814819
244	5	103	2023-08-28 20:08:34.331506	2023-08-28 20:08:34.331506
245	5	102	2023-08-28 20:08:46.30498	2023-08-28 20:08:46.30498
246	5	97	2023-08-28 20:09:52.914865	2023-08-28 20:09:52.914865
247	5	98	2023-08-28 20:10:11.709345	2023-08-28 20:10:11.709345
248	5	99	2023-08-28 20:10:27.161771	2023-08-28 20:10:27.161771
249	5	100	2023-08-28 20:10:32.330777	2023-08-28 20:10:32.330777
250	5	101	2023-08-28 20:10:37.220558	2023-08-28 20:10:37.220558
251	1	110	2023-08-29 13:30:01.365512	2023-08-29 13:30:01.365512
252	1	109	2023-08-29 13:30:05.440614	2023-08-29 13:30:05.440614
253	1	108	2023-08-29 13:30:17.161415	2023-08-29 13:30:17.161415
254	1	107	2023-08-29 13:30:26.166675	2023-08-29 13:30:26.166675
255	1	111	2023-08-29 19:28:21.68594	2023-08-29 19:28:21.68594
256	11	111	2023-08-30 13:36:10.975108	2023-08-30 13:36:10.975108
257	1	112	2023-08-31 06:44:29.708167	2023-08-31 06:44:29.708167
258	1	114	2023-08-31 18:33:25.660154	2023-08-31 18:33:25.660154
259	1	113	2023-08-31 18:33:37.506316	2023-08-31 18:33:37.506316
260	1	115	2023-09-01 08:29:13.098966	2023-09-01 08:29:13.098966
261	4	115	2023-09-01 12:25:19.352392	2023-09-01 12:25:19.352392
262	4	114	2023-09-01 12:25:34.044818	2023-09-01 12:25:34.044818
263	11	116	2023-09-01 13:37:15.909542	2023-09-01 13:37:15.909542
264	11	112	2023-09-01 13:37:56.082919	2023-09-01 13:37:56.082919
265	1	116	2023-09-01 13:56:23.082392	2023-09-01 13:56:23.082392
266	1	117	2023-09-01 15:51:23.796213	2023-09-01 15:51:23.796213
267	1	118	2023-09-01 16:25:38.869967	2023-09-01 16:25:38.869967
268	1	120	2023-09-02 17:09:46.852863	2023-09-02 17:09:46.852863
269	11	120	2023-09-02 17:45:25.177923	2023-09-02 17:45:25.177923
270	11	119	2023-09-02 17:45:29.303755	2023-09-02 17:45:29.303755
271	2	122	2023-09-02 17:51:47.654635	2023-09-02 17:51:47.654635
272	2	121	2023-09-02 17:51:51.657222	2023-09-02 17:51:51.657222
273	2	120	2023-09-02 17:51:59.110112	2023-09-02 17:51:59.110112
274	2	119	2023-09-02 17:52:04.930338	2023-09-02 17:52:04.930338
275	2	118	2023-09-02 17:52:14.790398	2023-09-02 17:52:14.790398
276	2	117	2023-09-02 17:52:21.499209	2023-09-02 17:52:21.499209
277	2	116	2023-09-02 17:52:26.159021	2023-09-02 17:52:26.159021
278	2	115	2023-09-02 17:52:35.413764	2023-09-02 17:52:35.413764
279	11	123	2023-09-02 18:12:17.261669	2023-09-02 18:12:17.261669
280	2	124	2023-09-02 19:25:26.076463	2023-09-02 19:25:26.076463
281	1	124	2023-09-02 19:45:17.445819	2023-09-02 19:45:17.445819
282	1	123	2023-09-02 19:45:22.898977	2023-09-02 19:45:22.898977
283	1	122	2023-09-02 19:45:37.696078	2023-09-02 19:45:37.696078
284	1	121	2023-09-02 19:45:40.898205	2023-09-02 19:45:40.898205
285	1	126	2023-09-02 20:43:56.368965	2023-09-02 20:43:56.368965
286	1	125	2023-09-02 20:43:59.967515	2023-09-02 20:43:59.967515
287	1	127	2023-09-02 20:45:11.852839	2023-09-02 20:45:11.852839
288	1	130	2023-09-02 20:55:39.65845	2023-09-02 20:55:39.65845
289	1	129	2023-09-02 20:55:53.893722	2023-09-02 20:55:53.893722
290	1	128	2023-09-02 20:55:57.917013	2023-09-02 20:55:57.917013
291	2	125	2023-09-03 06:33:34.390945	2023-09-03 06:33:34.390945
292	2	126	2023-09-03 06:33:36.940686	2023-09-03 06:33:36.940686
293	2	127	2023-09-03 06:33:39.576642	2023-09-03 06:33:39.576642
294	2	128	2023-09-03 06:33:43.457459	2023-09-03 06:33:43.457459
295	2	129	2023-09-03 06:33:57.862812	2023-09-03 06:33:57.862812
296	2	130	2023-09-03 06:34:01.501051	2023-09-03 06:34:01.501051
297	2	131	2023-09-03 06:34:04.531053	2023-09-03 06:34:04.531053
298	1	132	2023-09-03 07:27:47.705397	2023-09-03 07:27:47.705397
299	1	131	2023-09-03 07:27:55.227657	2023-09-03 07:27:55.227657
300	1	133	2023-09-03 11:11:37.421785	2023-09-03 11:11:37.421785
301	1	134	2023-09-03 11:13:03.167583	2023-09-03 11:13:03.167583
302	5	133	2023-09-03 11:15:56.766864	2023-09-03 11:15:56.766864
303	1	135	2023-09-03 11:37:53.375089	2023-09-03 11:37:53.375089
305	3	136	2023-09-03 12:38:52.57553	2023-09-03 12:38:52.57553
306	3	135	2023-09-03 12:38:55.094928	2023-09-03 12:38:55.094928
307	3	134	2023-09-03 12:38:59.490617	2023-09-03 12:38:59.490617
308	3	133	2023-09-03 12:39:10.92489	2023-09-03 12:39:10.92489
309	3	132	2023-09-03 12:39:28.113793	2023-09-03 12:39:28.113793
310	3	131	2023-09-03 12:39:36.74035	2023-09-03 12:39:36.74035
311	3	130	2023-09-03 12:39:45.013568	2023-09-03 12:39:45.013568
312	3	129	2023-09-03 12:39:53.593013	2023-09-03 12:39:53.593013
313	3	128	2023-09-03 12:39:58.090857	2023-09-03 12:39:58.090857
314	3	127	2023-09-03 12:40:14.65381	2023-09-03 12:40:14.65381
315	1	136	2023-09-03 13:21:09.429959	2023-09-03 13:21:09.429959
316	1	137	2023-09-03 13:21:11.343624	2023-09-03 13:21:11.343624
317	1	138	2023-09-03 14:51:12.764618	2023-09-03 14:51:12.764618
318	4	137	2023-09-03 15:01:52.915358	2023-09-03 15:01:52.915358
319	4	138	2023-09-03 15:01:56.980328	2023-09-03 15:01:56.980328
320	4	135	2023-09-03 15:02:17.340639	2023-09-03 15:02:17.340639
321	4	134	2023-09-03 15:02:26.095082	2023-09-03 15:02:26.095082
322	4	133	2023-09-03 15:02:39.941354	2023-09-03 15:02:39.941354
323	1	140	2023-09-03 18:04:01.739918	2023-09-03 18:04:01.739918
324	1	139	2023-09-03 18:04:03.274308	2023-09-03 18:04:03.274308
325	10	140	2023-09-03 18:29:38.122307	2023-09-03 18:29:38.122307
326	10	139	2023-09-03 18:29:41.701066	2023-09-03 18:29:41.701066
327	10	138	2023-09-03 18:29:43.362293	2023-09-03 18:29:43.362293
328	10	137	2023-09-03 18:29:45.637324	2023-09-03 18:29:45.637324
329	10	136	2023-09-03 18:29:47.87125	2023-09-03 18:29:47.87125
330	10	135	2023-09-03 18:29:49.891932	2023-09-03 18:29:49.891932
331	10	134	2023-09-03 18:29:52.014927	2023-09-03 18:29:52.014927
332	10	133	2023-09-03 18:29:54.355242	2023-09-03 18:29:54.355242
333	10	132	2023-09-03 18:29:56.40693	2023-09-03 18:29:56.40693
334	10	131	2023-09-03 18:30:01.087958	2023-09-03 18:30:01.087958
335	3	140	2023-09-03 19:01:41.286919	2023-09-03 19:01:41.286919
336	3	139	2023-09-03 19:01:47.005161	2023-09-03 19:01:47.005161
337	3	138	2023-09-03 19:01:57.623798	2023-09-03 19:01:57.623798
338	1	141	2023-09-03 21:03:53.954814	2023-09-03 21:03:53.954814
339	1	143	2023-09-04 18:54:30.005867	2023-09-04 18:54:30.005867
340	1	142	2023-09-04 18:54:39.333201	2023-09-04 18:54:39.333201
341	4	142	2023-09-04 19:22:46.127293	2023-09-04 19:22:46.127293
342	4	143	2023-09-04 19:22:54.181804	2023-09-04 19:22:54.181804
343	4	144	2023-09-04 19:22:58.771594	2023-09-04 19:22:58.771594
345	2	135	2023-09-05 07:21:35.482903	2023-09-05 07:21:35.482903
346	2	136	2023-09-05 07:21:38.630652	2023-09-05 07:21:38.630652
347	2	137	2023-09-05 07:21:42.083188	2023-09-05 07:21:42.083188
348	2	138	2023-09-05 07:21:44.167582	2023-09-05 07:21:44.167582
349	2	139	2023-09-05 07:21:46.742544	2023-09-05 07:21:46.742544
350	2	140	2023-09-05 07:21:49.771568	2023-09-05 07:21:49.771568
351	2	141	2023-09-05 07:21:52.162024	2023-09-05 07:21:52.162024
352	2	142	2023-09-05 07:21:56.139425	2023-09-05 07:21:56.139425
353	2	143	2023-09-05 07:21:59.209502	2023-09-05 07:21:59.209502
354	2	144	2023-09-05 07:22:02.446581	2023-09-05 07:22:02.446581
355	6	144	2023-09-05 11:21:24.684964	2023-09-05 11:21:24.684964
356	6	142	2023-09-05 11:21:32.073076	2023-09-05 11:21:32.073076
357	4	145	2023-09-05 16:54:19.154964	2023-09-05 16:54:19.154964
358	1	146	2023-09-05 17:49:27.648005	2023-09-05 17:49:27.648005
359	1	145	2023-09-05 17:49:36.277543	2023-09-05 17:49:36.277543
360	11	146	2023-09-05 17:50:07.789809	2023-09-05 17:50:07.789809
361	11	145	2023-09-05 17:50:22.305354	2023-09-05 17:50:22.305354
362	11	144	2023-09-05 17:50:26.582454	2023-09-05 17:50:26.582454
363	11	143	2023-09-05 17:50:37.076407	2023-09-05 17:50:37.076407
364	11	142	2023-09-05 17:50:42.22589	2023-09-05 17:50:42.22589
365	11	141	2023-09-05 17:50:51.279456	2023-09-05 17:50:51.279456
366	11	140	2023-09-05 17:51:14.953683	2023-09-05 17:51:14.953683
367	11	138	2023-09-05 17:51:31.689726	2023-09-05 17:51:31.689726
368	11	147	2023-09-05 17:55:13.074341	2023-09-05 17:55:13.074341
369	4	147	2023-09-05 17:56:41.695892	2023-09-05 17:56:41.695892
370	4	148	2023-09-05 17:56:46.757689	2023-09-05 17:56:46.757689
371	1	148	2023-09-05 18:09:18.03873	2023-09-05 18:09:18.03873
372	1	147	2023-09-05 18:09:23.730338	2023-09-05 18:09:23.730338
373	1	149	2023-09-05 18:21:30.766306	2023-09-05 18:21:30.766306
374	1	150	2023-09-05 18:21:32.42599	2023-09-05 18:21:32.42599
375	3	152	2023-09-05 18:31:30.395501	2023-09-05 18:31:30.395501
376	3	151	2023-09-05 18:31:32.844593	2023-09-05 18:31:32.844593
377	3	150	2023-09-05 18:31:49.099128	2023-09-05 18:31:49.099128
378	3	149	2023-09-05 18:32:09.148303	2023-09-05 18:32:09.148303
379	3	148	2023-09-05 18:32:12.519267	2023-09-05 18:32:12.519267
380	3	147	2023-09-05 18:32:36.375474	2023-09-05 18:32:36.375474
381	3	146	2023-09-05 18:32:44.859532	2023-09-05 18:32:44.859532
382	3	145	2023-09-05 18:32:54.540026	2023-09-05 18:32:54.540026
383	3	144	2023-09-05 18:33:01.852973	2023-09-05 18:33:01.852973
384	13	154	2023-09-05 18:42:12.121336	2023-09-05 18:42:12.121336
385	13	153	2023-09-05 18:42:39.89299	2023-09-05 18:42:39.89299
386	13	152	2023-09-05 18:42:58.247134	2023-09-05 18:42:58.247134
387	13	151	2023-09-05 18:43:09.651366	2023-09-05 18:43:09.651366
388	13	150	2023-09-05 18:43:13.316431	2023-09-05 18:43:13.316431
389	13	149	2023-09-05 18:43:18.503528	2023-09-05 18:43:18.503528
390	13	148	2023-09-05 18:43:22.858677	2023-09-05 18:43:22.858677
391	13	155	2023-09-05 18:58:30.09704	2023-09-05 18:58:30.09704
392	1	155	2023-09-05 19:13:34.520417	2023-09-05 19:13:34.520417
393	1	154	2023-09-05 19:13:41.944789	2023-09-05 19:13:41.944789
394	1	153	2023-09-05 19:13:46.080141	2023-09-05 19:13:46.080141
395	1	152	2023-09-05 19:13:59.89554	2023-09-05 19:13:59.89554
396	1	156	2023-09-05 19:25:32.189042	2023-09-05 19:25:32.189042
397	5	156	2023-09-05 21:16:56.440824	2023-09-05 21:16:56.440824
398	5	154	2023-09-05 21:17:17.833337	2023-09-05 21:17:17.833337
399	1	158	2023-09-06 08:27:05.615921	2023-09-06 08:27:05.615921
400	1	157	2023-09-06 08:27:08.654635	2023-09-06 08:27:08.654635
401	4	157	2023-09-06 09:18:24.768804	2023-09-06 09:18:24.768804
402	4	156	2023-09-06 09:18:39.049693	2023-09-06 09:18:39.049693
403	4	155	2023-09-06 09:18:50.580575	2023-09-06 09:18:50.580575
404	4	154	2023-09-06 09:18:59.504469	2023-09-06 09:18:59.504469
405	4	153	2023-09-06 09:19:05.364168	2023-09-06 09:19:05.364168
406	4	152	2023-09-06 09:19:13.000974	2023-09-06 09:19:13.000974
407	4	151	2023-09-06 09:19:18.705404	2023-09-06 09:19:18.705404
408	4	150	2023-09-06 09:19:26.50295	2023-09-06 09:19:26.50295
409	4	149	2023-09-06 09:19:32.808305	2023-09-06 09:19:32.808305
410	13	156	2023-09-06 10:22:57.969145	2023-09-06 10:22:57.969145
411	13	157	2023-09-06 10:23:01.261902	2023-09-06 10:23:01.261902
412	13	158	2023-09-06 10:23:05.267385	2023-09-06 10:23:05.267385
413	5	159	2023-09-06 18:47:05.416212	2023-09-06 18:47:05.416212
414	5	158	2023-09-06 18:47:12.313694	2023-09-06 18:47:12.313694
415	1	159	2023-09-06 19:31:10.993751	2023-09-06 19:31:10.993751
416	13	159	2023-09-06 20:22:43.451639	2023-09-06 20:22:43.451639
417	1	164	2023-09-07 19:42:12.070213	2023-09-07 19:42:12.070213
418	1	163	2023-09-07 19:42:17.242464	2023-09-07 19:42:17.242464
419	1	162	2023-09-07 19:42:23.637537	2023-09-07 19:42:23.637537
420	1	161	2023-09-07 19:42:39.693718	2023-09-07 19:42:39.693718
421	1	160	2023-09-07 19:42:45.107805	2023-09-07 19:42:45.107805
422	4	164	2023-09-07 20:20:21.000056	2023-09-07 20:20:21.000056
423	4	166	2023-09-08 17:09:48.789293	2023-09-08 17:09:48.789293
424	1	169	2023-09-09 08:39:02.807315	2023-09-09 08:39:02.807315
425	1	168	2023-09-09 08:39:08.560943	2023-09-09 08:39:08.560943
426	1	167	2023-09-09 08:39:21.479789	2023-09-09 08:39:21.479789
427	1	166	2023-09-09 08:39:26.435148	2023-09-09 08:39:26.435148
428	1	165	2023-09-09 08:39:50.636348	2023-09-09 08:39:50.636348
429	4	167	2023-09-09 10:25:22.605151	2023-09-09 10:25:22.605151
430	4	168	2023-09-09 10:25:28.354374	2023-09-09 10:25:28.354374
431	4	169	2023-09-09 10:25:34.811016	2023-09-09 10:25:34.811016
432	1	171	2023-09-10 06:09:56.517783	2023-09-10 06:09:56.517783
433	1	170	2023-09-10 06:10:09.799964	2023-09-10 06:10:09.799964
434	3	171	2023-09-10 06:44:47.250637	2023-09-10 06:44:47.250637
435	3	170	2023-09-10 06:44:55.257173	2023-09-10 06:44:55.257173
436	3	169	2023-09-10 06:45:06.041364	2023-09-10 06:45:06.041364
437	3	168	2023-09-10 06:45:14.639366	2023-09-10 06:45:14.639366
438	3	166	2023-09-10 06:46:23.407477	2023-09-10 06:46:23.407477
439	3	165	2023-09-10 06:46:33.018394	2023-09-10 06:46:33.018394
440	3	164	2023-09-10 06:46:41.770724	2023-09-10 06:46:41.770724
441	3	163	2023-09-10 06:46:46.748843	2023-09-10 06:46:46.748843
442	4	172	2023-09-10 08:50:28.271324	2023-09-10 08:50:28.271324
443	4	171	2023-09-10 08:50:37.962653	2023-09-10 08:50:37.962653
444	4	170	2023-09-10 08:50:47.015251	2023-09-10 08:50:47.015251
445	3	173	2023-09-10 09:36:36.215971	2023-09-10 09:36:36.215971
446	13	173	2023-09-10 09:48:58.752114	2023-09-10 09:48:58.752114
447	13	172	2023-09-10 09:49:11.894533	2023-09-10 09:49:11.894533
448	13	171	2023-09-10 09:49:20.493008	2023-09-10 09:49:20.493008
449	13	170	2023-09-10 09:49:28.614701	2023-09-10 09:49:28.614701
450	13	169	2023-09-10 09:49:35.772136	2023-09-10 09:49:35.772136
451	13	168	2023-09-10 09:49:40.901132	2023-09-10 09:49:40.901132
452	13	167	2023-09-10 09:49:45.236984	2023-09-10 09:49:45.236984
453	13	166	2023-09-10 09:49:49.746347	2023-09-10 09:49:49.746347
454	13	165	2023-09-10 09:49:53.883437	2023-09-10 09:49:53.883437
455	13	164	2023-09-10 09:49:57.930154	2023-09-10 09:49:57.930154
456	5	173	2023-09-10 10:18:05.06981	2023-09-10 10:18:05.06981
457	5	172	2023-09-10 10:18:15.251705	2023-09-10 10:18:15.251705
458	5	171	2023-09-10 10:18:23.276343	2023-09-10 10:18:23.276343
459	5	170	2023-09-10 10:19:57.412362	2023-09-10 10:19:57.412362
460	5	169	2023-09-10 10:20:12.002743	2023-09-10 10:20:12.002743
461	5	168	2023-09-10 10:20:19.520774	2023-09-10 10:20:19.520774
462	5	167	2023-09-10 10:20:25.085677	2023-09-10 10:20:25.085677
463	5	166	2023-09-10 10:20:32.882115	2023-09-10 10:20:32.882115
464	5	165	2023-09-10 10:20:38.162902	2023-09-10 10:20:38.162902
465	4	174	2023-09-10 10:51:47.586487	2023-09-10 10:51:47.586487
466	1	176	2023-09-10 10:55:28.182039	2023-09-10 10:55:28.182039
467	1	175	2023-09-10 10:55:32.090003	2023-09-10 10:55:32.090003
468	1	174	2023-09-10 11:00:18.444749	2023-09-10 11:00:18.444749
469	1	173	2023-09-10 11:00:32.055428	2023-09-10 11:00:32.055428
470	1	172	2023-09-10 11:00:35.973147	2023-09-10 11:00:35.973147
471	4	178	2023-09-10 11:13:05.410981	2023-09-10 11:13:05.410981
472	4	177	2023-09-10 11:13:15.481381	2023-09-10 11:13:15.481381
473	4	176	2023-09-10 11:13:28.295959	2023-09-10 11:13:28.295959
474	4	175	2023-09-10 11:13:36.507718	2023-09-10 11:13:36.507718
475	1	179	2023-09-10 13:28:21.759488	2023-09-10 13:28:21.759488
476	1	178	2023-09-10 13:28:28.933509	2023-09-10 13:28:28.933509
477	4	179	2023-09-10 14:33:41.010328	2023-09-10 14:33:41.010328
478	4	180	2023-09-10 14:33:44.142248	2023-09-10 14:33:44.142248
479	10	180	2023-09-10 14:38:37.291432	2023-09-10 14:38:37.291432
480	10	179	2023-09-10 14:38:53.015331	2023-09-10 14:38:53.015331
481	10	178	2023-09-10 14:38:55.826397	2023-09-10 14:38:55.826397
482	10	177	2023-09-10 14:39:03.209769	2023-09-10 14:39:03.209769
483	10	176	2023-09-10 14:39:08.795624	2023-09-10 14:39:08.795624
484	10	175	2023-09-10 14:39:11.729098	2023-09-10 14:39:11.729098
485	10	174	2023-09-10 14:39:14.827303	2023-09-10 14:39:14.827303
486	10	173	2023-09-10 14:39:16.899495	2023-09-10 14:39:16.899495
487	10	172	2023-09-10 14:39:19.39205	2023-09-10 14:39:19.39205
488	10	171	2023-09-10 14:39:25.97551	2023-09-10 14:39:25.97551
489	5	181	2023-09-10 16:27:59.575681	2023-09-10 16:27:59.575681
1234	5	479	2023-11-05 14:15:53.446536	2023-11-05 14:15:53.446536
491	5	179	2023-09-10 16:28:56.578498	2023-09-10 16:28:56.578498
492	1	181	2023-09-10 17:19:53.696297	2023-09-10 17:19:53.696297
493	1	180	2023-09-10 17:19:58.473211	2023-09-10 17:19:58.473211
494	13	181	2023-09-10 17:33:22.396874	2023-09-10 17:33:22.396874
495	13	180	2023-09-10 17:33:26.860317	2023-09-10 17:33:26.860317
496	13	179	2023-09-10 17:33:39.677842	2023-09-10 17:33:39.677842
497	13	178	2023-09-10 17:33:43.376154	2023-09-10 17:33:43.376154
498	13	177	2023-09-10 17:33:47.214231	2023-09-10 17:33:47.214231
499	13	176	2023-09-10 17:33:50.943985	2023-09-10 17:33:50.943985
500	13	175	2023-09-10 17:33:54.269372	2023-09-10 17:33:54.269372
501	13	174	2023-09-10 17:33:59.508464	2023-09-10 17:33:59.508464
502	2	181	2023-09-11 09:10:37.844438	2023-09-11 09:10:37.844438
503	2	180	2023-09-11 09:10:40.955215	2023-09-11 09:10:40.955215
504	2	179	2023-09-11 09:10:43.609363	2023-09-11 09:10:43.609363
505	2	178	2023-09-11 09:10:51.120306	2023-09-11 09:10:51.120306
506	2	177	2023-09-11 09:10:55.36022	2023-09-11 09:10:55.36022
507	2	176	2023-09-11 09:11:02.644999	2023-09-11 09:11:02.644999
508	2	175	2023-09-11 09:11:11.559522	2023-09-11 09:11:11.559522
509	2	174	2023-09-11 09:11:25.676037	2023-09-11 09:11:25.676037
510	2	173	2023-09-11 09:11:29.722226	2023-09-11 09:11:29.722226
511	2	172	2023-09-11 09:11:34.977612	2023-09-11 09:11:34.977612
512	1	182	2023-09-11 18:26:27.914741	2023-09-11 18:26:27.914741
514	10	182	2023-09-11 19:51:31.010079	2023-09-11 19:51:31.010079
515	2	182	2023-09-11 22:32:00.6939	2023-09-11 22:32:00.6939
516	3	185	2023-09-12 18:33:34.969326	2023-09-12 18:33:34.969326
517	3	184	2023-09-12 18:33:37.077579	2023-09-12 18:33:37.077579
518	3	183	2023-09-12 18:33:39.874299	2023-09-12 18:33:39.874299
519	3	182	2023-09-12 18:33:49.178659	2023-09-12 18:33:49.178659
520	3	181	2023-09-12 18:33:57.942767	2023-09-12 18:33:57.942767
521	3	180	2023-09-12 18:34:08.416984	2023-09-12 18:34:08.416984
522	3	179	2023-09-12 18:34:27.234648	2023-09-12 18:34:27.234648
523	3	178	2023-09-12 18:34:38.834765	2023-09-12 18:34:38.834765
524	3	177	2023-09-12 18:34:44.058886	2023-09-12 18:34:44.058886
525	3	176	2023-09-12 18:34:46.942331	2023-09-12 18:34:46.942331
526	10	183	2023-09-12 19:05:50.051701	2023-09-12 19:05:50.051701
527	10	184	2023-09-12 19:06:08.270729	2023-09-12 19:06:08.270729
528	10	185	2023-09-12 19:06:11.331744	2023-09-12 19:06:11.331744
529	10	186	2023-09-12 19:06:14.713546	2023-09-12 19:06:14.713546
530	1	188	2023-09-12 19:17:47.019755	2023-09-12 19:17:47.019755
531	1	187	2023-09-12 19:17:51.73781	2023-09-12 19:17:51.73781
532	1	186	2023-09-12 19:17:56.336719	2023-09-12 19:17:56.336719
533	1	185	2023-09-12 19:18:04.927451	2023-09-12 19:18:04.927451
534	1	184	2023-09-12 19:18:09.350193	2023-09-12 19:18:09.350193
535	1	183	2023-09-12 19:18:15.496129	2023-09-12 19:18:15.496129
536	11	183	2023-09-12 19:21:19.335573	2023-09-12 19:21:19.335573
537	3	188	2023-09-12 19:22:41.02548	2023-09-12 19:22:41.02548
538	3	187	2023-09-12 19:22:45.105137	2023-09-12 19:22:45.105137
539	3	186	2023-09-12 19:22:47.562534	2023-09-12 19:22:47.562534
540	1	191	2023-09-12 19:33:42.188873	2023-09-12 19:33:42.188873
541	1	190	2023-09-12 19:33:45.789327	2023-09-12 19:33:45.789327
542	1	189	2023-09-12 19:33:48.820039	2023-09-12 19:33:48.820039
543	1	192	2023-09-12 19:33:55.218294	2023-09-12 19:33:55.218294
544	1	193	2023-09-12 19:39:40.137654	2023-09-12 19:39:40.137654
545	5	190	2023-09-12 19:43:25.344851	2023-09-12 19:43:25.344851
546	5	191	2023-09-12 19:43:32.892021	2023-09-12 19:43:32.892021
547	5	192	2023-09-12 19:43:37.399588	2023-09-12 19:43:37.399588
548	5	189	2023-09-12 19:43:48.129692	2023-09-12 19:43:48.129692
549	5	188	2023-09-12 19:43:52.162827	2023-09-12 19:43:52.162827
550	5	187	2023-09-12 19:43:55.487585	2023-09-12 19:43:55.487585
551	5	186	2023-09-12 19:43:58.645282	2023-09-12 19:43:58.645282
552	5	184	2023-09-12 19:44:07.875103	2023-09-12 19:44:07.875103
553	3	193	2023-09-13 10:12:55.04489	2023-09-13 10:12:55.04489
554	3	192	2023-09-13 10:12:58.646639	2023-09-13 10:12:58.646639
555	3	191	2023-09-13 10:13:00.715977	2023-09-13 10:13:00.715977
556	3	190	2023-09-13 10:13:03.007581	2023-09-13 10:13:03.007581
557	1	195	2023-09-13 19:49:52.589615	2023-09-13 19:49:52.589615
558	1	194	2023-09-13 19:49:56.952278	2023-09-13 19:49:56.952278
559	4	196	2023-09-14 11:47:25.017867	2023-09-14 11:47:25.017867
560	4	195	2023-09-14 11:47:30.893434	2023-09-14 11:47:30.893434
561	4	194	2023-09-14 11:47:46.466927	2023-09-14 11:47:46.466927
562	4	193	2023-09-14 11:47:53.905976	2023-09-14 11:47:53.905976
563	4	192	2023-09-14 11:47:58.567886	2023-09-14 11:47:58.567886
564	4	191	2023-09-14 11:48:15.424114	2023-09-14 11:48:15.424114
565	4	190	2023-09-14 11:48:22.567985	2023-09-14 11:48:22.567985
566	4	189	2023-09-14 11:48:27.165902	2023-09-14 11:48:27.165902
567	4	188	2023-09-14 11:48:30.890983	2023-09-14 11:48:30.890983
568	4	187	2023-09-14 11:48:40.983849	2023-09-14 11:48:40.983849
569	1	197	2023-09-14 18:52:40.60346	2023-09-14 18:52:40.60346
570	1	200	2023-09-16 05:58:38.496288	2023-09-16 05:58:38.496288
571	1	199	2023-09-16 05:58:42.644657	2023-09-16 05:58:42.644657
572	1	198	2023-09-16 05:58:47.429762	2023-09-16 05:58:47.429762
574	10	200	2023-09-16 13:07:08.193855	2023-09-16 13:07:08.193855
575	10	199	2023-09-16 13:07:11.378926	2023-09-16 13:07:11.378926
576	10	198	2023-09-16 13:07:14.835208	2023-09-16 13:07:14.835208
578	10	197	2023-09-16 13:07:42.857544	2023-09-16 13:07:42.857544
579	10	196	2023-09-16 13:07:52.084669	2023-09-16 13:07:52.084669
580	10	195	2023-09-16 13:07:54.530128	2023-09-16 13:07:54.530128
581	10	194	2023-09-16 13:07:57.364304	2023-09-16 13:07:57.364304
582	10	193	2023-09-16 13:08:03.039127	2023-09-16 13:08:03.039127
583	10	192	2023-09-16 13:08:05.068774	2023-09-16 13:08:05.068774
584	10	191	2023-09-16 13:08:12.210039	2023-09-16 13:08:12.210039
585	11	197	2023-09-16 13:08:23.15791	2023-09-16 13:08:23.15791
586	11	196	2023-09-16 13:08:51.144672	2023-09-16 13:08:51.144672
587	11	201	2023-09-16 13:09:24.424561	2023-09-16 13:09:24.424561
588	2	202	2023-09-16 13:34:27.212966	2023-09-16 13:34:27.212966
590	2	201	2023-09-16 13:34:33.26992	2023-09-16 13:34:33.26992
591	2	200	2023-09-16 13:34:40.49785	2023-09-16 13:34:40.49785
592	2	199	2023-09-16 13:34:43.157277	2023-09-16 13:34:43.157277
593	2	198	2023-09-16 13:34:47.718144	2023-09-16 13:34:47.718144
594	2	197	2023-09-16 13:35:00.365369	2023-09-16 13:35:00.365369
595	2	196	2023-09-16 13:35:12.65645	2023-09-16 13:35:12.65645
596	2	195	2023-09-16 13:35:17.573256	2023-09-16 13:35:17.573256
597	2	194	2023-09-16 13:35:20.673341	2023-09-16 13:35:20.673341
599	2	193	2023-09-16 13:35:24.752566	2023-09-16 13:35:24.752566
600	4	200	2023-09-16 15:13:06.710681	2023-09-16 15:13:06.710681
601	4	201	2023-09-16 15:13:09.411217	2023-09-16 15:13:09.411217
602	4	205	2023-09-16 15:13:22.474234	2023-09-16 15:13:22.474234
603	4	207	2023-09-16 18:34:10.112854	2023-09-16 18:34:10.112854
604	4	204	2023-09-16 18:34:32.432733	2023-09-16 18:34:32.432733
605	4	203	2023-09-16 18:34:36.630452	2023-09-16 18:34:36.630452
606	1	207	2023-09-17 08:51:47.48369	2023-09-17 08:51:47.48369
607	1	206	2023-09-17 08:51:51.894127	2023-09-17 08:51:51.894127
608	1	205	2023-09-17 08:51:58.693269	2023-09-17 08:51:58.693269
609	1	204	2023-09-17 08:52:02.916339	2023-09-17 08:52:02.916339
610	1	203	2023-09-17 08:52:07.813696	2023-09-17 08:52:07.813696
611	1	202	2023-09-17 08:52:15.298212	2023-09-17 08:52:15.298212
612	1	201	2023-09-17 08:52:22.127015	2023-09-17 08:52:22.127015
613	1	210	2023-09-17 16:22:25.418755	2023-09-17 16:22:25.418755
614	1	209	2023-09-17 16:22:35.116745	2023-09-17 16:22:35.116745
615	1	208	2023-09-17 16:22:48.566529	2023-09-17 16:22:48.566529
616	5	210	2023-09-17 17:27:56.994094	2023-09-17 17:27:56.994094
617	5	209	2023-09-17 17:28:01.670312	2023-09-17 17:28:01.670312
618	5	208	2023-09-17 17:28:05.24056	2023-09-17 17:28:05.24056
619	5	207	2023-09-17 17:28:11.138805	2023-09-17 17:28:11.138805
620	5	206	2023-09-17 17:28:16.532164	2023-09-17 17:28:16.532164
621	5	205	2023-09-17 17:28:22.265038	2023-09-17 17:28:22.265038
622	5	204	2023-09-17 17:28:30.844596	2023-09-17 17:28:30.844596
623	5	202	2023-09-17 17:29:24.145761	2023-09-17 17:29:24.145761
624	5	201	2023-09-17 17:29:28.796032	2023-09-17 17:29:28.796032
625	3	211	2023-09-17 19:07:18.901139	2023-09-17 19:07:18.901139
626	3	210	2023-09-17 19:07:26.488981	2023-09-17 19:07:26.488981
627	3	209	2023-09-17 19:07:32.263131	2023-09-17 19:07:32.263131
628	3	208	2023-09-17 19:07:37.379519	2023-09-17 19:07:37.379519
629	3	207	2023-09-17 19:07:40.162342	2023-09-17 19:07:40.162342
630	1	211	2023-09-17 19:07:41.048131	2023-09-17 19:07:41.048131
631	3	206	2023-09-17 19:07:42.906228	2023-09-17 19:07:42.906228
632	3	205	2023-09-17 19:07:46.612643	2023-09-17 19:07:46.612643
633	3	204	2023-09-17 19:07:49.397729	2023-09-17 19:07:49.397729
634	3	203	2023-09-17 19:07:51.549613	2023-09-17 19:07:51.549613
635	3	202	2023-09-17 19:07:53.680984	2023-09-17 19:07:53.680984
636	4	210	2023-09-17 19:29:05.922804	2023-09-17 19:29:05.922804
637	4	211	2023-09-17 19:29:12.001103	2023-09-17 19:29:12.001103
638	4	212	2023-09-17 19:29:20.156279	2023-09-17 19:29:20.156279
639	2	213	2023-09-18 17:31:41.77545	2023-09-18 17:31:41.77545
640	2	212	2023-09-18 17:31:46.671673	2023-09-18 17:31:46.671673
641	2	211	2023-09-18 17:31:48.995158	2023-09-18 17:31:48.995158
642	2	210	2023-09-18 17:31:52.114296	2023-09-18 17:31:52.114296
643	2	209	2023-09-18 17:31:58.695172	2023-09-18 17:31:58.695172
644	2	208	2023-09-18 17:32:01.891984	2023-09-18 17:32:01.891984
645	2	207	2023-09-18 17:32:06.000949	2023-09-18 17:32:06.000949
646	2	206	2023-09-18 17:32:11.416044	2023-09-18 17:32:11.416044
647	2	205	2023-09-18 17:32:15.671322	2023-09-18 17:32:15.671322
648	2	204	2023-09-18 17:32:19.291549	2023-09-18 17:32:19.291549
649	5	212	2023-09-18 18:13:34.754892	2023-09-18 18:13:34.754892
650	5	215	2023-09-18 18:13:52.678538	2023-09-18 18:13:52.678538
651	5	214	2023-09-18 18:13:56.897324	2023-09-18 18:13:56.897324
652	5	213	2023-09-18 18:14:01.703563	2023-09-18 18:14:01.703563
653	5	211	2023-09-18 18:14:12.857015	2023-09-18 18:14:12.857015
654	1	216	2023-09-18 19:03:50.47937	2023-09-18 19:03:50.47937
655	1	215	2023-09-18 19:07:12.441086	2023-09-18 19:07:12.441086
656	1	214	2023-09-18 19:07:18.799139	2023-09-18 19:07:18.799139
657	1	213	2023-09-18 19:07:31.881243	2023-09-18 19:07:31.881243
658	1	212	2023-09-18 19:07:38.081512	2023-09-18 19:07:38.081512
659	6	217	2023-09-18 19:10:52.035053	2023-09-18 19:10:52.035053
660	6	216	2023-09-18 19:10:55.311566	2023-09-18 19:10:55.311566
661	6	215	2023-09-18 19:10:58.600041	2023-09-18 19:10:58.600041
662	6	213	2023-09-18 19:11:07.127905	2023-09-18 19:11:07.127905
663	6	212	2023-09-18 19:11:10.728731	2023-09-18 19:11:10.728731
664	4	214	2023-09-18 19:16:24.296707	2023-09-18 19:16:24.296707
665	4	215	2023-09-18 19:16:32.067381	2023-09-18 19:16:32.067381
666	4	216	2023-09-18 19:16:36.691856	2023-09-18 19:16:36.691856
667	4	217	2023-09-18 19:16:40.685438	2023-09-18 19:16:40.685438
668	2	216	2023-09-19 00:57:31.555183	2023-09-19 00:57:31.555183
669	2	215	2023-09-19 00:57:37.052205	2023-09-19 00:57:37.052205
670	2	214	2023-09-19 00:57:44.27908	2023-09-19 00:57:44.27908
671	2	217	2023-09-19 00:57:57.581239	2023-09-19 00:57:57.581239
672	1	220	2023-09-19 18:13:19.178406	2023-09-19 18:13:19.178406
673	1	219	2023-09-19 18:13:31.945078	2023-09-19 18:13:31.945078
674	1	218	2023-09-19 18:13:34.879514	2023-09-19 18:13:34.879514
675	13	221	2023-09-19 18:22:29.467275	2023-09-19 18:22:29.467275
676	13	220	2023-09-19 18:22:34.372867	2023-09-19 18:22:34.372867
677	13	219	2023-09-19 18:22:38.895137	2023-09-19 18:22:38.895137
678	13	218	2023-09-19 18:22:52.167531	2023-09-19 18:22:52.167531
679	13	217	2023-09-19 18:22:58.794879	2023-09-19 18:22:58.794879
680	13	216	2023-09-19 18:23:07.79391	2023-09-19 18:23:07.79391
681	13	215	2023-09-19 18:23:16.050781	2023-09-19 18:23:16.050781
682	13	214	2023-09-19 18:23:20.473122	2023-09-19 18:23:20.473122
683	13	213	2023-09-19 18:23:23.812664	2023-09-19 18:23:23.812664
684	2	222	2023-09-19 18:53:00.342767	2023-09-19 18:53:00.342767
685	2	221	2023-09-19 18:53:05.977402	2023-09-19 18:53:05.977402
686	2	220	2023-09-19 18:53:17.855738	2023-09-19 18:53:17.855738
688	2	218	2023-09-19 18:53:41.569817	2023-09-19 18:53:41.569817
689	1	224	2023-09-19 19:18:02.908377	2023-09-19 19:18:02.908377
690	1	223	2023-09-19 19:18:05.051224	2023-09-19 19:18:05.051224
691	1	222	2023-09-19 19:18:08.353611	2023-09-19 19:18:08.353611
692	1	221	2023-09-19 19:18:10.092248	2023-09-19 19:18:10.092248
693	5	219	2023-09-20 04:52:03.757598	2023-09-20 04:52:03.757598
694	13	225	2023-09-20 06:52:00.700565	2023-09-20 06:52:00.700565
695	13	224	2023-09-20 06:52:09.63967	2023-09-20 06:52:09.63967
696	13	223	2023-09-20 06:52:14.049842	2023-09-20 06:52:14.049842
697	6	225	2023-09-20 15:06:37.43104	2023-09-20 15:06:37.43104
698	6	224	2023-09-20 15:06:42.905716	2023-09-20 15:06:42.905716
699	6	223	2023-09-20 15:06:46.424278	2023-09-20 15:06:46.424278
700	6	222	2023-09-20 15:06:49.445013	2023-09-20 15:06:49.445013
701	6	221	2023-09-20 15:06:51.87233	2023-09-20 15:06:51.87233
702	6	220	2023-09-20 15:06:57.267758	2023-09-20 15:06:57.267758
703	6	219	2023-09-20 15:07:02.323925	2023-09-20 15:07:02.323925
704	6	218	2023-09-20 15:07:16.158747	2023-09-20 15:07:16.158747
705	4	226	2023-09-20 17:23:00.526995	2023-09-20 17:23:00.526995
706	4	225	2023-09-20 17:23:08.395958	2023-09-20 17:23:08.395958
707	4	224	2023-09-20 17:23:13.979219	2023-09-20 17:23:13.979219
708	4	223	2023-09-20 17:23:18.25261	2023-09-20 17:23:18.25261
709	4	222	2023-09-20 17:23:22.727892	2023-09-20 17:23:22.727892
710	4	221	2023-09-20 17:23:27.695464	2023-09-20 17:23:27.695464
711	4	220	2023-09-20 17:23:33.596179	2023-09-20 17:23:33.596179
712	4	219	2023-09-20 17:23:38.296428	2023-09-20 17:23:38.296428
713	4	218	2023-09-20 17:23:44.01504	2023-09-20 17:23:44.01504
714	1	228	2023-09-21 10:24:14.169862	2023-09-21 10:24:14.169862
715	1	227	2023-09-21 10:24:16.665891	2023-09-21 10:24:16.665891
716	1	226	2023-09-21 10:24:19.507372	2023-09-21 10:24:19.507372
717	1	225	2023-09-21 10:24:22.463372	2023-09-21 10:24:22.463372
718	6	228	2023-09-21 14:05:56.543732	2023-09-21 14:05:56.543732
719	6	227	2023-09-21 14:05:59.87326	2023-09-21 14:05:59.87326
720	4	228	2023-09-21 14:59:20.064271	2023-09-21 14:59:20.064271
721	4	229	2023-09-21 14:59:24.367839	2023-09-21 14:59:24.367839
722	6	230	2023-09-22 08:53:20.667163	2023-09-22 08:53:20.667163
723	1	233	2023-09-24 09:39:03.890924	2023-09-24 09:39:03.890924
724	1	232	2023-09-24 09:39:14.381098	2023-09-24 09:39:14.381098
725	1	231	2023-09-24 09:39:22.912454	2023-09-24 09:39:22.912454
726	1	230	2023-09-24 09:39:38.696642	2023-09-24 09:39:38.696642
727	1	229	2023-09-24 09:39:47.097107	2023-09-24 09:39:47.097107
728	1	237	2023-09-24 20:29:11.263504	2023-09-24 20:29:11.263504
729	1	236	2023-09-24 20:29:16.262131	2023-09-24 20:29:16.262131
730	1	235	2023-09-24 20:29:20.800405	2023-09-24 20:29:20.800405
731	1	234	2023-09-24 20:29:27.061716	2023-09-24 20:29:27.061716
732	3	237	2023-09-25 19:15:46.057769	2023-09-25 19:15:46.057769
733	3	236	2023-09-25 19:15:48.097302	2023-09-25 19:15:48.097302
734	3	235	2023-09-25 19:15:50.003095	2023-09-25 19:15:50.003095
735	3	234	2023-09-25 19:15:53.814682	2023-09-25 19:15:53.814682
736	3	233	2023-09-25 19:15:56.480401	2023-09-25 19:15:56.480401
737	3	232	2023-09-25 19:16:09.473646	2023-09-25 19:16:09.473646
738	3	231	2023-09-25 19:16:24.477576	2023-09-25 19:16:24.477576
739	3	230	2023-09-25 19:16:52.882811	2023-09-25 19:16:52.882811
740	3	229	2023-09-25 19:17:11.051208	2023-09-25 19:17:11.051208
741	3	240	2023-09-26 05:56:50.849948	2023-09-26 05:56:50.849948
743	3	239	2023-09-26 05:57:14.247511	2023-09-26 05:57:14.247511
744	4	238	2023-09-26 12:10:39.897654	2023-09-26 12:10:39.897654
745	4	239	2023-09-26 12:10:44.530111	2023-09-26 12:10:44.530111
746	4	240	2023-09-26 12:10:53.204813	2023-09-26 12:10:53.204813
747	1	243	2023-09-26 18:24:45.327513	2023-09-26 18:24:45.327513
748	1	242	2023-09-26 18:24:57.357085	2023-09-26 18:24:57.357085
749	1	241	2023-09-26 18:25:03.508515	2023-09-26 18:25:03.508515
750	1	240	2023-09-26 18:25:09.28014	2023-09-26 18:25:09.28014
751	1	239	2023-09-26 18:25:20.49352	2023-09-26 18:25:20.49352
752	1	238	2023-09-26 18:25:24.247552	2023-09-26 18:25:24.247552
753	1	245	2023-09-26 19:10:08.994456	2023-09-26 19:10:08.994456
754	11	245	2023-09-26 19:17:16.44248	2023-09-26 19:17:16.44248
755	11	244	2023-09-26 19:17:19.189775	2023-09-26 19:17:19.189775
756	11	243	2023-09-26 19:17:23.164452	2023-09-26 19:17:23.164452
757	11	242	2023-09-26 19:17:25.521176	2023-09-26 19:17:25.521176
758	11	241	2023-09-26 19:17:28.600121	2023-09-26 19:17:28.600121
759	11	240	2023-09-26 19:17:35.316658	2023-09-26 19:17:35.316658
760	11	239	2023-09-26 19:17:38.800299	2023-09-26 19:17:38.800299
761	11	238	2023-09-26 19:17:43.764704	2023-09-26 19:17:43.764704
762	1	250	2023-09-27 13:01:38.80403	2023-09-27 13:01:38.80403
763	1	249	2023-09-27 13:02:13.064096	2023-09-27 13:02:13.064096
764	1	248	2023-09-27 13:03:16.163488	2023-09-27 13:03:16.163488
765	1	247	2023-09-27 13:03:19.716121	2023-09-27 13:03:19.716121
766	1	246	2023-09-27 13:03:23.842145	2023-09-27 13:03:23.842145
767	6	252	2023-09-28 05:17:33.410433	2023-09-28 05:17:33.410433
769	3	253	2023-09-28 06:26:38.996489	2023-09-28 06:26:38.996489
770	3	252	2023-09-28 06:26:41.249994	2023-09-28 06:26:41.249994
771	3	251	2023-09-28 06:26:49.831219	2023-09-28 06:26:49.831219
772	3	250	2023-09-28 06:27:10.804257	2023-09-28 06:27:10.804257
773	3	249	2023-09-28 06:27:20.740298	2023-09-28 06:27:20.740298
774	3	248	2023-09-28 06:27:23.153593	2023-09-28 06:27:23.153593
775	3	247	2023-09-28 06:27:28.646276	2023-09-28 06:27:28.646276
776	3	246	2023-09-28 06:27:32.15586	2023-09-28 06:27:32.15586
777	3	245	2023-09-28 06:27:39.545705	2023-09-28 06:27:39.545705
778	6	254	2023-09-28 06:30:31.221956	2023-09-28 06:30:31.221956
779	4	253	2023-09-28 12:12:20.015186	2023-09-28 12:12:20.015186
780	4	254	2023-09-28 12:12:24.079435	2023-09-28 12:12:24.079435
781	4	255	2023-09-28 12:12:27.444422	2023-09-28 12:12:27.444422
782	1	257	2023-09-28 18:38:35.333101	2023-09-28 18:38:35.333101
783	1	256	2023-09-28 18:38:41.298816	2023-09-28 18:38:41.298816
784	1	255	2023-09-28 18:38:47.893724	2023-09-28 18:38:47.893724
785	1	254	2023-09-28 18:38:51.952281	2023-09-28 18:38:51.952281
786	1	253	2023-09-28 18:39:00.577202	2023-09-28 18:39:00.577202
787	1	252	2023-09-28 18:39:07.190486	2023-09-28 18:39:07.190486
788	1	251	2023-09-28 18:39:11.723941	2023-09-28 18:39:11.723941
790	10	257	2023-09-28 19:26:06.820124	2023-09-28 19:26:06.820124
791	10	256	2023-09-28 19:26:09.345386	2023-09-28 19:26:09.345386
792	10	255	2023-09-28 19:26:19.485858	2023-09-28 19:26:19.485858
793	10	254	2023-09-28 19:26:22.993182	2023-09-28 19:26:22.993182
794	10	253	2023-09-28 19:26:31.062317	2023-09-28 19:26:31.062317
795	10	252	2023-09-28 19:26:35.449232	2023-09-28 19:26:35.449232
796	10	251	2023-09-28 19:26:38.339395	2023-09-28 19:26:38.339395
797	10	250	2023-09-28 19:26:42.05838	2023-09-28 19:26:42.05838
798	10	249	2023-09-28 19:26:45.776999	2023-09-28 19:26:45.776999
799	10	248	2023-09-28 19:26:48.392717	2023-09-28 19:26:48.392717
800	4	257	2023-09-29 07:52:12.725076	2023-09-29 07:52:12.725076
801	4	258	2023-09-29 07:52:17.129832	2023-09-29 07:52:17.129832
802	4	259	2023-09-29 07:52:22.142678	2023-09-29 07:52:22.142678
803	4	260	2023-09-29 07:52:25.893184	2023-09-29 07:52:25.893184
804	4	261	2023-09-29 07:52:29.920543	2023-09-29 07:52:29.920543
805	4	262	2023-09-29 07:52:33.502162	2023-09-29 07:52:33.502162
806	4	263	2023-09-29 07:52:37.087317	2023-09-29 07:52:37.087317
807	6	261	2023-09-30 09:50:24.871064	2023-09-30 09:50:24.871064
808	6	256	2023-09-30 09:51:01.092754	2023-09-30 09:51:01.092754
809	6	263	2023-09-30 09:51:24.008124	2023-09-30 09:51:24.008124
810	6	262	2023-09-30 09:51:26.631304	2023-09-30 09:51:26.631304
811	6	260	2023-09-30 09:51:30.032883	2023-09-30 09:51:30.032883
812	6	259	2023-09-30 09:51:32.649225	2023-09-30 09:51:32.649225
813	6	258	2023-09-30 09:51:35.219165	2023-09-30 09:51:35.219165
814	1	264	2023-09-30 14:45:01.431522	2023-09-30 14:45:01.431522
815	1	263	2023-09-30 14:45:19.096771	2023-09-30 14:45:19.096771
816	1	261	2023-09-30 14:45:26.467373	2023-09-30 14:45:26.467373
817	1	262	2023-09-30 14:45:29.525642	2023-09-30 14:45:29.525642
818	1	258	2023-09-30 14:46:06.515799	2023-09-30 14:46:06.515799
819	1	259	2023-09-30 14:46:10.689896	2023-09-30 14:46:10.689896
820	1	260	2023-09-30 14:46:14.332702	2023-09-30 14:46:14.332702
821	1	271	2023-09-30 16:00:39.40683	2023-09-30 16:00:39.40683
822	1	270	2023-09-30 16:00:42.932237	2023-09-30 16:00:42.932237
823	1	269	2023-09-30 16:00:59.848635	2023-09-30 16:00:59.848635
824	1	268	2023-09-30 16:01:03.372186	2023-09-30 16:01:03.372186
825	1	267	2023-09-30 16:01:07.101616	2023-09-30 16:01:07.101616
826	1	266	2023-09-30 16:01:10.611822	2023-09-30 16:01:10.611822
827	1	265	2023-09-30 16:01:15.888952	2023-09-30 16:01:15.888952
828	4	273	2023-09-30 16:46:13.922696	2023-09-30 16:46:13.922696
829	4	272	2023-09-30 16:46:38.438163	2023-09-30 16:46:38.438163
830	4	271	2023-09-30 16:46:44.291445	2023-09-30 16:46:44.291445
831	4	270	2023-09-30 16:46:49.111619	2023-09-30 16:46:49.111619
832	4	269	2023-09-30 16:47:01.606348	2023-09-30 16:47:01.606348
833	4	268	2023-09-30 16:47:06.012599	2023-09-30 16:47:06.012599
834	4	267	2023-09-30 16:47:13.039721	2023-09-30 16:47:13.039721
835	4	266	2023-09-30 16:47:19.422311	2023-09-30 16:47:19.422311
836	4	265	2023-09-30 16:47:28.573042	2023-09-30 16:47:28.573042
837	4	264	2023-09-30 16:47:40.715974	2023-09-30 16:47:40.715974
838	4	274	2023-09-30 17:53:34.838522	2023-09-30 17:53:34.838522
839	11	274	2023-09-30 18:04:46.985064	2023-09-30 18:04:46.985064
840	11	269	2023-09-30 18:06:02.479545	2023-09-30 18:06:02.479545
841	11	272	2023-09-30 18:09:23.593239	2023-09-30 18:09:23.593239
842	11	270	2023-09-30 18:09:31.91531	2023-09-30 18:09:31.91531
843	11	267	2023-09-30 18:09:38.972906	2023-09-30 18:09:38.972906
844	11	268	2023-09-30 18:09:44.082498	2023-09-30 18:09:44.082498
845	11	266	2023-09-30 18:09:46.697294	2023-09-30 18:09:46.697294
846	1	276	2023-09-30 18:36:08.601531	2023-09-30 18:36:08.601531
847	1	275	2023-09-30 18:36:15.924881	2023-09-30 18:36:15.924881
848	1	274	2023-09-30 18:36:20.725916	2023-09-30 18:36:20.725916
849	1	273	2023-09-30 18:36:25.615935	2023-09-30 18:36:25.615935
850	6	276	2023-09-30 18:51:58.955604	2023-09-30 18:51:58.955604
851	6	275	2023-09-30 18:52:03.71835	2023-09-30 18:52:03.71835
852	6	274	2023-09-30 18:52:08.173272	2023-09-30 18:52:08.173272
853	6	273	2023-09-30 18:52:11.303423	2023-09-30 18:52:11.303423
854	6	272	2023-09-30 18:52:20.377054	2023-09-30 18:52:20.377054
855	6	271	2023-09-30 18:52:26.555977	2023-09-30 18:52:26.555977
856	6	270	2023-09-30 18:52:29.893155	2023-09-30 18:52:29.893155
857	6	269	2023-09-30 18:52:37.92228	2023-09-30 18:52:37.92228
858	6	268	2023-09-30 18:52:41.945343	2023-09-30 18:52:41.945343
859	5	273	2023-09-30 18:53:53.779615	2023-09-30 18:53:53.779615
860	5	272	2023-09-30 18:54:02.823179	2023-09-30 18:54:02.823179
861	5	271	2023-09-30 18:54:07.332299	2023-09-30 18:54:07.332299
862	5	270	2023-09-30 18:54:13.263872	2023-09-30 18:54:13.263872
863	5	269	2023-09-30 18:54:18.995253	2023-09-30 18:54:18.995253
864	5	268	2023-09-30 18:54:22.839292	2023-09-30 18:54:22.839292
865	5	274	2023-09-30 18:54:37.105275	2023-09-30 18:54:37.105275
866	5	275	2023-09-30 18:54:47.76924	2023-09-30 18:54:47.76924
867	5	276	2023-09-30 18:54:53.266799	2023-09-30 18:54:53.266799
868	5	277	2023-09-30 18:55:01.626499	2023-09-30 18:55:01.626499
869	1	277	2023-10-01 08:17:40.006087	2023-10-01 08:17:40.006087
870	4	277	2023-10-01 12:19:40.798121	2023-10-01 12:19:40.798121
871	4	276	2023-10-01 12:19:46.679624	2023-10-01 12:19:46.679624
872	4	275	2023-10-01 12:19:52.481654	2023-10-01 12:19:52.481654
873	1	278	2023-10-01 12:29:59.978575	2023-10-01 12:29:59.978575
874	4	279	2023-10-01 13:00:20.975348	2023-10-01 13:00:20.975348
875	6	278	2023-10-01 15:37:33.49386	2023-10-01 15:37:33.49386
876	1	279	2023-10-01 17:44:20.814441	2023-10-01 17:44:20.814441
877	1	280	2023-10-02 04:08:06.54575	2023-10-02 04:08:06.54575
878	4	280	2023-10-02 15:44:24.13353	2023-10-02 15:44:24.13353
879	5	281	2023-10-02 19:32:48.393537	2023-10-02 19:32:48.393537
880	5	282	2023-10-02 19:33:10.6626	2023-10-02 19:33:10.6626
881	5	280	2023-10-02 19:33:24.676659	2023-10-02 19:33:24.676659
882	5	279	2023-10-02 19:33:31.034776	2023-10-02 19:33:31.034776
883	5	278	2023-10-02 19:33:45.070558	2023-10-02 19:33:45.070558
884	6	282	2023-10-03 04:02:33.009191	2023-10-03 04:02:33.009191
885	6	281	2023-10-03 04:02:36.280285	2023-10-03 04:02:36.280285
886	6	279	2023-10-03 04:02:42.473558	2023-10-03 04:02:42.473558
887	1	282	2023-10-03 09:14:41.789052	2023-10-03 09:14:41.789052
888	1	281	2023-10-03 09:14:47.803284	2023-10-03 09:14:47.803284
889	11	283	2023-10-03 18:01:51.906821	2023-10-03 18:01:51.906821
890	11	281	2023-10-03 18:02:17.252011	2023-10-03 18:02:17.252011
891	6	284	2023-10-03 18:08:38.900996	2023-10-03 18:08:38.900996
892	1	293	2023-10-04 04:32:17.550041	2023-10-04 04:32:17.550041
893	1	292	2023-10-04 04:33:57.05723	2023-10-04 04:33:57.05723
894	1	291	2023-10-04 04:34:00.009672	2023-10-04 04:34:00.009672
895	1	290	2023-10-04 04:34:05.09099	2023-10-04 04:34:05.09099
896	1	289	2023-10-04 04:34:08.935154	2023-10-04 04:34:08.935154
897	1	288	2023-10-04 04:34:12.897937	2023-10-04 04:34:12.897937
898	1	287	2023-10-04 04:34:17.712016	2023-10-04 04:34:17.712016
899	1	286	2023-10-04 04:34:22.536602	2023-10-04 04:34:22.536602
900	1	285	2023-10-04 04:34:28.522543	2023-10-04 04:34:28.522543
901	2	294	2023-10-04 06:28:57.632429	2023-10-04 06:28:57.632429
902	2	293	2023-10-04 06:29:02.01006	2023-10-04 06:29:02.01006
903	2	292	2023-10-04 06:29:07.996367	2023-10-04 06:29:07.996367
904	2	291	2023-10-04 06:29:11.056146	2023-10-04 06:29:11.056146
905	2	290	2023-10-04 06:29:15.21483	2023-10-04 06:29:15.21483
906	2	289	2023-10-04 06:29:18.553503	2023-10-04 06:29:18.553503
907	2	287	2023-10-04 06:29:26.217022	2023-10-04 06:29:26.217022
908	2	286	2023-10-04 06:29:31.121763	2023-10-04 06:29:31.121763
909	2	285	2023-10-04 06:29:38.395094	2023-10-04 06:29:38.395094
911	6	296	2023-10-04 17:29:34.913829	2023-10-04 17:29:34.913829
912	6	295	2023-10-04 17:29:38.396532	2023-10-04 17:29:38.396532
913	6	294	2023-10-04 17:29:41.526503	2023-10-04 17:29:41.526503
914	6	293	2023-10-04 17:29:43.563822	2023-10-04 17:29:43.563822
915	6	292	2023-10-04 17:29:45.222474	2023-10-04 17:29:45.222474
916	6	291	2023-10-04 17:29:46.837744	2023-10-04 17:29:46.837744
917	6	290	2023-10-04 17:29:48.551693	2023-10-04 17:29:48.551693
918	6	289	2023-10-04 17:29:50.760064	2023-10-04 17:29:50.760064
919	6	288	2023-10-04 17:29:53.811039	2023-10-04 17:29:53.811039
920	1	297	2023-10-05 09:17:55.504626	2023-10-05 09:17:55.504626
921	1	296	2023-10-05 09:17:57.413814	2023-10-05 09:17:57.413814
922	1	295	2023-10-05 09:18:01.087377	2023-10-05 09:18:01.087377
923	3	297	2023-10-05 16:10:30.018325	2023-10-05 16:10:30.018325
924	3	296	2023-10-05 16:10:44.874667	2023-10-05 16:10:44.874667
925	3	295	2023-10-05 16:10:49.937532	2023-10-05 16:10:49.937532
926	3	294	2023-10-05 16:10:53.062914	2023-10-05 16:10:53.062914
927	3	293	2023-10-05 16:11:00.130133	2023-10-05 16:11:00.130133
928	3	292	2023-10-05 16:11:01.705536	2023-10-05 16:11:01.705536
929	3	291	2023-10-05 16:11:03.756556	2023-10-05 16:11:03.756556
930	3	290	2023-10-05 16:11:05.381828	2023-10-05 16:11:05.381828
931	3	289	2023-10-05 16:11:07.495138	2023-10-05 16:11:07.495138
932	3	288	2023-10-05 16:11:10.059728	2023-10-05 16:11:10.059728
934	11	298	2023-10-05 18:04:20.883327	2023-10-05 18:04:20.883327
935	6	304	2023-10-05 19:17:34.743865	2023-10-05 19:17:34.743865
936	6	303	2023-10-05 19:17:38.293064	2023-10-05 19:17:38.293064
937	6	302	2023-10-05 19:17:41.42187	2023-10-05 19:17:41.42187
938	6	301	2023-10-05 19:17:44.485353	2023-10-05 19:17:44.485353
939	6	300	2023-10-05 19:17:46.966051	2023-10-05 19:17:46.966051
940	6	299	2023-10-05 19:17:49.808375	2023-10-05 19:17:49.808375
941	6	298	2023-10-05 19:17:54.7158	2023-10-05 19:17:54.7158
942	5	305	2023-10-05 19:30:01.655464	2023-10-05 19:30:01.655464
943	5	304	2023-10-05 19:30:23.419987	2023-10-05 19:30:23.419987
944	5	303	2023-10-05 19:30:28.937894	2023-10-05 19:30:28.937894
945	5	302	2023-10-05 19:30:57.666332	2023-10-05 19:30:57.666332
946	5	301	2023-10-05 19:31:23.347665	2023-10-05 19:31:23.347665
947	3	308	2023-10-05 20:28:13.87585	2023-10-05 20:28:13.87585
948	3	307	2023-10-05 20:28:21.768586	2023-10-05 20:28:21.768586
949	3	306	2023-10-05 20:28:29.920088	2023-10-05 20:28:29.920088
950	3	305	2023-10-05 20:28:40.924078	2023-10-05 20:28:40.924078
951	3	304	2023-10-05 20:28:52.437259	2023-10-05 20:28:52.437259
952	3	303	2023-10-05 20:28:54.5903	2023-10-05 20:28:54.5903
953	3	302	2023-10-05 20:29:03.862554	2023-10-05 20:29:03.862554
954	3	301	2023-10-05 20:29:12.548139	2023-10-05 20:29:12.548139
955	3	300	2023-10-05 20:29:15.399972	2023-10-05 20:29:15.399972
956	3	299	2023-10-05 20:29:27.281974	2023-10-05 20:29:27.281974
957	11	305	2023-10-05 21:25:05.744024	2023-10-05 21:25:05.744024
958	11	301	2023-10-05 21:29:11.376528	2023-10-05 21:29:11.376528
959	6	308	2023-10-06 08:26:55.163361	2023-10-06 08:26:55.163361
960	6	307	2023-10-06 08:27:06.191086	2023-10-06 08:27:06.191086
961	6	306	2023-10-06 08:27:22.55526	2023-10-06 08:27:22.55526
962	2	308	2023-10-06 10:24:58.595834	2023-10-06 10:24:58.595834
963	2	307	2023-10-06 10:25:01.512793	2023-10-06 10:25:01.512793
964	2	306	2023-10-06 10:25:04.53341	2023-10-06 10:25:04.53341
965	2	305	2023-10-06 10:25:09.000794	2023-10-06 10:25:09.000794
966	2	304	2023-10-06 10:25:12.719468	2023-10-06 10:25:12.719468
967	2	303	2023-10-06 10:25:17.713308	2023-10-06 10:25:17.713308
968	2	302	2023-10-06 10:25:22.704726	2023-10-06 10:25:22.704726
969	6	316	2023-10-07 13:51:24.342002	2023-10-07 13:51:24.342002
970	6	315	2023-10-07 13:51:33.514956	2023-10-07 13:51:33.514956
971	6	314	2023-10-07 13:51:45.256755	2023-10-07 13:51:45.256755
972	6	313	2023-10-07 13:51:50.000356	2023-10-07 13:51:50.000356
973	6	312	2023-10-07 13:51:54.352586	2023-10-07 13:51:54.352586
974	6	311	2023-10-07 13:51:58.597289	2023-10-07 13:51:58.597289
975	4	314	2023-10-07 14:23:12.497648	2023-10-07 14:23:12.497648
976	4	310	2023-10-07 14:23:28.516412	2023-10-07 14:23:28.516412
977	4	309	2023-10-07 14:23:35.339164	2023-10-07 14:23:35.339164
978	4	308	2023-10-07 14:23:43.971062	2023-10-07 14:23:43.971062
979	4	316	2023-10-07 14:24:21.193982	2023-10-07 14:24:21.193982
980	4	317	2023-10-07 14:24:35.920164	2023-10-07 14:24:35.920164
981	6	317	2023-10-07 17:26:42.694676	2023-10-07 17:26:42.694676
982	1	317	2023-10-08 10:58:09.610424	2023-10-08 10:58:09.610424
983	1	316	2023-10-08 10:58:16.015222	2023-10-08 10:58:16.015222
984	1	315	2023-10-08 10:58:26.408529	2023-10-08 10:58:26.408529
985	1	314	2023-10-08 10:58:33.034826	2023-10-08 10:58:33.034826
986	1	313	2023-10-08 10:58:37.461079	2023-10-08 10:58:37.461079
987	1	312	2023-10-08 10:59:52.011557	2023-10-08 10:59:52.011557
988	1	311	2023-10-08 10:59:57.494017	2023-10-08 10:59:57.494017
989	1	310	2023-10-08 11:00:01.027928	2023-10-08 11:00:01.027928
990	1	309	2023-10-08 11:00:05.219034	2023-10-08 11:00:05.219034
991	1	320	2023-10-08 11:34:42.032235	2023-10-08 11:34:42.032235
992	1	319	2023-10-08 11:35:01.806908	2023-10-08 11:35:01.806908
993	1	321	2023-10-08 13:17:49.756764	2023-10-08 13:17:49.756764
994	6	321	2023-10-09 05:54:41.209498	2023-10-09 05:54:41.209498
995	6	320	2023-10-09 05:54:51.836563	2023-10-09 05:54:51.836563
996	6	319	2023-10-09 05:54:55.544426	2023-10-09 05:54:55.544426
997	6	318	2023-10-09 05:55:00.537029	2023-10-09 05:55:00.537029
999	1	322	2023-10-10 16:42:54.028425	2023-10-10 16:42:54.028425
1000	6	324	2023-10-10 19:00:28.509096	2023-10-10 19:00:28.509096
1001	6	323	2023-10-10 19:00:32.005512	2023-10-10 19:00:32.005512
1002	6	322	2023-10-10 19:00:36.352693	2023-10-10 19:00:36.352693
1003	11	324	2023-10-10 19:00:42.406845	2023-10-10 19:00:42.406845
1004	11	323	2023-10-10 19:00:47.856584	2023-10-10 19:00:47.856584
1005	11	322	2023-10-10 19:01:50.204346	2023-10-10 19:01:50.204346
1006	11	321	2023-10-10 19:02:06.655768	2023-10-10 19:02:06.655768
1007	11	320	2023-10-10 19:02:09.471237	2023-10-10 19:02:09.471237
1008	4	326	2023-10-10 19:35:57.577822	2023-10-10 19:35:57.577822
1009	4	330	2023-10-11 10:17:35.653706	2023-10-11 10:17:35.653706
1010	4	329	2023-10-11 10:17:46.70864	2023-10-11 10:17:46.70864
1011	4	328	2023-10-11 10:17:51.436237	2023-10-11 10:17:51.436237
1012	4	327	2023-10-11 10:17:54.91338	2023-10-11 10:17:54.91338
1013	6	331	2023-10-11 15:39:49.234493	2023-10-11 15:39:49.234493
1014	6	330	2023-10-11 15:39:54.329688	2023-10-11 15:39:54.329688
1015	6	329	2023-10-11 15:39:57.307748	2023-10-11 15:39:57.307748
1016	6	328	2023-10-11 15:40:01.09325	2023-10-11 15:40:01.09325
1017	6	327	2023-10-11 15:40:08.896419	2023-10-11 15:40:08.896419
1018	5	330	2023-10-11 15:57:13.116008	2023-10-11 15:57:13.116008
1019	5	329	2023-10-11 15:57:20.520889	2023-10-11 15:57:20.520889
1020	5	328	2023-10-11 15:57:23.495059	2023-10-11 15:57:23.495059
1021	1	332	2023-10-11 19:10:03.850149	2023-10-11 19:10:03.850149
1022	1	331	2023-10-11 19:10:07.580475	2023-10-11 19:10:07.580475
1023	1	330	2023-10-11 19:10:12.75365	2023-10-11 19:10:12.75365
1024	1	329	2023-10-11 19:10:16.322868	2023-10-11 19:10:16.322868
1025	1	327	2023-10-11 19:10:30.059784	2023-10-11 19:10:30.059784
1026	1	328	2023-10-11 19:10:32.860436	2023-10-11 19:10:32.860436
1027	1	326	2023-10-11 19:10:38.140713	2023-10-11 19:10:38.140713
1028	1	325	2023-10-11 19:10:41.235743	2023-10-11 19:10:41.235743
1029	1	324	2023-10-11 19:10:44.812638	2023-10-11 19:10:44.812638
1030	1	323	2023-10-11 19:10:48.302035	2023-10-11 19:10:48.302035
1031	2	331	2023-10-13 15:20:19.53084	2023-10-13 15:20:19.53084
1032	2	332	2023-10-13 15:20:22.984169	2023-10-13 15:20:22.984169
1033	2	333	2023-10-13 15:20:28.794884	2023-10-13 15:20:28.794884
1034	2	334	2023-10-13 15:20:31.760897	2023-10-13 15:20:31.760897
1035	2	335	2023-10-13 15:20:37.214146	2023-10-13 15:20:37.214146
1036	2	336	2023-10-13 15:20:39.777118	2023-10-13 15:20:39.777118
1038	2	337	2023-10-13 15:20:43.251313	2023-10-13 15:20:43.251313
1039	2	338	2023-10-13 15:20:46.75995	2023-10-13 15:20:46.75995
1040	2	339	2023-10-13 15:20:50.090529	2023-10-13 15:20:50.090529
1041	2	340	2023-10-13 15:20:53.448528	2023-10-13 15:20:53.448528
1042	1	343	2023-10-14 10:28:39.493891	2023-10-14 10:28:39.493891
1043	1	342	2023-10-14 10:28:49.477392	2023-10-14 10:28:49.477392
1044	1	341	2023-10-14 10:28:54.835651	2023-10-14 10:28:54.835651
1045	1	340	2023-10-14 10:29:06.136174	2023-10-14 10:29:06.136174
1046	1	339	2023-10-14 10:29:10.199341	2023-10-14 10:29:10.199341
1047	1	338	2023-10-14 10:29:17.626768	2023-10-14 10:29:17.626768
1048	1	337	2023-10-14 10:29:20.741588	2023-10-14 10:29:20.741588
1049	1	336	2023-10-14 10:29:24.741781	2023-10-14 10:29:24.741781
1050	1	335	2023-10-14 10:29:28.109864	2023-10-14 10:29:28.109864
1051	1	334	2023-10-14 10:29:31.77422	2023-10-14 10:29:31.77422
1052	4	343	2023-10-14 17:02:00.208887	2023-10-14 17:02:00.208887
1053	6	346	2023-10-15 10:26:47.532306	2023-10-15 10:26:47.532306
1054	4	347	2023-10-16 17:15:30.244481	2023-10-16 17:15:30.244481
1055	4	346	2023-10-16 17:22:02.891216	2023-10-16 17:22:02.891216
1056	4	345	2023-10-16 17:22:08.603688	2023-10-16 17:22:08.603688
1057	1	349	2023-10-17 15:04:38.795773	2023-10-17 15:04:38.795773
1058	1	348	2023-10-17 15:04:43.350797	2023-10-17 15:04:43.350797
1059	1	347	2023-10-17 15:04:47.651465	2023-10-17 15:04:47.651465
1060	1	346	2023-10-17 15:04:51.889478	2023-10-17 15:04:51.889478
1061	1	345	2023-10-17 15:04:55.579659	2023-10-17 15:04:55.579659
1062	1	344	2023-10-17 15:05:25.099728	2023-10-17 15:05:25.099728
1063	1	358	2023-10-17 20:16:16.257919	2023-10-17 20:16:16.257919
1064	1	357	2023-10-17 20:16:20.500846	2023-10-17 20:16:20.500846
1065	1	356	2023-10-17 20:16:24.007143	2023-10-17 20:16:24.007143
1066	1	355	2023-10-17 20:16:27.996171	2023-10-17 20:16:27.996171
1067	1	354	2023-10-17 20:16:31.623853	2023-10-17 20:16:31.623853
1068	1	353	2023-10-17 20:16:34.081164	2023-10-17 20:16:34.081164
1069	1	352	2023-10-17 20:16:35.976951	2023-10-17 20:16:35.976951
1070	1	351	2023-10-17 20:16:39.170331	2023-10-17 20:16:39.170331
1071	1	350	2023-10-17 20:16:42.772923	2023-10-17 20:16:42.772923
1072	10	360	2023-10-19 19:27:29.431021	2023-10-19 19:27:29.431021
1073	10	359	2023-10-19 19:27:32.632762	2023-10-19 19:27:32.632762
1074	10	357	2023-10-19 19:27:36.17927	2023-10-19 19:27:36.17927
1075	10	358	2023-10-19 19:27:38.595511	2023-10-19 19:27:38.595511
1076	10	361	2023-10-19 19:27:43.838279	2023-10-19 19:27:43.838279
1077	10	362	2023-10-19 19:27:46.666504	2023-10-19 19:27:46.666504
1078	10	364	2023-10-19 19:27:51.626464	2023-10-19 19:27:51.626464
1079	10	365	2023-10-19 19:27:59.699951	2023-10-19 19:27:59.699951
1080	10	366	2023-10-19 19:28:02.845408	2023-10-19 19:28:02.845408
1081	1	366	2023-10-19 20:35:44.434689	2023-10-19 20:35:44.434689
1082	1	365	2023-10-19 20:36:10.935305	2023-10-19 20:36:10.935305
1083	1	364	2023-10-19 20:36:49.105386	2023-10-19 20:36:49.105386
1084	1	363	2023-10-19 20:36:53.118582	2023-10-19 20:36:53.118582
1085	1	362	2023-10-19 20:36:55.94536	2023-10-19 20:36:55.94536
1086	1	361	2023-10-19 20:37:02.248466	2023-10-19 20:37:02.248466
1087	1	360	2023-10-19 20:37:08.695609	2023-10-19 20:37:08.695609
1088	10	367	2023-10-20 17:09:27.583535	2023-10-20 17:09:27.583535
1089	10	368	2023-10-20 17:09:29.076248	2023-10-20 17:09:29.076248
1090	10	369	2023-10-20 17:09:33.001999	2023-10-20 17:09:33.001999
1091	1	381	2023-10-21 16:08:00.192255	2023-10-21 16:08:00.192255
1092	1	380	2023-10-21 16:08:09.098588	2023-10-21 16:08:09.098588
1093	1	379	2023-10-21 16:08:16.100273	2023-10-21 16:08:16.100273
1094	1	377	2023-10-21 16:09:09.534519	2023-10-21 16:09:09.534519
1095	1	378	2023-10-21 16:09:10.418173	2023-10-21 16:09:10.418173
1096	1	375	2023-10-21 16:09:10.72189	2023-10-21 16:09:10.72189
1097	11	382	2023-10-21 20:21:51.406237	2023-10-21 20:21:51.406237
1098	11	381	2023-10-21 20:22:10.673942	2023-10-21 20:22:10.673942
1099	11	378	2023-10-21 20:23:18.093719	2023-10-21 20:23:18.093719
1100	11	379	2023-10-21 20:23:24.680926	2023-10-21 20:23:24.680926
1101	11	377	2023-10-21 20:23:34.369796	2023-10-21 20:23:34.369796
1102	11	376	2023-10-21 20:26:10.390903	2023-10-21 20:26:10.390903
1103	11	375	2023-10-21 20:27:08.699568	2023-10-21 20:27:08.699568
1104	6	384	2023-10-22 10:32:09.417598	2023-10-22 10:32:09.417598
1105	1	386	2023-10-22 11:51:33.067018	2023-10-22 11:51:33.067018
1106	1	385	2023-10-22 11:54:16.803561	2023-10-22 11:54:16.803561
1107	1	384	2023-10-22 11:54:20.162019	2023-10-22 11:54:20.162019
1108	1	383	2023-10-22 11:54:22.868036	2023-10-22 11:54:22.868036
1109	1	382	2023-10-22 11:54:26.337244	2023-10-22 11:54:26.337244
1110	6	386	2023-10-22 11:57:21.335706	2023-10-22 11:57:21.335706
1111	11	386	2023-10-23 11:37:09.300416	2023-10-23 11:37:09.300416
1113	6	389	2023-10-23 19:25:01.143398	2023-10-23 19:25:01.143398
1114	6	388	2023-10-23 19:25:04.059158	2023-10-23 19:25:04.059158
1116	6	387	2023-10-23 19:25:11.641757	2023-10-23 19:25:11.641757
1117	6	383	2023-10-23 19:25:26.419512	2023-10-23 19:25:26.419512
1118	6	382	2023-10-23 19:25:33.729302	2023-10-23 19:25:33.729302
1119	6	380	2023-10-23 19:25:42.195678	2023-10-23 19:25:42.195678
1120	11	385	2023-10-24 18:10:29.555113	2023-10-24 18:10:29.555113
1121	1	392	2023-10-24 18:46:24.324615	2023-10-24 18:46:24.324615
1122	1	391	2023-10-24 18:46:27.566545	2023-10-24 18:46:27.566545
1123	1	390	2023-10-24 18:46:31.442413	2023-10-24 18:46:31.442413
1124	1	389	2023-10-24 18:46:35.714612	2023-10-24 18:46:35.714612
1125	1	388	2023-10-24 18:46:45.834502	2023-10-24 18:46:45.834502
1126	1	396	2023-10-24 18:58:41.412735	2023-10-24 18:58:41.412735
1127	1	393	2023-10-24 18:58:57.504644	2023-10-24 18:58:57.504644
1128	1	387	2023-10-24 19:02:13.476393	2023-10-24 19:02:13.476393
1129	1	399	2023-10-24 19:07:45.016908	2023-10-24 19:07:45.016908
1130	1	398	2023-10-24 19:07:50.39422	2023-10-24 19:07:50.39422
1131	1	397	2023-10-24 19:07:53.091176	2023-10-24 19:07:53.091176
1132	1	401	2023-10-24 19:39:54.486158	2023-10-24 19:39:54.486158
1133	1	400	2023-10-24 19:39:56.879965	2023-10-24 19:39:56.879965
1134	1	408	2023-10-25 20:03:40.955462	2023-10-25 20:03:40.955462
1135	1	407	2023-10-25 20:03:45.857737	2023-10-25 20:03:45.857737
1136	1	406	2023-10-25 20:03:49.942819	2023-10-25 20:03:49.942819
1137	1	405	2023-10-25 20:03:53.268686	2023-10-25 20:03:53.268686
1138	1	404	2023-10-25 20:03:55.796299	2023-10-25 20:03:55.796299
1139	1	403	2023-10-25 20:04:00.280362	2023-10-25 20:04:00.280362
1140	1	402	2023-10-25 20:04:18.274456	2023-10-25 20:04:18.274456
1141	1	419	2023-10-27 17:47:15.914474	2023-10-27 17:47:15.914474
1142	1	418	2023-10-27 17:47:21.184972	2023-10-27 17:47:21.184972
1143	1	417	2023-10-27 17:47:30.503732	2023-10-27 17:47:30.503732
1144	1	416	2023-10-27 17:47:36.601376	2023-10-27 17:47:36.601376
1145	1	415	2023-10-27 17:47:39.096644	2023-10-27 17:47:39.096644
1146	1	414	2023-10-27 17:47:42.179392	2023-10-27 17:47:42.179392
1147	1	413	2023-10-27 17:47:44.914961	2023-10-27 17:47:44.914961
1148	1	412	2023-10-27 17:47:51.77522	2023-10-27 17:47:51.77522
1149	1	411	2023-10-27 17:48:01.884127	2023-10-27 17:48:01.884127
1150	1	410	2023-10-27 17:48:11.422118	2023-10-27 17:48:11.422118
1151	2	430	2023-10-29 17:51:50.244012	2023-10-29 17:51:50.244012
1152	2	429	2023-10-29 17:51:56.381637	2023-10-29 17:51:56.381637
1153	2	428	2023-10-29 17:52:05.269572	2023-10-29 17:52:05.269572
1154	2	427	2023-10-29 17:52:08.397414	2023-10-29 17:52:08.397414
1155	2	426	2023-10-29 17:52:12.692538	2023-10-29 17:52:12.692538
1156	6	433	2023-10-29 20:16:58.900166	2023-10-29 20:16:58.900166
1157	6	432	2023-10-29 20:17:01.987395	2023-10-29 20:17:01.987395
1158	6	431	2023-10-29 20:17:04.792568	2023-10-29 20:17:04.792568
1159	6	430	2023-10-29 20:17:07.060392	2023-10-29 20:17:07.060392
1160	6	429	2023-10-29 20:17:10.027527	2023-10-29 20:17:10.027527
1161	6	428	2023-10-29 20:17:16.001859	2023-10-29 20:17:16.001859
1162	6	426	2023-10-29 20:17:29.005125	2023-10-29 20:17:29.005125
1163	6	434	2023-10-29 20:17:34.335946	2023-10-29 20:17:34.335946
1165	1	435	2023-10-30 10:46:00.295766	2023-10-30 10:46:00.295766
1166	1	434	2023-10-30 10:46:02.788178	2023-10-30 10:46:02.788178
1167	1	433	2023-10-30 10:46:08.493587	2023-10-30 10:46:08.493587
1168	1	432	2023-10-30 10:46:11.253895	2023-10-30 10:46:11.253895
1169	1	431	2023-10-30 10:46:21.235027	2023-10-30 10:46:21.235027
1170	1	430	2023-10-30 10:46:26.308584	2023-10-30 10:46:26.308584
1171	1	429	2023-10-30 10:46:31.841828	2023-10-30 10:46:31.841828
1172	1	428	2023-10-30 10:46:35.119604	2023-10-30 10:46:35.119604
1173	1	427	2023-10-30 10:46:39.273115	2023-10-30 10:46:39.273115
1174	1	426	2023-10-30 10:46:41.611911	2023-10-30 10:46:41.611911
1175	1	437	2023-10-30 19:23:08.207	2023-10-30 19:23:08.207
1176	1	436	2023-10-30 19:23:12.876773	2023-10-30 19:23:12.876773
1177	1	438	2023-10-30 20:29:46.363709	2023-10-30 20:29:46.363709
1178	1	439	2023-10-30 20:29:49.010763	2023-10-30 20:29:49.010763
1179	1	445	2023-10-31 19:39:03.246579	2023-10-31 19:39:03.246579
1180	1	444	2023-10-31 19:39:05.84521	2023-10-31 19:39:05.84521
1181	1	443	2023-10-31 19:39:09.13778	2023-10-31 19:39:09.13778
1182	1	442	2023-10-31 19:39:39.001262	2023-10-31 19:39:39.001262
1183	1	441	2023-10-31 19:39:43.500492	2023-10-31 19:39:43.500492
1184	1	440	2023-10-31 19:39:47.630544	2023-10-31 19:39:47.630544
1185	1	447	2023-10-31 19:44:43.918028	2023-10-31 19:44:43.918028
1186	1	448	2023-10-31 19:49:50.103456	2023-10-31 19:49:50.103456
1187	1	449	2023-10-31 19:53:09.606271	2023-10-31 19:53:09.606271
1188	1	450	2023-10-31 20:03:20.496774	2023-10-31 20:03:20.496774
1189	1	451	2023-11-02 19:15:49.93679	2023-11-02 19:15:49.93679
1190	1	461	2023-11-02 21:15:02.733891	2023-11-02 21:15:02.733891
1191	1	460	2023-11-02 21:15:08.996844	2023-11-02 21:15:08.996844
1192	1	459	2023-11-02 21:15:12.950948	2023-11-02 21:15:12.950948
1193	1	458	2023-11-02 21:15:19.428996	2023-11-02 21:15:19.428996
1194	1	457	2023-11-02 21:15:22.432188	2023-11-02 21:15:22.432188
1195	1	456	2023-11-02 21:15:26.788757	2023-11-02 21:15:26.788757
1196	1	455	2023-11-02 21:15:38.395909	2023-11-02 21:15:38.395909
1197	1	454	2023-11-02 21:15:43.04985	2023-11-02 21:15:43.04985
1198	1	453	2023-11-02 21:15:45.958081	2023-11-02 21:15:45.958081
1199	1	452	2023-11-02 21:15:48.959054	2023-11-02 21:15:48.959054
1200	6	463	2023-11-03 20:14:16.900353	2023-11-03 20:14:16.900353
1201	6	462	2023-11-03 20:14:23.703308	2023-11-03 20:14:23.703308
1202	6	461	2023-11-03 20:14:27.792649	2023-11-03 20:14:27.792649
1203	6	460	2023-11-03 20:14:32.076536	2023-11-03 20:14:32.076536
1204	6	459	2023-11-03 20:14:34.366183	2023-11-03 20:14:34.366183
1205	6	458	2023-11-03 20:14:38.09571	2023-11-03 20:14:38.09571
1206	6	457	2023-11-03 20:14:41.828444	2023-11-03 20:14:41.828444
1207	6	456	2023-11-03 20:14:56.674688	2023-11-03 20:14:56.674688
1208	6	455	2023-11-03 20:15:00.641956	2023-11-03 20:15:00.641956
1209	6	454	2023-11-03 20:15:04.010767	2023-11-03 20:15:04.010767
1210	23	463	2023-11-03 20:21:52.075288	2023-11-03 20:21:52.075288
1211	1	465	2023-11-03 22:34:15.632094	2023-11-03 22:34:15.632094
1212	1	464	2023-11-03 22:34:19.016399	2023-11-03 22:34:19.016399
1213	1	467	2023-11-04 21:39:37.390656	2023-11-04 21:39:37.390656
1214	1	466	2023-11-04 21:39:40.222754	2023-11-04 21:39:40.222754
1215	10	470	2023-11-05 00:06:53.568037	2023-11-05 00:06:53.568037
1216	10	469	2023-11-05 00:06:55.632992	2023-11-05 00:06:55.632992
1217	10	468	2023-11-05 00:06:57.635796	2023-11-05 00:06:57.635796
1218	10	467	2023-11-05 00:07:04.231041	2023-11-05 00:07:04.231041
1219	10	466	2023-11-05 00:07:08.031999	2023-11-05 00:07:08.031999
1220	10	465	2023-11-05 00:07:10.274683	2023-11-05 00:07:10.274683
1222	10	463	2023-11-05 00:07:15.638664	2023-11-05 00:07:15.638664
1223	10	462	2023-11-05 00:07:17.714152	2023-11-05 00:07:17.714152
1224	10	461	2023-11-05 00:07:19.684739	2023-11-05 00:07:19.684739
1225	1	472	2023-11-05 06:59:08.104534	2023-11-05 06:59:08.104534
1226	1	471	2023-11-05 06:59:15.458368	2023-11-05 06:59:15.458368
1227	1	470	2023-11-05 06:59:22.988551	2023-11-05 06:59:22.988551
1228	1	469	2023-11-05 06:59:28.001967	2023-11-05 06:59:28.001967
1229	1	468	2023-11-05 06:59:36.547005	2023-11-05 06:59:36.547005
1230	23	469	2023-11-05 08:27:54.347452	2023-11-05 08:27:54.347452
1231	1	475	2023-11-05 08:27:56.813315	2023-11-05 08:27:56.813315
1235	5	478	2023-11-05 14:16:04.719937	2023-11-05 14:16:04.719937
1242	1	482	2023-11-05 16:47:25.105299	2023-11-05 16:47:25.105299
1253	1	483	2023-11-05 16:56:20.149116	2023-11-05 16:56:20.149116
1254	23	483	2023-11-05 18:55:25.020856	2023-11-05 18:55:25.020856
1257	5	484	2023-11-06 08:42:22.513152	2023-11-06 08:42:22.513152
1259	6	483	2023-11-07 14:05:10.423756	2023-11-07 14:05:10.423756
1260	6	482	2023-11-07 14:05:13.69128	2023-11-07 14:05:13.69128
1261	6	481	2023-11-07 14:05:17.50202	2023-11-07 14:05:17.50202
1262	6	480	2023-11-07 14:05:20.472455	2023-11-07 14:05:20.472455
1264	1	486	2023-11-07 18:02:47.893351	2023-11-07 18:02:47.893351
1265	1	485	2023-11-07 18:02:58.887527	2023-11-07 18:02:58.887527
1266	1	484	2023-11-07 18:03:05.132941	2023-11-07 18:03:05.132941
1270	11	486	2023-11-07 19:40:19.496569	2023-11-07 19:40:19.496569
1274	1	487	2023-11-07 19:46:07.339373	2023-11-07 19:46:07.339373
1275	1	490	2023-11-07 19:55:06.00557	2023-11-07 19:55:06.00557
1276	1	489	2023-11-07 19:55:09.244931	2023-11-07 19:55:09.244931
1277	1	488	2023-11-07 19:55:12.250248	2023-11-07 19:55:12.250248
1281	3	493	2023-11-07 20:27:20.053889	2023-11-07 20:27:20.053889
1282	3	492	2023-11-07 20:27:30.961154	2023-11-07 20:27:30.961154
1283	3	491	2023-11-07 20:27:38.41786	2023-11-07 20:27:38.41786
1284	3	490	2023-11-07 20:27:43.970443	2023-11-07 20:27:43.970443
1285	3	489	2023-11-07 20:27:46.471884	2023-11-07 20:27:46.471884
1286	3	488	2023-11-07 20:27:50.314554	2023-11-07 20:27:50.314554
1287	3	487	2023-11-07 20:27:56.113906	2023-11-07 20:27:56.113906
1292	1	502	2023-11-08 21:19:27.19643	2023-11-08 21:19:27.19643
1295	1	499	2023-11-08 21:32:51.337878	2023-11-08 21:32:51.337878
1296	1	498	2023-11-08 21:32:56.838048	2023-11-08 21:32:56.838048
1297	1	497	2023-11-08 21:33:03.045112	2023-11-08 21:33:03.045112
1298	1	496	2023-11-08 21:33:10.548956	2023-11-08 21:33:10.548956
1303	7	503	2023-11-09 14:26:45.740415	2023-11-09 14:26:45.740415
1304	7	502	2023-11-09 14:26:57.044646	2023-11-09 14:26:57.044646
1313	1	503	2023-11-09 17:16:05.993151	2023-11-09 17:16:05.993151
1315	5	505	2023-11-09 17:30:31.713744	2023-11-09 17:30:31.713744
1316	5	504	2023-11-09 17:30:55.95555	2023-11-09 17:30:55.95555
1317	5	503	2023-11-09 17:31:03.929911	2023-11-09 17:31:03.929911
1320	6	507	2023-11-09 19:21:40.35711	2023-11-09 19:21:40.35711
1321	6	506	2023-11-09 19:21:44.58825	2023-11-09 19:21:44.58825
1328	6	512	2023-11-09 20:39:50.486902	2023-11-09 20:39:50.486902
1329	6	511	2023-11-09 20:40:02.272267	2023-11-09 20:40:02.272267
1330	6	510	2023-11-09 20:40:10.346816	2023-11-09 20:40:10.346816
1331	6	509	2023-11-09 20:40:13.411376	2023-11-09 20:40:13.411376
1333	6	513	2023-11-10 09:09:08.541781	2023-11-10 09:09:08.541781
1335	1	516	2023-11-10 16:03:52.365036	2023-11-10 16:03:52.365036
1336	1	515	2023-11-10 16:04:36.310255	2023-11-10 16:04:36.310255
1337	1	514	2023-11-10 16:04:48.184873	2023-11-10 16:04:48.184873
1338	1	513	2023-11-10 16:04:52.153048	2023-11-10 16:04:52.153048
1342	6	518	2023-11-11 15:57:42.139187	2023-11-11 15:57:42.139187
1343	6	517	2023-11-11 15:57:48.643554	2023-11-11 15:57:48.643554
1344	6	516	2023-11-11 15:58:05.610248	2023-11-11 15:58:05.610248
1346	2	519	2023-11-12 03:20:09.105084	2023-11-12 03:20:09.105084
1347	2	518	2023-11-12 03:20:12.333478	2023-11-12 03:20:12.333478
1348	2	517	2023-11-12 03:20:17.213295	2023-11-12 03:20:17.213295
1349	2	516	2023-11-12 03:20:20.356035	2023-11-12 03:20:20.356035
1351	2	514	2023-11-12 03:20:31.286191	2023-11-12 03:20:31.286191
1352	2	513	2023-11-12 03:20:34.194501	2023-11-12 03:20:34.194501
1353	2	512	2023-11-12 03:20:39.599098	2023-11-12 03:20:39.599098
1355	1	522	2023-11-12 13:27:10.715601	2023-11-12 13:27:10.715601
1356	1	521	2023-11-12 13:27:15.705804	2023-11-12 13:27:15.705804
1357	1	520	2023-11-12 13:27:18.596668	2023-11-12 13:27:18.596668
1358	1	517	2023-11-12 13:27:34.458887	2023-11-12 13:27:34.458887
1359	1	518	2023-11-12 13:27:52.432722	2023-11-12 13:27:52.432722
1361	11	522	2023-11-12 17:15:31.80406	2023-11-12 17:15:31.80406
1364	1	527	2023-11-12 18:27:36.031761	2023-11-12 18:27:36.031761
1365	1	526	2023-11-12 18:27:44.568143	2023-11-12 18:27:44.568143
1366	1	524	2023-11-12 18:27:51.656954	2023-11-12 18:27:51.656954
1367	1	523	2023-11-12 18:28:02.155439	2023-11-12 18:28:02.155439
1372	3	528	2023-11-13 12:21:53.39786	2023-11-13 12:21:53.39786
1373	3	527	2023-11-13 12:22:10.132407	2023-11-13 12:22:10.132407
1374	3	526	2023-11-13 12:22:17.216024	2023-11-13 12:22:17.216024
1375	3	525	2023-11-13 12:22:22.902265	2023-11-13 12:22:22.902265
1376	3	524	2023-11-13 12:22:24.969731	2023-11-13 12:22:24.969731
1377	3	523	2023-11-13 12:22:27.228706	2023-11-13 12:22:27.228706
1378	3	522	2023-11-13 12:22:29.525177	2023-11-13 12:22:29.525177
1379	3	521	2023-11-13 12:22:35.313711	2023-11-13 12:22:35.313711
1381	3	520	2023-11-13 12:22:42.851903	2023-11-13 12:22:42.851903
1382	3	519	2023-11-13 12:22:45.756244	2023-11-13 12:22:45.756244
1388	3	531	2023-11-13 20:03:38.310896	2023-11-13 20:03:38.310896
1389	3	530	2023-11-13 20:03:58.012131	2023-11-13 20:03:58.012131
1400	1	532	2023-11-14 19:36:48.854084	2023-11-14 19:36:48.854084
1401	1	533	2023-11-14 19:37:08.396831	2023-11-14 19:37:08.396831
1403	1	537	2023-11-14 19:50:11.788715	2023-11-14 19:50:11.788715
1404	1	536	2023-11-14 19:50:24.344762	2023-11-14 19:50:24.344762
1405	1	535	2023-11-14 19:50:28.511104	2023-11-14 19:50:28.511104
1406	1	540	2023-11-14 20:00:35.734082	2023-11-14 20:00:35.734082
1407	1	539	2023-11-14 20:00:40.733294	2023-11-14 20:00:40.733294
1417	2	542	2023-11-15 20:46:26.907149	2023-11-15 20:46:26.907149
1421	6	546	2023-11-16 19:00:07.995042	2023-11-16 19:00:07.995042
1422	6	545	2023-11-16 19:00:16.33335	2023-11-16 19:00:16.33335
1425	6	554	2023-11-19 08:12:11.852733	2023-11-19 08:12:11.852733
1426	6	553	2023-11-19 08:12:21.286019	2023-11-19 08:12:21.286019
1433	6	558	2023-11-19 18:07:51.478268	2023-11-19 18:07:51.478268
1434	6	557	2023-11-19 18:07:55.634202	2023-11-19 18:07:55.634202
1436	6	556	2023-11-20 15:41:52.803329	2023-11-20 15:41:52.803329
1437	6	555	2023-11-20 15:42:00.936386	2023-11-20 15:42:00.936386
1440	5	563	2023-11-20 21:02:49.703663	2023-11-20 21:02:49.703663
1441	5	562	2023-11-20 21:02:55.034476	2023-11-20 21:02:55.034476
1443	6	564	2023-11-21 12:27:43.331871	2023-11-21 12:27:43.331871
1445	1	565	2023-11-21 17:04:21.103805	2023-11-21 17:04:21.103805
1446	1	564	2023-11-21 17:04:24.028847	2023-11-21 17:04:24.028847
1447	1	563	2023-11-21 17:04:29.805689	2023-11-21 17:04:29.805689
1448	1	562	2023-11-21 17:04:38.535813	2023-11-21 17:04:38.535813
1449	1	561	2023-11-21 17:04:43.397825	2023-11-21 17:04:43.397825
1450	1	560	2023-11-21 17:04:47.345754	2023-11-21 17:04:47.345754
1451	1	559	2023-11-21 17:04:51.064253	2023-11-21 17:04:51.064253
1452	1	558	2023-11-21 17:04:54.844907	2023-11-21 17:04:54.844907
1453	1	557	2023-11-21 17:04:58.149701	2023-11-21 17:04:58.149701
1454	1	556	2023-11-21 17:05:05.359813	2023-11-21 17:05:05.359813
1459	6	570	2023-11-21 19:53:16.614321	2023-11-21 19:53:16.614321
1460	6	569	2023-11-21 19:53:19.046407	2023-11-21 19:53:19.046407
1461	6	568	2023-11-21 19:53:24.085637	2023-11-21 19:53:24.085637
1466	10	563	2023-11-21 19:53:41.075868	2023-11-21 19:53:41.075868
1474	1	566	2023-11-21 20:10:50.425317	2023-11-21 20:10:50.425317
1475	6	574	2023-11-21 20:28:28.497167	2023-11-21 20:28:28.497167
1477	6	573	2023-11-21 20:28:37.046702	2023-11-21 20:28:37.046702
1478	6	572	2023-11-21 20:28:41.122838	2023-11-21 20:28:41.122838
1479	6	571	2023-11-21 20:28:43.676841	2023-11-21 20:28:43.676841
1480	6	575	2023-11-22 15:48:26.194036	2023-11-22 15:48:26.194036
1481	5	575	2023-11-22 18:13:17.009831	2023-11-22 18:13:17.009831
1232	1	474	2023-11-05 08:28:02.309135	2023-11-05 08:28:02.309135
1233	1	473	2023-11-05 08:28:15.438856	2023-11-05 08:28:15.438856
1236	1	481	2023-11-05 15:00:43.431369	2023-11-05 15:00:43.431369
1237	1	480	2023-11-05 15:00:47.339705	2023-11-05 15:00:47.339705
1238	1	479	2023-11-05 15:00:51.326145	2023-11-05 15:00:51.326145
1239	1	478	2023-11-05 15:01:01.222766	2023-11-05 15:01:01.222766
1240	1	477	2023-11-05 15:01:08.371033	2023-11-05 15:01:08.371033
1241	1	476	2023-11-05 15:01:11.775621	2023-11-05 15:01:11.775621
1243	3	479	2023-11-05 16:52:16.036563	2023-11-05 16:52:16.036563
1245	3	477	2023-11-05 16:52:26.694999	2023-11-05 16:52:26.694999
1246	3	476	2023-11-05 16:52:31.256763	2023-11-05 16:52:31.256763
1247	3	475	2023-11-05 16:52:43.38415	2023-11-05 16:52:43.38415
1248	3	474	2023-11-05 16:52:47.739225	2023-11-05 16:52:47.739225
1249	3	473	2023-11-05 16:52:54.650896	2023-11-05 16:52:54.650896
1250	3	480	2023-11-05 16:53:04.423247	2023-11-05 16:53:04.423247
1251	3	481	2023-11-05 16:53:08.975782	2023-11-05 16:53:08.975782
1252	3	482	2023-11-05 16:53:11.786855	2023-11-05 16:53:11.786855
1256	13	482	2023-11-05 21:13:20.907892	2023-11-05 21:13:20.907892
1258	9	482	2023-11-06 16:47:28.798385	2023-11-06 16:47:28.798385
1263	5	486	2023-11-07 16:51:28.604705	2023-11-07 16:51:28.604705
1268	3	486	2023-11-07 19:18:41.08342	2023-11-07 19:18:41.08342
1269	3	485	2023-11-07 19:18:52.375463	2023-11-07 19:18:52.375463
1271	11	479	2023-11-07 19:41:56.711003	2023-11-07 19:41:56.711003
1272	11	477	2023-11-07 19:42:07.935996	2023-11-07 19:42:07.935996
1273	11	483	2023-11-07 19:42:21.35994	2023-11-07 19:42:21.35994
1278	1	493	2023-11-07 20:14:32.926477	2023-11-07 20:14:32.926477
1279	1	492	2023-11-07 20:14:43.384557	2023-11-07 20:14:43.384557
1280	1	491	2023-11-07 20:14:59.796732	2023-11-07 20:14:59.796732
1288	1	495	2023-11-07 20:29:06.770375	2023-11-07 20:29:06.770375
1289	1	494	2023-11-07 20:29:09.049586	2023-11-07 20:29:09.049586
1291	6	498	2023-11-08 21:13:38.6989	2023-11-08 21:13:38.6989
1293	1	501	2023-11-08 21:31:31.833733	2023-11-08 21:31:31.833733
1294	1	500	2023-11-08 21:31:38.723586	2023-11-08 21:31:38.723586
1299	23	502	2023-11-09 09:15:10.767823	2023-11-09 09:15:10.767823
1300	23	501	2023-11-09 09:15:18.994363	2023-11-09 09:15:18.994363
1301	23	500	2023-11-09 09:15:26.267365	2023-11-09 09:15:26.267365
1302	23	499	2023-11-09 09:15:32.75659	2023-11-09 09:15:32.75659
1305	6	502	2023-11-09 16:19:16.662006	2023-11-09 16:19:16.662006
1306	6	503	2023-11-09 16:19:27.488779	2023-11-09 16:19:27.488779
1307	6	501	2023-11-09 16:19:32.49142	2023-11-09 16:19:32.49142
1308	6	500	2023-11-09 16:19:35.749801	2023-11-09 16:19:35.749801
1309	6	499	2023-11-09 16:19:38.816469	2023-11-09 16:19:38.816469
1310	6	496	2023-11-09 16:19:46.559414	2023-11-09 16:19:46.559414
1311	6	495	2023-11-09 16:19:49.257694	2023-11-09 16:19:49.257694
1312	6	494	2023-11-09 16:19:51.437586	2023-11-09 16:19:51.437586
1314	6	504	2023-11-09 17:24:34.230781	2023-11-09 17:24:34.230781
1318	1	505	2023-11-09 17:47:21.941536	2023-11-09 17:47:21.941536
1319	1	504	2023-11-09 17:47:24.350992	2023-11-09 17:47:24.350992
1322	1	511	2023-11-09 19:53:45.981726	2023-11-09 19:53:45.981726
1323	1	510	2023-11-09 19:53:55.117474	2023-11-09 19:53:55.117474
1324	1	509	2023-11-09 19:53:58.493067	2023-11-09 19:53:58.493067
1325	1	508	2023-11-09 19:54:07.863479	2023-11-09 19:54:07.863479
1326	1	507	2023-11-09 19:54:17.409286	2023-11-09 19:54:17.409286
1327	1	506	2023-11-09 19:54:21.206958	2023-11-09 19:54:21.206958
1332	6	514	2023-11-10 09:08:30.802645	2023-11-10 09:08:30.802645
1334	6	515	2023-11-10 09:55:53.165582	2023-11-10 09:55:53.165582
1339	5	517	2023-11-11 12:57:22.439193	2023-11-11 12:57:22.439193
1340	5	514	2023-11-11 12:58:12.687994	2023-11-11 12:58:12.687994
1341	5	515	2023-11-11 12:58:22.212793	2023-11-11 12:58:22.212793
1345	11	520	2023-11-11 19:32:06.828253	2023-11-11 19:32:06.828253
1354	23	516	2023-11-12 10:02:59.89886	2023-11-12 10:02:59.89886
1360	1	519	2023-11-12 13:28:13.485958	2023-11-12 13:28:13.485958
1362	2	527	2023-11-12 18:23:40.886194	2023-11-12 18:23:40.886194
1363	2	526	2023-11-12 18:23:48.472507	2023-11-12 18:23:48.472507
1368	13	528	2023-11-12 22:13:03.505296	2023-11-12 22:13:03.505296
1369	13	527	2023-11-12 22:13:31.410317	2023-11-12 22:13:31.410317
1370	13	526	2023-11-12 22:13:35.474685	2023-11-12 22:13:35.474685
1383	1	529	2023-11-13 12:30:44.603718	2023-11-13 12:30:44.603718
1384	1	528	2023-11-13 12:30:56.897851	2023-11-13 12:30:56.897851
1385	1	525	2023-11-13 12:31:51.101878	2023-11-13 12:31:51.101878
1387	1	530	2023-11-13 18:59:49.930044	2023-11-13 18:59:49.930044
1390	6	531	2023-11-14 10:13:50.21922	2023-11-14 10:13:50.21922
1391	6	530	2023-11-14 10:13:59.289212	2023-11-14 10:13:59.289212
1392	6	529	2023-11-14 10:14:04.122642	2023-11-14 10:14:04.122642
1393	6	528	2023-11-14 10:14:13.135536	2023-11-14 10:14:13.135536
1394	6	527	2023-11-14 10:14:22.724272	2023-11-14 10:14:22.724272
1395	6	526	2023-11-14 10:14:27.070021	2023-11-14 10:14:27.070021
1396	6	525	2023-11-14 10:14:34.549909	2023-11-14 10:14:34.549909
1397	6	524	2023-11-14 10:14:37.868316	2023-11-14 10:14:37.868316
1398	6	523	2023-11-14 10:14:40.714368	2023-11-14 10:14:40.714368
1399	6	522	2023-11-14 10:14:43.640361	2023-11-14 10:14:43.640361
1402	1	534	2023-11-14 19:37:29.273776	2023-11-14 19:37:29.273776
1408	6	541	2023-11-15 07:21:57.462753	2023-11-15 07:21:57.462753
1409	6	540	2023-11-15 07:22:11.504698	2023-11-15 07:22:11.504698
1410	6	539	2023-11-15 07:22:31.104386	2023-11-15 07:22:31.104386
1411	6	538	2023-11-15 07:22:36.315596	2023-11-15 07:22:36.315596
1412	6	537	2023-11-15 07:22:46.072587	2023-11-15 07:22:46.072587
1413	6	536	2023-11-15 07:22:55.168855	2023-11-15 07:22:55.168855
1414	6	535	2023-11-15 07:22:58.557769	2023-11-15 07:22:58.557769
1415	6	534	2023-11-15 07:23:04.396957	2023-11-15 07:23:04.396957
1416	6	533	2023-11-15 07:23:09.174145	2023-11-15 07:23:09.174145
1418	1	543	2023-11-16 17:46:55.021687	2023-11-16 17:46:55.021687
1419	1	542	2023-11-16 17:46:59.184774	2023-11-16 17:46:59.184774
1420	1	541	2023-11-16 17:47:14.304186	2023-11-16 17:47:14.304186
1423	2	553	2023-11-18 17:56:52.603202	2023-11-18 17:56:52.603202
1424	2	554	2023-11-18 17:56:55.987735	2023-11-18 17:56:55.987735
1427	6	552	2023-11-19 08:12:41.816753	2023-11-19 08:12:41.816753
1428	6	551	2023-11-19 08:12:46.182044	2023-11-19 08:12:46.182044
1429	6	550	2023-11-19 08:12:49.09697	2023-11-19 08:12:49.09697
1430	6	549	2023-11-19 08:12:52.660414	2023-11-19 08:12:52.660414
1431	6	548	2023-11-19 08:12:59.53037	2023-11-19 08:12:59.53037
1432	6	547	2023-11-19 08:13:03.223411	2023-11-19 08:13:03.223411
1435	5	558	2023-11-19 18:19:40.025578	2023-11-19 18:19:40.025578
1439	23	556	2023-11-20 17:55:56.356998	2023-11-20 17:55:56.356998
1442	6	563	2023-11-21 07:25:23.993711	2023-11-21 07:25:23.993711
1444	5	564	2023-11-21 14:34:22.892684	2023-11-21 14:34:22.892684
1455	5	570	2023-11-21 19:52:03.95144	2023-11-21 19:52:03.95144
1456	5	566	2023-11-21 19:52:19.360549	2023-11-21 19:52:19.360549
1457	5	567	2023-11-21 19:52:23.357282	2023-11-21 19:52:23.357282
1458	5	569	2023-11-21 19:52:30.239391	2023-11-21 19:52:30.239391
1463	6	566	2023-11-21 19:53:29.814372	2023-11-21 19:53:29.814372
1464	10	564	2023-11-21 19:53:32.113801	2023-11-21 19:53:32.113801
1467	1	573	2023-11-21 20:10:28.193084	2023-11-21 20:10:28.193084
1468	1	572	2023-11-21 20:10:31.862863	2023-11-21 20:10:31.862863
1469	1	571	2023-11-21 20:10:34.3161	2023-11-21 20:10:34.3161
1470	1	570	2023-11-21 20:10:37.781168	2023-11-21 20:10:37.781168
1471	1	569	2023-11-21 20:10:40.065612	2023-11-21 20:10:40.065612
1472	1	568	2023-11-21 20:10:42.782582	2023-11-21 20:10:42.782582
1473	1	567	2023-11-21 20:10:45.674933	2023-11-21 20:10:45.674933
1482	23	575	2023-11-22 20:35:07.073943	2023-11-22 20:35:07.073943
1483	6	577	2023-11-23 14:29:32.445191	2023-11-23 14:29:32.445191
1484	9	578	2023-11-23 16:30:03.494709	2023-11-23 16:30:03.494709
1485	5	579	2023-11-23 17:09:49.317052	2023-11-23 17:09:49.317052
1486	6	579	2023-11-23 17:21:11.523902	2023-11-23 17:21:11.523902
1487	1	579	2023-11-24 14:02:45.33212	2023-11-24 14:02:45.33212
1488	1	578	2023-11-24 14:02:48.036841	2023-11-24 14:02:48.036841
1489	1	577	2023-11-24 14:02:51.461284	2023-11-24 14:02:51.461284
1490	1	576	2023-11-24 14:02:56.221439	2023-11-24 14:02:56.221439
1491	1	575	2023-11-24 14:03:02.228269	2023-11-24 14:03:02.228269
1492	9	581	2023-11-24 18:06:42.857491	2023-11-24 18:06:42.857491
1494	2	587	2023-11-26 07:58:24.019399	2023-11-26 07:58:24.019399
1495	2	586	2023-11-26 07:58:28.799991	2023-11-26 07:58:28.799991
1496	2	585	2023-11-26 07:58:32.707994	2023-11-26 07:58:32.707994
1497	2	584	2023-11-26 07:58:35.981524	2023-11-26 07:58:35.981524
1498	2	583	2023-11-26 07:58:39.893392	2023-11-26 07:58:39.893392
1499	2	582	2023-11-26 07:58:49.245747	2023-11-26 07:58:49.245747
1500	2	581	2023-11-26 07:58:52.151234	2023-11-26 07:58:52.151234
1501	2	580	2023-11-26 07:58:55.050398	2023-11-26 07:58:55.050398
1502	2	579	2023-11-26 07:58:59.640506	2023-11-26 07:58:59.640506
1503	2	578	2023-11-26 07:59:11.55908	2023-11-26 07:59:11.55908
1504	5	587	2023-11-26 15:18:03.023935	2023-11-26 15:18:03.023935
1505	5	589	2023-11-28 19:11:33.421205	2023-11-28 19:11:33.421205
1506	11	590	2023-11-28 19:32:06.65843	2023-11-28 19:32:06.65843
1507	1	591	2023-11-28 19:50:45.063566	2023-11-28 19:50:45.063566
1508	1	590	2023-11-28 19:50:49.35634	2023-11-28 19:50:49.35634
1509	1	589	2023-11-28 19:50:55.356387	2023-11-28 19:50:55.356387
1510	1	588	2023-11-28 19:51:02.204771	2023-11-28 19:51:02.204771
1511	1	587	2023-11-28 19:51:06.04251	2023-11-28 19:51:06.04251
1512	1	586	2023-11-28 19:51:10.354662	2023-11-28 19:51:10.354662
1513	1	585	2023-11-28 19:51:14.722014	2023-11-28 19:51:14.722014
1514	1	584	2023-11-28 19:51:21.128174	2023-11-28 19:51:21.128174
1515	1	583	2023-11-28 19:51:24.91334	2023-11-28 19:51:24.91334
1516	1	582	2023-11-28 19:51:27.674279	2023-11-28 19:51:27.674279
1517	6	591	2023-11-29 09:39:38.826791	2023-11-29 09:39:38.826791
1518	6	590	2023-11-29 09:39:43.178503	2023-11-29 09:39:43.178503
1519	6	589	2023-11-29 09:39:46.369253	2023-11-29 09:39:46.369253
1520	9	592	2023-11-29 16:15:57.222468	2023-11-29 16:15:57.222468
1523	9	590	2023-11-29 16:34:50.693508	2023-11-29 16:34:50.693508
1524	9	591	2023-11-29 16:35:24.656641	2023-11-29 16:35:24.656641
1525	5	591	2023-11-29 22:05:56.317797	2023-11-29 22:05:56.317797
1526	5	592	2023-11-29 22:06:00.749744	2023-11-29 22:06:00.749744
1527	5	593	2023-11-29 22:06:05.112192	2023-11-29 22:06:05.112192
1529	6	593	2023-11-30 09:23:38.697116	2023-11-30 09:23:38.697116
1530	1	593	2023-11-30 13:15:20.205933	2023-11-30 13:15:20.205933
1531	1	592	2023-11-30 13:15:22.269655	2023-11-30 13:15:22.269655
1532	11	593	2023-11-30 19:42:16.902071	2023-11-30 19:42:16.902071
1533	11	592	2023-11-30 19:42:20.300642	2023-11-30 19:42:20.300642
1534	11	591	2023-11-30 19:42:35.3562	2023-11-30 19:42:35.3562
1535	11	589	2023-11-30 19:42:52.059242	2023-11-30 19:42:52.059242
1536	5	597	2023-12-05 18:45:10.175881	2023-12-05 18:45:10.175881
1537	1	597	2023-12-05 20:31:38.906725	2023-12-05 20:31:38.906725
1538	1	598	2023-12-05 20:31:48.039416	2023-12-05 20:31:48.039416
1539	23	597	2023-12-05 20:58:57.061313	2023-12-05 20:58:57.061313
1540	23	598	2023-12-05 20:59:03.451329	2023-12-05 20:59:03.451329
1541	23	599	2023-12-05 20:59:06.38409	2023-12-05 20:59:06.38409
1542	9	599	2023-12-07 19:10:49.292052	2023-12-07 19:10:49.292052
1543	9	594	2023-12-07 19:11:57.183526	2023-12-07 19:11:57.183526
1544	9	595	2023-12-07 19:12:00.48659	2023-12-07 19:12:00.48659
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."notifications" ("id", "recipient_type", "recipient_id", "type", "params", "read_at", "created_at", "updated_at") FROM stdin;
2	User	11	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/4"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/27"},"_aj_symbol_keys":["comment","activity"]}	2023-07-10 21:36:26.723371	2023-07-07 13:19:23.644374	2023-07-10 21:36:26.723385
3	User	11	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/5"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/27"},"_aj_symbol_keys":["comment","activity"]}	2023-07-10 21:36:26.723371	2023-07-08 08:00:02.05167	2023-07-10 21:36:26.723385
4	User	3	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/6"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/32"},"_aj_symbol_keys":["comment","activity"]}	2023-07-13 14:42:00.70652	2023-07-09 16:04:25.324347	2023-07-13 14:42:00.706536
6	User	9	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/8"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/133"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-09-03 18:29:34.16278	2023-09-03 18:29:34.16278
1	User	6	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/3"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/14"},"_aj_symbol_keys":["comment","activity"]}	2023-09-03 18:59:02.225031	2023-07-07 11:32:36.329064	2023-09-03 18:59:02.225046
7	User	8	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/9"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/142"},"_aj_symbol_keys":["comment","activity"]}	2023-09-10 10:43:43.850973	2023-09-05 07:21:01.598978	2023-09-10 10:43:43.850988
8	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/10"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/165"},"_aj_symbol_keys":["comment","activity"]}	2023-09-12 18:28:18.779994	2023-09-08 18:56:18.824705	2023-09-12 18:28:18.780008
5	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/7"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/116"},"_aj_symbol_keys":["comment","activity"]}	2023-09-12 18:28:18.779994	2023-09-01 13:03:13.361955	2023-09-12 18:28:18.780008
11	User	1	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/13"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/196"},"_aj_symbol_keys":["comment","activity"]}	2023-09-17 16:23:25.104953	2023-09-16 13:09:04.71686	2023-09-17 16:23:25.104972
12	User	10	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/14"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/201"},"_aj_symbol_keys":["comment","activity"]}	2023-09-19 18:55:28.501396	2023-09-16 13:09:45.859569	2023-09-19 18:55:28.501411
14	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/16"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/278"},"_aj_symbol_keys":["comment","activity"]}	2023-10-05 19:03:39.931377	2023-10-02 09:27:53.418621	2023-10-05 19:03:39.931392
13	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/15"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/278"},"_aj_symbol_keys":["comment","activity"]}	2023-10-05 19:03:39.931377	2023-10-01 12:30:21.966102	2023-10-05 19:03:39.931392
10	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/12"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/197"},"_aj_symbol_keys":["comment","activity"]}	2023-10-05 19:03:39.931377	2023-09-16 13:08:38.502737	2023-10-05 19:03:39.931392
9	User	11	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/11"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/190"},"_aj_symbol_keys":["comment","activity"]}	2023-10-05 21:27:42.264717	2023-09-12 19:40:45.022151	2023-10-05 21:27:42.264733
15	User	9	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/17"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/328"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-11 15:58:52.302063	2023-10-11 15:58:52.302063
16	User	9	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/18"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/328"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-11 16:01:06.725359	2023-10-11 16:01:06.725359
17	User	8	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/19"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/332"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-12 05:53:09.293534	2023-10-12 05:53:09.293534
18	User	5	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/20"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/331"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-12 05:53:29.823898	2023-10-12 05:53:29.823898
19	User	2	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/21"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/377"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-21 20:25:02.09403	2023-10-21 20:25:02.09403
20	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/22"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/386"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-10-22 11:54:06.345265	2023-10-22 11:54:06.345265
21	User	3	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/23"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/483"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-06 18:52:25.659923	2023-11-06 18:52:25.659923
22	User	4	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/24"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/502"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-08 21:19:57.028321	2023-11-08 21:19:57.028321
23	User	11	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/25"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/514"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-10 09:08:58.806892	2023-11-10 09:08:58.806892
24	User	6	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/26"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/532"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-14 19:40:59.08922	2023-11-14 19:40:59.08922
25	User	6	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/27"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/532"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-15 14:54:22.596376	2023-11-15 14:54:22.596376
26	User	6	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/28"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/542"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-16 10:05:40.265027	2023-11-16 10:05:40.265027
27	User	3	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/29"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/552"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-17 07:58:49.493974	2023-11-17 07:58:49.493974
28	User	9	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/30"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/579"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-23 17:11:25.979879	2023-11-23 17:11:25.979879
29	User	5	CommentNotification	{"comment":{"_aj_globalid":"gid://rozbiegana/Comment/31"},"activity":{"_aj_globalid":"gid://rozbiegana/Activity/590"},"_aj_symbol_keys":["comment","activity"]}	\N	2023-11-28 19:32:22.767321	2023-11-28 19:32:22.767321
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."schema_migrations" ("version") FROM stdin;
20230504122829
20230505094209
20230505101739
20230505112442
20230505112604
20230513174526
20230514130455
20230515113053
20230522122353
20230705091030
20230817054607
20230817054827
20230817122155
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."teams" ("id", "name", "created_at", "updated_at") FROM stdin;
1	niesklasyfikowany	2023-08-17 10:34:54.728407	2023-08-17 10:34:54.728407
2	Pomarańczowi	2023-08-17 10:34:54.732117	2023-08-17 10:34:54.732117
3	Zieloni	2023-08-17 10:34:54.735023	2023-08-17 10:34:54.735023
4	Niebiescy	2023-08-17 10:34:54.737782	2023-08-17 10:34:54.737782
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "public"."users" ("id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "created_at", "updated_at", "username", "team_id") FROM stdin;
20	jackiewiczmarek1@wp.pl	$2a$12$ZAM9xtHbdektKMCDPH7KEu58rGKaAaR.Lw49eltPZn8ga0fWRRslC	\N	\N	\N	2023-08-30 14:22:57.705392	2023-08-30 14:22:57.705392	Marek Jackiewicz	1
10	asiafabianska@wp.pl	$2a$12$o1Vc3cOvwoyO10EgTuoXUOTbNGInEJAw6hR9k96Y.pHcr.Q03LNxC	\N	\N	\N	2023-07-03 20:47:11.597239	2023-12-02 09:49:45.38204	Asia Fabiańska 	1
17	maja.urbanek@vp.pl	$2a$12$YnTZLcydLX915vYZmbXakOq74ZmQ5OGtVJ6T.I.mFSzKJSZy6MXpu	\N	\N	\N	2023-08-29 20:50:01.664186	2023-12-02 09:49:45.39385	Maja Urbanek	1
21	kzborala@wp.pl	$2a$12$M5KOCK27Y3YD3nqwpT1vuu83BY5IeOoJYKRLEKxgk1zK.50CwVyWe	\N	\N	2023-09-01 15:43:16.461068	2023-08-31 08:02:58.944707	2023-12-02 09:49:45.398104	Krzysztof Zboralski	1
22	tszwagrowski@gmail.com	$2a$12$65d1Dfqkzj0.KA3DDTZht.pG9LaTbswkgw1dfQpUzssjWfYCpvlsy	\N	\N	\N	2023-10-23 12:39:25.749277	2023-11-01 18:55:25.00938	Tomasz Szwagrowski 	1
18	malgorzataszczudlinska@wp.pl	$2a$12$/S6roLPOVcnCd5n45DnEMOmlUj5453jmXrzj7jRQyXSEyjuWcJYGu	\N	\N	\N	2023-08-29 20:53:28.155982	2023-12-02 09:49:45.400862	Małgorzata Kusz 	1
6	dm77@vp.pl	$2a$12$1QiDdr2ImEKC4pn7pk3u1OupwXLfxfRzJXpVXA0sBTvk8atZf.3fq	\N	\N	2023-09-07 14:55:25.464702	2023-07-02 20:19:53.98601	2023-12-02 09:49:45.513078	Damian Majer	1
14	ratajczak.marcin@allianz.com.pl	$2a$12$HGPHiVH7VbcGtcYr5SaNwulfCTNvp908Bxjb.yrvRGA4pF.NN5liy	9d5235e0589b328f3c55cd9bd533f4f07864c9283983415f6783d5f0f6b1f11a	2023-09-02 15:17:09.261435	\N	2023-07-08 13:52:32.293517	2023-12-02 09:49:45.402976	Marcin Ratajczak 	1
11	n3m05@wp.pl	$2a$12$HNQDiF3sdjO0wwf6o7tRAuSxRRc.PZA4t3pv7yopYHJcmU2nn9t7.	\N	\N	\N	2023-07-07 11:30:58.709829	2023-12-02 09:49:45.404809	Piotr Klamecki 	1
1	michal.sieradzki@mail.com	$2a$12$w/ZvSJaJwZn06JHRJULx6.zd2qNaW.a2mCj5X1.BYsEqmhz7MMuXm	\N	\N	\N	2023-06-02 13:22:26.017479	2023-12-02 09:49:45.406686	Michał Sieradzki	1
4	adam-renata@wp.pl	$2a$12$kcWFeyJnYafb/IyfLaeFWu55Fq/nlrePbyraebIpNYZxltmgu.9SS	\N	\N	\N	2023-07-02 19:49:13.497745	2023-12-02 09:49:45.408458	Adam Molenda	1
19	tomaszszwagrowski@onet.pl	$2a$12$exwj8ahvgwXo3Ga5oS.hqObQSNqv0kp3CiJreE9IVj11iLdoleBVi	\N	\N	\N	2023-08-29 20:58:45.756329	2023-12-02 09:49:45.410135	Tomasz Szwagrowski	1
23	dkanarek@poczta.onet.pl	$2a$12$vQ57hOsKYOUJuL2Aj4.tJOMAsYpcgPqEqnaZDNxvldVKc8BcIvMPq	\N	\N	2023-11-02 19:45:30.857204	2023-10-31 20:32:42.87301	2023-12-02 09:49:45.411836	Dorota 	1
8	d.szymanski86@wp.pl	$2a$12$hGAvCq2RA7vjZvpWUzrrZuktIEqbPaSGujEjpjzUjUxYTbXR3Z1Oa	\N	\N	2023-08-29 21:20:16.350952	2023-07-03 18:35:33.056215	2023-12-02 09:49:45.413616	Damian Szymański 	1
5	juskowiakartur@o2.pl	$2a$12$M6tYVRiQ4c1DthKNM5wDou/60qVEXp35RE0BSRn3Y5tmEMeQVsapK	\N	\N	2023-07-03 18:15:37.005351	2023-07-02 19:53:29.191815	2023-12-02 09:49:45.416056	Dorota Juskowiak 	1
12	piotrekfab5@wp.pl	$2a$12$30sz7y5.IXJX0PXwuYFUaOhXC23Pu.gxrnf.7HJktBFN8fdjJVylC	\N	\N	\N	2023-07-07 11:38:56.513002	2023-12-02 09:49:45.494131	Piotr Fabiański 	1
3	iga.sieradzka@o2.pl	$2a$12$Ej.lveCqJgT1pU5elNDrkOwIkEY.OV888A0MHrpCU4hc.LsmCLV0G	\N	\N	\N	2023-06-30 21:27:55.420023	2023-12-02 09:49:45.501761	Iga Sieradzka	1
13	justynkajuskowiak@wp.pl	$2a$12$j5MmbGyzzFnFfGh1e9gKpOLPMBJb4hFio9xPtPUtZj0AOY.Ilu4JO	\N	\N	\N	2023-07-07 12:19:33.037117	2023-12-02 09:49:45.505751	Justyna Juskowiak	1
7	szkanarek@gmail.com	$2a$12$CB4nvWS9cqVkkKkXYuDjz.CpV3yMJPwHGda969d19Jx5/BFYsT3.O	\N	\N	\N	2023-07-02 20:29:53.788234	2023-12-02 09:49:45.509279	Szymon Kanarek	1
2	paulina.grzelak17@wp.pl	$2a$12$KIK5PdDmXsz.gw6rRreT1eyiMgd63x06tIdnjC3VFTRMG5VLJ8wIm	\N	\N	\N	2023-06-30 13:35:44.224398	2023-12-02 09:49:45.511187	Paulina Klamecka 	1
9	b.chmielecka39@gmail.com	$2a$12$RPDbonxXnHhHxIe3fc8Hj.lYxz685UrgmM4h68kWE.oATyfv2zvka	\N	\N	2023-08-21 20:51:49.853634	2023-07-03 18:46:52.462652	2023-12-02 09:49:45.514909	Bożena Chmielecka 	1
15	jerzy.czepiel@smartshack.pl	$2a$12$.43ALIX8RrwIDVw5sexew.OzsIDMRMPqgq6Y5PmLIGQ27IMTe8kgG	\N	\N	\N	2023-08-10 07:39:28.120227	2023-08-17 11:29:47.174684	Jerzy Czepiel	1
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."action_text_rich_texts_id_seq"', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."active_storage_attachments_id_seq"', 632, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."active_storage_blobs_id_seq"', 632, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."active_storage_variant_records_id_seq"', 1, false);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."activities_id_seq"', 610, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."comments_id_seq"', 31, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."likes_id_seq"', 1545, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."notifications_id_seq"', 29, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."teams_id_seq"', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 23, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."action_text_rich_texts"
    ADD CONSTRAINT "action_text_rich_texts_pkey" PRIMARY KEY ("id");


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_attachments"
    ADD CONSTRAINT "active_storage_attachments_pkey" PRIMARY KEY ("id");


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_blobs"
    ADD CONSTRAINT "active_storage_blobs_pkey" PRIMARY KEY ("id");


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_variant_records"
    ADD CONSTRAINT "active_storage_variant_records_pkey" PRIMARY KEY ("id");


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."activities"
    ADD CONSTRAINT "activities_pkey" PRIMARY KEY ("id");


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."ar_internal_metadata"
    ADD CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key");


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."comments"
    ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("id");


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "likes_pkey" PRIMARY KEY ("id");


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."teams"
    ADD CONSTRAINT "teams_pkey" PRIMARY KEY ("id");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_action_text_rich_texts_uniqueness" ON "public"."action_text_rich_texts" USING "btree" ("record_type", "record_id", "name");


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "public"."active_storage_attachments" USING "btree" ("blob_id");


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "public"."active_storage_attachments" USING "btree" ("record_type", "record_id", "name", "blob_id");


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "public"."active_storage_blobs" USING "btree" ("key");


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "public"."active_storage_variant_records" USING "btree" ("blob_id", "variation_digest");


--
-- Name: index_activities_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_activities_on_user_id" ON "public"."activities" USING "btree" ("user_id");


--
-- Name: index_comments_on_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_comments_on_activity_id" ON "public"."comments" USING "btree" ("activity_id");


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_comments_on_user_id" ON "public"."comments" USING "btree" ("user_id");


--
-- Name: index_likes_on_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_likes_on_activity_id" ON "public"."likes" USING "btree" ("activity_id");


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_likes_on_user_id" ON "public"."likes" USING "btree" ("user_id");


--
-- Name: index_likes_on_user_id_and_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_likes_on_user_id_and_activity_id" ON "public"."likes" USING "btree" ("user_id", "activity_id");


--
-- Name: index_notifications_on_read_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_notifications_on_read_at" ON "public"."notifications" USING "btree" ("read_at");


--
-- Name: index_notifications_on_recipient; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_notifications_on_recipient" ON "public"."notifications" USING "btree" ("recipient_type", "recipient_id");


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_users_on_email" ON "public"."users" USING "btree" ("email");


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "public"."users" USING "btree" ("reset_password_token");


--
-- Name: index_users_on_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "index_users_on_team_id" ON "public"."users" USING "btree" ("team_id");


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."comments"
    ADD CONSTRAINT "fk_rails_03de2dc08c" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "fk_rails_1e09b5dabf" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");


--
-- Name: comments fk_rails_4a8da7c691; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."comments"
    ADD CONSTRAINT "fk_rails_4a8da7c691" FOREIGN KEY ("activity_id") REFERENCES "public"."activities"("id");


--
-- Name: activities fk_rails_7e11bb717f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."activities"
    ADD CONSTRAINT "fk_rails_7e11bb717f" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_variant_records"
    ADD CONSTRAINT "fk_rails_993965df05" FOREIGN KEY ("blob_id") REFERENCES "public"."active_storage_blobs"("id");


--
-- Name: likes fk_rails_b081767325; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "fk_rails_b081767325" FOREIGN KEY ("activity_id") REFERENCES "public"."activities"("id");


--
-- Name: users fk_rails_b2bbf87303; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "fk_rails_b2bbf87303" FOREIGN KEY ("team_id") REFERENCES "public"."teams"("id");


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."active_storage_attachments"
    ADD CONSTRAINT "fk_rails_c3b3935057" FOREIGN KEY ("blob_id") REFERENCES "public"."active_storage_blobs"("id");


--
-- PostgreSQL database dump complete
--

