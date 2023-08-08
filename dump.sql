--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name text NOT NULL,
    author text,
    "isArchived" boolean DEFAULT false NOT NULL,
    accountable text,
    address text,
    contact text,
    document text,
    project_number text
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    wage integer NOT NULL,
    start_day timestamp(3) without time zone NOT NULL,
    name text NOT NULL,
    author text,
    address text,
    contact text,
    document text,
    obs text,
    pix text,
    fullname text,
    loan integer DEFAULT 0 NOT NULL,
    "isArchived" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees_food (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    type text NOT NULL,
    value integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    author text
);


ALTER TABLE public.employees_food OWNER TO postgres;

--
-- Name: employees_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_food_id_seq OWNER TO postgres;

--
-- Name: employees_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_food_id_seq OWNED BY public.employees_food.id;


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: employees_worked_days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees_worked_days (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    client_id integer NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.employees_worked_days OWNER TO postgres;

--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_worked_days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_worked_days_id_seq OWNER TO postgres;

--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_worked_days_id_seq OWNED BY public.employees_worked_days.id;


--
-- Name: incomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incomes (
    id integer NOT NULL,
    name text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_id integer NOT NULL,
    value integer NOT NULL,
    author text
);


ALTER TABLE public.incomes OWNER TO postgres;

--
-- Name: incomes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incomes_id_seq OWNER TO postgres;

--
-- Name: incomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incomes_id_seq OWNED BY public.incomes.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    invoice text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    store_id integer NOT NULL,
    client_id integer NOT NULL,
    value integer NOT NULL,
    value_negotiated integer,
    value_cash integer NOT NULL,
    value_financed integer NOT NULL,
    author text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    name text NOT NULL,
    author text,
    accountable text,
    address text,
    contact text
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    role_id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: employees_food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_food ALTER COLUMN id SET DEFAULT nextval('public.employees_food_id_seq'::regclass);


--
-- Name: employees_worked_days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days ALTER COLUMN id SET DEFAULT nextval('public.employees_worked_days_id_seq'::regclass);


--
-- Name: incomes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incomes ALTER COLUMN id SET DEFAULT nextval('public.incomes_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c506c9ca-821e-4706-a396-96978a789816	271ccc1259355f66850c6fb6539a46d002fed8cbb0cffbbc9a303b70451dc08b	2022-12-14 14:41:50.618545+00	20221027180716_create_database_default_v1	\N	\N	2022-12-14 14:41:50.564006+00	1
dca4810c-23cd-4387-b901-8249e2559a7d	193307977b9ec82a55b94e101acdbf4487dfb73ebf8eb3e63fdab1c9c1f983e2	2022-12-14 14:41:50.630045+00	20221027183330_alter_date_time_default_worked_days	\N	\N	2022-12-14 14:41:50.624877+00	1
abe6d2e7-6d26-4d7c-b8e4-422bc1114be9	553dac479b3eb51c41a03a7b3b5122c93d07df782bfd925e06bde537a3ed3e31	2022-12-14 14:41:50.639772+00	20221027183548_alter_date_time_default_general	\N	\N	2022-12-14 14:41:50.634349+00	1
a6fed643-d70d-48b4-b118-6c81fb492240	3f111904b7c6ba8080adb5c880b734a36ea45830adc2cf69036ea7543f1c6c24	2022-12-14 14:41:50.653128+00	20221027183818_alter_table_test	\N	\N	2022-12-14 14:41:50.647426+00	1
e791029d-9d4e-40f4-a83e-9bc0f11f2150	2724fdb2401f76aeb8f7af2efe3069e7a3f098970188c6667fc9ff244a883756	2022-12-14 14:41:50.671547+00	20221027184020_back_to_default	\N	\N	2022-12-14 14:41:50.656665+00	1
a91ba28f-ff16-4269-8ece-0cb8b1e995da	a11d14bcec8bb4d4a1ddce45ea7b1f126ee89cca2cfa31b3f7d3aaa0b63da397	2022-12-14 14:41:50.707672+00	20221027185243_alter_timestamp_config	\N	\N	2022-12-14 14:41:50.681326+00	1
9e630b0a-24f9-4eb0-a02d-c4cd6f2aa8ae	8c582f1052c0e370f3f0bd96a020ca7a3b7a173fb7cd2f56a8e1e918d5fb7889	2022-12-14 14:41:50.728013+00	20221027194908_add_unique_constraint_to_names	\N	\N	2022-12-14 14:41:50.713314+00	1
a8ff2f20-a06e-4d86-82a6-157960353456	880656b16cb7e45c40f6b3110563365ccd2deec1cabb58f0d26561dc9a245995	2022-12-27 15:47:07.209246+00	20221215140844_negotiated_as_nullable	\N	\N	2022-12-27 15:47:07.19698+00	1
017608bd-f7e5-47a3-8ceb-afb0c477488c	abfa918135b7cf7ffc57ec21759a5c2e95483ea44d65e8843fcb0d0b41cd498a	2023-06-23 14:30:29.483141+00	20230623124416_add_employees_fullname	\N	\N	2023-06-23 14:30:29.478142+00	1
eb1fa87c-68c8-4004-a62d-e7993ec3fc04	7cd7536e9ec5dcb63ff92579299eab8d2ec687e2398d17b2dc8e4c162be32363	2023-01-25 22:01:22.519454+00	20230105142622_add_incomes_table	\N	\N	2023-01-25 22:01:22.500863+00	1
e75f88a9-462a-4d3d-925d-0c59deee8cf4	a639d46a8df4d3307e809ba2465a6ac9b864c7036009311049da4893b9a24cdc	2023-01-25 22:01:22.542156+00	20230106192337_auth	\N	\N	2023-01-25 22:01:22.52159+00	1
c6d6b3e1-9df1-42d5-890f-ac97494afbbd	9063cda6c9eea6a6e91e5ea3bf8b14cb6032f5c4a1f4af8a0296154b162d7299	2023-01-25 22:01:22.553214+00	20230106211847_unique_email	\N	\N	2023-01-25 22:01:22.544448+00	1
beff6ee4-73b2-46bd-b7f0-d397669add07	bbfe9c609d3183162ee3e6e37a29896ecd6dfadade70bfa3f2dc1984d743cc45	2023-06-28 12:36:21.562115+00	20230623141653_add_employees_food_table	\N	\N	2023-06-28 12:36:21.039913+00	1
394461f2-2772-476b-b5dd-09f1d72dddd2	ebf6a6e1fd631a2d9734292e8839bdd089546bc4009d40526c392d30f3b7f2a1	2023-01-25 22:01:22.562027+00	20230116215214_relational_users	\N	\N	2023-01-25 22:01:22.555371+00	1
deb6e81f-f195-471a-a6ee-f799adcc83a9	60a8089092269e7d850054920586c23007aa18bf22ab34a81f399cdec0d22f1c	2023-01-25 22:01:22.568774+00	20230118134635_add_authors_feature	\N	\N	2023-01-25 22:01:22.564129+00	1
11508d40-ee0b-47f9-81a5-1fb3c1ac6cf0	f12823247bae954518ec2dfac8bbbf24beb4efec24aadb49912d9504e084f84e	2023-01-25 22:01:22.575301+00	20230118174055_archive_for_clients	\N	\N	2023-01-25 22:01:22.570904+00	1
0327d0b7-250a-4827-93df-cd43fec9a438	e0a557513cf00e4804e79017ae62f89cfd4c56ca7d380f9f7a6787c5080a6533	2023-06-28 12:36:21.568198+00	20230623193015_add_food_control_author	\N	\N	2023-06-28 12:36:21.563687+00	1
f4a95e44-21d3-4ad4-bb55-fe432d9ae775	f71f91e806141296bb91a2984cd42b1bd16bf9e54351ee16bdca479c187f47ad	2023-01-25 22:01:22.585136+00	20230120213714_unique_roles_name	\N	\N	2023-01-25 22:01:22.577113+00	1
fab217d8-9dfc-46d8-9ea6-b2f6858ae837	7d760f81d63707a538302d50daf5580c741848623dbd3703e88123e9c54ebbd3	2023-06-19 14:14:52.892574+00	20230612142138_add_stores_info	\N	\N	2023-06-19 14:14:52.881089+00	1
d3e894f6-b785-4ffd-a144-b395a7c47153	666901033335b0e087d120dcca73c87585699212fd7635eb7596f4728f154214	2023-06-19 14:14:52.8991+00	20230612163802_add_clients_info	\N	\N	2023-06-19 14:14:52.894148+00	1
f758bdcc-f7e9-486c-a37a-bd5dd7b528b0	e162ab036ccef7d767971565e9dd262629fc74ccff42e9bf11ef21447bccd522	2023-07-05 19:08:28.472453+00	20230705181819_add_loan_column	\N	\N	2023-07-05 19:08:28.467363+00	1
7b38f0ee-6f34-4fc2-86f2-c111433c1da2	cf04e871ce70119cba3082f99ec758117278d0ae451d9fe9795080c6a3d840bf	2023-06-19 14:14:52.904914+00	20230612180633_add_employees_info	\N	\N	2023-06-19 14:14:52.900635+00	1
3fcc0c3d-0949-48c8-890e-fc55863d2828	04f804a17627f0a24ff8b2ab9641a4622268a50ddef62bcf7ca16004e2933081	2023-07-06 18:49:04.842618+00	20230706130810_add_employee_is_archived_column	\N	\N	2023-07-06 18:49:04.835887+00	1
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, author, "isArchived", accountable, address, contact, document, project_number) FROM stdin;
17	4 CASA BOREBI	\N	f	\N	\N	\N	\N	\N
18	IGREJA FRUTO SAGRADO	\N	f	\N	\N	\N	\N	\N
24	ANDRÉ	\N	f	\N	\N	\N	\N	\N
26	SERRALHERIA	Luana Camargo	f	\N	\N	\N	\N	\N
27	ESCOLA - E.E. PROF. IRACEMA LEITE CENTRO	Luana Camargo	f	\N	\N	\N	\N	\N
29	REFEITÓRIO BOREBI	Luana Camargo	f	\N	\N	\N	\N	\N
30	LUANA CAMARGO	Luana Camargo	f	\N	\N	\N	\N	\N
21	PIOTTO CASA	Paulo	t	\N	\N	\N	\N	\N
36	PAÇO MUNICIPAL BOREBI	Paulo	f					\N
37	SECRETARIA BOREBI	Paulo	f					\N
38	DIEGO	Paulo	f					\N
39	RAFAEL PIOTTO	Paulo	f					\N
40	KLEBINHO CONTROLE	Paulo	f					\N
41	UBS MARTHA BROSCO	Paulo	f					\N
42	PRAÇA DO TURISTA	Paulo	f					\N
34	0 CONTROLE	Paulo	f					\N
43	1 BONIFICAÇÃO	Paulo	f					\N
44	EVERTON E ISABELLE	Paulo	f					\N
45	CENTRO DO IDOSO BOREBI	Paulo	f					\N
46	ANA CLAUDIA	Paulo	f					\N
47	IMPOSTOS	Paulo	f					\N
48	ESCOLA IRACEMA COBERTURA	Paulo	f					\N
32	ACACIO	Paulo	f	Flavio Acacio	Rua Manoel Haggi Filho, 139, Smeralda			\N
28	ALCARDE	Paulo	f		Avenida Newton D'Avilla, 111, Smeralda			\N
13	BARBARA	Paulo	f		 Rua Luiza Bastos Mendes, 152, Sant'Anna			\N
35	BEATRIZ BROSCO	Paulo	f	Beatriz Brosco	R. Oswaldo Lúcio da Silva, 32, Bem Viver			\N
33	BENICA	Paulo	f	Luan e Manuela Benica	Rua Ida Vidali Mazzoni, 546, Parque Pampulha			\N
16	BRUNA THIEDE	Paulo	f		Rua Dr. Walter Villas Boas Franco, 102, Bem Viver			\N
20	HOSPITAL	Paulo	f		Rua Andrade Neves, 209, Hospital			\N
14	KARINA E TOBIAS	Paulo	f		Rua Dilce Mariano, 77, Sant'Anna			\N
22	MANFLIM	Paulo	f		Rua Waldemar Duarte, 230, Sta Cândida			\N
15	MARLON	Paulo	f		Rua Olympia Ana Santana Sawaia, 52, Bem Viver			\N
31	MATHEUS PIOTTO	Paulo	f	Matheus	R. José Antunes Oliveira, 387, Sant'Anna,	14997182689		\N
25	PIOTTO ESCRITÓRIO 	Paulo	f		R. José Nogueira de Abreu, 572 B, Jd. Canaã			\N
19	SENGER	Paulo	f		Rua Lourival Ramos dos Santos, 124, Santa Cândida			\N
23	THIAGO FREITAS	Paulo	f		Avenida João Wolber, 219, Jardim Márcia II			\N
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, wage, start_day, name, author, address, contact, document, obs, pix, fullname, loan, "isArchived") FROM stdin;
11	150000	2023-06-21 18:44:01.627	Djalma	Paulo	Rua Vilma Maria Venturini, 560, Parque Pampulha	14991447258	25497676839	vales: 120 - 120(20/07pg) + 70(27/07)	25497676839	Djalma Vicente	7000	f
17	150000	2023-06-21 11:41:18	Paulinho	Paulo	Rua Telma Luzia Filão de Toledo, 31, Santa Angelina		46566097813	vales: 690 - 200(20/07pg)\n\n! 21/07 meia falta	paulinho.sk847@gmail.com	Paulo Henrique Felippe	49000	f
31	110000	2023-07-04 17:59:23.038	Matheus	Paulo	Peniel	14991881849	46409208812	- Cel é da mãe(Érika) \n\nvales: 100(29/07) + 100(31/07) + 50(02/08) + 50(03/08)	14991881849	Matheus Buso Alves de Souza	30000	f
30	140000	2023-07-03 17:56:54	Wender	Paulo	Rua Nelson Bertho, n 30, Pampulha	14998772867	45897305889		45897305889	Wender André Ribeiro	0	t
32	140000	2023-07-06 13:10:04	Gustavo	Paulo	Rua Guido Corradi, 54, Jd. Cruzeiro	14991043386	41978705824	! 18/07 MEIA FALTA\n	alencar1004638@gmail.com	Gustavo Evangelista de Alencar	0	f
23	220000	2023-06-21 18:16:14	Marcelo	Paulo	Rua Osório Amâncio, 246, Santo Antônio	14997419358	26680442869	Vales: 100(15/07) + 800(31/07)	14997419358	Marcelo José Alpanez	90000	f
14	240000	2023-06-21 19:09:58.718	Eliseu	Paulo	Rua Armando Malakowski, 80, Cohab 4	14991254593	31711018821	vales: 2500 + 100(07/07) + 100(15/07) + 110(19/07) - 610(20/07pg) + 50(03/08)	31711018821	Eliseu Soares do Nascimento	225000	f
16	180000	2023-06-21 11:38:54	Homero	Paulo	Rua Telma Luzia Filão Toledo, 31, Santa Angelina	14988013979	37243370861	vales: 800 + 300	14988013979	Homero Araújo dos Santos	110000	t
26	180000	2023-06-27 11:50:03.681	Bambu	Paulo	Peniel	14997090195	14130412809	! 13/07 MEIA FALTA\n270 vale	14130412809	Claudemir Reginaldo	27000	t
19	200000	2023-06-23 14:54:37.274	Zelão	Paulo	Rua Jaime Lisboa, 103, Vila Malvina	14910041706	13499261839	Vales: 100 + 100(18/07) - 100(20/07pg) + 200(26/07) + 40(04/08)	26832144806	José Luis Leite	30000	f
25	140000	2023-06-26 11:46:45.393	Claudecir	Paulo	Rua Claudemir Sheshel Zago, 274, Parque Pampulha	88981904429	89156226349			Claudecir Ribeiro Soares	0	f
20	140000	2023-06-21 13:30:17	Bodinho	Paulo	Rua Dácio Delazari, 814, Parque Pampulha	14996698832	26274483829	vales: 100 - 100(20/07pg)	14996698832	Luiz André Ferreira	0	f
9	190000	2023-06-21 18:42:55.177	Ismael	Paulo	Rua Osório Amâncio, 246, Santo Antônio	14997497206	17178480874		17178480874	Ismael Lourenço	0	f
21	220000	2023-06-21 13:31:25	Ailton	Paulo	Rua Alcides Escada, 116, Pampulha	14998748982		vales: 600 - 300(20/07)pg	12732481807	Ailton Cezar de Souza	30000	t
8	150000	2023-06-21 18:42:29.887	Willian	Paulo	Avenida José Luiz Filho, 315, Jardim Europa	14991463144	34283038814	Pix no CPF da esposa: Fernanda dos Santos\n\nvales: 20(18/07) - 20(20/07pg)	32628008807	Willian de Paula Alves	0	f
35	280000	2023-06-21 17:40:31	Vini	Paulo						Vinícius Nassula	0	f
15	100000	2023-06-21 19:17:44.899	Alex	Paulo	Alameda Mercúrio, 4-51, Santa Edwirges	14910043258	32397883813	veio apenas 23/06 e saiu	32397883813	Alex Sandro Tardivo de Souza	0	t
7	240000	2023-06-21 18:41:52.363	Vanderlei	Paulo	Rua Miguel Leão Filho, 215, Santa Angelina	14991747571	25752692881		25752692881	Vanderlei Correia	0	t
28	100000	2023-06-28 13:05:56	Marcel	Paulo						Marcel	0	t
24	240000	2023-06-21 13:28:16	Perna	Paulo	Rua Frei Lauro Formigoni, 16, Vila Professor Simões	14998764745	26680442869	Pix Celular: Maria Betânia da Silva\n\nVales: 270 + 1386,90(material) - 70(15/07he) - 200(20/07pg) + 50(27/07) 	14997038484	Reginaldo Soares da Silva	143690	f
5	200000	2023-06-21 14:48:23	Bola	Paulo	Rua Maura Pinto Piovezan, 56, Jardim Europa	14998969090	18350672803	vales: 1300 - 300(20/07pg) + 150(26/07) + 700(03/08)	flucio.bola@gmail.com	Luis Fabiano Lucio da Silva	185000	f
13	130000	2023-06-21 19:09:46.027	Lagoinha	Paulo	Rua Lauro Frei Formigoni, 23, Professor Simões	14996235699	12828295800	Pix no CPF do Eliseu\nvales: 73,85(24/07) + 73,85(24/07)	31711018821	Dorgival Ferreira do Nascimento	14769	f
18	220000	2023-06-21 11:43:31	Carlinhos	Paulo	Rua Lourival Ramos dos Santos, 90, Santa Cândida	14991714580	31960307843		xavierjosecarlos84@gmail.com	José Carlos Xavier Pires	0	f
29	220000	2023-07-03 17:55:48	Ricardo	Paulo	Rua Prof. José Antônio Comidi, 2-35	14991858932	34901602829	Vales: 330 + 500 - 430(20/07pg) + 200(25/07)	34901602829	Nilton Ricardo Alexandre	60000	f
37	200000	2023-07-12 11:44:32.718	Iago	Paulo	Rua Reinaldo Fredel, 582, Cohab II	42998306535	10859714659	! 14/07 = MEIA FALTA\n! 21/07 -- 24/07 -- 01/08 = MEIA FALTA\nvales: 350(01/08)\n	10859714659	Iago Cleiton Rodrigues	35000	f
12	280000	2023-06-21 19:09:31.748	Carlão	Paulo	Avenida Luiz Odassi Neto, 175, Jardim Europa	14997336001	16605995805	faltou dia 26/06 com atestado\n\nvales: 460\n	16605995805	Carlos Soares do Nascimento	46000	f
38	0	2023-07-24 18:03:04.957	Escritório	Paulo						Escritório	0	f
22	180000	2023-06-21 13:29:05	Ellias	Paulo	Rua Orlando Leão, 21, CDHU	14991092781	35581470812	! 13/07 MEIA FALTA\n\nvales: 860 + 70(28/07) + 100(03/08)	elliassoares58@gmail.com	Ellias Soares	103000	f
39	200000	2023-08-02 12:04:28	Marquinhos	Paulo	Rua Josefina Carllin Vitti, 140, Santa Cecília	14991595085	26207713826		26207713826	Marcos Antônio Soares de Alencar	0	f
6	140000	2023-06-21 17:05:29.334	Robert	Paulo	Rua Maura Pinto Piovezan, 66, Jardim Europa	14998277772	47964784854	- dia 30/06 ficou até 13h alegando consulta médica\n\nvales: 260 + 70	14998277772	Robert Willian Bastos Vicente	33000	t
33	200000	2023-06-21 17:36:52	Christian	Paulo						Christian Takano	0	f
34	100000	2023-06-21 17:38:52	Edu	Paulo						Eduardo Gabriel Nogueira	0	f
36	200000	2023-07-07 17:41:35	Paulo Piotto	Paulo						Paulo Henrique Amancio Piotto	0	f
\.


