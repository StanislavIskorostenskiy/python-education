--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

ALTER TABLE ONLY public.user_profile_userprofile DROP CONSTRAINT user_profile_userprofile_user_id_84fd5b2a_fk_auth_user_id;
ALTER TABLE ONLY public.education_topic DROP CONSTRAINT education_topic_user_profile_id_8c2d7b54_fk_user_prof;
ALTER TABLE ONLY public.education_snippet DROP CONSTRAINT education_snippet_user_profile_id_26914182_fk_user_prof;
ALTER TABLE ONLY public.education_snippet DROP CONSTRAINT education_snippet_topic_id_ce52bf0f_fk_education_topic_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.education_topic_user_profile_id_8c2d7b54;
DROP INDEX public.education_snippet_user_profile_id_26914182;
DROP INDEX public.education_snippet_topic_id_ce52bf0f;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.user_profile_userprofile DROP CONSTRAINT user_profile_userprofile_user_id_key;
ALTER TABLE ONLY public.user_profile_userprofile DROP CONSTRAINT user_profile_userprofile_pkey;
ALTER TABLE ONLY public.education_topic DROP CONSTRAINT education_topic_pkey;
ALTER TABLE ONLY public.education_snippet DROP CONSTRAINT education_snippet_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
DROP TABLE public.user_profile_userprofile;
DROP TABLE public.education_topic;
DROP TABLE public.education_snippet;
DROP TABLE public.django_session;
DROP TABLE public.django_migrations;
DROP TABLE public.django_content_type;
DROP TABLE public.django_admin_log;
DROP TABLE public.auth_user_user_permissions;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_group_permissions;
DROP TABLE public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO abc_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO abc_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO abc_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO abc_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO abc_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO abc_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO abc_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO abc_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO abc_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO abc_user;

--
-- Name: education_snippet; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.education_snippet (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    topic_id integer,
    user_profile_id integer,
    complexity character varying(50) NOT NULL,
    example text NOT NULL
);


ALTER TABLE public.education_snippet OWNER TO abc_user;

--
-- Name: education_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.education_snippet ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.education_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: education_topic; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.education_topic (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    user_profile_id integer
);


ALTER TABLE public.education_topic OWNER TO abc_user;

--
-- Name: education_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.education_topic ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.education_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_profile_userprofile; Type: TABLE; Schema: public; Owner: abc_user
--

CREATE TABLE public.user_profile_userprofile (
    id integer NOT NULL,
    name character varying(140),
    password_recovery_key character varying(32),
    last_login_date timestamp with time zone,
    creation_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_profile_userprofile OWNER TO abc_user;

--
-- Name: user_profile_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: abc_user
--

ALTER TABLE public.user_profile_userprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_profile_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add topic	7	add_topic
26	Can change topic	7	change_topic
27	Can delete topic	7	delete_topic
28	Can view topic	7	view_topic
29	Can add snippet	8	add_snippet
30	Can change snippet	8	change_snippet
31	Can delete snippet	8	delete_snippet
32	Can view snippet	8	view_snippet
33	Can add user profile	9	add_userprofile
34	Can change user profile	9	change_userprofile
35	Can delete user profile	9	delete_userprofile
36	Can view user profile	9	view_userprofile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
17	pbkdf2_sha256$390000$43WTDl7rPozwhUXv9DqcVS$3/x0hvZKBAzbBzYCC2Mjr6h6+Zk5z+8FrsgTq1STpzg=	2023-05-31 05:55:41.787339+00	f	danil.of.viktor@gmail.com	Виктор	Данилов	danil.of.viktor@gmail.com	f	t	2023-05-31 05:55:41.460993+00
18	pbkdf2_sha256$390000$kbl3iDKE4yixWnRmy4cB4U$unY0NDQTIrANrQNK28wAb0RjAjhYWF+OPj3Q6UzIoTs=	2023-05-31 06:50:26.444301+00	f	bender15505@gmail.com	Илья	Власов	bender15505@gmail.com	f	t	2023-05-31 06:50:26.074371+00
19	pbkdf2_sha256$390000$wAaHELKdy5EXjFdhkveVpu$G8AZTi02dNlyEla1k/VFl8cQXDHAOSt0V/peczWEz18=	2023-05-31 09:18:05.346306+00	f	krut-deni@mail.ru	Кекс 	Денисович	krut-deni@mail.ru	f	t	2023-05-31 09:18:04.948844+00
1	pbkdf2_sha256$390000$OLWzJR2bepfPZFZganXZCm$rdbOugVTSZkSXRZJR2nwuSB9TtH6KvOgx/PmNtGF/ME=	2023-05-31 09:21:06.131106+00	t	abc@abc.abc	user	userovich	abc@abc.abc	t	t	2023-04-21 11:19:41.37923+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	education	topic
8	education	snippet
9	user_profile	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-04-21 11:12:48.681912+00
2	auth	0001_initial	2023-04-21 11:12:48.846973+00
3	admin	0001_initial	2023-04-21 11:12:48.892995+00
4	admin	0002_logentry_remove_auto_add	2023-04-21 11:12:48.909099+00
5	admin	0003_logentry_add_action_flag_choices	2023-04-21 11:12:48.924796+00
6	contenttypes	0002_remove_content_type_name	2023-04-21 11:12:48.966976+00
7	auth	0002_alter_permission_name_max_length	2023-04-21 11:12:48.988504+00
8	auth	0003_alter_user_email_max_length	2023-04-21 11:12:49.011995+00
9	auth	0004_alter_user_username_opts	2023-04-21 11:12:49.032596+00
10	auth	0005_alter_user_last_login_null	2023-04-21 11:12:49.053579+00
11	auth	0006_require_contenttypes_0002	2023-04-21 11:12:49.058725+00
12	auth	0007_alter_validators_add_error_messages	2023-04-21 11:12:49.083805+00
13	auth	0008_alter_user_username_max_length	2023-04-21 11:12:49.107427+00
14	auth	0009_alter_user_last_name_max_length	2023-04-21 11:12:49.129553+00
15	auth	0010_alter_group_name_max_length	2023-04-21 11:12:49.155313+00
16	auth	0011_update_proxy_permissions	2023-04-21 11:12:49.174752+00
17	auth	0012_alter_user_first_name_max_length	2023-04-21 11:12:49.192819+00
18	user_profile	0001_initial	2023-04-21 11:12:49.224102+00
19	education	0001_initial	2023-04-21 11:12:49.317009+00
20	education	0002_snippet_complexity_snippet_example	2023-04-21 11:12:49.354791+00
21	education	0003_alter_snippet_complexity_alter_snippet_description_and_more	2023-04-21 11:12:49.395924+00
22	education	0004_alter_snippet_complexity	2023-04-21 11:12:49.414405+00
23	education	0005_alter_topic_description	2023-04-21 11:12:49.436179+00
24	sessions	0001_initial	2023-04-21 11:12:49.462898+00
25	education	0006_remove_snippet_question	2023-05-26 06:52:45.602653+00
26	education	0007_remove_snippet_answer	2023-05-26 06:52:45.625461+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
oa90zpq9u4x7zj1704hepc0kvpteu879	.eJxVjUsOAiEQBe_C2hDB4dMu3XsG0g2NjBpIhpmV8e5KMgvdvqrUe4mA21rC1nkJcxJnocThdyOMD64DpDvWW5Ox1XWZSQ5F7rTLa0v8vOzuX6BgLyObE5B2iaMzmrM6sXIOTDziBBasIqMBWFvrPYJnzYp91mSm7wV7AvH-AOF7N_k:1pppLJ:2Mh9cOTnN9uES-1qMYWWpJajtGLQUucFn1rUkBJxsTQ	2023-05-05 11:54:21.149365+00
y144atcy80i8msr4d5kcokyl0ts9rnzo	.eJxVjUsOAiEQBe_C2hDB4dMu3XsG0g2NjBpIhpmV8e5KMgvdvqrUe4mA21rC1nkJcxJnocThdyOMD64DpDvWW5Ox1XWZSQ5F7rTLa0v8vOzuX6BgLyObE5B2iaMzmrM6sXIOTDziBBasIqMBWFvrPYJnzYp91mSm7wV7AvH-AOF7N_k:1q2SYb:zdFte2Xs0tXyEMCoM88h0ShAn6k4hA_BIZBTw6osB68	2023-06-09 08:12:17.902383+00
ca5snlzix88bjvferzu4eafeqxbu1zit	.eJxVjUsOAiEQBe_C2hDB4dMu3XsG0g2NjBpIhpmV8e5KMgvdvqrUe4mA21rC1nkJcxJnocThdyOMD64DpDvWW5Ox1XWZSQ5F7rTLa0v8vOzuX6BgLyObE5B2iaMzmrM6sXIOTDziBBasIqMBWFvrPYJnzYp91mSm7wV7AvH-AOF7N_k:1q2ViT:vcBfCw2PfOM_cPaVBAbiw0wIPVvQH2qa1aw1SR44zkI	2023-06-09 11:34:41.159262+00
sin3ccfe2jawm34ozg4ow9bgklxwctoy	.eJxVjUsOAiEQBe_C2hDB4dMu3XsG0g2NjBpIhpmV8e5KMgvdvqrUe4mA21rC1nkJcxJnocThdyOMD64DpDvWW5Ox1XWZSQ5F7rTLa0v8vOzuX6BgLyObE5B2iaMzmrM6sXIOTDziBBasIqMBWFvrPYJnzYp91mSm7wV7AvH-AOF7N_k:1q44mn:gnCq_4fzX3aBYpBwZIkS0-E3yQbxmbao-YqbIUc9M24	2023-06-13 19:13:37.502621+00
dwed3kapktc22godjm0lg3m0aroj9guy	.eJxVjUsOAiEQBe_C2hDB4dMu3XsG0g2NjBpIhpmV8e5KMgvdvqrUe4mA21rC1nkJcxJnocThdyOMD64DpDvWW5Ox1XWZSQ5F7rTLa0v8vOzuX6BgLyObE5B2iaMzmrM6sXIOTDziBBasIqMBWFvrPYJnzYp91mSm7wV7AvH-AOF7N_k:1q4Eik:Rtd78FWjppn6YRxxyccFgQpBsEN0v5Aei6JHVaKO1zk	2023-06-14 05:50:06.822496+00
evfv9ukj84ey1cttbrp5t6ipkypzs87k	.eJxVjDsOwjAQBe_iGllZL_YaSnrOYK0_iwPIkeKkQtwdIqWA9s3Me6nA61LD2sscxqzOCrw6_I6R06O0jeQ7t9uk09SWeYx6U_ROu75OuTwvu_t3ULnXb-0EyEQ65gJCDl0SKGQ8DZ6cLTIQkLUoCF6YGCJ6PDkWtJRyNCjq_QHxlzeR:1q4Ff8:KfM4ptoWnpCNSfYkFIa-orW-iuuUJGrFozMJpbFrtO4	2023-06-14 06:50:26.448158+00
44wjm3ya7pftw2oqz4jdsrv5ms90v5ks	.eJxVjEEOwiAQRe_C2pChLdPi0r1nIAMzSNVAUtqV8e7apAvd_vfefylP25r91mTxM6uzMk6dfsdA8SFlJ3yncqs61rIuc9C7og_a9LWyPC-H-3eQqeVvnfqRjQzoWGzsxIEzMEnsaQhgUwKLgQdCCq6zADAG7nq0LiKBnQBRvT8OmTeh:1q4Hy1:IoWhPZcTxKwY4f4Fptvhp46qpfah1KjCc0fIQu86JqE	2023-06-14 09:18:05.351126+00
\.


--
-- Data for Name: education_snippet; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.education_snippet (id, name, description, creation_date, topic_id, user_profile_id, complexity, example) FROM stdin;
406	Enumerate	Функция *enumerate* применяется для так называемых итерируемых объектов (строки, списки, кортежи, словари, файлы) и создает объект-генератор, который генерирует кортежи, состоящие из двух элементов – индекса элемента и самого элемента.	2023-05-26 09:03:26.945623+00	18	\N		warriors = ["night_elf", "mage", "orc", "healer"]\r\n\r\nfor index, warrior in enumerate(warriors):\r\n    print(index, warrior)\r\n\r\n'''\r\n>>> 0 night_elf\r\n>>> 1 mage\r\n>>> 2 orc\r\n>>> 3 healer\r\n'''\r\n
407	Распаковка кортежа		2023-05-26 09:03:26.976334+00	19	\N		my_warriors = ("footman", "elf", "mage", "orc")\r\nfirst_warrior, *another_warriors = my_warriors\r\n\r\nprint(first_warrior)  # footman\r\nprint(another_warriors)  # ['elf', 'mage', 'orc']\r\n
408	Генератор словаря		2023-05-26 09:03:27.011011+00	20	\N		d = {f"key_{x}": f"value_{x}" for x in range(3)}\r\n# {'key_0': 'value_0', 'key_1': 'value_1', 'key_2': 'value_2'}\r\n
410	type	*type* работает как метакласс и создаёт класс на основе переданных параметров.	2023-05-26 09:03:27.067233+00	22	\N		warrior = type("Warrior", (),\r\n               {"name": "Footman", "attack": 25}\r\n               )\r\n\r\nprint(type(warrior))  # <class 'type'>\r\nprint(warrior)  # <class '__main__.Warrior'>\r\nprint(warrior.attack)  # 25\r\n
411	property	*@property* это "вычисляемый" атрибут класса.	2023-05-26 09:03:27.091835+00	22	\N		class BloodMage:\r\n    def __init__(self):\r\n        self.health = 100\r\n\r\n    @property\r\n    def attack(self):\r\n        if self.health < 10:\r\n            print("They shall burn!")\r\n            return self.health * 10\r\n        else:\r\n            print("Evil is near")\r\n            return self.health // 2\r\n\r\n\r\nblood_mage = BloodMage()\r\nprint('attack =', blood_mage.attack)\r\n# Evil is near attack = 50\r\n\r\nblood_mage.health = 9\r\nprint('attack =', blood_mage.attack)\r\n# They shall burn! attack = 90\r\n
412	classmethod	При помощи *@classmethod* можно реализовать подсчет количества экземпляров класса.	2023-05-26 09:03:27.134266+00	22	\N		class BloodMage:\r\n    called = 0\r\n\r\n    def __init__(self):\r\n        BloodMage.called += 1\r\n\r\n    @classmethod\r\n    def count_calls(cls):\r\n        return cls.called\r\n\r\n\r\nfor i in range(100):\r\n    BloodMage()\r\n\r\nprint(BloodMage.count_calls())\r\n# К count_calls можно обратиться через @classmethod\r\n\r\nprint(BloodMage.called)\r\n# Или напрямую\r\n
413	Магические методы	Магические методы в Python обслуживают стандартные функции и операторы.\r\nК примеру *str(obj) -> __str__*	2023-05-26 09:03:27.169675+00	22	\N		class Elf:\r\n    def __str__(self) -> str:\r\n        print("Vo slavu lesa!")\r\n        return "O chem shumyat derevya?"\r\n\r\n\r\nelf = Elf()\r\n\r\n# Вызываем __str__\r\ns = str(elf)  # Vo slavu lesa!\r\nprint(s)  # O chem shumyat derevya?\r\n
414	Функция как объект	В языке программирования Python все является объектом. Функция это тоже объект. Как и к любому объекту, к функции можно добавлять аттрибуты.	2023-05-26 09:03:27.209501+00	23	\N		def warcraft3_worker_click():\r\n    print("Yes milord?")\r\n    warcraft3_worker_click.clicked += 1\r\n\r\n\r\nwarcraft3_worker_click.clicked = 0\r\n\r\nfor i in range(4):\r\n    warcraft3_worker_click()  # Yes milord?\r\n\r\nprint(warcraft3_worker_click.clicked)  # 4\r\n
415	Сортировка функцией	Сортировка функцией последовательности в Python выполняется при помощи конструкции *sorted(iterable, key=sort_fn)*	2023-05-26 09:03:27.243544+00	23	\N		units = [\r\n    {"class": "Gryphon Rider", "attack": 50},\r\n    {"class": "Footman", "attack": 20},\r\n    {"class": "Sorceress", "attack": 25}\r\n\r\n]\r\n\r\n\r\ndef sort_my_units_by_attack(unit):\r\n    print(f"unit {unit['class']} attack {unit['attack']}")\r\n    '''\r\n    >>> unit Gryphon Rider attack 50\r\n    >>> unit Footman attack 20\r\n    >>> unit Sorceress attack 25\r\n    '''\r\n    return unit["attack"]\r\n\r\n\r\nunits = sorted(units, key=sort_my_units_by_attack)\r\nprint(units)  # [{'class': 'Footman', 'attack': 20}, ...\r\n
417	map	Функция высшего порядка *map* позволяет выполнять преобразования над элементами последовательности (список, кортеж, строка).	2023-05-26 09:03:27.299071+00	23	\N		my_warriors = ["footman", "mage", "orc", "healer"]\r\n\r\n# with lambda\r\nfirst_chars = map(lambda x: x[0], my_warriors)\r\nprint(list(first_chars))  # ['f', 'm', 'o', 'h']\r\n\r\n# with standart function\r\n\r\n\r\ndef get_first_chars(warrior):\r\n    return warrior[0]\r\n\r\n\r\nfirst_chars = map(get_first_chars, my_warriors)\r\nprint(list(first_chars))  # ['f', 'm', 'o', 'h']\r\n
418	filter	Функция высшего порядка *filter* позволяет отфильтровать последовательность.	2023-05-26 09:03:27.347108+00	23	\N		my_warriors = [\r\n    {"name": "footman", "attack": 10},\r\n    {"name": "knight", "attack": 20},\r\n    {"name": "griffon", "attack": 30},\r\n]\r\n\r\n\r\ndef remove_weak(warrior):\r\n    if warrior["attack"] > 20:\r\n        return True\r\n    else:\r\n        return False\r\n\r\n\r\nmy_warriors = filter(remove_weak, my_warriors)\r\nprint(list(my_warriors))  # [{'name': 'griffon', 'attack': 30}]\r\n
419	Генератор	Генератор можно прочитать только один раз.	2023-05-26 09:03:27.376368+00	23	\N		def troops():\r\n    yield "Footman"\r\n    yield "Rifleman"\r\n    yield "Knight"\r\n\r\n\r\ntroops = troops()\r\n\r\nfor troop in troops:\r\n    print(troop)\r\n    # Footman\r\n    # Rifleman\r\n    # Knight\r\n\r\nfor troop in troops:\r\n    print(troop)\r\n    # ...\r\n
420	Корутина		2023-05-26 09:03:27.413547+00	24	\N		import asyncio\r\n\r\n\r\nasync def call_elf(x):\r\n    # courutine\r\n    print(f"I stand ready {x}")\r\n\r\n\r\nasync def castle_fight_map():\r\n    # define coroutines\r\n    elf_1 = call_elf(1)\r\n    elf_2 = call_elf(2)\r\n\r\n    # for coroutine call use await\r\n    await elf_1  # "I stand ready 1"\r\n    await elf_2  # "I stand ready 2"\r\n\r\nasyncio.run(castle_fight_map())\r\n
421	contextmanager	*contextmanager* используется как декоратор для функции, превращая ее в контекстный менеджер.	2023-05-26 09:03:27.447116+00	25	\N		from contextlib import contextmanager\r\n\r\n\r\n@contextmanager\r\ndef ClickFootman(footman):\r\n    print("Yes my master?")\r\n    try:\r\n        yield footman\r\n    except ValueError:\r\n        print("Today i not work! Damn.")\r\n    except ArithmeticError:\r\n        pass\r\n\r\n\r\nclass Footman:\r\n    pass\r\n\r\n\r\nfootman = Footman()\r\n\r\nwith ClickFootman(footman) as clicked_footman:\r\n    pass\r\n\r\nwith ClickFootman(footman) as clicked_footman:\r\n    raise ArithmeticError\r\n\r\nwith ClickFootman(footman) as clicked_footman:\r\n    raise ValueError\r\n
416	Функция генератор	Число значений, которые возвращает функция-генератор равно «количеству» *yield* в ее теле.	2023-05-26 09:03:27.273781+00	23	\N	easy	def barracks():\r\n    yield "Footman"\r\n    yield "Rifleman"\r\n    yield "Knight"\r\n\r\n\r\nfor unit in barracks():\r\n    print(unit)  # Footman, Riffleman, Knight\r\n
422	iter, next	List, tuple, dict и sets — это все итерируемые объекты. Они являются итерируемыми контейнерами, из которых вы можете получить итератор. Все эти объекты имеют метод *iter()*, который используется для получения итератора.	2023-05-26 09:03:27.475611+00	25	\N		l = [1, 2, 3]\r\ni = iter(l)\r\n\r\nwhile True:\r\n    try:\r\n        print(next(i), i=4)\r\n    except StopIteration:\r\n        break\r\n\r\ntry:\r\n    print(next(i))\r\nexcept Exception as e:\r\n    print("called once")\r\n
423	Генератор четных чисел	Пример генератора считающего четные числа в заданном диапазоне.	2023-05-26 09:03:27.498364+00	25	\N		def CountEven(count_from, count_to):\r\n    for i in range(count_from, count_to + 1):\r\n        if i % 2 == 0:\r\n            yield i\r\n\r\n\r\nfor even_gen in CountEven(1, 11):\r\n    print(even_gen)\r\n
409	for .. else	Блок *else* будет выполнен, когда цикл завершится в нормальном режиме. Т.е. не будет вызван *break*.	2023-05-26 09:03:27.039782+00	21	\N	medium	class Footman:\r\n    def __init__(self, defence):\r\n        self.defence = defence\r\n\r\n\r\nfootmans = [Footman(x) for x in range(-1, 99)]\r\n\r\ncheck_footmans_defence = False\r\nfor footman in footmans:\r\n    if footman.defence < 0:\r\n        break\r\n    else:\r\n        check_footmans_defence = True\r\n\r\nif check_footmans_defence:\r\n    print("All footmans have defence")\r\nelse:\r\n    print("Fall of Lordaeron")\r\n
404	ord / chr	*ord* преобразование символа в Unicode.\r\n*chr* преобразование кода Unicode в символ.	2023-05-26 09:03:26.885126+00	17	\N	medium	# Выполняем преобразование символа в код Unicodee\r\nsmile = "😀"\r\nsmile_num_in_unicode = ord(smile)\r\nprint(smile_num_in_unicode)\r\n'''\r\n>>> 128512 \r\nномер в таблице Unicode\r\n'''\r\n\r\n# Выполняем преобразование кода Unicode в символ\r\nback_to_smile = chr(smile_num_in_unicode)\r\nprint(back_to_smile)\r\n'''\r\n>>> 😀 \r\n'''\r\n
405	Counter	*collections.Counter* позволяет считать количество элементов в последовательностях (list, tuple, str)	2023-05-26 09:03:26.921068+00	18	\N	easy	from collections import Counter\r\nmy_warriors = ["footman", "knight", "elf",\r\n               "footman", "knight", "elf"]\r\n\r\n\r\nfor count, warrior in Counter(my_warriors).items():\r\n    print(count, warrior)\r\n    # footman 2\r\n    # knight 2\r\n    # elf 2\r\n
\.


--
-- Data for Name: education_topic; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.education_topic (id, name, description, creation_date, user_profile_id) FROM stdin;
17	Строки		2023-05-26 09:03:17.716161+00	\N
18	Последовательности		2023-05-26 09:03:17.73327+00	\N
19	Кортежи		2023-05-26 09:03:17.739257+00	\N
20	Словари		2023-05-26 09:03:17.744903+00	\N
21	Циклы, условия		2023-05-26 09:03:17.753237+00	\N
22	Классы		2023-05-26 09:03:17.762288+00	\N
23	Функции		2023-05-26 09:03:17.775582+00	\N
24	Asyncio		2023-05-26 09:03:17.784782+00	\N
25	Итераторы, генераторы		2023-05-26 09:03:17.792754+00	\N
\.


--
-- Data for Name: user_profile_userprofile; Type: TABLE DATA; Schema: public; Owner: abc_user
--

COPY public.user_profile_userprofile (id, name, password_recovery_key, last_login_date, creation_date, user_id) FROM stdin;
1	user userovich	abc	\N	2023-04-21 11:19:42.088102+00	1
2	Виктор Данилов	\N	\N	2023-05-31 05:55:41.778263+00	17
3	Илья Власов	\N	\N	2023-05-31 06:50:26.434939+00	18
4	Кекс  Денисович	\N	\N	2023-05-31 09:18:05.335225+00	19
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 19, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: education_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.education_snippet_id_seq', 423, true);


--
-- Name: education_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.education_topic_id_seq', 25, true);


--
-- Name: user_profile_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abc_user
--

SELECT pg_catalog.setval('public.user_profile_userprofile_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: education_snippet education_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.education_snippet
    ADD CONSTRAINT education_snippet_pkey PRIMARY KEY (id);


--
-- Name: education_topic education_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.education_topic
    ADD CONSTRAINT education_topic_pkey PRIMARY KEY (id);


--
-- Name: user_profile_userprofile user_profile_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.user_profile_userprofile
    ADD CONSTRAINT user_profile_userprofile_pkey PRIMARY KEY (id);


--
-- Name: user_profile_userprofile user_profile_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.user_profile_userprofile
    ADD CONSTRAINT user_profile_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: education_snippet_topic_id_ce52bf0f; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX education_snippet_topic_id_ce52bf0f ON public.education_snippet USING btree (topic_id);


--
-- Name: education_snippet_user_profile_id_26914182; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX education_snippet_user_profile_id_26914182 ON public.education_snippet USING btree (user_profile_id);


--
-- Name: education_topic_user_profile_id_8c2d7b54; Type: INDEX; Schema: public; Owner: abc_user
--

CREATE INDEX education_topic_user_profile_id_8c2d7b54 ON public.education_topic USING btree (user_profile_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: education_snippet education_snippet_topic_id_ce52bf0f_fk_education_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.education_snippet
    ADD CONSTRAINT education_snippet_topic_id_ce52bf0f_fk_education_topic_id FOREIGN KEY (topic_id) REFERENCES public.education_topic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: education_snippet education_snippet_user_profile_id_26914182_fk_user_prof; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.education_snippet
    ADD CONSTRAINT education_snippet_user_profile_id_26914182_fk_user_prof FOREIGN KEY (user_profile_id) REFERENCES public.user_profile_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: education_topic education_topic_user_profile_id_8c2d7b54_fk_user_prof; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.education_topic
    ADD CONSTRAINT education_topic_user_profile_id_8c2d7b54_fk_user_prof FOREIGN KEY (user_profile_id) REFERENCES public.user_profile_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_profile_userprofile user_profile_userprofile_user_id_84fd5b2a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: abc_user
--

ALTER TABLE ONLY public.user_profile_userprofile
    ADD CONSTRAINT user_profile_userprofile_user_id_84fd5b2a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