--
-- Data for Name: employees_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees_food (id, employee_id, type, value, date, author) FROM stdin;
1	29	Grande	2000	2023-07-04 12:00:00	Paulo
2	5	Média	1800	2023-07-04 12:00:00	Paulo
3	31	Média	1800	2023-07-04 12:00:00	Paulo
4	6	Grande	2000	2023-07-04 12:00:00	Paulo
5	20	Grande	2000	2023-07-04 12:00:00	Paulo
6	19	Grande	2000	2023-07-04 12:00:00	Paulo
7	17	Grande	2000	2023-07-04 12:00:00	Paulo
8	22	Grande	2000	2023-07-04 12:00:00	Paulo
9	30	Grande	2000	2023-07-04 12:00:00	Paulo
10	24	Média	1800	2023-07-04 12:00:00	Paulo
11	22	Grande	2000	2023-07-03 12:00:00	Paulo
12	14	Grande	2000	2023-07-03 12:00:00	Paulo
13	16	Grande	2000	2023-07-03 12:00:00	Paulo
14	24	Grande	2000	2023-07-03 12:00:00	Paulo
15	17	Grande	2000	2023-07-03 12:00:00	Paulo
16	19	Grande	2000	2023-07-03 12:00:00	Paulo
17	29	Grande	2000	2023-07-03 12:00:00	Paulo
18	8	Outro	700	2023-07-04 12:00:00	Paulo
19	29	Grande	2000	2023-07-05 12:00:00	Paulo
20	29	Outro	700	2023-07-05 12:00:00	Paulo
21	19	Grande	2000	2023-07-05 12:00:00	Paulo
22	20	Grande	2000	2023-07-05 12:00:00	Paulo
23	17	Grande	2000	2023-07-05 12:00:00	Paulo
24	26	Grande	2000	2023-07-05 12:00:00	Paulo
25	5	Média	1800	2023-07-05 12:00:00	Paulo
26	6	Grande	2000	2023-07-05 12:00:00	Paulo
27	31	Grande	2000	2023-07-05 12:00:00	Paulo
28	14	Grande	2000	2023-07-05 12:00:00	Paulo
29	24	Média	1800	2023-07-05 12:00:00	Paulo
30	22	Grande	2000	2023-07-05 12:00:00	Paulo
31	29	Outro	700	2023-07-06 12:00:00	Paulo
32	17	Grande	2000	2023-07-06 12:00:00	Paulo
33	20	Grande	2000	2023-07-06 12:00:00	Paulo
34	30	Grande	2000	2023-07-06 12:00:00	Paulo
35	19	Grande	2000	2023-07-06 12:00:00	Paulo
36	6	Grande	2000	2023-07-06 12:00:00	Paulo
37	31	Grande	2000	2023-07-06 12:00:00	Paulo
38	29	Grande	2000	2023-07-06 12:00:00	Paulo
39	24	Média	1800	2023-07-06 12:00:00	Paulo
40	19	Grande	2000	2023-07-07 12:00:00	Paulo
41	17	Grande	2000	2023-07-07 12:00:00	Paulo
42	30	Grande	2000	2023-07-07 12:00:00	Paulo
43	29	Grande	2000	2023-07-07 12:00:00	Paulo
44	8	Outro	700	2023-07-07 12:00:00	Paulo
45	22	Grande	2000	2023-07-07 12:00:00	Paulo
46	24	Média	1800	2023-07-07 12:00:00	Paulo
47	31	Grande	2000	2023-07-07 12:00:00	Paulo
48	11	Grande	2000	2023-07-10 12:00:00	Paulo
49	19	Grande	2000	2023-07-10 12:00:00	Paulo
50	17	Grande	2000	2023-07-10 12:00:00	Paulo
51	6	Grande	2000	2023-07-10 12:00:00	Paulo
52	31	Grande	2000	2023-07-10 12:00:00	Paulo
53	8	Grande	2000	2023-07-10 12:00:00	Paulo
54	22	Grande	2000	2023-07-10 12:00:00	Paulo
55	22	Outro	700	2023-07-10 12:00:00	Paulo
56	29	Grande	2000	2023-07-11 12:00:00	Paulo
57	24	Média	1800	2023-07-11 12:00:00	Paulo
58	29	Outro	700	2023-07-11 12:00:00	Paulo
59	22	Grande	2000	2023-07-11 12:00:00	Paulo
60	19	Grande	2000	2023-07-11 12:00:00	Paulo
61	17	Grande	2000	2023-07-11 12:00:00	Paulo
62	31	Grande	2000	2023-07-11 12:00:00	Paulo
63	22	Grande	2000	2023-07-12 12:00:00	Paulo
64	31	Grande	2000	2023-07-12 12:00:00	Paulo
65	5	Média	1800	2023-07-12 12:00:00	Paulo
66	5	Outro	700	2023-07-12 12:00:00	Paulo
67	19	Grande	2000	2023-07-12 12:00:00	Paulo
68	17	Grande	2000	2023-07-12 12:00:00	Paulo
69	29	Grande	2000	2023-07-12 12:00:00	Paulo
70	24	Grande	2000	2023-07-12 12:00:00	Paulo
71	8	Outro	700	2023-07-12 12:00:00	Paulo
72	29	Grande	2000	2023-07-13 12:00:00	Paulo
73	24	Grande	2000	2023-07-13 12:00:00	Paulo
74	24	Outro	700	2023-07-13 12:00:00	Paulo
75	31	Grande	2000	2023-07-13 12:00:00	Paulo
76	20	Grande	2000	2023-07-13 12:00:00	Paulo
77	17	Grande	2000	2023-07-13 12:00:00	Paulo
78	19	Grande	2000	2023-07-13 12:00:00	Paulo
79	11	Grande	2000	2023-07-13 12:00:00	Paulo
80	22	Grande	2000	2023-07-14 12:00:00	Paulo
81	29	Grande	2000	2023-07-14 12:00:00	Paulo
82	24	Grande	2000	2023-07-14 12:00:00	Paulo
83	29	Outro	700	2023-07-14 12:00:00	Paulo
84	31	Grande	2000	2023-07-14 12:00:00	Paulo
86	20	Grande	2000	2023-07-14 12:00:00	Paulo
87	19	Grande	2000	2023-07-14 12:00:00	Paulo
88	17	Grande	2000	2023-07-14 12:00:00	Paulo
89	19	Grande	2000	2023-07-17 12:00:00	Paulo
90	17	Grande	2000	2023-07-17 12:00:00	Paulo
91	20	Grande	2000	2023-07-17 12:00:00	Paulo
92	29	Grande	2000	2023-07-17 12:00:00	Paulo
93	24	Grande	2000	2023-07-17 12:00:00	Paulo
94	8	Outro	700	2023-07-17 12:00:00	Paulo
95	22	Grande	2000	2023-07-17 12:00:00	Paulo
96	22	Outro	700	2023-07-17 12:00:00	Paulo
97	31	Grande	2000	2023-07-17 12:00:00	Paulo
98	22	Grande	2000	2023-07-18 12:00:00	Paulo
99	29	Grande	2000	2023-07-18 12:00:00	Paulo
100	24	Grande	2000	2023-07-18 12:00:00	Paulo
101	29	Outro	700	2023-07-18 12:00:00	Paulo
102	31	Grande	2000	2023-07-18 12:00:00	Paulo
103	19	Grande	2000	2023-07-18 12:00:00	Paulo
104	17	Grande	2000	2023-07-18 12:00:00	Paulo
106	37	Pequena	1600	2023-07-19 12:00:00	Paulo
107	14	Grande	2000	2023-07-19 12:00:00	Paulo
108	29	Grande	2000	2023-07-19 12:00:00	Paulo
109	24	Grande	2000	2023-07-19 12:00:00	Paulo
110	17	Grande	2000	2023-07-19 12:00:00	Paulo
111	19	Grande	2000	2023-07-19 12:00:00	Paulo
112	18	Grande	2000	2023-07-19 12:00:00	Paulo
113	12	Grande	2000	2023-07-19 12:00:00	Paulo
114	22	Grande	2000	2023-07-19 12:00:00	Paulo
115	31	Grande	2000	2023-07-19 12:00:00	Paulo
116	29	Grande	2000	2023-07-20 12:00:00	Paulo
117	31	Grande	2000	2023-07-20 12:00:00	Paulo
118	24	Grande	2000	2023-07-20 12:00:00	Paulo
119	24	Outro	700	2023-07-20 12:00:00	Paulo
120	19	Grande	2000	2023-07-20 12:00:00	Paulo
121	17	Grande	2000	2023-07-20 12:00:00	Paulo
122	31	Grande	2000	2023-07-20 12:00:00	Paulo
123	37	Média	1800	2023-07-20 12:00:00	Paulo
124	22	Grande	2000	2023-07-20 12:00:00	Paulo
125	22	Outro	700	2023-07-20 12:00:00	Paulo
126	29	Grande	2000	2023-07-21 12:00:00	Paulo
127	8	Grande	2000	2023-07-21 12:00:00	Paulo
128	29	Outro	700	2023-07-21 12:00:00	Paulo
129	19	Grande	2000	2023-07-21 12:00:00	Paulo
130	31	Grande	2000	2023-07-21 12:00:00	Paulo
132	38	Grande	2000	2023-07-22 12:00:00	Paulo
133	38	Grande	2000	2023-07-22 12:00:00	Paulo
137	38	Grande	2000	2023-07-22 12:00:00	Paulo
136	38	Outro	700	2023-07-22 12:00:00	Paulo
135	38	Grande	2000	2023-07-22 12:00:00	Paulo
138	38	Grande	2000	2023-07-22 12:00:00	Paulo
139	38	Grande	2000	2023-07-22 12:00:00	Paulo
134	38	Grande	2000	2023-07-22 12:00:00	Paulo
131	31	Grande	2000	2023-07-24 12:00:00	Paulo
140	29	Grande	2000	2023-07-24 12:00:00	Paulo
141	8	Grande	2000	2023-07-24 12:00:00	Paulo
142	29	Outro	700	2023-07-24 12:00:00	Paulo
143	22	Grande	2000	2023-07-24 12:00:00	Paulo
144	32	Outro	700	2023-07-24 12:00:00	Paulo
145	19	Grande	2000	2023-07-24 12:00:00	Paulo
146	37	Grande	2000	2023-07-24 12:00:00	Paulo
147	19	Grande	2000	2023-07-25 12:00:00	Paulo
148	20	Grande	2000	2023-07-25 12:00:00	Paulo
149	5	Média	1800	2023-07-25 12:00:00	Paulo
150	5	Outro	700	2023-07-25 12:00:00	Paulo
151	31	Grande	2000	2023-07-25 12:00:00	Paulo
152	29	Grande	2000	2023-07-25 12:00:00	Paulo
153	24	Grande	2000	2023-07-25 12:00:00	Paulo
154	8	Outro	700	2023-07-25 12:00:00	Paulo
155	22	Grande	2000	2023-07-25 12:00:00	Paulo
156	22	Outro	700	2023-07-25 12:00:00	Paulo
157	29	Grande	2000	2023-07-26 12:00:00	Paulo
158	24	Grande	2000	2023-07-26 12:00:00	Paulo
159	8	Grande	2000	2023-07-26 12:00:00	Paulo
160	11	Outro	700	2023-07-26 12:00:00	Paulo
161	22	Grande	2000	2023-07-26 12:00:00	Paulo
162	19	Grande	2000	2023-07-26 12:00:00	Paulo
163	20	Grande	2000	2023-07-26 12:00:00	Paulo
164	37	Grande	2000	2023-07-26 12:00:00	Paulo
165	14	Grande	2000	2023-07-26 12:00:00	Paulo
166	5	Média	1800	2023-07-26 12:00:00	Paulo
167	31	Média	1800	2023-07-26 12:00:00	Paulo
168	32	Grande	2000	2023-07-27 12:00:00	Paulo
169	22	Grande	2000	2023-07-27 12:00:00	Paulo
170	5	Grande	2000	2023-07-27 12:00:00	Paulo
171	31	Grande	2000	2023-07-27 12:00:00	Paulo
172	5	Outro	700	2023-07-27 12:00:00	Paulo
173	19	Grande	2000	2023-07-27 12:00:00	Paulo
174	20	Grande	2000	2023-07-27 12:00:00	Paulo
175	17	Grande	2000	2023-07-27 12:00:00	Paulo
176	29	Grande	2000	2023-07-27 12:00:00	Paulo
177	24	Grande	2000	2023-07-27 12:00:00	Paulo
178	11	Grande	2000	2023-07-27 12:00:00	Paulo
179	8	Grande	2000	2023-07-27 12:00:00	Paulo
180	24	Outro	700	2023-07-27 12:00:00	Paulo
181	29	Grande	2000	2023-07-28 12:00:00	Paulo
182	29	Outro	700	2023-07-28 12:00:00	Paulo
183	22	Grande	2000	2023-07-28 12:00:00	Paulo
184	5	Grande	2000	2023-07-28 12:00:00	Paulo
185	31	Grande	2000	2023-07-28 12:00:00	Paulo
186	19	Grande	2000	2023-07-28 12:00:00	Paulo
187	20	Grande	2000	2023-07-28 12:00:00	Paulo
188	19	Outro	700	2023-07-28 12:00:00	Paulo
189	38	Grande	2000	2023-07-29 12:00:00	Paulo
191	38	Grande	2000	2023-07-29 12:00:00	Paulo
192	38	Grande	2000	2023-07-29 12:00:00	Paulo
193	38	Grande	2000	2023-07-29 12:00:00	Paulo
194	38	Grande	2000	2023-07-29 12:00:00	Paulo
195	38	Grande	2000	2023-07-29 12:00:00	Paulo
196	38	Grande	2000	2023-07-29 12:00:00	Paulo
197	38	Grande	2000	2023-07-29 12:00:00	Paulo
198	38	Grande	2000	2023-07-29 12:00:00	Paulo
199	38	Grande	2000	2023-07-29 12:00:00	Paulo
200	38	Grande	2000	2023-07-29 12:00:00	Paulo
201	38	Grande	2000	2023-07-29 12:00:00	Paulo
202	38	Grande	2000	2023-07-29 12:00:00	Paulo
203	38	Grande	2000	2023-07-29 12:00:00	Paulo
204	38	Grande	2000	2023-07-29 12:00:00	Paulo
205	38	Outro	700	2023-07-29 12:00:00	Paulo
206	38	Outro	700	2023-07-29 12:00:00	Paulo
207	38	Outro	700	2023-07-29 12:00:00	Paulo
208	19	Grande	2000	2023-07-31 12:00:00	Paulo
209	22	Grande	2000	2023-07-31 12:00:00	Paulo
210	31	Grande	2000	2023-07-31 12:00:00	Paulo
211	29	Grande	2000	2023-07-31 12:00:00	Paulo
212	29	Outro	700	2023-07-31 12:00:00	Paulo
213	24	Média	1800	2023-07-31 12:00:00	Paulo
214	19	Grande	2000	2023-08-01 12:00:00	Paulo
215	5	Média	1800	2023-08-01 12:00:00	Paulo
216	22	Grande	2000	2023-08-01 12:00:00	Paulo
217	31	Grande	2000	2023-08-01 12:00:00	Paulo
218	22	Outro	700	2023-08-01 12:00:00	Paulo
219	24	Grande	2000	2023-08-01 12:00:00	Paulo
220	37	Pequena	1600	2023-08-02 12:00:00	Paulo
221	19	Grande	2000	2023-08-02 12:00:00	Paulo
222	5	Grande	2000	2023-08-02 12:00:00	Paulo
223	31	Grande	2000	2023-08-02 12:00:00	Paulo
224	5	Outro	700	2023-08-02 12:00:00	Paulo
225	22	Grande	2000	2023-08-02 12:00:00	Paulo
226	24	Média	1800	2023-08-02 12:00:00	Paulo
227	22	Grande	2000	2023-08-03 12:00:00	Paulo
228	31	Grande	2000	2023-08-03 12:00:00	Paulo
229	31	Outro	700	2023-08-03 12:00:00	Paulo
230	5	Média	1800	2023-08-03 12:00:00	Paulo
231	24	Grande	2000	2023-08-03 12:00:00	Paulo
232	24	Outro	700	2023-08-03 12:00:00	Paulo
233	32	Outro	700	2023-08-03 12:00:00	Paulo
234	19	Grande	2000	2023-08-03 12:00:00	Paulo
235	24	Grande	2000	2023-08-04 12:00:00	Paulo
236	24	Outro	700	2023-08-04 12:00:00	Paulo
237	17	Grande	2000	2023-08-04 12:00:00	Paulo
238	19	Grande	2000	2023-08-04 12:00:00	Paulo
239	20	Grande	2000	2023-08-04 12:00:00	Paulo
240	29	Grande	2000	2023-08-04 12:00:00	Paulo
241	11	Pequena	1600	2023-08-04 12:00:00	Paulo
242	29	Outro	700	2023-08-04 12:00:00	Paulo
243	31	Grande	2000	2023-08-04 12:00:00	Paulo
244	22	Grande	2000	2023-08-04 12:00:00	Paulo
245	38	Grande	2000	2023-08-05 12:00:00	Paulo
246	38	Grande	2000	2023-08-05 12:00:00	Paulo
247	38	Grande	2000	2023-08-05 12:00:00	Paulo
248	38	Grande	2000	2023-08-05 12:00:00	Paulo
250	38	Grande	2000	2023-08-05 12:00:00	Paulo
252	38	Grande	2000	2023-08-05 12:00:00	Paulo
253	38	Grande	2000	2023-08-05 12:00:00	Paulo
254	38	Grande	2000	2023-08-05 12:00:00	Paulo
255	38	Grande	2000	2023-08-05 12:00:00	Paulo
256	38	Grande	2000	2023-08-05 12:00:00	Paulo
257	38	Grande	2000	2023-08-05 12:00:00	Paulo
258	38	Grande	2000	2023-08-05 12:00:00	Paulo
259	38	Grande	2000	2023-08-05 12:00:00	Paulo
260	38	Grande	2000	2023-08-05 12:00:00	Paulo
262	38	Grande	2000	2023-08-05 12:00:00	Paulo
263	38	Grande	2000	2023-08-05 12:00:00	Paulo
264	38	Grande	2000	2023-08-05 12:00:00	Paulo
265	29	Grande	2000	2023-08-07 12:00:00	Paulo
266	29	Outro	700	2023-08-07 12:00:00	Paulo
267	17	Grande	2000	2023-08-07 12:00:00	Paulo
268	19	Grande	2000	2023-08-07 12:00:00	Paulo
269	22	Grande	2000	2023-08-07 12:00:00	Paulo
270	31	Grande	2000	2023-08-07 12:00:00	Paulo
271	31	Outro	700	2023-08-07 12:00:00	Paulo
272	24	Grande	2000	2023-08-07 12:00:00	Paulo
273	8	Outro	700	2023-08-07 12:00:00	Paulo
261	29	Outro	700	2023-08-05 12:00:00	Paulo
249	25	Outro	1200	2023-08-05 12:00:00	Paulo
251	17	Outro	1200	2023-08-05 12:00:00	Paulo
\.


--
-- Data for Name: employees_worked_days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees_worked_days (id, employee_id, client_id, date) FROM stdin;
8	9	31	2023-06-22 12:00:00
9	23	31	2023-06-22 12:00:00
10	7	31	2023-06-22 12:00:00
11	8	31	2023-06-22 12:00:00
12	11	23	2023-06-22 12:00:00
13	22	23	2023-06-22 12:00:00
14	21	23	2023-06-22 12:00:00
15	5	13	2023-06-22 12:00:00
16	6	13	2023-06-22 12:00:00
17	19	28	2023-06-22 12:00:00
18	18	28	2023-06-22 12:00:00
19	13	20	2023-06-22 12:00:00
20	14	20	2023-06-22 12:00:00
21	12	20	2023-06-22 12:00:00
22	24	16	2023-06-22 12:00:00
23	5	13	2023-06-23 12:00:00
24	6	13	2023-06-23 12:00:00
26	19	28	2023-06-23 12:00:00
27	18	28	2023-06-23 12:00:00
28	20	28	2023-06-23 12:00:00
29	17	28	2023-06-23 12:00:00
30	7	32	2023-06-23 12:00:00
31	9	32	2023-06-23 12:00:00
32	8	32	2023-06-23 12:00:00
33	23	32	2023-06-23 12:00:00
34	17	28	2023-06-22 12:00:00
35	11	23	2023-06-23 12:00:00
36	21	23	2023-06-23 12:00:00
37	22	23	2023-06-23 12:00:00
38	14	20	2023-06-23 12:00:00
39	12	20	2023-06-23 12:00:00
40	13	20	2023-06-23 12:00:00
41	24	16	2023-06-23 12:00:00
42	26	28	2023-06-26 12:00:00
43	18	28	2023-06-26 12:00:00
44	20	28	2023-06-26 12:00:00
45	19	28	2023-06-26 12:00:00
46	14	22	2023-06-26 12:00:00
47	13	22	2023-06-26 12:00:00
49	5	13	2023-06-26 12:00:00
50	8	31	2023-06-26 12:00:00
51	7	31	2023-06-26 12:00:00
52	23	32	2023-06-26 12:00:00
53	9	32	2023-06-26 12:00:00
54	25	32	2023-06-26 12:00:00
55	24	16	2023-06-26 12:00:00
56	11	23	2023-06-26 12:00:00
57	21	23	2023-06-26 12:00:00
58	22	23	2023-06-26 12:00:00
59	20	28	2023-06-27 12:00:00
60	18	28	2023-06-27 12:00:00
61	26	28	2023-06-27 12:00:00
62	19	28	2023-06-27 12:00:00
63	17	28	2023-06-27 12:00:00
64	12	20	2023-06-27 12:00:00
65	13	20	2023-06-27 12:00:00
66	14	20	2023-06-27 12:00:00
67	7	31	2023-06-27 12:00:00
68	8	31	2023-06-27 12:00:00
69	9	32	2023-06-27 12:00:00
70	25	32	2023-06-27 12:00:00
71	23	32	2023-06-27 12:00:00
72	24	16	2023-06-27 12:00:00
73	21	23	2023-06-27 12:00:00
74	22	23	2023-06-27 12:00:00
75	6	33	2023-06-27 12:00:00
76	5	33	2023-06-27 12:00:00
77	5	33	2023-06-28 12:00:00
78	6	33	2023-06-28 12:00:00
79	20	28	2023-06-28 12:00:00
80	18	28	2023-06-28 12:00:00
81	19	28	2023-06-28 12:00:00
82	17	28	2023-06-28 12:00:00
83	7	31	2023-06-28 12:00:00
84	8	31	2023-06-28 12:00:00
85	12	14	2023-06-28 12:00:00
87	14	22	2023-06-28 12:00:00
88	13	22	2023-06-28 12:00:00
89	23	32	2023-06-28 12:00:00
90	9	32	2023-06-28 12:00:00
91	25	32	2023-06-28 12:00:00
92	22	23	2023-06-28 12:00:00
93	11	23	2023-06-28 12:00:00
94	21	23	2023-06-28 12:00:00
95	12	25	2023-06-26 12:00:00
96	25	32	2023-06-29 12:00:00
97	9	32	2023-06-29 12:00:00
98	23	32	2023-06-29 12:00:00
99	12	14	2023-06-29 12:00:00
100	19	28	2023-06-29 12:00:00
101	20	28	2023-06-29 12:00:00
102	26	28	2023-06-29 12:00:00
103	18	28	2023-06-29 12:00:00
104	24	16	2023-06-29 12:00:00
105	6	33	2023-06-29 12:00:00
106	5	33	2023-06-29 12:00:00
107	8	31	2023-06-29 12:00:00
108	7	31	2023-06-29 12:00:00
109	14	22	2023-06-30 12:00:00
110	13	22	2023-06-30 12:00:00
111	9	32	2023-06-30 12:00:00
112	23	32	2023-06-30 12:00:00
113	25	32	2023-06-30 12:00:00
114	5	33	2023-06-30 12:00:00
116	12	14	2023-06-30 12:00:00
117	24	14	2023-06-30 12:00:00
118	14	22	2023-06-29 12:00:00
119	13	22	2023-06-29 12:00:00
120	22	23	2023-06-29 12:00:00
121	11	23	2023-06-29 12:00:00
122	21	23	2023-06-29 12:00:00
123	28	14	2023-06-28 12:00:00
124	28	14	2023-06-29 12:00:00
125	28	14	2023-06-30 12:00:00
126	18	28	2023-06-30 12:00:00
127	19	28	2023-06-30 12:00:00
128	26	28	2023-06-30 12:00:00
129	17	28	2023-06-30 12:00:00
130	20	28	2023-06-30 12:00:00
131	7	31	2023-06-30 12:00:00
132	8	31	2023-06-30 12:00:00
133	22	23	2023-06-30 12:00:00
134	11	23	2023-06-30 12:00:00
135	21	23	2023-06-30 12:00:00
136	22	23	2023-07-03 12:00:00
137	11	23	2023-07-03 12:00:00
138	21	23	2023-07-03 12:00:00
139	18	28	2023-07-03 12:00:00
140	19	28	2023-07-03 12:00:00
141	26	28	2023-07-03 12:00:00
142	17	28	2023-07-03 12:00:00
143	8	31	2023-07-03 12:00:00
144	12	14	2023-07-03 12:00:00
145	24	14	2023-07-03 12:00:00
146	5	33	2023-07-03 12:00:00
147	25	32	2023-07-03 12:00:00
148	23	32	2023-07-03 12:00:00
149	9	32	2023-07-03 12:00:00
150	14	22	2023-07-03 12:00:00
151	13	22	2023-07-03 12:00:00
152	16	22	2023-07-03 12:00:00
153	11	23	2023-07-04 12:00:00
154	21	23	2023-07-04 12:00:00
155	5	33	2023-07-04 12:00:00
156	6	33	2023-07-04 12:00:00
157	8	31	2023-07-04 12:00:00
158	19	28	2023-07-04 12:00:00
159	18	28	2023-07-04 12:00:00
160	17	28	2023-07-04 12:00:00
161	26	28	2023-07-04 12:00:00
162	20	28	2023-07-04 12:00:00
163	12	13	2023-07-04 12:00:00
164	22	13	2023-07-04 12:00:00
165	23	32	2023-07-04 12:00:00
166	9	32	2023-07-04 12:00:00
167	25	32	2023-07-04 12:00:00
168	14	22	2023-07-04 12:00:00
169	13	22	2023-07-04 12:00:00
170	16	22	2023-07-04 12:00:00
171	24	14	2023-07-04 12:00:00
172	31	33	2023-07-04 12:00:00
173	29	31	2023-07-04 12:00:00
174	29	31	2023-07-03 12:00:00
175	30	28	2023-07-04 12:00:00
176	21	23	2023-07-05 12:00:00
177	11	23	2023-07-05 12:00:00
178	29	31	2023-07-05 12:00:00
179	8	31	2023-07-05 12:00:00
180	9	32	2023-07-05 12:00:00
181	23	32	2023-07-05 12:00:00
182	25	32	2023-07-05 12:00:00
183	24	14	2023-07-05 12:00:00
184	22	14	2023-07-05 12:00:00
185	18	28	2023-07-05 12:00:00
186	17	28	2023-07-05 12:00:00
187	19	28	2023-07-05 12:00:00
188	26	28	2023-07-05 12:00:00
189	20	28	2023-07-05 12:00:00
190	5	33	2023-07-05 12:00:00
191	6	33	2023-07-05 12:00:00
192	31	33	2023-07-05 12:00:00
193	14	22	2023-07-05 12:00:00
194	13	22	2023-07-05 12:00:00
195	21	23	2023-07-06 12:00:00
196	11	23	2023-07-06 12:00:00
197	12	13	2023-07-06 12:00:00
198	16	13	2023-07-06 12:00:00
199	29	31	2023-07-06 12:00:00
200	8	31	2023-07-06 12:00:00
201	23	32	2023-07-06 12:00:00
202	25	32	2023-07-06 12:00:00
203	9	32	2023-07-06 12:00:00
204	19	28	2023-07-06 12:00:00
205	17	28	2023-07-06 12:00:00
206	20	28	2023-07-06 12:00:00
207	26	28	2023-07-06 12:00:00
208	30	28	2023-07-06 12:00:00
209	5	33	2023-07-06 12:00:00
210	31	33	2023-07-06 12:00:00
211	6	33	2023-07-06 12:00:00
212	14	35	2023-07-06 12:00:00
213	13	35	2023-07-06 12:00:00
214	24	14	2023-07-06 12:00:00
215	18	28	2023-07-06 12:00:00
216	12	13	2023-07-05 12:00:00
217	32	14	2023-07-06 12:00:00
218	33	25	2023-06-22 12:00:00
219	33	25	2023-06-23 12:00:00
220	33	25	2023-06-26 12:00:00
221	33	25	2023-06-27 12:00:00
222	33	25	2023-06-28 12:00:00
223	33	25	2023-06-29 12:00:00
224	33	25	2023-06-30 12:00:00
225	33	25	2023-07-03 12:00:00
226	33	25	2023-07-04 12:00:00
227	33	25	2023-07-05 12:00:00
228	33	25	2023-07-06 12:00:00
229	33	25	2023-07-07 12:00:00
230	34	25	2023-06-22 12:00:00
231	34	25	2023-06-23 12:00:00
232	34	25	2023-06-26 12:00:00
233	34	25	2023-06-27 12:00:00
234	34	25	2023-06-28 12:00:00
235	34	25	2023-06-29 12:00:00
236	34	25	2023-06-30 12:00:00
237	34	25	2023-07-03 12:00:00
238	34	25	2023-07-04 12:00:00
239	34	25	2023-07-05 12:00:00
240	34	25	2023-07-06 12:00:00
241	34	25	2023-07-07 12:00:00
242	35	25	2023-06-22 12:00:00
243	35	25	2023-06-23 12:00:00
244	35	25	2023-06-26 12:00:00
245	35	25	2023-06-27 12:00:00
246	35	25	2023-06-28 12:00:00
247	35	25	2023-06-29 12:00:00
248	35	25	2023-06-30 12:00:00
249	35	25	2023-07-03 12:00:00
250	35	25	2023-07-04 12:00:00
251	35	25	2023-07-05 12:00:00
252	35	25	2023-07-06 12:00:00
253	35	25	2023-07-07 12:00:00
254	36	25	2023-06-21 12:00:00
255	36	25	2023-06-22 12:00:00
256	36	25	2023-06-23 12:00:00
257	36	25	2023-06-26 12:00:00
258	36	25	2023-06-27 12:00:00
259	36	25	2023-06-28 12:00:00
260	36	25	2023-06-29 12:00:00
261	36	25	2023-06-30 12:00:00
262	36	25	2023-07-03 12:00:00
263	36	25	2023-07-04 12:00:00
264	36	25	2023-07-05 12:00:00
265	36	25	2023-07-06 12:00:00
266	36	25	2023-07-07 12:00:00
267	34	25	2023-06-21 12:00:00
268	9	25	2023-06-21 12:00:00
269	35	25	2023-06-21 12:00:00
270	6	25	2023-06-21 12:00:00
271	12	25	2023-06-21 12:00:00
272	24	25	2023-06-21 12:00:00
273	19	25	2023-06-21 12:00:00
274	21	25	2023-06-21 12:00:00
275	14	25	2023-06-21 12:00:00
276	17	25	2023-06-21 12:00:00
277	20	25	2023-06-21 12:00:00
278	22	25	2023-06-21 12:00:00
279	13	25	2023-06-21 12:00:00
280	33	25	2023-06-21 12:00:00
281	5	25	2023-06-21 12:00:00
282	18	25	2023-06-21 12:00:00
283	23	25	2023-06-21 12:00:00
284	8	25	2023-06-21 12:00:00
285	11	25	2023-06-21 12:00:00
286	33	25	2023-06-08 12:00:00
287	33	25	2023-06-09 12:00:00
288	33	25	2023-06-12 12:00:00
289	33	25	2023-06-13 12:00:00
290	33	25	2023-06-14 12:00:00
291	33	25	2023-06-15 12:00:00
292	33	25	2023-06-16 12:00:00
293	33	25	2023-06-19 12:00:00
294	33	25	2023-06-20 12:00:00
295	35	25	2023-06-08 12:00:00
296	35	25	2023-06-09 12:00:00
297	35	25	2023-06-12 12:00:00
298	35	25	2023-06-13 12:00:00
299	35	25	2023-06-14 12:00:00
300	35	25	2023-06-15 12:00:00
301	35	25	2023-06-16 12:00:00
302	35	25	2023-06-19 12:00:00
303	35	25	2023-06-20 12:00:00
311	34	25	2023-06-08 12:00:00
312	34	25	2023-06-09 12:00:00
313	34	25	2023-06-12 12:00:00
314	34	25	2023-06-13 12:00:00
315	34	25	2023-06-14 12:00:00
316	34	25	2023-06-15 12:00:00
317	34	25	2023-06-16 12:00:00
318	34	25	2023-06-19 12:00:00
319	34	25	2023-06-20 12:00:00
320	21	23	2023-07-07 12:00:00
321	11	23	2023-07-07 12:00:00
322	22	13	2023-07-07 12:00:00
323	29	31	2023-07-07 12:00:00
324	8	31	2023-07-07 12:00:00
325	23	32	2023-07-07 12:00:00
326	9	32	2023-07-07 12:00:00
327	25	32	2023-07-07 12:00:00
328	18	28	2023-07-07 12:00:00
329	19	28	2023-07-07 12:00:00
330	17	28	2023-07-07 12:00:00
331	26	28	2023-07-07 12:00:00
332	30	28	2023-07-07 12:00:00
333	5	33	2023-07-07 12:00:00
334	6	33	2023-07-07 12:00:00
335	31	33	2023-07-07 12:00:00
336	14	35	2023-07-07 12:00:00
337	13	35	2023-07-07 12:00:00
338	16	35	2023-07-07 12:00:00
339	12	14	2023-07-07 12:00:00
340	24	14	2023-07-07 12:00:00
341	32	14	2023-07-07 12:00:00
342	9	32	2023-07-10 12:00:00
343	25	32	2023-07-10 12:00:00
344	13	35	2023-07-10 12:00:00
345	14	35	2023-07-10 12:00:00
346	6	33	2023-07-10 12:00:00
347	5	33	2023-07-10 12:00:00
348	31	33	2023-07-10 12:00:00
349	32	14	2023-07-10 12:00:00
350	12	14	2023-07-10 12:00:00
351	22	14	2023-07-10 12:00:00
352	8	31	2023-07-10 12:00:00
353	33	25	2023-07-10 12:00:00
354	34	25	2023-07-10 12:00:00
355	35	25	2023-07-10 12:00:00
356	36	25	2023-07-10 12:00:00
357	26	28	2023-07-10 12:00:00
358	17	28	2023-07-10 12:00:00
359	20	28	2023-07-10 12:00:00
360	19	28	2023-07-10 12:00:00
361	18	28	2023-07-10 12:00:00
362	11	23	2023-07-10 12:00:00
363	21	23	2023-07-10 12:00:00
364	29	31	2023-07-11 12:00:00
365	8	31	2023-07-11 12:00:00
366	24	31	2023-07-11 12:00:00
367	26	28	2023-07-11 12:00:00
368	19	28	2023-07-11 12:00:00
369	18	28	2023-07-11 12:00:00
370	17	28	2023-07-11 12:00:00
371	14	35	2023-07-11 12:00:00
372	13	35	2023-07-11 12:00:00
373	32	14	2023-07-11 12:00:00
374	12	14	2023-07-11 12:00:00
375	22	14	2023-07-11 12:00:00
376	6	33	2023-07-11 12:00:00
377	5	33	2023-07-11 12:00:00
378	31	33	2023-07-11 12:00:00
379	25	32	2023-07-11 12:00:00
380	23	32	2023-07-11 12:00:00
381	9	32	2023-07-11 12:00:00
382	11	23	2023-07-11 12:00:00
383	21	23	2023-07-11 12:00:00
384	33	25	2023-07-11 12:00:00
385	34	25	2023-07-11 12:00:00
386	36	25	2023-07-11 12:00:00
387	35	25	2023-07-11 12:00:00
388	20	28	2023-07-11 12:00:00
389	36	25	2023-07-12 12:00:00
390	36	25	2023-07-13 12:00:00
391	18	28	2023-07-12 12:00:00
392	26	28	2023-07-12 12:00:00
393	20	28	2023-07-12 12:00:00
394	17	28	2023-07-12 12:00:00
395	19	28	2023-07-12 12:00:00
396	13	35	2023-07-12 12:00:00
397	14	35	2023-07-12 12:00:00
398	37	35	2023-07-12 12:00:00
399	31	33	2023-07-12 12:00:00
400	5	33	2023-07-12 12:00:00
401	23	32	2023-07-12 12:00:00
402	9	32	2023-07-12 12:00:00
403	25	32	2023-07-12 12:00:00
404	24	31	2023-07-12 12:00:00
405	8	31	2023-07-12 12:00:00
406	29	31	2023-07-12 12:00:00
407	32	14	2023-07-12 12:00:00
408	22	14	2023-07-12 12:00:00
409	12	14	2023-07-12 12:00:00
410	21	23	2023-07-12 12:00:00
411	11	23	2023-07-12 12:00:00
412	33	25	2023-07-12 12:00:00
413	34	25	2023-07-12 12:00:00
414	35	25	2023-07-12 12:00:00
415	11	23	2023-07-13 12:00:00
416	21	23	2023-07-13 12:00:00
417	13	35	2023-07-13 12:00:00
418	14	35	2023-07-13 12:00:00
419	37	35	2023-07-13 12:00:00
420	25	32	2023-07-13 12:00:00
421	9	32	2023-07-13 12:00:00
422	23	32	2023-07-13 12:00:00
423	26	28	2023-07-13 12:00:00
424	17	28	2023-07-13 12:00:00
425	19	28	2023-07-13 12:00:00
426	18	28	2023-07-13 12:00:00
427	20	28	2023-07-13 12:00:00
428	33	25	2023-07-13 12:00:00
429	34	25	2023-07-13 12:00:00
430	35	25	2023-07-13 12:00:00
431	34	25	2023-07-14 12:00:00
432	36	25	2023-07-14 12:00:00
433	35	25	2023-07-14 12:00:00
434	33	25	2023-07-14 12:00:00
435	32	14	2023-07-13 12:00:00
436	24	14	2023-07-13 12:00:00
437	12	14	2023-07-13 12:00:00
438	22	14	2023-07-13 12:00:00
439	5	33	2023-07-13 12:00:00
440	8	31	2023-07-13 12:00:00
441	29	31	2023-07-13 12:00:00
442	19	28	2023-07-14 12:00:00
443	18	28	2023-07-14 12:00:00
444	17	28	2023-07-14 12:00:00
445	20	28	2023-07-14 12:00:00
446	25	32	2023-07-14 12:00:00
447	9	32	2023-07-14 12:00:00
448	23	32	2023-07-14 12:00:00
449	13	35	2023-07-14 12:00:00
450	14	35	2023-07-14 12:00:00
451	31	33	2023-07-14 12:00:00
452	5	33	2023-07-14 12:00:00
453	12	14	2023-07-14 12:00:00
454	22	14	2023-07-14 12:00:00
455	32	14	2023-07-14 12:00:00
456	8	31	2023-07-14 12:00:00
457	24	31	2023-07-14 12:00:00
458	29	31	2023-07-14 12:00:00
459	21	23	2023-07-14 12:00:00
460	11	23	2023-07-14 12:00:00
461	31	33	2023-07-13 12:00:00
462	37	35	2023-07-14 12:00:00
463	33	25	2023-07-17 12:00:00
464	34	25	2023-07-17 12:00:00
465	36	25	2023-07-17 12:00:00
466	35	25	2023-07-17 12:00:00
467	31	33	2023-07-17 12:00:00
468	5	33	2023-07-17 12:00:00
469	37	35	2023-07-17 12:00:00
470	13	35	2023-07-17 12:00:00
471	14	35	2023-07-17 12:00:00
472	25	32	2023-07-17 12:00:00
473	9	32	2023-07-17 12:00:00
474	23	32	2023-07-17 12:00:00
475	21	23	2023-07-17 12:00:00
476	11	23	2023-07-17 12:00:00
477	8	31	2023-07-17 12:00:00
478	24	31	2023-07-17 12:00:00
479	29	31	2023-07-17 12:00:00
480	33	25	2023-07-18 12:00:00
481	34	25	2023-07-18 12:00:00
482	36	25	2023-07-18 12:00:00
483	35	25	2023-07-18 12:00:00
487	22	14	2023-07-17 12:00:00
488	32	14	2023-07-17 12:00:00
489	12	14	2023-07-17 12:00:00
490	19	28	2023-07-17 12:00:00
491	18	28	2023-07-17 12:00:00
492	17	28	2023-07-17 12:00:00
493	20	28	2023-07-17 12:00:00
494	5	33	2023-07-18 12:00:00
495	31	33	2023-07-18 12:00:00
496	13	35	2023-07-18 12:00:00
497	37	35	2023-07-18 12:00:00
498	14	35	2023-07-18 12:00:00
499	23	32	2023-07-18 12:00:00
500	25	32	2023-07-18 12:00:00
501	9	32	2023-07-18 12:00:00
502	11	23	2023-07-18 12:00:00
503	21	23	2023-07-18 12:00:00
504	24	31	2023-07-18 12:00:00
505	8	31	2023-07-18 12:00:00
506	29	31	2023-07-18 12:00:00
507	20	28	2023-07-18 12:00:00
508	17	28	2023-07-18 12:00:00
509	19	28	2023-07-18 12:00:00
510	18	28	2023-07-18 12:00:00
511	22	14	2023-07-18 12:00:00
512	12	14	2023-07-18 12:00:00
513	32	14	2023-07-18 12:00:00
514	33	25	2023-07-19 12:00:00
515	34	25	2023-07-19 12:00:00
516	36	25	2023-07-19 12:00:00
517	35	25	2023-07-19 12:00:00
518	11	23	2023-07-19 12:00:00
519	21	23	2023-07-19 12:00:00
520	22	13	2023-07-19 12:00:00
521	32	13	2023-07-19 12:00:00
522	12	13	2023-07-19 12:00:00
523	24	31	2023-07-19 12:00:00
524	8	31	2023-07-19 12:00:00
525	29	31	2023-07-19 12:00:00
526	37	35	2023-07-19 12:00:00
527	13	35	2023-07-19 12:00:00
528	14	35	2023-07-19 12:00:00
529	9	32	2023-07-19 12:00:00
530	25	32	2023-07-19 12:00:00
531	23	32	2023-07-19 12:00:00
532	31	33	2023-07-19 12:00:00
533	5	33	2023-07-19 12:00:00
534	17	28	2023-07-19 12:00:00
535	20	28	2023-07-19 12:00:00
536	19	28	2023-07-19 12:00:00
537	18	28	2023-07-19 12:00:00
538	33	25	2023-07-20 12:00:00
539	34	25	2023-07-20 12:00:00
540	36	25	2023-07-20 12:00:00
541	35	25	2023-07-20 12:00:00
542	12	14	2023-07-20 12:00:00
543	22	14	2023-07-20 12:00:00
544	32	14	2023-07-20 12:00:00
545	18	28	2023-07-20 12:00:00
546	19	28	2023-07-20 12:00:00
547	17	28	2023-07-20 12:00:00
548	20	28	2023-07-20 12:00:00
549	14	35	2023-07-20 12:00:00
550	13	35	2023-07-20 12:00:00
551	37	35	2023-07-20 12:00:00
552	5	33	2023-07-20 12:00:00
553	31	33	2023-07-20 12:00:00
554	23	32	2023-07-20 12:00:00
555	25	32	2023-07-20 12:00:00
556	9	32	2023-07-20 12:00:00
557	29	31	2023-07-20 12:00:00
558	24	31	2023-07-20 12:00:00
559	8	31	2023-07-20 12:00:00
560	11	23	2023-07-20 12:00:00
561	21	23	2023-07-20 12:00:00
562	35	25	2023-07-21 12:00:00
563	36	25	2023-07-21 12:00:00
564	33	25	2023-07-21 12:00:00
565	34	25	2023-07-21 12:00:00
566	21	23	2023-07-21 12:00:00
567	11	23	2023-07-21 12:00:00
568	18	28	2023-07-21 12:00:00
569	19	28	2023-07-21 12:00:00
570	17	28	2023-07-21 12:00:00
571	8	31	2023-07-21 12:00:00
572	29	31	2023-07-21 12:00:00
573	12	14	2023-07-21 12:00:00
574	32	14	2023-07-21 12:00:00
575	23	32	2023-07-21 12:00:00
576	9	32	2023-07-21 12:00:00
577	25	32	2023-07-21 12:00:00
578	14	35	2023-07-21 12:00:00
579	37	35	2023-07-21 12:00:00
580	13	35	2023-07-21 12:00:00
581	5	33	2023-07-21 12:00:00
582	31	33	2023-07-21 12:00:00
583	36	25	2023-07-24 12:00:00
584	35	25	2023-07-24 12:00:00
585	33	25	2023-07-24 12:00:00
586	34	25	2023-07-24 12:00:00
587	5	33	2023-07-24 12:00:00
588	31	33	2023-07-24 12:00:00
590	14	35	2023-07-24 12:00:00
591	13	35	2023-07-24 12:00:00
592	32	13	2023-07-24 12:00:00
593	22	13	2023-07-24 12:00:00
594	12	13	2023-07-24 12:00:00
595	19	28	2023-07-24 12:00:00
596	17	28	2023-07-24 12:00:00
597	11	31	2023-07-24 12:00:00
598	8	31	2023-07-24 12:00:00
599	29	31	2023-07-24 12:00:00
600	25	32	2023-07-24 12:00:00
601	23	32	2023-07-24 12:00:00
602	9	32	2023-07-24 12:00:00
603	31	33	2023-07-25 12:00:00
604	5	33	2023-07-25 12:00:00
605	8	31	2023-07-25 12:00:00
606	29	31	2023-07-25 12:00:00
607	11	31	2023-07-25 12:00:00
608	24	31	2023-07-25 12:00:00
609	32	14	2023-07-25 12:00:00
610	22	14	2023-07-25 12:00:00
611	12	14	2023-07-25 12:00:00
612	9	32	2023-07-25 12:00:00
613	25	32	2023-07-25 12:00:00
614	23	32	2023-07-25 12:00:00
615	19	28	2023-07-25 12:00:00
616	18	28	2023-07-25 12:00:00
617	20	28	2023-07-25 12:00:00
618	17	28	2023-07-25 12:00:00
619	14	35	2023-07-25 12:00:00
620	13	35	2023-07-25 12:00:00
621	37	35	2023-07-25 12:00:00
622	33	25	2023-07-25 12:00:00
623	34	25	2023-07-25 12:00:00
624	35	25	2023-07-25 12:00:00
625	36	25	2023-07-25 12:00:00
626	5	33	2023-07-26 12:00:00
627	31	33	2023-07-26 12:00:00
628	8	31	2023-07-26 12:00:00
629	29	31	2023-07-26 12:00:00
630	24	31	2023-07-26 12:00:00
631	11	31	2023-07-26 12:00:00
632	32	14	2023-07-26 12:00:00
633	22	14	2023-07-26 12:00:00
634	12	14	2023-07-26 12:00:00
635	25	32	2023-07-26 12:00:00
636	9	32	2023-07-26 12:00:00
637	23	32	2023-07-26 12:00:00
638	19	28	2023-07-26 12:00:00
639	20	28	2023-07-26 12:00:00
640	17	28	2023-07-26 12:00:00
641	18	28	2023-07-26 12:00:00
642	13	35	2023-07-26 12:00:00
643	14	35	2023-07-26 12:00:00
644	37	35	2023-07-26 12:00:00
645	36	25	2023-07-26 12:00:00
646	35	25	2023-07-26 12:00:00
647	33	25	2023-07-26 12:00:00
648	34	25	2023-07-26 12:00:00
649	34	25	2023-07-27 12:00:00
650	33	25	2023-07-27 12:00:00
651	36	25	2023-07-27 12:00:00
652	35	25	2023-07-27 12:00:00
653	36	25	2023-07-28 12:00:00
654	35	25	2023-07-28 12:00:00
655	33	25	2023-07-28 12:00:00
656	34	25	2023-07-28 12:00:00
657	33	25	2023-07-31 12:00:00
658	34	25	2023-07-31 12:00:00
659	35	25	2023-07-31 12:00:00
660	36	25	2023-07-31 12:00:00
661	22	20	2023-07-28 12:00:00
662	5	20	2023-07-28 12:00:00
663	31	20	2023-07-28 12:00:00
664	29	31	2023-07-28 12:00:00
665	11	31	2023-07-28 12:00:00
666	8	31	2023-07-28 12:00:00
667	12	13	2023-07-28 12:00:00
668	32	13	2023-07-28 12:00:00
669	23	32	2023-07-28 12:00:00
670	25	32	2023-07-28 12:00:00
671	9	32	2023-07-28 12:00:00
672	19	28	2023-07-28 12:00:00
673	20	28	2023-07-28 12:00:00
674	17	28	2023-07-28 12:00:00
675	18	28	2023-07-28 12:00:00
676	14	35	2023-07-28 12:00:00
677	13	35	2023-07-28 12:00:00
678	37	35	2023-07-28 12:00:00
679	23	32	2023-07-27 12:00:00
680	25	32	2023-07-27 12:00:00
681	9	32	2023-07-27 12:00:00
682	19	28	2023-07-27 12:00:00
683	20	28	2023-07-27 12:00:00
684	17	28	2023-07-27 12:00:00
685	18	28	2023-07-27 12:00:00
686	13	35	2023-07-27 12:00:00
687	14	35	2023-07-27 12:00:00
688	37	35	2023-07-27 12:00:00
691	31	20	2023-07-27 12:00:00
692	5	20	2023-07-27 12:00:00
693	22	20	2023-07-27 12:00:00
694	11	20	2023-07-27 12:00:00
695	32	13	2023-07-27 12:00:00
696	12	13	2023-07-27 12:00:00
697	29	31	2023-07-27 12:00:00
698	24	31	2023-07-27 12:00:00
699	8	31	2023-07-27 12:00:00
700	23	32	2023-07-31 12:00:00
701	25	32	2023-07-31 12:00:00
702	9	32	2023-07-31 12:00:00
703	37	35	2023-07-31 12:00:00
704	14	35	2023-07-31 12:00:00
705	13	35	2023-07-31 12:00:00
706	12	14	2023-07-31 12:00:00
707	32	14	2023-07-31 12:00:00
708	31	20	2023-07-31 12:00:00
709	5	20	2023-07-31 12:00:00
710	22	20	2023-07-31 12:00:00
711	24	31	2023-07-31 12:00:00
712	8	31	2023-07-31 12:00:00
713	29	23	2023-07-31 12:00:00
714	18	28	2023-07-31 12:00:00
715	17	28	2023-07-31 12:00:00
716	19	28	2023-07-31 12:00:00
717	23	32	2023-08-01 12:00:00
718	25	32	2023-08-01 12:00:00
719	9	32	2023-08-01 12:00:00
721	14	35	2023-08-01 12:00:00
722	13	35	2023-08-01 12:00:00
723	12	14	2023-08-01 12:00:00
724	32	14	2023-08-01 12:00:00
725	5	20	2023-08-01 12:00:00
726	31	20	2023-08-01 12:00:00
727	22	20	2023-08-01 12:00:00
728	24	31	2023-08-01 12:00:00
729	8	31	2023-08-01 12:00:00
730	18	28	2023-08-01 12:00:00
731	17	28	2023-08-01 12:00:00
732	19	28	2023-08-01 12:00:00
733	11	23	2023-08-01 12:00:00
734	39	23	2023-08-01 12:00:00
735	36	25	2023-08-01 12:00:00
736	35	25	2023-08-01 12:00:00
737	33	25	2023-08-01 12:00:00
738	34	25	2023-08-01 12:00:00
739	36	25	2023-08-02 12:00:00
740	35	25	2023-08-02 12:00:00
741	33	25	2023-08-02 12:00:00
742	34	25	2023-08-02 12:00:00
743	37	35	2023-08-02 12:00:00
744	13	35	2023-08-02 12:00:00
745	14	35	2023-08-02 12:00:00
746	22	20	2023-08-02 12:00:00
747	5	20	2023-08-02 12:00:00
748	31	20	2023-08-02 12:00:00
749	12	20	2023-08-02 12:00:00
750	32	20	2023-08-02 12:00:00
751	18	20	2023-08-02 12:00:00
752	19	20	2023-08-02 12:00:00
753	20	20	2023-08-02 12:00:00
754	9	32	2023-08-02 12:00:00
755	25	32	2023-08-02 12:00:00
756	23	32	2023-08-02 12:00:00
757	8	31	2023-08-02 12:00:00
758	24	31	2023-08-02 12:00:00
759	36	25	2023-08-03 12:00:00
760	35	25	2023-08-03 12:00:00
761	33	25	2023-08-03 12:00:00
762	34	25	2023-08-03 12:00:00
763	39	23	2023-08-03 12:00:00
764	11	23	2023-08-03 12:00:00
765	9	32	2023-08-03 12:00:00
766	25	32	2023-08-03 12:00:00
767	23	32	2023-08-03 12:00:00
768	12	13	2023-08-03 12:00:00
769	32	13	2023-08-03 12:00:00
770	39	23	2023-08-02 12:00:00
771	11	23	2023-08-02 12:00:00
772	8	31	2023-08-03 12:00:00
773	24	31	2023-08-03 12:00:00
774	19	28	2023-08-03 12:00:00
775	20	28	2023-08-03 12:00:00
776	17	28	2023-08-03 12:00:00
777	18	28	2023-08-03 12:00:00
779	14	35	2023-08-03 12:00:00
780	13	35	2023-08-03 12:00:00
781	37	35	2023-08-03 12:00:00
782	5	20	2023-08-03 12:00:00
783	22	20	2023-08-03 12:00:00
784	31	20	2023-08-03 12:00:00
785	11	23	2023-08-04 12:00:00
786	29	23	2023-08-04 12:00:00
787	39	23	2023-08-04 12:00:00
788	23	32	2023-08-04 12:00:00
789	25	32	2023-08-04 12:00:00
790	9	32	2023-08-04 12:00:00
791	12	13	2023-08-04 12:00:00
792	32	13	2023-08-04 12:00:00
793	8	31	2023-08-04 12:00:00
794	24	31	2023-08-04 12:00:00
795	19	28	2023-08-04 12:00:00
796	17	28	2023-08-04 12:00:00
797	18	28	2023-08-04 12:00:00
798	20	28	2023-08-04 12:00:00
799	13	35	2023-08-04 12:00:00
800	14	35	2023-08-04 12:00:00
801	37	35	2023-08-04 12:00:00
802	5	20	2023-08-04 12:00:00
803	22	20	2023-08-04 12:00:00
804	31	20	2023-08-04 12:00:00
805	33	25	2023-08-04 12:00:00
806	34	25	2023-08-04 12:00:00
807	36	25	2023-08-04 12:00:00
808	35	25	2023-08-04 12:00:00
809	35	25	2023-08-07 12:00:00
810	33	25	2023-08-07 12:00:00
811	34	25	2023-08-07 12:00:00
812	36	25	2023-08-07 12:00:00
814	29	23	2023-08-07 12:00:00
815	39	23	2023-08-07 12:00:00
816	23	32	2023-08-07 12:00:00
817	25	32	2023-08-07 12:00:00
818	9	32	2023-08-07 12:00:00
819	12	13	2023-08-07 12:00:00
820	32	13	2023-08-07 12:00:00
821	24	31	2023-08-07 12:00:00
822	8	31	2023-08-07 12:00:00
823	18	28	2023-08-07 12:00:00
824	19	28	2023-08-07 12:00:00
825	17	28	2023-08-07 12:00:00
826	14	35	2023-08-07 12:00:00
827	13	35	2023-08-07 12:00:00
828	37	35	2023-08-07 12:00:00
829	22	20	2023-08-07 12:00:00
830	31	20	2023-08-07 12:00:00
831	5	20	2023-08-07 12:00:00
\.


--
-- Data for Name: incomes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incomes (id, name, date, client_id, value, author) FROM stdin;
1	HS-01	2023-06-30 20:36:02.664	20	3000000	Paulo
2	BB-01	2023-07-07 18:11:16.922	35	1000000	Paulo
3	AL-01	2023-07-07 18:12:04.696	28	1600000	Paulo
4	MP-01	2023-07-07 18:12:23.798	31	390000	Paulo
5	SECB-01	2023-07-07 18:12:44.858	37	11448083	Paulo
7	MP-S-01	2023-07-07 18:20:38.65	31	-1000000	Paulo
9	CHQ-S-01	2023-07-07 18:22:35.874	37	-210200	Paulo
10	AC-01	2023-07-11 13:41:16.822	32	4437450	Paulo
13	CHQ-S-02	2023-07-14 11:59:40	37	-200000	Paulo
14	DRL-S-01	2023-07-14 12:00:12	37	-200000	Paulo
15	HS-02	2023-07-21 20:15:28.298	20	4824900	Paulo
19	CHQ-S-001	2023-07-26 17:49:22.775	37	-60000	Paulo
20	AC-001	2023-08-02 20:14:12.159	32	2724600	Paulo
21	CI-0001	2023-08-02 20:14:28.95	45	2309938	Paulo
22	MP-002	2023-08-02 20:20:42.522	31	1000000	Paulo
24	CHQ-S-002	2023-08-02 20:22:04.287	37	-30000	Paulo
25	IR-0001	2023-08-03 15:12:46.967	48	14544400	Paulo
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, invoice, date, store_id, client_id, value, value_negotiated, value_cash, value_financed, author) FROM stdin;
38	278206	2022-12-28 11:21:06	13	25	6750	\N	5594	6750	\N
40	278236	2022-12-28 11:23:29	13	25	15750	\N	13053	15750	\N
41	278364	2022-12-29 11:24:33	13	16	99800	\N	82709	99800	\N
42	278416	2022-12-29 11:25:12	13	16	4425	\N	3667	4425	\N
43	278507	2022-12-29 11:25:58	13	25	32900	\N	27266	32900	\N
44	278582	2022-12-30 11:26:27	13	20	33500	\N	27763	33500	\N
45	278921	2023-01-02 11:27:12	13	13	31589	\N	26180	31589	\N
46	278892	2023-01-02 11:33:00	13	15	34800	\N	28841	34800	\N
47	278889	2023-01-02 11:33:31	13	16	48290	\N	40020	48290	\N
48	278925	2023-01-02 11:37:14	13	14	16750	\N	13882	16750	\N
49	279080	2023-01-03 11:37:59	13	19	550	\N	455	550	\N
50	279081	2023-01-03 11:40:12	13	13	5085	\N	4214	5085	\N
51	279082	2023-01-03 11:42:42	13	16	73800	\N	61162	73800	\N
52	279070	2023-01-03 11:43:19	13	15	38000	\N	31493	38000	\N
53	279179	2023-01-03 11:43:47	13	13	29130	\N	24141	29130	\N
54	279206	2023-01-03 11:44:14	13	16	24792	\N	20546	24792	\N
55	279209	2023-01-03 11:44:48	13	15	100000	\N	82875	100000	\N
56	279232	2023-01-03 11:45:31	13	13	99800	\N	82709	99800	\N
57	279234	2023-01-03 11:46:06	13	23	39280	\N	32552	39280	\N
58	279323	2023-01-04 11:51:55	13	16	2500	\N	2072	2500	\N
59	279321	2023-01-04 11:52:35	13	13	4250	\N	3522	4250	\N
60	279320	2023-01-04 11:54:04	13	23	9150	\N	7583	9150	\N
61	279339	2023-01-04 11:54:34	13	13	6350	\N	5263	6350	\N
62	279352	2023-01-04 11:55:12	13	13	2955	\N	2449	2955	\N
63	279511	2023-01-05 11:55:38	13	20	49200	\N	40775	49200	\N
64	279536	2023-01-05 11:56:29	13	20	7600	\N	6298	7600	\N
65	279537	2023-01-05 11:57:02	13	20	1100	\N	911	1100	\N
66	279581	2023-01-05 11:57:28	13	16	112209	\N	92994	112209	\N
67	279578	2023-01-05 11:58:02	13	15	31095	\N	25770	31095	\N
68	279636	2023-01-06 11:59:46	13	25	3900	\N	3232	3900	\N
69	279642	2023-01-06 12:02:08	13	13	4970	\N	4119	4970	\N
70	279075	2023-01-03 12:02:55	13	13	134870	\N	111774	134870	\N
71	279638	2023-01-06 12:04:44	13	23	56529	\N	46849	56529	\N
72	279646	2023-01-06 12:06:55	13	14	8350	\N	6920	8350	\N
73	279712	2023-01-06 12:07:38	13	14	6620	\N	5486	6620	\N
74	279668	2023-01-06 12:08:14	13	14	79400	\N	65803	79400	\N
75	279692	2023-01-06 12:08:53	13	14	5250	\N	4351	5250	\N
76	279796	2023-01-06 12:09:40	13	15	99800	\N	82709	99800	\N
77	279800	2023-01-06 12:10:09	13	16	37900	\N	31410	37900	\N
78	279801	2023-01-06 12:10:40	13	15	22000	\N	18232	22000	\N
79	279881	2023-01-07 12:11:14	13	21	13400	\N	11105	13400	\N
80	280025	2023-01-09 12:12:43	13	14	132658	\N	109940	132658	\N
81	280174	2023-01-09 12:13:24	13	14	160140	\N	132716	160140	\N
82	280303	2023-01-10 18:09:59.65	13	15	135390	\N	112204	135390	\N
83	280306	2023-01-10 18:10:34.382	13	16	41850	\N	34683	41850	\N
84	280508	2023-01-11 16:51:37	13	23	11150	\N	9241	11150	\N
85	280506	2023-01-11 16:52:32	13	15	17600	\N	14586	17600	\N
86	280660	2023-01-12 16:53:04.921	13	15	7000	\N	5801	7000	\N
87	280723	2023-01-12 16:53:37.031	13	23	2250	\N	1864	2250	\N
88	280724	2023-01-12 16:54:11.242	13	13	19080	\N	15813	19080	\N
89	280758	2023-01-12 16:54:37.313	13	25	5800	\N	4807	5800	\N
90	280766	2023-01-12 17:08:26.549	13	25	3900	\N	3232	3900	\N
91	280788	2023-01-12 18:13:00	13	13	8420	\N	6978	8420	Luana Camargo
92	280790	2023-01-12 18:16:17	13	13	19900	\N	16492	19900	Luana Camargo
93	280853	2023-01-12 18:16:53	13	16	20000	\N	16575	20000	Luana Camargo
94	280949	2023-01-13 18:20:08	13	14	3150	\N	2611	3150	Luana Camargo
95	280950	2023-01-13 18:21:04	13	13	25	\N	21	25	Luana Camargo
96	280952	2023-01-13 18:21:42	13	23	6200	\N	5138	6200	Luana Camargo
97	280947	2023-01-13 18:22:09	13	20	25800	\N	21382	25800	Luana Camargo
98	281339	2023-01-16 18:23:10	13	13	7050	\N	5843	7050	Luana Camargo
99	281269	2023-01-16 18:23:39	13	23	40975	\N	33958	40975	Luana Camargo
100	281408	2023-01-16 18:24:16	13	16	93600	\N	77571	93600	Luana Camargo
101	281410	2023-01-16 18:25:36	13	15	5600	\N	4641	5600	Luana Camargo
102	281693	2023-01-18 18:26:18	13	23	1200	\N	994	1200	Luana Camargo
103	281832	2023-01-18 18:26:42	13	14	45900	\N	38040	45900	Luana Camargo
104	281834	2023-01-18 18:32:03	13	23	3390	\N	2809	3390	Luana Camargo
105	281859	2023-01-18 18:33:10	13	23	70100	\N	58095	70100	Luana Camargo
106	281947	2023-01-19 18:39:47	13	15	175430	\N	145388	175430	Luana Camargo
107	281984	2023-01-19 18:40:34	13	16	50700	\N	42018	50700	Luana Camargo
108	282039	2023-01-19 18:43:47	13	13	41330	\N	34252	41330	Luana Camargo
109	282090	2023-01-19 18:46:05	13	15	102450	\N	84905	102450	Luana Camargo
110	282184	2023-01-20 18:46:42	13	13	68520	\N	56786	68520	Luana Camargo
111	282234	2023-01-20 18:49:45	13	23	51290	\N	42507	51290	Luana Camargo
112	282237	2023-01-20 18:51:46	13	15	57000	\N	47239	57000	Luana Camargo
113	282343	2023-01-20 18:53:01	13	13	4600	\N	3811	4600	Luana Camargo
114	282342	2023-01-20 18:53:40	13	16	6350	\N	5263	6350	Luana Camargo
115	282557	2023-01-23 18:55:15	13	14	43140	\N	35752	43140	Luana Camargo
116	282628	2023-01-23 18:56:52	13	15	184925	\N	153257	184925	Luana Camargo
117	282633	2023-01-23 18:57:39	13	16	26950	\N	22335	26950	Luana Camargo
118	282696	2023-01-23 18:58:19	13	13	6940	\N	5752	6940	Luana Camargo
119	282815	2023-01-24 18:58:57	13	13	41925	\N	34745	41925	Luana Camargo
120	282856	2023-01-24 18:59:27	13	16	7050	\N	5843	7050	Luana Camargo
121	282958	2023-01-24 18:59:53	13	23	77510	\N	64236	77510	Luana Camargo
122	282959	2023-01-24 19:00:23	13	14	62000	\N	51383	62000	Luana Camargo
123	283089	2023-01-26 19:00:52	13	14	185470	\N	153708	185470	Luana Camargo
124	283099	2023-01-26 19:01:33	13	13	79930	\N	66242	79930	Luana Camargo
125	283114	2023-01-26 19:02:06	13	15	5250	\N	4351	5250	Luana Camargo
126	283180	2023-01-26 19:02:29	13	16	173795	\N	144033	173795	Luana Camargo
127	283218	2023-01-26 19:03:10	13	25	1700	\N	1409	1700	Luana Camargo
128	283219	2023-01-26 19:03:43	13	23	5100	\N	4227	5100	Luana Camargo
129	283347	2023-01-27 19:05:02	13	26	14500	\N	12017	14500	Luana Camargo
130	283366	2023-01-27 19:05:30	13	13	27700	\N	22956	27700	Luana Camargo
131	283367	2023-01-27 19:05:55	13	16	2950	\N	2445	2950	Luana Camargo
132	283368	2023-01-27 19:06:18	13	23	30000	\N	24863	30000	Luana Camargo
133	283433	2023-01-27 19:06:43	13	20	2750	\N	2279	2750	Luana Camargo
134	283585	2023-01-28 19:07:12	13	21	13400	\N	11105	13400	Luana Camargo
135	284043	2023-02-01 11:29:15	13	13	48731	\N	48731	58800	Luana Camargo
136	284050	2023-02-01 11:33:00	13	15	35694	\N	35694	43070	Luana Camargo
137	284068	2023-02-01 11:38:28	13	14	39366	\N	39366	47500	Luana Camargo
138	284077	2023-02-01 11:39:17	13	13	3629	\N	3629	4380	Luana Camargo
139	284073	2023-02-01 11:39:50	13	14	67908	\N	67908	81940	Luana Camargo
140	284090	2023-02-01 11:40:53	13	16	84184	\N	84184	101580	Luana Camargo
141	284150	2023-02-01 11:44:27	13	13	16244	\N	16244	19600	Luana Camargo
142	284083	2023-02-01 11:45:35	13	23	71745	\N	71745	86570	Luana Camargo
143	284208	2023-02-01 11:46:12	13	13	6298	\N	6298	7600	Luana Camargo
144	284272	2023-02-02 11:46:40	13	13	8022	\N	8022	9680	Luana Camargo
145	284349	2023-02-02 11:47:35	13	13	19558	\N	19558	23600	Luana Camargo
146	284353	2023-02-02 11:48:05	13	23	49435	\N	49435	59650	Luana Camargo
147	284363	2023-02-02 11:52:12	13	27	19558	\N	19558	23600	Luana Camargo
148	284494	2023-02-03 11:53:48	13	20	52874	\N	52874	63800	Luana Camargo
149	284530	2023-02-03 11:59:20	13	20	77530	\N	77530	93550	Luana Camargo
150	284566	2023-02-03 11:59:59	13	20	1202	\N	1202	1450	Luana Camargo
151	284905	2023-02-06 19:35:54.073	13	27	31161	\N	31161	37600	Luana Camargo
152	284928	2023-02-06 19:36:41.803	13	13	71074	\N	71074	85760	Luana Camargo
153	284976	2023-02-06 19:37:24.691	13	20	15538	\N	15538	18750	Luana Camargo
154	285077	2023-02-07 19:25:39.076	13	21	26848	\N	26848	32395	Luana Camargo
155	285168	2023-02-07 19:31:35.972	13	28	8122	\N	8122	9800	Luana Camargo
156	285206	2023-02-07 19:32:00.811	13	27	143080	143080	144261	174070	Luana Camargo
157	285244	2023-02-07 18:46:25	13	28	19558	\N	19558	23600	Luana Camargo
158	285247	2023-02-07 18:49:16	13	28	170959	\N	170959	206285	Luana Camargo
159	285257	2023-02-08 18:50:05.797	13	20	7044	\N	7044	8500	Luana Camargo
160	285270	2023-02-08 18:50:43.399	13	23	14047	\N	14047	16950	Luana Camargo
161	285305	2023-02-08 18:52:24.128	13	29	2984	\N	2984	3600	Luana Camargo
162	285358	2023-02-08 18:54:59.304	13	14	106378	\N	106378	128359	Luana Camargo
163	285359	2023-02-08 18:55:26.468	13	13	36871	\N	36871	44490	Luana Camargo
164	285361	2023-02-08 18:55:54.95	13	23	43841	\N	43841	52900	Luana Camargo
201	287278	2023-02-20 13:45:23	13	16	6216	\N	6216	7500	Luana Camargo
202	287336	2023-02-20 13:46:04	13	20	74422	\N	74422	89800	Luana Camargo
167	285435	2023-02-08 11:19:31	13	23	4227	\N	4227	5100	Luana Camargo
168	285492	2023-02-08 13:07:26	13	23	994	\N	994	1200	Luana Camargo
169	285535	2023-02-09 13:08:14	13	23	1989	\N	1989	2400	Luana Camargo
170	285572	2023-02-09 13:08:42	13	16	9282	\N	9282	11200	Luana Camargo
171	285573	2023-02-09 13:09:19	13	28	8246	\N	8246	9950	Luana Camargo
172	285634	2023-02-09 13:12:21	13	23	189527	\N	189527	228690	Luana Camargo
173	285660	2023-02-09 13:13:13	13	23	85950	\N	85950	103709	Luana Camargo
174	285809	2023-02-10 13:13:58	13	14	16244	\N	16244	19600	Luana Camargo
175	285808	2023-02-10 13:14:28	13	16	101290	\N	101290	122220	Luana Camargo
176	285849	2023-02-10 13:15:07	13	25	2196	\N	2196	2650	Luana Camargo
177	285882	2023-02-10 13:15:59	13	20	8992	\N	8992	10850	Luana Camargo
178	285880	2023-02-10 13:16:39	13	23	9696	\N	9696	11700	Luana Camargo
179	285953	2023-02-10 13:17:05	13	28	11395	\N	11395	13750	Luana Camargo
180	285977	2023-02-11 13:17:36	13	20	10604	\N	10604	12795	Luana Camargo
181	286150	2023-02-13 13:18:15	13	23	19807	\N	19807	23900	Luana Camargo
182	280674	2023-02-13 13:19:16	13	18	27845	\N	27845	33600	Luana Camargo
183	286444	2023-02-14 13:20:02	13	14	4634	\N	4634	5592	Luana Camargo
184	286522	2023-02-15 13:21:16	13	15	64904	\N	64904	78315	Luana Camargo
185	286524	2023-02-15 13:21:51	13	23	4682	\N	4682	5650	Luana Camargo
186	286585	2023-02-15 13:22:29	13	28	254957	\N	254957	307640	Luana Camargo
187	286603	2023-02-15 13:23:37	13	23	86492	\N	86492	104365	Luana Camargo
188	286652	2023-02-15 13:24:49	13	28	19186	\N	19186	23150	Luana Camargo
189	286653	2023-02-15 13:25:44	13	13	21034	\N	21034	25380	Luana Camargo
190	286655	2023-02-15 13:26:07	13	14	17528	\N	17528	21150	Luana Camargo
192	286968	2023-02-17 13:27:04	13	14	98671	\N	98671	119059	Luana Camargo
193	287004	2023-02-17 13:27:38	13	13	1119	\N	1119	1350	Luana Camargo
194	287002	2023-02-17 13:28:17	13	20	10993	\N	10993	13265	Luana Camargo
195	287003	2023-02-17 13:29:02	13	20	25401	\N	25401	30650	Luana Camargo
196	287067	2023-02-17 13:41:43	13	28	45167	\N	45167	54500	Luana Camargo
197	287121	2023-02-18 13:42:59	13	20	33150	\N	33150	40000	Luana Camargo
198	287125	2023-02-18 13:43:27	13	20	2180	\N	2180	2630	Luana Camargo
199	287209	2023-02-18 13:44:07	13	23	46700	\N	46700	56350	Luana Camargo
200	287317	2023-02-20 13:44:41	13	13	84533	\N	84533	102000	Luana Camargo
203	287371	2023-02-20 13:46:41	13	14	54474	\N	54474	65730	Luana Camargo
204	287499	2023-02-22 13:47:15	13	20	10094	\N	10094	12180	Luana Camargo
205	287510	2023-02-22 13:47:44.601	13	15	19766	\N	19766	23850	Luana Camargo
206	287511	2023-02-22 13:48:11.535	13	16	5387	\N	5387	6500	Luana Camargo
207	286699	2023-02-15 13:48:35	13	28	72516	\N	72516	87500	Luana Camargo
208	286714	2023-02-15 13:50:09	13	23	12149	\N	12149	14660	Luana Camargo
209	286726	2023-02-16 13:50:39	13	16	2859	\N	2859	3450	Luana Camargo
210	286727	2023-02-16 13:51:10	13	15	2859	\N	2859	3450	Luana Camargo
211	286729	2023-02-16 13:51:36	13	16	17528	\N	17528	21150	Luana Camargo
212	286738	2023-02-16 13:54:22	13	30	57241	\N	57241	69070	Luana Camargo
213	286852	2023-02-16 13:54:57	13	23	13716	\N	13716	16550	Luana Camargo
214	286854	2023-02-16 13:55:50	13	28	12887	\N	12887	15550	Luana Camargo
217	286899	2023-02-16 13:59:44	13	14	2611	\N	2611	3150	Luana Camargo
191	286656	2023-02-15 13:26:32	13	23	33606	\N	33606	40550	Luana Camargo
215	286819	2023-02-16 13:56:15	13	14	10235	\N	10235	12350	Luana Camargo
216	286896	2023-02-16 13:56:56	13	14	3025	\N	3025	3650	Luana Camargo
218	287560	2023-02-22 14:08:22.211	13	20	1115	\N	1115	1345	Luana Camargo
219	287553	2023-02-22 17:40:46.977	13	20	2652	\N	2652	3200	Luana Camargo
220	287543	2023-02-22 17:41:12.582	13	28	54698	\N	54698	66000	Luana Camargo
221	287613	2023-02-22 17:42:57.842	13	30	78557	\N	78557	94790	Luana Camargo
222	287625	2023-02-22 17:43:48.764	13	16	61327	\N	61327	74000	Luana Camargo
223	287551	2023-02-22 19:09:29.154	13	23	42747	\N	42747	51579	Luana Camargo
224	287688	2023-02-22 18:20:44	13	15	45067	\N	45067	54379	Luana Camargo
225	287773	2023-02-23 18:21:21	13	16	3771	\N	3771	4550	Luana Camargo
226	287776	2023-02-23 18:23:05	13	13	4061	\N	4061	4900	Luana Camargo
227	287777	2023-02-23 18:23:34	13	20	5138	\N	5138	6200	Luana Camargo
228	287763	2023-02-23 18:23:58	13	14	4475	\N	4475	5400	Luana Camargo
229	287859	2023-02-23 18:24:26	13	28	4434	\N	4434	5350	Luana Camargo
230	287971	2023-02-24 18:24:51.034	13	16	16534	\N	16534	19950	Luana Camargo
231	287977	2023-02-24 18:25:15.525	13	20	911	\N	911	1100	Luana Camargo
232	287975	2023-02-24 18:25:38.518	13	30	7861	\N	7861	9485	Luana Camargo
233	287989	2023-02-24 18:26:55.388	13	16	47880	\N	39681	47880	Luana Camargo
234	287963	2023-02-24 18:27:18.776	13	15	43310	\N	43310	52260	Luana Camargo
235	287995	2023-02-24 18:27:49.172	13	28	35288	\N	35288	42580	Luana Camargo
236	288025	2023-02-24 18:28:37.52	13	28	48399	\N	48399	58400	Luana Camargo
237	288098	2023-02-24 18:29:01.06	13	20	22169	\N	22169	26750	Luana Camargo
238	288260	2023-02-25 11:51:23	13	20	2901	\N	2901	3500	Luana Camargo
239	288370	2023-02-27 18:09:53	13	16	14047	\N	14047	16950	Luana Camargo
240	288407	2023-02-27 18:15:08	13	14	762	\N	762	919	Luana Camargo
241	288405	2023-02-27 18:16:37	13	23	1044	\N	1044	1260	Luana Camargo
242	288490	2023-02-27 18:17:40	13	23	2760	\N	2760	3329	Luana Camargo
243	288623	2023-02-28 18:18:07.265	13	16	2030	\N	2030	2450	Luana Camargo
244	288621	2023-02-28 18:18:32.847	13	23	2735	\N	2735	3300	Luana Camargo
245	288625	2023-02-28 18:19:01.875	13	25	497	\N	497	600	Luana Camargo
246	288746	2023-02-28 18:20:14.806	13	28	56032	\N	56032	67610	Luana Camargo
247	288752	2023-02-28 18:22:00.133	13	28	165418	\N	165418	199600	Luana Camargo
249	288812	2023-02-28 17:00:02	13	14	62372	\N	62372	75260	Luana Camargo
248	288805	2023-02-28 11:30:23	13	15	37605	\N	37605	45375	Luana Camargo
250	288820	2023-02-28 17:02:33	13	14	52232	\N	52232	63025	Luana Camargo
251	288873	2023-03-01 17:03:26	13	20	911	\N	911	1100	Luana Camargo
252	288878	2023-03-01 17:03:57	13	23	22708	\N	22708	27400	Luana Camargo
253	288879	2023-03-01 17:05:46	13	20	4890	\N	4890	5900	Luana Camargo
254	288853	2023-03-01 17:06:19	13	16	25650	\N	25650	30950	Luana Camargo
255	288950	2023-03-01 17:07:03	13	28	2113	\N	2113	2550	Luana Camargo
256	288949	2023-03-01 17:07:30	13	14	2279	\N	2279	2750	Luana Camargo
257	289055	2023-03-02 17:08:21.195	13	14	16492	\N	16492	19900	Luana Camargo
258	289056	2023-03-02 17:08:50.173	13	23	29669	\N	29669	35800	Luana Camargo
259	289083	2023-03-02 17:10:49.524	13	16	68571	\N	68571	82740	Luana Camargo
260	289145	2023-03-02 17:11:21	13	16	26520	\N	26520	32000	Luana Camargo
261	289183	2023-03-02 17:30:45	13	14	28989	\N	28989	34980	Luana Camargo
262	289190	2023-03-02 17:39:29	13	14	25459	\N	25459	30720	Luana Camargo
263	289206	2023-03-02 17:40:16	13	19	48747	\N	48747	58820	Luana Camargo
264	289214	2023-03-02 17:42:07	13	23	3811	\N	3811	4600	Luana Camargo
265	289203	2023-03-02 17:42:37	13	28	4475	\N	4475	5400	Luana Camargo
266	289204	2023-03-02 17:43:05	13	14	6464	\N	6464	7800	Luana Camargo
267	289342	2023-03-03 17:43:28	13	20	3274	\N	3274	3950	Luana Camargo
268	289383	2023-03-03 17:44:02	13	20	1492	\N	1492	1800	Luana Camargo
269	289393	2023-03-03 17:44:58	13	23	4268	\N	4268	5150	Luana Camargo
270	289411	2023-03-03 17:45:28	13	14	5801	\N	5801	7000	Luana Camargo
271	289557	2023-03-04 17:46:13	13	20	3274	\N	3274	3950	Luana Camargo
272	289569	2023-03-04 17:48:00	13	19	8205	\N	8205	9900	Luana Camargo
273	289574	2023-03-04 17:48:31	13	19	66217	\N	66217	79900	Luana Camargo
274	289712	2023-03-06 17:50:45.57	13	19	4935	\N	4935	5955	Luana Camargo
276	289753	2023-03-06 17:51:46.775	13	13	7550	\N	7550	9110	Luana Camargo
277	289748	2023-03-06 17:52:20.11	13	19	30664	\N	30664	37000	Luana Camargo
278	289779	2023-03-06 17:52:47.352	13	25	10111	\N	10111	12200	Luana Camargo
279	289781	2023-03-06 17:53:17.535	13	19	497	\N	497	600	Luana Camargo
280	289874	2023-03-06 17:53:39.552	13	15	4641	\N	4641	5600	Luana Camargo
281	289877	2023-03-06 17:54:18.348	13	23	601	\N	601	725	Luana Camargo
282	289875	2023-03-06 17:54:37.515	13	25	15788	\N	15788	19050	Luana Camargo
283	289914	2023-03-06 12:06:57	13	16	4807	\N	4807	5800	Luana Camargo
284	289927	2023-03-06 12:11:06	13	13	48424	\N	48424	58429	Luana Camargo
285	290016	2023-03-07 12:12:00	13	28	17155	\N	17155	20700	Luana Camargo
286	290012	2023-03-07 12:12:39	13	14	3397	\N	3397	4100	Luana Camargo
287	290134	2023-03-07 12:12:59	13	25	704	\N	704	850	Luana Camargo
288	290164	2023-03-07 12:13:33	13	15	233723	\N	233723	282020	Luana Camargo
289	290159	2023-03-07 12:14:19	13	28	256183	\N	256183	309120	Luana Camargo
290	290212	2023-03-08 12:14:52	13	14	738	\N	738	890	Luana Camargo
291	290219	2023-03-08 12:15:18	13	13	1367	\N	1367	1650	Luana Camargo
292	290270	2023-03-08 12:15:59	13	23	12846	\N	12846	15500	Luana Camargo
293	290267	2023-03-08 12:16:27	13	13	13674	\N	13674	16500	Luana Camargo
294	290277	2023-03-08 12:16:50	13	14	11370	\N	11370	13719	Luana Camargo
295	290280	2023-03-08 12:17:25	13	25	3431	\N	3431	4140	Luana Camargo
296	290301	2023-03-08 12:17:53	13	14	162261	\N	162261	195790	Luana Camargo
297	290330	2023-03-08 12:18:57	13	14	12025	\N	12025	14510	Luana Camargo
298	290328	2023-03-08 12:19:58	13	30	497	\N	497	600	Luana Camargo
275	289761	2023-03-06 17:51:18.871	13	30	8859	\N	8859	10690	Luana Camargo
299	287852	2023-02-23 18:24:45	13	30	10608	\N	10608	12800	Luana Camargo
300	287713	2023-02-23 18:51:11	13	30	16542	\N	16542	19960	Luana Camargo
301	288584	2023-02-28 18:54:03	13	30	23416	\N	23416	28255	Luana Camargo
302	290428	2023-03-09 11:46:39	13	15	26106	\N	26106	31500	Luana Camargo
303	290429	2023-03-09 11:47:40	13	16	26106	\N	26106	31500	Luana Camargo
304	290555	2023-03-09 11:48:16	13	16	39407	\N	39407	47550	Luana Camargo
305	290608	2023-03-10 11:48:55	13	28	15249	\N	15249	18400	Luana Camargo
306	290613	2023-03-10 11:49:35	13	28	73034	\N	73034	88125	Luana Camargo
307	290616	2023-03-10 11:50:06	13	23	45391	\N	45391	54770	Luana Camargo
308	290620	2023-03-10 11:50:36	13	27	23122	\N	23122	27900	Luana Camargo
309	290689	2023-03-10 11:51:21	13	13	5387	\N	5387	6500	Luana Camargo
310	290691	2023-03-10 11:51:48	13	23	3978	\N	3978	4800	Luana Camargo
311	290690	2023-03-10 11:52:21	13	25	5760	\N	5760	6950	Luana Camargo
312	290776	2023-03-10 11:52:53	13	18	15208	\N	15208	18350	Luana Camargo
313	290794	2023-03-10 11:53:24	13	23	20205	\N	20205	24380	Luana Camargo
314	290812	2023-03-10 11:53:56	13	15	29172	\N	29172	35200	Luana Camargo
315	290873	2023-03-11 11:54:27	13	20	7127	\N	7127	8600	Luana Camargo
316	291025	2023-03-13 14:42:01	13	30	22907	\N	22907	27639	Luana Camargo
317	291076	2023-03-13 14:43:52	13	14	21465	\N	21465	25900	Luana Camargo
318	291105	2023-03-13 14:44:21	13	20	10111	\N	10111	12200	Luana Camargo
319	291039	2023-03-13 14:44:54	13	28	280292	\N	280292	338210	Luana Camargo
320	291046	2023-03-13 14:45:33	13	14	55725	\N	55725	67240	Luana Camargo
321	291134	2023-03-13 14:46:02	13	23	36283	\N	36283	43780	Luana Camargo
322	291167	2023-03-13 14:46:36	13	23	28558	\N	28558	34460	Luana Camargo
323	291210	2023-03-14 14:48:54.502	13	13	7625	\N	7625	9200	Luana Camargo
324	291358	2023-03-14 11:37:19	13	28	82709	\N	82709	99800	Luana Camargo
325	291375	2023-03-14 12:09:45	13	25	894	\N	894	1080	Luana Camargo
326	291440	2023-03-15 12:11:43	13	28	21133	\N	21133	25500	Luana Camargo
327	291434	2023-03-15 13:05:01	13	23	13388	\N	13388	16155	Luana Camargo
328	291476	2023-03-15 13:05:33	13	25	7625	\N	7625	9200	Luana Camargo
329	291474	2023-03-15 13:05:58	13	23	2611	\N	2611	3150	Luana Camargo
330	291525	2023-03-15 13:06:25	13	20	10815	\N	10815	13050	Luana Camargo
331	291526	2023-03-15 13:06:55	13	28	29752	\N	29752	35900	Luana Camargo
332	291829	2023-03-16 14:10:17	13	23	10102	\N	10102	12190	Luana Camargo
333	291883	2023-03-17 14:10:52	13	28	32570	\N	32570	39300	Luana Camargo
334	291905	2023-03-17 14:11:28	13	20	16534	\N	16534	19950	Luana Camargo
335	291740	2023-03-16 14:11:57	13	30	2681	\N	2681	3235	Luana Camargo
336	291753	2023-03-16 14:50:04	13	23	19886	\N	19886	23995	Luana Camargo
337	291679	2023-03-16 14:50:41	13	15	38686	\N	38686	46680	Luana Camargo
338	291701	2023-03-16 14:51:08	13	16	44338	\N	44338	53500	Luana Camargo
339	291768	2023-03-16 14:51:32	13	28	33888	\N	33888	40890	Luana Camargo
340	291787	2023-03-16 14:52:10	13	14	5627	\N	5627	6790	Luana Camargo
341	291950	2023-03-17 14:52:39.355	13	30	1044	\N	1044	1260	Luana Camargo
342	291958	2023-03-17 14:53:28.176	13	23	31194	\N	31194	37640	Luana Camargo
343	291890	2023-03-17 16:45:25	13	15	8039	\N	8039	9700	Luana Camargo
344	291902	2023-03-17 17:08:10	13	14	146672	\N	146672	176980	Luana Camargo
345	291908	2023-03-17 17:08:42	13	27	6050	\N	6050	7300	Luana Camargo
346	292044	2023-03-17 17:09:12	13	14	6622	\N	6622	7990	Luana Camargo
347	292046	2023-03-17 17:09:41	13	19	13335	\N	13335	16090	Luana Camargo
348	292065	2023-03-17 17:10:09	13	27	284203	\N	284203	342930	Luana Camargo
349	292286	2023-03-20 17:10:52	13	23	10102	\N	10102	12190	Luana Camargo
350	292318	2023-03-20 17:11:33	13	15	32984	\N	32984	39800	Luana Camargo
351	292320	2023-03-20 17:12:06.947	13	28	39366	\N	39366	47500	Luana Camargo
352	292345	2023-03-20 17:12:41.427	13	30	5710	\N	5710	6890	Luana Camargo
353	292432	2023-03-20 14:51:19	13	15	38711	\N	38711	46710	Luana Camargo
354	292424	2023-03-20 14:52:24	13	14	3688	\N	3688	4450	Luana Camargo
355	292425	2023-03-20 14:53:09	13	14	3083	\N	3083	3720	Luana Camargo
356	292484	2023-03-21 14:53:37	13	16	76079	\N	76079	91800	Luana Camargo
357	292532	2023-03-21 14:54:17	13	14	6995	\N	6995	8440	Luana Camargo
358	292543	2023-03-21 14:54:49	13	27	41902	\N	41902	50560	Luana Camargo
359	292705	2023-03-22 14:55:20	13	28	113323	\N	113323	136740	Luana Camargo
360	292698	2023-03-22 14:55:52.231	13	28	23122	\N	23122	27900	Luana Camargo
361	292720	2023-03-22 14:56:15.844	13	14	31127	\N	31127	37560	Luana Camargo
362	292709	2023-03-22 14:56:41.776	13	13	10227	\N	10227	12340	Luana Camargo
363	292752	2023-03-22 14:57:06.153	13	30	10442	\N	10442	12600	Luana Camargo
364	292800	2023-03-22 11:23:10	13	23	58501	\N	58501	70590	Luana Camargo
365	292700	2023-03-22 11:30:09	13	14	7417	\N	7417	8950	Luana Camargo
366	292925	2023-03-23 11:31:04	13	14	11437	\N	11437	13800	Luana Camargo
367	292921	2023-03-23 11:31:34	13	16	16492	\N	16492	19900	Luana Camargo
368	292965	2023-03-23 11:32:33	13	25	27639	\N	27639	33350	Luana Camargo
369	292961	2023-03-23 11:34:05	13	14	18605	\N	18605	22450	Luana Camargo
370	292977	2023-03-23 11:34:44	13	28	12763	\N	12763	15400	Luana Camargo
371	292983	2023-03-23 11:35:27	13	28	19476	\N	19476	23500	Luana Camargo
372	293022	2023-03-23 11:36:14	13	16	21755	\N	21755	26250	Luana Camargo
373	293101	2023-03-23 11:36:53	13	16	4144	\N	4144	5000	Luana Camargo
374	293105	2023-03-23 11:37:22	13	16	2486	\N	2486	3000	Luana Camargo
375	293144	2023-03-24 11:38:22	13	27	26454	\N	26454	31920	Luana Camargo
376	293193	2023-03-24 11:39:03	13	25	4475	\N	4475	5400	Luana Camargo
377	293245	2023-03-24 11:39:49	13	28	10939	\N	10939	13200	Luana Camargo
378	293244	2023-03-24 11:40:22	13	16	2569	\N	2569	3100	Luana Camargo
379	293246	2023-03-24 11:40:52	13	15	273	\N	273	330	Luana Camargo
380	293230	2023-03-24 11:41:20	13	23	33175	\N	33175	40030	Luana Camargo
381	293260	2023-03-24 11:42:06	13	13	1367	\N	1367	1650	Luana Camargo
382	293261	2023-03-24 11:42:41	13	20	269	\N	269	325	Luana Camargo
383	293252	2023-03-24 11:43:13	13	13	30452	\N	30452	36745	Luana Camargo
385	293294	2023-03-24 11:44:28	13	20	1948	\N	1948	2350	Luana Camargo
384	293290	2023-03-24 11:43:55	13	20	3978	\N	3978	4800	Luana Camargo
386	293569	2023-03-27 11:45:03.254	13	28	46791	\N	46791	56460	Luana Camargo
387	293597	2023-03-27 18:49:59.84	13	14	33067	\N	33067	39900	Luana Camargo
388	293651	2023-03-27 18:50:23.524	13	13	7293	\N	7293	8800	Luana Camargo
389	293654	2023-03-27 18:50:54.518	13	20	1948	\N	1948	2350	Luana Camargo
390	293652	2023-03-27 18:51:21.311	13	25	4227	\N	4227	5100	Luana Camargo
391	293704	2023-03-28 12:27:15.011	13	30	14503	\N	14503	17500	Luana Camargo
392	293657	2023-03-27 12:27:45	13	23	150609	\N	150609	181730	Luana Camargo
393	293658	2023-03-27 12:29:31	13	28	12680	\N	12680	15300	Luana Camargo
394	293660	2023-03-27 12:29:57	13	28	4227	\N	4227	5100	Luana Camargo
395	293669	2023-03-27 12:30:20	13	28	25733	\N	25733	31050	Luana Camargo
396	293523	2023-03-27 12:30:49	13	16	50193	\N	50193	60565	Luana Camargo
397	293721	2023-03-28 16:45:38.607	13	15	50653	\N	50653	61120	Luana Camargo
398	293745	2023-03-28 16:47:15.312	13	19	10558	\N	10558	12740	Luana Camargo
399	293753	2023-03-28 16:47:45.038	13	19	101737	\N	101737	122759	Luana Camargo
400	293766	2023-03-28 16:48:22.924	13	19	1160	\N	1160	1400	Luana Camargo
401	293774	2023-03-28 16:48:48.898	13	13	5884	\N	5884	7100	Luana Camargo
402	293798	2023-03-28 16:49:13.354	13	27	83439	\N	83439	100680	Luana Camargo
403	293825	2023-03-28 16:50:42.014	13	13	29172	\N	29172	35200	Luana Camargo
404	293826	2023-03-28 16:51:09.717	13	19	3953	\N	3953	4770	Luana Camargo
405	293833	2023-03-28 11:44:56	13	27	29752	\N	29752	35900	Luana Camargo
406	293887	2023-03-28 11:47:37	13	19	3017	\N	3017	3640	Luana Camargo
407	293935	2023-03-29 11:48:03	13	16	197533	\N	197533	238350	Luana Camargo
408	293948	2023-03-29 11:48:39	13	15	164673	\N	164673	198700	Luana Camargo
409	293954	2023-03-29 11:49:05	13	23	32156	\N	32156	38800	Luana Camargo
410	294096	2023-03-29 11:49:40	13	16	249	\N	249	300	Luana Camargo
411	294093	2023-03-29 11:50:06	13	16	6837	\N	6837	8250	Luana Camargo
412	294094	2023-03-29 11:50:31	13	15	18274	\N	18274	22050	Luana Camargo
413	294099	2023-03-29 11:50:57	13	16	1367	\N	1367	1650	Luana Camargo
414	294035	2023-03-29 11:51:29	13	30	30788	\N	30788	37150	Luana Camargo
415	294041	2023-03-29 11:51:54	13	30	1739	\N	1739	2100	Luana Camargo
416	294136	2023-03-30 13:51:29	13	16	3108	\N	3108	3750	Luana Camargo
417	294150	2023-03-30 13:52:26	13	15	11437	\N	11437	13800	Luana Camargo
418	294178	2023-03-30 13:53:00	13	19	17155	\N	17155	20700	Luana Camargo
419	294171	2023-03-30 13:53:33	13	28	24780	\N	24780	29900	Luana Camargo
420	294186	2023-03-30 13:53:59	13	28	236683	\N	236683	285590	Luana Camargo
421	294196	2023-03-30 13:54:32	13	28	1483	\N	1483	1789	Luana Camargo
422	294197	2023-03-30 13:57:44	13	16	4434	\N	4434	5350	Luana Camargo
423	294132	2023-03-30 13:58:10	13	27	6962	\N	6962	8400	Luana Camargo
424	294211	2023-03-30 13:58:37	13	15	31451	\N	31451	37950	Luana Camargo
425	294191	2023-03-30 13:59:06	13	23	461368	\N	461368	556705	Luana Camargo
426	294322	2023-03-30 14:00:05	13	13	2445	\N	2445	2950	Luana Camargo
427	294404	2023-03-31 14:00:32.717	13	25	3729	\N	3729	4500	Luana Camargo
428	294397	2023-03-31 14:01:05.541	13	15	82672	\N	82672	99755	Luana Camargo
429	294414	2023-03-31 14:01:42.542	13	13	42929	\N	42929	51800	Luana Camargo
430	294430	2023-03-31 14:02:08.104	13	16	1864	\N	1864	2250	Luana Camargo
431	47721	2023-06-20 12:42:24	20	13	59000	59000	51876	62595	Paulo
432	107208	2023-06-21 12:44:42	19	13	30000	30000	29686	35820	Paulo
433	062138	2023-06-20 12:46:37	17	13	210000	\N	174038	210000	Paulo
434	86911	2023-06-21 12:47:28	18	13	13499	\N	11187	13499	Paulo
436	682932	2023-06-23 11:42:02	21	25	29900	\N	24780	29900	Paulo
437	018607	2023-06-26 11:44:33.726	22	13	1750	\N	1450	1750	Paulo
438	624498	2023-06-27 20:36:51.232	37	25	2990	\N	2478	2990	Paulo
439	0157575	2023-06-27 20:38:13.01	34	13	19500	\N	16161	19500	Paulo
460	23322-F	2023-05-30 11:49:17	13	23	804254	\N	666526	804254	Paulo
440	684892	2023-06-28 13:29:11.911	21	25	27908	\N	23130	27908	Paulo
441	000001	2023-06-28 13:30:50.83	38	25	40000	\N	33150	40000	Paulo
442	157684	2023-06-28 17:31:30.448	34	16	39800	\N	32984	39800	Paulo
443	157684-2	2023-06-28 17:35:18.472	34	14	39800	\N	32984	39800	Paulo
444	31010	2023-06-29 19:23:51.869	40	25	1600	\N	1326	1600	Paulo
445	737938	2023-06-29 11:30:22	41	25	9680	\N	8022	9680	Paulo
446	81146696	2023-06-22 13:27:24	18	13	26699	\N	22127	26699	Paulo
448	022938	2023-06-30 14:27:05.015	14	22	8095	\N	6709	8095	Paulo
449	615026	2023-06-30 19:44:41.59	43	28	15000	\N	12431	15000	Paulo
450	000002	2023-06-30 20:07:53.127	44	13	37240	\N	30863	37240	Paulo
451	150334	2023-06-28 20:08:56	35	13	52000	\N	43095	52000	Paulo
452	HS-01	2023-06-30 20:37:10.703	45	20	488500	\N	404844	488500	Paulo
453	MT-01	2023-06-24 20:38:16	45	31	19500	\N	16161	19500	Paulo
454	AC-01	2023-06-24 20:39:14	45	32	21000	\N	17404	21000	Paulo
455	3497-F	2023-05-30 11:37:44	13	14	1118727	\N	927145	1118727	Paulo
456	70063-F	2023-05-30 11:45:56	13	20	1948	\N	1614	1948	Paulo
457	70068-F	2023-05-30 11:47:01	13	25	34510	\N	28600	34510	Paulo
458	23325-F	2023-05-30 11:47:51	13	33	569600	\N	472056	569600	Paulo
459	3500-F	2023-05-30 11:48:36	13	19	544189	\N	450997	544189	Paulo
461	23316-F	2023-05-30 11:50:26	13	13	153559	\N	127261	153559	Paulo
462	23327-F	2023-05-30 11:51:07	13	30	400479	\N	331897	400479	Paulo
463	23315-F	2023-05-30 11:51:56	13	27	910636	\N	754690	910636	Paulo
464	3501-F	2023-05-30 11:52:48	13	16	646882	\N	536103	646882	Paulo
465	3502-F	2023-05-30 11:53:33	13	15	403215	\N	334164	403215	Paulo
466	70073-F	2023-05-30 11:54:10	13	28	651436	\N	539878	651436	Paulo
467	310622	2023-07-01 12:06:39	46	34	8700	\N	7209	8700	Paulo
468	310628	2023-07-01 12:08:13	46	34	66000	\N	54698	66000	Paulo
469	65561	2023-07-01 12:46:03	47	13	8600	\N	7127	8600	Paulo
470	370001	2023-07-03 12:46:26.551	43	28	15000	\N	12431	15000	Paulo
471	370002	2023-07-03 19:36:36.343	43	13	15000	\N	12431	15000	Paulo
447	643566	2023-07-03 13:41:06	42	25	4600	\N	3811	4600	Paulo
472	310852	2023-07-03 19:43:17.743	46	34	2350	\N	1948	2350	Paulo
474	310877	2023-07-03 19:45:34.682	46	34	117170	\N	97105	117170	Paulo
475	310911	2023-07-03 19:46:23.379	46	34	48934	\N	40554	48934	Paulo
476	310919	2023-07-03 19:49:54.298	46	34	2700	\N	2238	2700	Paulo
477	310920	2023-07-03 19:50:56.814	46	34	850	\N	704	850	Paulo
478	310918	2023-07-03 19:51:33.498	46	34	1450	\N	1202	1450	Paulo
479	310958	2023-07-03 19:54:52.369	46	34	100000	\N	82875	100000	Paulo
480	310957	2023-07-03 19:55:32.747	46	34	183754	\N	152286	183754	Paulo
481	310959	2023-07-03 19:56:03.02	46	34	23600	\N	19558	23600	Paulo
482	310992	2023-07-03 19:56:27.709	46	34	7000	\N	5801	7000	Paulo
483	310993	2023-07-03 19:57:01.77	46	34	226080	\N	187364	226080	Paulo
484	311000	2023-07-03 20:02:13.101	46	34	5660	\N	4691	5660	Paulo
485	311001	2023-07-03 20:02:44.621	46	34	7500	\N	6216	7500	Paulo
486	311002	2023-07-03 20:03:13.902	46	34	2950	\N	2445	2950	Paulo
487	310999	2023-07-03 20:03:57.359	46	34	5300	\N	4392	5300	Paulo
488	311006	2023-07-03 20:04:19.739	46	34	1455	\N	1206	1455	Paulo
489	311008	2023-07-03 20:04:47.351	46	34	240	\N	199	240	Paulo
490	311040	2023-07-03 20:05:09.822	46	34	18850	\N	15622	18850	Paulo
491	311152	2023-07-04 20:27:38.606	46	34	4750	\N	3936	4750	Paulo
492	311153	2023-07-04 20:31:07	46	34	5200	\N	4310	5200	Paulo
493	311155	2023-07-04 20:31:27.845	46	34	119150	\N	98746	119150	Paulo
494	311157	2023-07-04 20:32:18.681	46	34	26400	\N	21879	26400	Paulo
495	311160	2023-07-04 20:32:55.124	46	34	34060	\N	28227	34060	Paulo
496	311229	2023-07-04 20:33:16.091	46	34	77568	\N	64284	77568	Paulo
497	311177	2023-07-04 20:33:44.48	46	34	51700	\N	42846	51700	Paulo
498	311180	2023-07-04 20:34:13.938	46	34	645	\N	535	645	Paulo
499	311184	2023-07-04 20:34:52.292	46	34	165	\N	137	165	Paulo
500	311306	2023-07-04 20:35:13.5	46	34	4400	\N	3646	4400	Paulo
501	001-V	2023-07-03 20:38:33	48	33	5000	\N	4144	5000	Paulo
502	356354	2023-07-04 20:40:41.16	49	25	6673	\N	5530	6673	Paulo
503	614673	2023-07-04 20:41:39.064	49	25	6065	\N	5026	6065	Paulo
505	AL-01	2023-07-01 20:44:05	45	28	28000	\N	23205	28000	Paulo
504	HS-02	2023-07-01 20:42:04	45	20	72000	\N	59670	72000	Paulo
506	70064-F	2023-05-30 20:50:00	13	36	36175	\N	29980	36175	Paulo
507	23314-F	2023-05-30 20:50:52	13	25	31130	\N	25799	31130	Paulo
508	23318	2023-05-30 20:51:30	13	37	74815	\N	62003	74815	Paulo
509	RP-001-F	2023-05-30 20:52:00	13	25	17000	\N	14088	17000	Paulo
473	310842	2023-07-03 19:45:04.847	46	34	61400	\N	50885	61400	Paulo
510	240604	2023-07-05 20:56:35.505	14	28	6334	\N	5249	6334	Paulo
511	311405	2023-07-05 20:59:18.079	46	34	63440	\N	52576	63440	Paulo
512	311403	2023-07-05 21:04:19.3	46	34	19990	\N	16567	19990	Paulo
513	311379	2023-07-05 21:05:00.739	46	34	950	\N	787	950	Paulo
514	311382	2023-07-05 21:05:25.231	46	34	9340	\N	7741	9340	Paulo
515	311383	2023-07-05 21:05:50.393	46	34	2950	\N	2445	2950	Paulo
516	311544	2023-07-05 21:06:17.219	46	34	6950	\N	5760	6950	Paulo
517	311547	2023-07-05 21:06:46.329	46	34	2950	\N	2445	2950	Paulo
518	311548	2023-07-05 21:07:52.546	46	34	6950	\N	5760	6950	Paulo
519	311552	2023-07-05 21:08:29.692	46	34	498200	\N	412883	498200	Paulo
520	311622	2023-07-05 21:09:22.169	46	34	199040	\N	164954	199040	Paulo
521	662324	2023-07-06 19:38:18.113	50	25	5950	\N	4931	5950	Paulo
522	641951	2023-07-06 19:40:33.392	51	35	8000	\N	6630	8000	Paulo
523	240665	2023-07-06 19:41:03.003	14	35	7798	\N	6463	7798	Paulo
524	240664	2023-07-06 19:42:43.368	14	33	6269	\N	5195	6269	Paulo
525	240514	2023-07-04 19:43:42	14	22	3379	\N	2801	3379	Paulo
526	311642	2023-07-06 20:10:56.361	46	34	1200	\N	994	1200	Paulo
527	311664	2023-07-06 20:23:23.082	46	34	8490	\N	7036	8490	Paulo
528	311685	2023-07-06 20:24:25.105	46	34	15991	\N	13253	15991	Paulo
529	311711	2023-07-06 20:26:01.185	46	34	4500	\N	3729	4500	Paulo
530	311732	2023-07-06 20:26:19.6	46	34	9100	\N	7542	9100	Paulo
531	311786	2023-07-06 20:27:57.167	46	34	600	\N	497	600	Paulo
532	311783	2023-07-06 20:28:25.409	46	34	64360	\N	53338	64360	Paulo
533	311792	2023-07-06 20:29:01.661	46	34	1950	\N	1616	1950	Paulo
534	311802	2023-07-06 20:29:24.948	46	34	6950	\N	5760	6950	Paulo
535	311753	2023-07-06 21:52:18.068	46	34	52529	\N	43534	52529	Paulo
536	311854	2023-07-06 21:52:55.928	46	34	321570	\N	266501	321570	Paulo
537	311887	2023-07-06 21:54:01.757	46	34	16580	\N	13741	16580	Paulo
538	PD-01	2023-07-07 18:14:29.965	52	25	300000	\N	248625	300000	Paulo
539	NET-01	2023-07-07 18:35:02.191	55	25	10490	\N	8694	10490	Paulo
540	CP-01	2023-07-07 18:35:37.295	56	25	51877	\N	42993	51877	Paulo
541	CP-02	2023-07-07 18:36:03.576	56	25	21253	\N	17613	21253	Paulo
542	ALG	2023-07-07 18:36:23.907	54	25	180000	\N	149175	180000	Paulo
543	AF-01	2023-07-07 18:36:57.185	53	25	231323	\N	191710	231323	Paulo
544	MJP-01	2023-07-07 18:38:03.436	39	37	401426	\N	332682	401426	Paulo
545	PRC-01	2023-07-07 18:38:47.365	57	31	300000	\N	248625	300000	Paulo
546	PRC-02	2023-07-07 18:39:20.774	57	32	300000	\N	248625	300000	Paulo
547	PRC-03	2023-07-07 18:40:05.357	57	37	833750	\N	690970	833750	Paulo
548	FGTS-01	2023-07-07 18:41:38.105	58	25	69816	\N	57860	69816	Paulo
549	23478-F	2023-06-30 19:00:20	13	14	334869	\N	277523	334869	Paulo
550	23505-F	2023-06-30 19:14:09	13	20	62529	\N	51822	62529	Paulo
552	70682-F	2023-06-30 19:15:59	13	16	198745	\N	164710	198745	Paulo
553	70540-F	2023-06-30 19:17:00	13	25	38830	\N	32180	38830	Paulo
554	23480-F	2023-06-30 19:17:33	13	19	20600	\N	17072	20600	Paulo
555	23512-F	2023-06-30 19:18:11	13	33	374636	\N	310480	374636	Paulo
556	23482-F	2023-06-30 19:20:36	13	23	748804	\N	620571	748804	Paulo
557	23485-F	2023-06-30 19:21:40	13	37	5533217	\N	4585654	5533217	Paulo
559	23504-F	2023-06-30 19:27:24	13	27	230860	\N	191325	230860	Paulo
562	70666-F	2023-06-30 19:30:29	13	31	1936716	\N	1605054	1936716	Paulo
565	SCC-12	2023-06-30 19:39:03	13	25	204000	\N	169065	204000	Paulo
560	70662-F	2023-06-30 19:28:00	13	13	1039910	\N	861825	1039910	Paulo
558	23486-F	2023-06-30 19:22:36	13	32	1626800	\N	1348210	1626800	Paulo
561	23511-F	2023-06-30 19:29:55	13	28	1670518	\N	1384442	1670518	Paulo
563	23515-F	2023-06-30 19:31:16	13	22	180880	\N	149904	180880	Paulo
564	70542-F	2023-06-30 19:38:35	13	38	13832	\N	11463	13832	Paulo
566	PS-01	2023-07-07 20:23:49.975	59	31	295399	\N	244812	295399	Paulo
567	PS-02	2023-07-07 20:25:42.883	59	39	295400	\N	244813	295400	Paulo
568	AD-01	2023-07-07 11:42:06	23	37	900000	\N	745875	900000	Paulo
569	OD-01	2023-07-07 11:47:01	60	37	1000000	\N	828750	1000000	Paulo
570	311939	2023-07-07 11:59:26	46	34	1775	\N	1471	1775	Paulo
571	311940	2023-07-07 12:07:31	46	34	2200	\N	1823	2200	Paulo
572	311948	2023-07-07 12:08:10	46	34	12190	\N	10102	12190	Paulo
573	312006	2023-07-07 12:08:43	46	34	4715	\N	3908	4715	Paulo
574	312075	2023-07-07 12:09:27	46	34	9750	\N	8080	9750	Paulo
575	312079	2023-07-07 12:10:00	46	34	1200	\N	994	1200	Paulo
576	312104	2023-07-07 12:10:30	46	34	311900	\N	258487	311900	Paulo
577	332106	2023-07-07 12:11:33	46	34	198075	\N	164155	198075	Paulo
579	312222	2023-07-08 12:13:01	46	34	9550	\N	7915	9550	Paulo
580	312158	2023-07-08 12:13:30	46	34	39060	\N	32370	39060	Paulo
581	312223	2023-07-08 12:14:15	46	34	86700	\N	71853	86700	Paulo
582	680561	2023-07-10 19:55:07.961	21	25	24793	\N	20547	24793	Paulo
583	126886	2023-07-10 20:02:38.291	61	31	13000	13000	11138	13440	Paulo
584	312362	2023-07-10 20:23:41.25	46	34	81350	\N	67419	81350	Paulo
585	312361	2023-07-10 20:24:30.05	46	34	44775	\N	37107	44775	Paulo
586	312433	2023-07-10 20:25:07.206	46	34	20150	\N	16699	20150	Paulo
587	312447	2023-07-10 20:25:32.641	46	34	4850	\N	4019	4850	Paulo
588	312509	2023-07-10 20:25:56.85	46	34	740	\N	613	740	Paulo
589	240938	2023-07-11 17:50:03.578	14	28	9466	\N	7845	9466	Paulo
590	451072	2023-07-11 20:06:50.758	61	32	13000	\N	10774	13000	Paulo
591	312549	2023-07-10 20:08:37	46	34	174700	\N	144783	174700	Paulo
592	56E664	2023-07-11 20:11:02.792	24	16	77000	\N	63814	77000	Paulo
593	312563	2023-07-11 20:12:06.166	46	34	22650	\N	18771	22650	Paulo
594	312598	2023-07-11 20:13:13.304	46	34	51712	\N	42856	51712	Paulo
595	312600	2023-07-11 20:14:00.114	46	34	26900	\N	22293	26900	Paulo
596	312626	2023-07-11 20:14:26.215	46	34	57779	\N	47885	57779	Paulo
597	312612	2023-07-11 20:15:11.186	46	34	134546	\N	111505	134546	Paulo
598	312611	2023-07-11 20:15:35.683	46	34	14776	\N	12246	14776	Paulo
599	312617	2023-07-11 20:15:56.391	46	34	11200	\N	9282	11200	Paulo
600	312620	2023-07-11 20:16:18.299	46	34	2500	\N	2072	2500	Paulo
601	312647	2023-07-11 20:17:00.485	46	34	263040	\N	217994	263040	Paulo
602	312660	2023-07-11 20:17:28.703	46	34	6800	\N	5635	6800	Paulo
603	312664	2023-07-11 20:17:48.011	46	34	1100	\N	911	1100	Paulo
604	312707	2023-07-11 20:18:04.453	46	34	8150	\N	6754	8150	Paulo
605	312745	2023-07-11 20:18:24.251	46	34	550	\N	455	550	Paulo
606	604855	2023-07-12 14:47:49.241	21	25	27300	\N	22625	27300	Paulo
607	778325	2023-07-12 14:48:17.868	41	25	10350	\N	8578	10350	Paulo
608	312811	2023-07-12 11:57:04	46	34	10000	\N	8288	10000	Paulo
609	312821	2023-07-12 11:57:50	46	34	7450	\N	6174	7450	Paulo
610	312832	2023-07-12 11:58:29	46	34	144800	\N	120003	144800	Paulo
611	312815	2023-07-12 11:59:07	46	34	12190	\N	10102	12190	Paulo
612	312857	2023-07-12 11:59:42	46	34	192300	\N	159369	192300	Paulo
615	313007	2023-07-12 12:02:57	46	34	2950	\N	2445	2950	Paulo
616	313055	2023-07-12 12:03:29	46	34	146165	\N	121133	146165	Paulo
617	312983	2023-07-12 12:03:59	46	34	7080	\N	5868	7080	Paulo
618	JA-001	2023-07-13 18:13:47.276	62	41	5690535	\N	4716031	5690535	Paulo
619	AD-02	2023-07-13 18:14:45.783	23	37	500000	\N	414375	500000	Paulo
620	AD-03	2023-07-13 19:18:43.81	23	37	60000	\N	49725	60000	Paulo
621	AD-04	2023-07-13 19:19:02.67	23	37	75000	\N	62155	75000	Paulo
622	AD-05	2023-07-13 19:19:37.099	23	37	20000	\N	16575	20000	Paulo
623	AD-06	2023-07-13 19:20:08.689	23	37	27500	\N	22791	27500	Paulo
624	AD-07	2023-07-13 19:20:32.861	23	37	150000	\N	124313	150000	Paulo
625	AD-08	2023-07-13 19:21:07.731	23	37	90000	\N	74588	90000	Paulo
626	AD-09	2023-07-13 19:21:26.101	23	37	25000	\N	20719	25000	Paulo
627	AD-10	2023-07-13 19:21:43.363	23	37	18000	\N	14918	18000	Paulo
628	AD-11	2023-07-13 19:22:12.853	23	37	800000	\N	663000	800000	Paulo
629	AD-12	2023-07-13 19:22:49.548	23	37	800000	\N	663000	800000	Paulo
630	AD-13	2023-07-13 19:23:07.13	23	37	100000	\N	82875	100000	Paulo
631	024828	2023-07-13 19:23:24.7	14	35	2398	\N	1987	2398	Paulo
632	4250	2023-07-13 20:11:46.792	42	25	1200	\N	994	1200	Paulo
633	PCT-001	2023-07-13 20:23:06.072	63	42	11518	\N	9546	11518	Paulo
634	MARMITA-01	2023-07-14 14:50:24.784	15	40	3600	\N	2984	3600	Paulo
635	KL-001	2023-07-14 18:15:10.905	15	40	6000	\N	4973	6000	Paulo
636	JR-001	2023-07-13 18:19:40	64	35	80000	\N	66300	80000	Paulo
637	AD-014	2023-07-14 18:21:28.39	23	37	100000	\N	82875	100000	Paulo
638	331137	2023-07-14 12:03:57	65	25	11775	\N	9759	11775	Paulo
639	635313	2023-07-14 12:04:48	66	25	6000	\N	4973	6000	Paulo
640	50652	2023-07-14 12:05:30	67	35	111425	\N	92343	111425	Paulo
641	241125	2023-07-14 12:06:18	14	28	2142	\N	1775	2142	Paulo
642	241124	2023-07-14 12:07:15	14	33	3892	\N	3225	3892	Paulo
643	313087	2023-07-13 12:31:26	46	34	10820	\N	8967	10820	Paulo
644	313119	2023-07-13 12:33:19	46	34	1500	\N	1243	1500	Paulo
645	313121	2023-07-13 12:33:46	46	34	2100	\N	1739	2100	Paulo
646	313134	2023-07-13 12:34:06	46	34	5100	\N	4227	5100	Paulo
647	313131	2023-07-13 12:34:27	46	34	24200	\N	20056	24200	Paulo
648	313179	2023-07-13 12:34:58	46	34	7040	\N	5834	7040	Paulo
649	313167	2023-07-13 12:35:26	46	34	97674	\N	80947	97674	Paulo
650	313168	2023-07-13 12:35:51	46	34	810	\N	671	810	Paulo
651	313249	2023-07-13 12:36:10	46	34	45200	\N	37459	45200	Paulo
652	313270	2023-07-13 12:36:30	46	34	5700	\N	4724	5700	Paulo
653	313359	2023-07-14 12:36:54	46	34	2200	\N	1823	2200	Paulo
656	313374	2023-07-14 12:38:36	46	34	20050	\N	16616	20050	Paulo
658	313395	2023-07-14 12:40:01	46	34	26400	\N	21879	26400	Paulo
659	313402	2023-07-14 12:40:40	46	34	27900	\N	23122	27900	Paulo
654	313356	2023-07-14 12:37:18	46	34	53450	\N	44297	53450	Paulo
655	313370	2023-07-14 12:37:40	46	34	224580	\N	186121	224580	Paulo
657	313385	2023-07-14 12:39:11	46	34	39980	\N	33133	39980	Paulo
660	313398	2023-07-14 12:41:12	46	34	112435	\N	93181	112435	Paulo
661	313444	2023-07-14 12:42:14	46	34	3300	\N	2735	3300	Paulo
662	313436	2023-07-14 12:42:59	46	34	6850	\N	5677	6850	Paulo
663	313454	2023-07-14 12:43:21	46	34	13200	\N	10939	13200	Paulo
664	313476	2023-07-14 12:43:57	46	34	7000	\N	5801	7000	Paulo
665	313480	2023-07-14 12:45:02	46	34	4600	\N	3811	4600	Paulo
666	313519	2023-07-14 12:45:20	46	34	2370	\N	1964	2370	Paulo
667	313560	2023-07-14 12:45:41	46	34	119240	\N	98820	119240	Paulo
668	313564	2023-07-14 12:46:43	46	34	138690	\N	114939	138690	Paulo
669	313557	2023-07-14 12:47:26	46	34	38000	\N	31493	38000	Paulo
670	KL-002	2023-07-17 13:51:22.625	15	40	500000	\N	414375	500000	Paulo
671	MT-02	2023-07-15 16:52:01	45	31	13000	\N	10774	13000	Paulo
672	AC-02	2023-07-15 16:55:04	45	32	28000	\N	23205	28000	Paulo
673	BR-01	2023-07-15 16:56:48	45	35	25000	\N	20719	25000	Paulo
674	TG-01	2023-07-15 16:57:34	45	23	17000	\N	14088	17000	Paulo
675	313778	2023-07-17 12:40:27	46	34	24184	\N	20042	24184	Paulo
676	313780	2023-07-17 12:42:51	46	34	7500	\N	6216	7500	Paulo
677	313782	2023-07-17 12:45:29	46	34	34200	\N	28343	34200	Paulo
678	313775	2023-07-17 12:45:55	46	34	100500	\N	83289	100500	Paulo
679	313777	2023-07-17 12:46:27	46	34	18150	\N	15041	18150	Paulo
680	313772	2023-07-17 12:46:52	46	34	34200	\N	28343	34200	Paulo
681	313829	2023-07-17 12:48:09	46	34	320	\N	265	320	Paulo
682	313833	2023-07-17 12:48:39	46	34	2150	\N	1782	2150	Paulo
683	313876	2023-07-17 12:49:17	46	34	189457	\N	157012	189457	Paulo
684	313842	2023-07-17 12:49:52	46	34	216475	\N	179404	216475	Paulo
685	313852	2023-07-17 12:50:48	46	34	45160	\N	37426	45160	Paulo
686	313922	2023-07-17 12:51:11	46	34	1200	\N	994	1200	Paulo
687	313957	2023-07-17 12:51:35	46	34	16620	\N	13774	16620	Paulo
688	313960	2023-07-17 12:52:03	46	34	16766	\N	13894	16766	Paulo
689	314005	2023-07-17 12:52:28	46	34	112698	\N	93398	112698	Paulo
690	314002	2023-07-17 12:53:13	46	34	11200	\N	9282	11200	Paulo
691	314008	2023-07-17 12:53:34	46	34	7950	\N	6589	7950	Paulo
692	88729E2	2023-07-17 12:56:32	68	28	13000	\N	10774	13000	Paulo
693	M-0001	2023-07-18 13:10:14.017	69	25	20000	\N	16575	20000	Paulo
694	M-0002	2023-07-18 13:10:33.355	69	25	570000	\N	472388	570000	Paulo
695	M-0003	2023-07-18 13:10:52.799	69	25	440000	\N	364650	440000	Paulo
696	241291	2023-07-18 14:55:10.913	14	35	6269	\N	5195	6269	Paulo
697	314064	2023-07-18 18:04:09.261	46	34	241400	\N	200060	241400	Paulo
698	314065	2023-07-18 18:07:45.798	46	34	99800	\N	82709	99800	Paulo
699	314182	2023-07-18 18:10:46.451	46	34	13980	\N	11586	13980	Paulo
700	620693	2023-07-18 18:11:37.372	21	25	28889	\N	23943	28889	Paulo
701	613893	2023-07-18 19:26:03.635	21	25	4000	\N	3315	4000	Paulo
702	314234	2023-07-18 11:56:35	46	34	10900	\N	9033	10900	Paulo
703	314238	2023-07-18 12:00:05	46	34	4400	\N	3646	4400	Paulo
735	314955	2023-07-21 19:10:36.543	46	34	22260	\N	18448	22260	Paulo
704	KL-003	2023-07-18 12:00:58	15	40	1220	\N	1011	1220	Paulo
705	C-001	2023-07-18 12:07:59	70	25	22000	\N	18232	22000	Paulo
706	000106	2023-07-19 19:40:11.173	71	32	9500	\N	7873	9500	Paulo
707	314298	2023-07-19 12:16:22	46	34	218292	\N	180909	218292	Paulo
708	314310	2023-07-19 12:17:13	46	34	22900	\N	18978	22900	Paulo
709	314349	2023-07-19 12:17:45	46	34	39920	\N	33084	39920	Paulo
710	314352	2023-07-19 12:18:08	46	34	249500	\N	206773	249500	Paulo
711	314375	2023-07-19 12:18:42	46	34	41700	\N	34559	41700	Paulo
712	314459	2023-07-19 12:19:09	46	34	10850	\N	8992	10850	Paulo
713	314491	2023-07-19 12:19:31	46	34	43200	\N	35802	43200	Paulo
714	314488	2023-07-19 12:19:53	46	34	2350	\N	1948	2350	Paulo
715	126988	2023-07-20 19:29:30.733	61	14	2030	\N	1682	2030	Paulo
716	050251	2023-07-20 19:30:25.725	14	33	771	\N	639	771	Paulo
717	454038	2023-07-20 19:32:19.267	47	32	2290	\N	1898	2290	Paulo
718	314531	2023-07-20 19:47:02.977	46	34	6400	\N	5304	6400	Paulo
719	314556	2023-07-20 19:49:17.314	46	34	500	\N	413	500	Paulo
720	314562	2023-07-20 19:49:58.314	46	34	13200	\N	10939	13200	Paulo
721	314573	2023-07-20 19:50:20.719	46	34	168451	\N	139604	168451	Paulo
722	314572	2023-07-20 19:51:44.73	46	34	13560	\N	11238	13560	Paulo
723	314588	2023-07-20 19:53:01.439	46	34	6300	\N	5221	6300	Paulo
724	314586	2023-07-20 19:53:31.805	46	34	1100	\N	911	1100	Paulo
725	314608	2023-07-20 19:54:26.975	46	34	2800	\N	2321	2800	Paulo
726	314628	2023-07-20 19:55:05.959	46	34	2950	\N	2445	2950	Paulo
727	314638	2023-07-20 19:55:41.178	46	34	33600	\N	27845	33600	Paulo
728	314702	2023-07-20 19:56:04.806	46	34	14210	\N	11777	14210	Paulo
729	314751	2023-07-20 19:56:25.291	46	34	8500	\N	7044	8500	Paulo
730	PLOT-0001	2023-07-20 19:58:33.437	72	25	4600	\N	3811	4600	Paulo
731	314787	2023-07-21 19:09:00.816	46	34	120394	\N	99777	120394	Paulo
732	314788	2023-07-21 19:09:22.575	46	34	28200	\N	23371	28200	Paulo
733	314842	2023-07-21 19:09:53.926	46	34	24300	\N	20139	24300	Paulo
734	314922	2023-07-21 19:10:11.788	46	34	22780	\N	18879	22780	Paulo
736	314972	2023-07-21 19:10:57.446	46	43	2950	\N	2445	2950	Paulo
737	314963	2023-07-21 19:11:16.341	46	34	52860	\N	43808	52860	Paulo
738	314974	2023-07-21 19:11:44.846	46	34	4600	\N	3811	4600	Paulo
739	AD-015	2023-07-21 20:03:44.463	23	37	1000000	\N	828750	1000000	Paulo
740	KL-004	2023-07-21 20:05:20.883	15	40	250000	\N	207188	250000	Paulo
741	PRATA-0001	2023-07-21 20:13:03.962	41	25	4140	\N	3431	4140	Paulo
743	LGT-0001	2023-07-21 20:18:43.417	31	16	95000	\N	78731	95000	Paulo
744	LGT-0002	2023-07-21 20:32:10.938	31	20	240000	\N	198900	240000	Paulo
746	315029	2023-07-21 18:41:12	46	34	97290	\N	80629	97290	Paulo
747	AG-0001	2023-07-24 18:41:42.795	42	25	1200	\N	994	1200	Paulo
814	DD3174	2023-07-31 11:50:21	45	25	3900	\N	3232	3900	Paulo
815	316384	2023-07-31 12:14:01	46	34	26400	\N	21879	26400	Paulo
742	AD-M-(BOTINAS/DISCOS)	2023-07-21 20:16:36.027	23	37	30000	\N	24863	30000	Paulo
750	MERC-0001	2023-07-24 12:11:35	73	25	15654	\N	12972	15654	Paulo
748	AD-M-0001	2023-07-24 12:02:52	23	37	1066	\N	883	1066	Paulo
749	241663- ADALTO	2023-07-24 12:05:24	14	37	1066	\N	883	1066	Paulo
751	GN-0001	2023-07-24 12:13:25	32	14	85000	\N	70444	85000	Paulo
753	315203	2023-07-24 12:18:38	46	34	7300	\N	6050	7300	Paulo
752	315301	2023-07-24 12:14:01	46	34	1700	\N	1409	1700	Paulo
755	315205	2023-07-24 12:19:52	46	34	7000	\N	5801	7000	Paulo
754	315206	2023-07-24 12:19:07	46	34	5085	\N	4214	5085	Paulo
756	315216	2023-07-24 12:20:09	46	34	19960	\N	16542	19960	Paulo
757	315252	2023-07-24 12:20:36	46	34	10690	\N	8859	10690	Paulo
758	315248	2023-07-24 12:21:27	46	34	1750	\N	1450	1750	Paulo
759	315253	2023-07-24 12:22:07	46	34	139780	\N	115843	139780	Paulo
760	315372	2023-07-24 12:22:45	46	34	19530	\N	16185	19530	Paulo
761	315378	2023-07-24 12:23:02	46	43	1050	\N	869	1050	Paulo
762	3660-L	2023-07-21 12:27:16	74	15	44000	\N	36465	44000	Paulo
763	2221-L	2023-07-21 12:28:49	74	17	44000	\N	36465	44000	Paulo
764	2245-L	2023-07-21 12:29:35	74	20	44000	\N	36465	44000	Paulo
765	3175-L	2023-07-21 12:32:08	74	44	44000	\N	36465	44000	Paulo
766	315507	2023-07-25 11:29:31	46	34	4200	\N	3481	4200	Paulo
767	315527	2023-07-25 11:30:02	46	34	39980	\N	33133	39980	Paulo
768	315540	2023-07-25 11:30:26	46	34	10500	\N	8702	10500	Paulo
769	315557	2023-07-25 11:30:42	46	34	47500	\N	39366	47500	Paulo
770	315565	2023-07-25 11:31:01	46	34	3500	\N	2901	3500	Paulo
771	315661	2023-07-25 11:31:16	46	34	484480	\N	401513	484480	Paulo
772	315664	2023-07-25 11:31:45	46	34	7734	\N	6409	7734	Paulo
773	315699	2023-07-25 11:32:05	46	34	1350	\N	1119	1350	Paulo
774	315698	2023-07-25 11:32:25	46	34	15300	\N	12680	15300	Paulo
775	BTM-0001	2023-07-26 17:43:39.656	75	45	39000	\N	32320	39000	Paulo
776	RG-611838	2023-07-26 17:46:34.547	76	45	500000	\N	414375	500000	Paulo
777	315738	2023-07-26 11:42:55	46	34	44586	\N	36951	44586	Paulo
745	315028	2023-07-21 18:38:54	46	34	15150	\N	12556	15150	Paulo
778	315751	2023-07-26 12:07:59	46	34	63000	\N	52211	63000	Paulo
779	315781	2023-07-26 12:11:36	46	34	110590	\N	91651	110590	Paulo
780	315784	2023-07-26 12:12:09	46	34	1400	\N	1160	1400	Paulo
781	315809	2023-07-26 12:12:42	46	34	135400	\N	112213	135400	Paulo
782	315807	2023-07-26 12:13:45	46	34	110350	\N	91453	110350	Paulo
783	315804	2023-07-26 12:14:18	46	34	123250	\N	102143	123250	Paulo
784	315824	2023-07-26 12:14:52	46	34	123690	\N	102508	123690	Paulo
785	315831	2023-07-26 12:15:21	46	34	10794	\N	8946	10794	Paulo
786	315830	2023-07-26 12:15:59	46	34	650	\N	539	650	Paulo
788	315944	2023-07-26 12:18:10	46	34	585	\N	484	585	Paulo
789	315983	2023-07-28 12:18:31	46	34	3500	\N	2901	3500	Paulo
790	316018	2023-07-28 12:19:08	46	34	14100	\N	11685	14100	Paulo
791	316104	2023-07-28 12:19:29	46	34	9100	\N	7542	9100	Paulo
792	316171	2023-07-28 12:19:55	46	34	57350	\N	47529	57350	Paulo
793	316176	2023-07-28 12:20:22	46	34	2900	\N	2403	2900	Paulo
794	316237-B	2023-07-29 12:20:45	46	43	2950	\N	2445	2950	Paulo
795	316261	2023-07-29 12:23:02	46	34	5330	\N	4417	5330	Paulo
796	316279	2023-07-29 12:23:36	46	34	186530	\N	154587	186530	Paulo
797	316277	2023-07-29 12:24:04	46	34	8250	\N	6837	8250	Paulo
798	316282	2023-07-29 12:24:43	46	34	6990	\N	5793	6990	Paulo
799	316287	2023-07-29 12:25:21	46	34	42700	\N	35388	42700	Paulo
801	316171-AD	2023-07-28 12:26:37	23	37	57350	\N	47529	57350	Paulo
802	CT-0001	2023-07-27 12:36:09	77	25	580781	\N	481322	580781	Paulo
803	2IR-0001	2023-07-27 12:36:54	24	14	35000	\N	29006	35000	Paulo
804	AD-016	2023-07-28 12:38:06	23	37	100000	\N	82875	100000	Paulo
805	KL-005	2023-07-27 12:39:25	15	40	15000	\N	12431	15000	Paulo
806	KL-006	2023-07-28 12:40:21	15	40	250000	\N	207188	250000	Paulo
807	AG-0002	2023-07-26 14:09:57	42	25	3000	\N	2486	3000	Paulo
808	SP-75543	2023-07-31 14:17:18.649	49	25	14613	\N	12111	14613	Paulo
809	AL-002	2023-07-29 14:26:36	45	28	28000	\N	23205	28000	Paulo
810	BR-002	2023-07-29 14:27:23	45	35	27000	\N	22376	27000	Paulo
811	MT-003	2023-07-29 14:28:15	45	31	15500	\N	12846	15500	Paulo
812	TG-002	2023-07-29 14:29:20	45	23	15500	\N	12846	15500	Paulo
800	WD-0003	2023-07-29 12:25:47	61	35	9150	\N	7583	9150	Paulo
813	WD-0004	2023-07-31 14:31:42.179	61	32	34425	\N	28530	34425	Paulo
817	316390	2023-07-31 12:20:42	46	34	44980	\N	37277	44980	Paulo
818	316406	2023-07-31 12:21:24	46	34	15300	\N	12680	15300	Paulo
819	316413	2023-07-31 12:22:38	46	34	6600	\N	5470	6600	Paulo
820	316425	2023-07-31 12:23:07	46	34	17500	\N	14503	17500	Paulo
821	316469	2023-07-31 12:23:27	46	34	17425	\N	14441	17425	Paulo
822	316473	2023-07-31 12:24:04	46	34	20500	\N	16989	20500	Paulo
823	316475	2023-07-31 12:24:48	46	34	43290	\N	35877	43290	Paulo
824	316470	2023-07-31 12:25:21	46	34	2720	\N	2254	2720	Paulo
825	316483	2023-07-31 12:25:41	46	34	2200	\N	1823	2200	Paulo
826	316534	2023-07-31 12:27:05	46	34	5730	\N	4749	5730	Paulo
827	316541	2023-07-31 12:27:40	46	34	720	\N	597	720	Paulo
828	316600	2023-07-31 12:28:20	46	34	160	\N	133	160	Paulo
830	RRT-0001	2023-08-01 18:05:33.388	63	25	11518	\N	9546	11518	Paulo
831	RRT-0002	2023-08-01 18:06:40.803	63	25	11518	\N	9546	11518	Paulo
816	316389	2023-07-31 12:19:45	46	34	130040	\N	107771	130040	Paulo
829	316647	2023-08-01 12:29:13	46	37	11994	\N	9940	11994	Paulo
832	PLOT-0002	2023-08-01 18:07:50.795	78	25	4000	\N	3315	4000	Paulo
787	315943	2023-07-26 12:16:40	46	34	21155	\N	17532	21155	Paulo
833	316662	2023-08-01 12:40:55	46	14	6200	\N	5138	6200	Paulo
834	316638	2023-08-01 12:43:30	46	14	16950	\N	14047	16950	Paulo
835	316675	2023-08-01 12:44:05	46	23	110	\N	91	110	Paulo
836	316678	2023-08-01 12:44:55	46	28	17100	\N	14172	17100	Paulo
837	316699	2023-08-01 12:45:18	46	32	550	\N	455	550	Paulo
838	316771	2023-08-01 12:46:48	46	37	59590	\N	49385	59590	Paulo
839	316815	2023-08-01 12:47:13	46	37	150630	\N	124834	150630	Paulo
840	316811	2023-08-01 12:49:00	46	25	6800	\N	5635	6800	Paulo
841	316822	2023-08-01 12:49:29	46	35	106830	\N	88535	106830	Paulo
842	316855	2023-08-01 12:49:54	46	28	41000	\N	33979	41000	Paulo
843	316856	2023-08-01 12:50:57	46	23	8800	\N	7293	8800	Paulo
844	316857	2023-08-01 12:51:19	46	25	5200	\N	4310	5200	Paulo
845	316873	2023-08-01 12:52:23	46	23	800	\N	663	800	Paulo
846	316874	2023-08-01 12:52:41	46	23	159000	\N	131771	159000	Paulo
847	316876	2023-08-01 12:53:05	46	28	12600	\N	10442	12600	Paulo
848	316869	2023-08-01 12:53:29	46	23	187280	\N	155208	187280	Paulo
850	736106	2023-08-01 12:55:53	41	25	11730	\N	9721	11730	Paulo
851	325953	2023-07-31 12:57:22	79	14	2332	\N	1932	2332	Paulo
849	602938	2023-07-31 12:53:55	21	25	18674	\N	15476	18674	Paulo
852	RG-0001	2023-08-02 20:15:22.861	76	45	1000000	\N	828750	1000000	Paulo
853	ALC-0001	2023-08-02 20:17:20.868	80	25	27405	\N	22712	27405	Paulo
854	IMP-0001	2023-08-02 20:18:17.993	80	47	69816	\N	57860	69816	Paulo
855	523222	2023-08-02 20:33:51.878	14	16	70841	\N	58709	70841	Paulo
856	WD-127063	2023-08-02 20:34:51.01	61	28	4600	\N	3811	4600	Paulo
857	316929	2023-08-02 12:36:07	46	35	19300	\N	15994	19300	Paulo
858	316953	2023-08-02 12:55:11	46	28	12600	\N	10442	12600	Paulo
859	316960	2023-08-02 12:56:37	46	28	2700	\N	2238	2700	Paulo
860	316992	2023-08-02 13:01:18	46	14	3350	\N	2776	3350	Paulo
861	317016	2023-08-02 13:01:45	46	28	4600	\N	3811	4600	Paulo
862	317022	2023-08-02 13:02:05	46	32	2150	\N	1782	2150	Paulo
863	317084	2023-08-02 13:02:24	46	13	3360	\N	2785	3360	Paulo
864	317082	2023-08-02 13:02:44	46	16	67650	\N	56065	67650	Paulo
865	317119	2023-08-02 13:03:02	46	39	45981	\N	38107	45981	Paulo
866	317117	2023-08-02 13:03:43	46	39	23600	\N	19558	23600	Paulo
867	OD-002	2023-08-03 15:13:20.584	60	48	8244400	\N	6832546	8244400	Paulo
868	PL-0001	2023-08-03 20:49:51.317	81	25	207500	\N	171966	207500	Paulo
869	SG-0001	2023-08-03 20:52:08.524	35	14	67500	\N	55941	67500	Paulo
870	RGA-0001	2023-08-03 20:55:23.459	28	14	60000	\N	49725	60000	Paulo
871	STA-0001	2023-08-03 21:22:45.133	82	25	187000	\N	154976	187000	Paulo
872	ANE-0001	2023-08-03 21:23:20.307	27	14	380000	\N	314925	380000	Paulo
873	317131	2023-08-03 13:18:35	46	23	27150	\N	22501	27150	Paulo
874	317159	2023-08-03 13:20:40	46	23	10940	\N	9067	10940	Paulo
875	317166	2023-08-03 13:25:03	46	16	900	\N	746	900	Paulo
876	317180	2023-08-03 13:25:26	46	25	5600	\N	4641	5600	Paulo
877	317185	2023-08-03 13:25:57	46	31	26632	\N	22071	26632	Paulo
878	317199	2023-08-03 13:26:35	46	20	5750	\N	4765	5750	Paulo
879	317224	2023-08-03 13:27:03	46	14	16400	\N	13591	16400	Paulo
880	317217	2023-08-03 13:27:31	46	32	1440	\N	1193	1440	Paulo
881	317227	2023-08-03 13:27:53	46	16	7550	\N	6257	7550	Paulo
882	317248	2023-08-03 13:28:13	46	14	75	\N	62	75	Paulo
883	317255	2023-08-03 13:28:35	46	20	1450	\N	1202	1450	Paulo
884	317259	2023-08-03 13:29:08	46	35	9450	\N	7831	9450	Paulo
885	317284	2023-08-03 13:29:40	46	37	9980	\N	8271	9980	Paulo
886	317286	2023-08-03 13:30:13	46	37	2200	\N	1823	2200	Paulo
887	317339	2023-08-03 13:30:33	46	16	3400	\N	2818	3400	Paulo
888	242233	2023-08-04 18:12:42.77	14	20	5444	\N	4512	5444	Paulo
889	242234	2023-08-04 18:23:31.255	14	16	518	\N	429	518	Paulo
890	KL-007	2023-08-04 20:02:32.984	15	40	250000	\N	207188	250000	Paulo
891	AD-017	2023-08-04 23:09:27.169	23	37	800000	\N	663000	800000	Paulo
893	317414	2023-08-04 12:38:23	46	28	33790	\N	28002	33790	Paulo
894	317420	2023-08-04 12:38:56	46	32	1700	\N	1409	1700	Paulo
895	317435	2023-08-04 12:39:15	46	31	10400	\N	8619	10400	Paulo
896	317482	2023-08-04 12:39:38	46	23	27230	\N	22567	27230	Paulo
897	317485	2023-08-04 12:40:13	46	31	1750	\N	1450	1750	Paulo
898	317517	2023-08-04 12:40:43	46	25	7030	\N	5826	7030	Paulo
899	317544	2023-08-04 12:41:08	46	13	33050	\N	27389	33050	Paulo
901	317553	2023-08-04 12:41:56	46	32	8050	\N	6670	8050	Paulo
907	317837	2023-08-05 12:55:54	46	39	39413	\N	32664	39413	Paulo
902	317560	2023-08-04 12:42:30	46	28	600000	600000	732095	883370	Paulo
903	317580	2023-08-04 12:43:54	46	23	76780	\N	63630	76780	Paulo
904	317659	2023-08-05 12:44:47	46	39	5350	\N	4434	5350	Paulo
905	317635	2023-08-05 12:55:02	46	32	13900	\N	11520	13900	Paulo
906	317836	2023-08-05 12:55:33	46	28	39980	\N	33133	39980	Paulo
908	HE-0001	2023-08-05 13:04:55	45	39	30000	\N	24863	30000	Paulo
909	HE-0002	2023-08-05 13:21:22	45	28	37000	\N	30664	37000	Paulo
910	HE-0003	2023-08-05 13:22:08	45	23	18000	\N	14918	18000	Paulo
911	HE-0004	2023-08-05 13:22:38	45	20	17000	\N	14088	17000	Paulo
912	HE-0005	2023-08-05 13:23:00	45	32	31000	\N	25691	31000	Paulo
913	HE-0006	2023-08-05 13:23:30	45	35	29000	\N	24034	29000	Paulo
914	317845	2023-08-07 12:09:21	46	23	1710	\N	1417	1710	Paulo
915	317850	2023-08-07 12:17:28	46	28	220	\N	182	220	Paulo
916	317857	2023-08-07 12:17:52	46	32	228100	\N	189038	228100	Paulo
917	317876	2023-08-07 12:18:24	46	23	31080	\N	25758	31080	Paulo
918	317886	2023-08-07 12:18:50	46	31	7600	\N	6298	7600	Paulo
919	317893	2023-08-07 12:21:14	46	28	15800	\N	13094	15800	Paulo
920	317919	2023-08-07 12:21:41	46	32	18800	\N	15581	18800	Paulo
921	317955	2023-08-07 12:22:11	46	28	48000	\N	39780	48000	Paulo
922	317967	2023-08-07 12:22:31	46	28	650	\N	539	650	Paulo
924	317992	2023-08-07 12:23:24	46	35	19350	\N	16036	19350	Paulo
925	318015	2023-08-07 12:23:52	46	33	8950	\N	7417	8950	Paulo
926	318014	2023-08-07 12:24:11	46	37	63600	\N	52709	63600	Paulo
900	317545	2023-08-04 12:41:30	46	37	95400	\N	79063	95400	Paulo
923	317986	2023-08-07 12:22:57	46	37	2250	\N	1864	2250	Paulo
927	318023	2023-08-07 12:24:38	46	37	119940	\N	99400	119940	Paulo
928	CC-0708231	2023-08-07 12:25:04	73	25	16172	\N	13403	16172	Paulo
929	CC-0708232	2023-08-07 12:29:50	73	25	6826	\N	5657	6826	Paulo
930	P-736373	2023-08-07 12:30:53	41	25	9660	\N	8006	9660	Paulo
931	3C046C07	2023-08-07 12:42:18	61	31	15000	\N	12431	15000	Paulo
932	EF091542	2023-08-07 03:00:00	61	35	15000	\N	12431	15000	Paulo
933	AG-0003	2023-08-07 12:43:48	42	25	4600	\N	3811	4600	Paulo
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	new
2	basic
3	root
4	admin
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, name, author, accountable, address, contact) FROM stdin;
13	CIAL SANDRI	\N	\N	\N	\N
14	COMACO LOJA	\N	\N	\N	\N
17	CAIO MADEIRAS	Paulo		Rua Celso Lemos de Almeida, 166, Bauru - SP	
18	C&C CASA E CONSTRUÇÃO	Paulo	Emerson Ferreira	Avenida Nuno de Assis, Centro, Bauru - SP	
20	MADEIREIRA FRASCARELI	Paulo	Vinicius	Rua Padre Francisco Van Der Mas, 16-63	14998898673
19	MADEIREIRA ARARUNA	Paulo		Rua Cel Lima Figueiredo, 8-041	32392580
21	AUTO POSTO ESMERALDA	Paulo			
22	MADEIRANIT BAURU	Rafael Piotto		Alameda Amor Perfeito, 1-6, Madureira - Bauru	
23	ADALTO	Paulo	Adalto Vital		
24	2 IRMÃOS MARCENARIA	Paulo			
25	PAULO CARPINTEIRO	Paulo			
26	D&D ESQUADRIAS	Paulo			
27	ANDERSON ESQUADRIAS	Paulo			
28	ROGÉRIO AR CONDICIONADO	Paulo			
29	REFRIMAG	Paulo			
30	DETALHE INTERNO	Paulo	FAUSTO		
31	LIGHT ELÉTRICA	Paulo	PAULO PIRES		
32	GN MARMORARIA	Paulo	AGNALDO		
33	COLIBRI CARPINTARIA	Paulo			
34	VIVA TINTAS	Paulo	CELSO JAPA	Rua Rio Branco, 22-27, Altos da Cidade - Bauru	1438792766
35	SÃO GERALDO	Paulo			
36	COPICAL	Paulo			
37	ARCO ÍRIS PAPELARIA	Paulo			
15	PINTURA KLEBINHO	Paulo	Klébinho		(14) 99175-3662
38	GABMEL	Paulo			
39	MJP BLOCOS E LAJE	Paulo	SIMONE VERSANO DA SILVA GASPAR	Av. Carlos Travain, 680, Professor Simões - Agudos	14991536168
40	CHAVEIRO AGUDOS	Paulo			
41	EXPRESSO DE PRATA	Paulo			
42	ÁGUA SANTA BÁRBARA	Paulo			
43	COMDEZ	Paulo			
44	W.A MANUTENÇÕES	Paulo			
45	HORAS EXTRAS	Paulo			
47	CASA T	Paulo			
48	ÁGUA VIZINHOS	Paulo			
49	SABESP	Paulo			
50	INFOKIA	Paulo			
51	MILLY OIL	Paulo			
52	PAULO DEV	Paulo			
53	AUTOFEST	Paulo			
54	ALUGUEL	Paulo			
55	LPNET	Paulo			
56	CPFL	Paulo			
57	PORTAL RAIZ CONCRETO	Paulo			
58	FGTS	Paulo			
59	FÁBRICA PISOS	Paulo			
60	S.O.S SERRALHERIA	Paulo	ODAIR		
61	WANDAL	Paulo			
62	JA CONSTRUÇÕES	Paulo			
63	CAU - CONSELHO	Paulo			
64	JR PERFURAÇÕES	Paulo			
65	PADARIA PAULISTA	Paulo			
66	TECHPOINT	Paulo			
67	PORTAL RAYS	Paulo			
68	TIO ZÉ	Paulo			
69	MECANICO	Paulo			
46	0 CONTROLE SANDRI	Paulo			
70	CARTÓRIO	Paulo			
71	3F'S FERRAMENTAS	Paulo			
72	M2 PLOTAGEM	Paulo			
73	MERCADO	Paulo			
74	A&M LOCAÇÕES	Paulo			
75	BETTERMAQ	Paulo			
76	ROGÉRIO PINTOR	Paulo			
77	CARTÃO	Paulo			
78	JULIO PLOTAGENS	Paulo			
79	REFRIGÁS	Paulo			
80	ALIANÇA CONTABILIDADE	Paulo			
81	PLACCA ANDAIMES	Paulo			
82	STAMP ART	Paulo			
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, role_id, email, password) FROM stdin;
1	Paulo	3	paulo@email.com	$2b$10$yU0YnRUZBAXqfTtnbVAjFOZMIkO/3SFiQtFtpzLfi5UeuFf4jqBfq
11	Vinícius Nassula	4	vinicius@piottoarq.com	$2b$10$mDyBl4mg6aSJDGmvNlBMzeSCqM0zVUlOrHPL8k.YSFblxKuelSWE6
9	Beatriz Brosco	2	beatriz@piottoarq.com	$2b$10$OlsDY0RAfZ7IcFFwVy89weeeVqjrA7pT9CT9SHQd19NyExakl3AOi
10	Fernando	2	fernando@piottoarq.com	$2b$10$Bl5DdsmEqn7jbtpaK7/63.r9wU59JypeHd.JOgtHW1RFxqexuA9mG
12	Christian Takano	2	christian@piottoarq.com	$2b$10$2awuxM3blFIoMeLA6/4qiuxpj7Pf8BrHp0JrokAF8Dldv.9ZC8Nhy
14	Eduardo	2	eduardo@piottoarq.com	$2b$10$oyjExl7TtCCBrAkjKbKWCesV00K1eipyj7a26WSeMsWX.4vULHCsO
15	Matheus	2	matheus@piottoarq.com	$2b$10$da.6qOqyozse594TwNZhq.WjFrE6bD/YfT2hm.B9mvXe5ad84yF/q
16	Rafael Piotto	3	rafael@piottoarq.com	$2b$10$L7vwue.3nUoHNI2tBdsX9utZDuTYSdqM2D5QhHc2Wbv01XzyENLrS
17	Testes Google	3	testes@piottoarq.com	$2b$10$sNKH6ojy0a/l2hsS8CH1h.YrMZItcGwHMtlb49jCr6yazfDHLouAO
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 48, true);


--
-- Name: employees_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_food_id_seq', 275, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 40, true);


--
-- Name: employees_worked_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_worked_days_id_seq', 831, true);


--
-- Name: incomes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incomes_id_seq', 25, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 933, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 82, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: employees_food employees_food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_food
    ADD CONSTRAINT employees_food_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: employees_worked_days employees_worked_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_pkey PRIMARY KEY (id);


--
-- Name: incomes incomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: clients_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clients_name_key ON public.clients USING btree (name);


--
-- Name: employees_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX employees_name_key ON public.employees USING btree (name);


--
-- Name: roles_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_name_key ON public.roles USING btree (name);


--
-- Name: stores_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stores_name_key ON public.stores USING btree (name);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: employees_food employees_food_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_food
    ADD CONSTRAINT employees_food_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: employees_worked_days employees_worked_days_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: employees_worked_days employees_worked_days_employee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_worked_days
    ADD CONSTRAINT employees_worked_days_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- Name: orders orders_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: incomes orders_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT orders_client_id_foreign FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: orders orders_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

