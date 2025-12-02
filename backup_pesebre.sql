--
-- PostgreSQL database dump
--

\restrict sWrFwFoimbyJIEnwT2hs3qiC6jPCFlUag9sbL4o3kl6Vh5MXfvaNAfTmPXE2V2I

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-01 23:38:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 238 (class 1259 OID 16788)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    id_bit integer NOT NULL,
    id_us integer,
    accion text NOT NULL,
    fecha timestamp without time zone DEFAULT now()
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16787)
-- Name: bitacora_id_bit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bitacora_id_bit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bitacora_id_bit_seq OWNER TO postgres;

--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 237
-- Name: bitacora_id_bit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_id_bit_seq OWNED BY public.bitacora.id_bit;


--
-- TOC entry 230 (class 1259 OID 16735)
-- Name: novena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.novena (
    id_nov integer NOT NULL,
    dia integer NOT NULL,
    titulo character varying(200) NOT NULL,
    imagen character varying(200),
    contenido text NOT NULL,
    estado integer DEFAULT 1
);


ALTER TABLE public.novena OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16734)
-- Name: novena_id_nov_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.novena_id_nov_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.novena_id_nov_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 229
-- Name: novena_id_nov_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.novena_id_nov_seq OWNED BY public.novena.id_nov;


--
-- TOC entry 234 (class 1259 OID 16762)
-- Name: personaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personaje (
    id_perse integer NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text,
    imagen character varying(200),
    estado integer DEFAULT 1
);


ALTER TABLE public.personaje OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16761)
-- Name: personaje_id_perse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personaje_id_perse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personaje_id_perse_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 233
-- Name: personaje_id_perse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personaje_id_perse_seq OWNED BY public.personaje.id_perse;


--
-- TOC entry 236 (class 1259 OID 16773)
-- Name: puntaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puntaje (
    id_score integer NOT NULL,
    id_us integer,
    puntaje integer NOT NULL,
    fecha_juego timestamp without time zone DEFAULT now()
);


ALTER TABLE public.puntaje OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16772)
-- Name: puntaje_id_score_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puntaje_id_score_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.puntaje_id_score_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 235
-- Name: puntaje_id_score_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puntaje_id_score_seq OWNED BY public.puntaje.id_score;


--
-- TOC entry 242 (class 1259 OID 16814)
-- Name: tb_bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_bitacora (
    id_bit integer NOT NULL,
    id_us integer,
    accion text NOT NULL,
    fecha timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tb_bitacora OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16813)
-- Name: tb_bitacora_id_bit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_bitacora_id_bit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_bitacora_id_bit_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 241
-- Name: tb_bitacora_id_bit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_bitacora_id_bit_seq OWNED BY public.tb_bitacora.id_bit;


--
-- TOC entry 240 (class 1259 OID 16805)
-- Name: tb_estado_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_estado_usuario (
    id_est integer NOT NULL,
    descripcion_est character varying(20) NOT NULL
);


ALTER TABLE public.tb_estado_usuario OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16804)
-- Name: tb_estado_usuario_id_est_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_estado_usuario_id_est_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_estado_usuario_id_est_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 239
-- Name: tb_estado_usuario_id_est_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_estado_usuario_id_est_seq OWNED BY public.tb_estado_usuario.id_est;


--
-- TOC entry 226 (class 1259 OID 16703)
-- Name: tb_estadocivil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_estadocivil (
    id_est integer NOT NULL,
    descripcion_est text NOT NULL
);


ALTER TABLE public.tb_estadocivil OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16702)
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_estadocivil_id_est_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_estadocivil_id_est_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_estadocivil_id_est_seq OWNED BY public.tb_estadocivil.id_est;


--
-- TOC entry 222 (class 1259 OID 16673)
-- Name: tb_pagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_pagina (
    id_pag integer NOT NULL,
    descripcion_pag text NOT NULL,
    path_pag text NOT NULL
);


ALTER TABLE public.tb_pagina OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16672)
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_pagina_id_pag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_pagina_id_pag_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_pagina_id_pag_seq OWNED BY public.tb_pagina.id_pag;


--
-- TOC entry 220 (class 1259 OID 16662)
-- Name: tb_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_perfil (
    id_per integer NOT NULL,
    descripcion_per text NOT NULL
);


ALTER TABLE public.tb_perfil OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16661)
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_perfil_id_per_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_perfil_id_per_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_perfil_id_per_seq OWNED BY public.tb_perfil.id_per;


--
-- TOC entry 224 (class 1259 OID 16685)
-- Name: tb_perfilpagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_perfilpagina (
    id_perpag integer NOT NULL,
    id_per integer,
    id_pag integer
);


ALTER TABLE public.tb_perfilpagina OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16684)
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_perfilpagina_id_perpag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_perfilpagina_id_perpag_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_perfilpagina_id_perpag_seq OWNED BY public.tb_perfilpagina.id_perpag;


--
-- TOC entry 228 (class 1259 OID 16714)
-- Name: tb_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario (
    id_us integer NOT NULL,
    id_per integer,
    id_est integer DEFAULT 1,
    nombre_us text NOT NULL,
    cedula_us text,
    correo_us text NOT NULL,
    clave_us text NOT NULL
);


ALTER TABLE public.tb_usuario OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16713)
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_usuario_id_us_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_usuario_id_us_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_usuario_id_us_seq OWNED BY public.tb_usuario.id_us;


--
-- TOC entry 232 (class 1259 OID 16750)
-- Name: villancico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villancico (
    id_vill integer NOT NULL,
    titulo character varying(200) NOT NULL,
    imagen character varying(200),
    audio character varying(200),
    letra text NOT NULL
);


ALTER TABLE public.villancico OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16749)
-- Name: villancico_id_vill_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villancico_id_vill_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.villancico_id_vill_seq OWNER TO postgres;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 231
-- Name: villancico_id_vill_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villancico_id_vill_seq OWNED BY public.villancico.id_vill;


--
-- TOC entry 4924 (class 2604 OID 16791)
-- Name: bitacora id_bit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN id_bit SET DEFAULT nextval('public.bitacora_id_bit_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16738)
-- Name: novena id_nov; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.novena ALTER COLUMN id_nov SET DEFAULT nextval('public.novena_id_nov_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 16765)
-- Name: personaje id_perse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje ALTER COLUMN id_perse SET DEFAULT nextval('public.personaje_id_perse_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16776)
-- Name: puntaje id_score; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntaje ALTER COLUMN id_score SET DEFAULT nextval('public.puntaje_id_score_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 16817)
-- Name: tb_bitacora id_bit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bitacora ALTER COLUMN id_bit SET DEFAULT nextval('public.tb_bitacora_id_bit_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 16808)
-- Name: tb_estado_usuario id_est; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado_usuario ALTER COLUMN id_est SET DEFAULT nextval('public.tb_estado_usuario_id_est_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16706)
-- Name: tb_estadocivil id_est; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estadocivil ALTER COLUMN id_est SET DEFAULT nextval('public.tb_estadocivil_id_est_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16676)
-- Name: tb_pagina id_pag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pagina ALTER COLUMN id_pag SET DEFAULT nextval('public.tb_pagina_id_pag_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16665)
-- Name: tb_perfil id_per; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfil ALTER COLUMN id_per SET DEFAULT nextval('public.tb_perfil_id_per_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16688)
-- Name: tb_perfilpagina id_perpag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina ALTER COLUMN id_perpag SET DEFAULT nextval('public.tb_perfilpagina_id_perpag_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16717)
-- Name: tb_usuario id_us; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario ALTER COLUMN id_us SET DEFAULT nextval('public.tb_usuario_id_us_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 16753)
-- Name: villancico id_vill; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villancico ALTER COLUMN id_vill SET DEFAULT nextval('public.villancico_id_vill_seq'::regclass);


--
-- TOC entry 5129 (class 0 OID 16788)
-- Dependencies: 238
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (id_bit, id_us, accion, fecha) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 16735)
-- Dependencies: 230
-- Data for Name: novena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.novena (id_nov, dia, titulo, imagen, contenido, estado) FROM stdin;
2	2	La Anunciación	novena/dia2.png	María recibe el anuncio del ángel y acepta con humildad ser madre del Salvador.	1
3	3	El viaje de María y José	novena/dia3.png	Se preparan para ir a Belén, confiando en la providencia divina.	1
4	4	La espera confiada	novena/dia4.png	María y José enfrentan dificultades, pero mantienen la fe en Dios.	1
5	5	La llegada a Belén	novena/dia5.png	Encuentran rechazo e incomodidad, pero siguen firmes en su misión	1
6	6	La pobreza del pesebre	novena/dia6.png	Reflexión sobre la humildad y sencillez en que nacerá Jesús.	1
7	7	La preparación del nacimiento	novena/dia7.png	Se medita sobre la esperanza y la alegría que trae el Niño.	1
8	8	La cercanía del Salvador	novena/dia8.png	Se anuncia que ya está por llegar la luz que ilumina al mundo.	1
9	9	El nacimiento de Jesús	novena/dia9.png	María y José reciben al Niño en el pesebre; se celebra la Navidad.	1
10	10	prueba	dia9.png	test	2
1	1	Reconciliación	novena/dia1.png	Dios envía a su Hijo para salvar y reconciliar a la humanidad.\r\n                \r\n                \r\n                	1
\.


--
-- TOC entry 5125 (class 0 OID 16762)
-- Dependencies: 234
-- Data for Name: personaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personaje (id_perse, nombre, descripcion, imagen, estado) FROM stdin;
3	Gaspar	Rey Mago	gaspar.png	0
4	Gaspar	Rey Mago	gaspar.png	0
5	Gaspar	Rey Mago	gaspar.png	0
2	Gaspar	Simbolizan la manifestación de Jesús como salvador de todos los hombres, ofreciendo incienso (divinidad)	gaspar.png	1
6	Baltasar	Simboliza la manifestación de Jesús como salvador de todos los hombres, ofreciendo mirra simboliza humanidad de Cristo	baltazar.png	1
7	Melchor	Simbolizan la manifestación de Jesús como salvador de todos los hombres, ofreciendo oro simboliza realeza	melchoor.png	1
8	Niño Jesus	Representando a Dios hecho hombre	jesus.png	1
9	Virgen Maria	Simboliza la madre amorosa y protectora	maria.png	1
10	San Jose	El padre terrenal, protector y custodio de la Sagrada Familia	jose.png	1
11	Pastores	Representan la humildad y la sencillez, siendo los primeros en recibir la noticia y acudir a adorar al Niño	pastores.png	1
12	Angeles	Anuncian la "Gloria a Dios en el cielo" y el nacimiento	angel.png	1
13	Buey	Tradicionalmente asociado con el calor y la bondad, ayudando a abrigar al Niño	buey.png	1
14	Asno	Representa la humildad, la paz y la pobreza, y a menudo se le ve como el animal que transportó a María	asno.png	1
15	Ovejas y Terneros	Parte del rebaño de los pastores, simbolizan al pueblo de Dios y la inocencia	ovejas.png	1
1	Melchor	Simbolizan la manifestación de Jesús como salvador ofreciendo oro (realeza)	melchor.png	0
\.


--
-- TOC entry 5127 (class 0 OID 16773)
-- Dependencies: 236
-- Data for Name: puntaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puntaje (id_score, id_us, puntaje, fecha_juego) FROM stdin;
1	2	160	2025-11-30 11:44:32.639117
2	2	160	2025-11-30 11:45:32.330426
3	2	160	2025-11-30 11:49:02.278161
4	2	40	2025-11-30 17:38:33.077401
5	11	160	2025-12-01 19:24:10.221328
\.


--
-- TOC entry 5133 (class 0 OID 16814)
-- Dependencies: 242
-- Data for Name: tb_bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_bitacora (id_bit, id_us, accion, fecha) FROM stdin;
1	3	Inicio de sesión	2025-11-29 21:58:46.367875
2	3	Inicio de sesión	2025-11-29 22:09:11.817185
3	3	Inicio de sesión	2025-11-29 22:09:45.588859
4	3	Inicio de sesión	2025-11-29 23:01:30.354004
5	3	Creó dia 1 de la novena	2025-11-29 23:04:34.223041
6	3	Editó día 1 de la novena	2025-11-29 23:06:09.766258
7	3	Editó día 1 de la novena	2025-11-29 23:07:47.905401
8	3	Creó dia 2 de la novena	2025-11-29 23:08:14.024996
9	3	Editó día 1 de la novena	2025-11-29 23:08:32.471578
10	3	Creó dia 3 de la novena	2025-11-29 23:09:04.187313
11	3	Creó dia 4 de la novena	2025-11-29 23:09:24.104767
12	3	Creó dia 5 de la novena	2025-11-29 23:09:44.17146
13	3	Creó dia 6 de la novena	2025-11-29 23:10:41.074795
14	3	Creó dia 7 de la novena	2025-11-29 23:11:05.550761
15	3	Creó dia 8 de la novena	2025-11-29 23:11:26.600013
16	3	Creó dia 9 de la novena	2025-11-29 23:11:47.916693
17	3	Desactivó día 1 de la novena	2025-11-29 23:11:54.211232
18	3	Activó día 1 de la novena	2025-11-29 23:12:07.740044
19	3	Inicio de sesión	2025-11-29 23:51:39.312818
20	3	Editó personaje Rey Mago Melchor	2025-11-29 23:51:46.359929
21	3	Inicio de sesión	2025-11-29 23:58:46.301852
22	3	Editó personaje Rey Mago Melchor	2025-11-29 23:58:54.211465
23	3	Editó personaje Rey Mago Melchor	2025-11-29 23:59:09.615689
24	3	Editó personaje Rey Mago Melchor	2025-11-29 23:59:40.724079
25	3	Editó personaje Rey Mago Melchor	2025-11-30 00:00:20.370538
26	3	Editó personaje Rey Mago Melchor	2025-11-30 00:00:51.889628
27	3	Editó personaje Rey Mago Melchor	2025-11-30 00:01:58.472538
28	3	Inicio de sesión	2025-11-30 00:06:58.023225
29	3	Inicio de sesión	2025-11-30 00:23:59.480232
30	3	Editó personaje Rey Mago Melchor	2025-11-30 00:24:42.281639
31	3	Editó personaje Melchor	2025-11-30 00:34:11.272779
32	3	Desactivo personaje ID 1	2025-11-30 00:34:51.5882
33	3	Activo personaje ID 1	2025-11-30 00:34:55.065919
34	3	Inicio de sesión	2025-11-30 00:55:26.593241
35	3	Registró villancico Peces en el rio-Villancico	2025-11-30 01:03:38.574738
36	3	Registró villancico Peces en el rio-Villancico	2025-11-30 01:04:17.299052
37	3	Registró villancico Peces en el rio-Villancico	2025-11-30 01:04:35.994337
38	3	Registró villancico Peces en el rio-Villancico	2025-11-30 01:04:55.833647
39	3	Registró villancico Peces en el rio-Villancico	2025-11-30 01:05:11.869609
40	3	Registró villancico: Peces en el rio-Villancico	2025-11-30 01:10:05.077916
41	3	Registró villancico: Peces en el rio-Villancico	2025-11-30 01:10:14.302239
42	2	Inicio de sesión	2025-11-30 11:42:12.669411
43	2	Guardó puntaje: 160	2025-11-30 11:44:32.719134
44	2	Guardó puntaje: 160	2025-11-30 11:45:32.413498
45	2	Guardó puntaje de 160	2025-11-30 11:49:02.453112
46	2	Inicio de sesión	2025-11-30 12:02:00.518044
47	3	Inicio de sesión	2025-11-30 12:02:44.620949
48	2	Inicio de sesión	2025-11-30 12:23:05.12308
49	3	Inicio de sesión	2025-11-30 12:27:45.713589
50	3	Inicio de sesión	2025-11-30 12:40:56.573516
51	3	Inicio de sesión	2025-11-30 12:42:43.159873
52	3	Inicio de sesión	2025-11-30 12:43:34.915821
53	2	Inicio de sesión	2025-11-30 12:45:36.138054
54	3	Inicio de sesión	2025-11-30 17:17:41.298337
55	2	Inicio de sesión	2025-11-30 17:35:23.205334
56	2	Guardó puntaje de 40	2025-11-30 17:38:33.150423
57	3	Inicio de sesión	2025-11-30 19:49:09.655428
58	3	Inicio de sesión	2025-11-30 19:59:49.063696
59	3	Inicio de sesión	2025-11-30 20:01:46.813533
60	3	Inicio de sesión	2025-11-30 20:13:02.110038
61	3	Inicio de sesión	2025-11-30 20:13:09.420076
62	3	Inicio de sesión	2025-11-30 20:17:51.663452
63	2	Inicio de sesión	2025-11-30 20:22:08.141005
64	2	Inicio de sesión	2025-11-30 20:31:42.129409
65	3	Inicio de sesión	2025-11-30 20:31:54.579184
66	2	Inicio de sesión	2025-11-30 20:38:44.760822
67	3	Inicio de sesión	2025-11-30 20:42:26.500774
69	3	Inicio de sesión	2025-11-30 21:30:59.228703
70	3	Desactivo personaje ID 3	2025-11-30 21:31:05.884572
71	3	Desactivo personaje ID 4	2025-11-30 21:31:08.297253
72	3	Desactivo personaje ID 5	2025-11-30 21:31:10.59851
73	3	Editó personaje: Melchor	2025-11-30 21:32:07.010643
74	3	Editó personaje: Melchor	2025-11-30 21:32:51.196908
75	3	Editó personaje: Melchor	2025-11-30 21:33:04.911485
76	3	Editó personaje: Melchor	2025-11-30 21:36:09.717899
77	3	Editó personaje: Gaspar	2025-11-30 21:36:59.137383
78	3	Registro personaje: Baltasar	2025-11-30 21:38:42.092187
79	3	Desactivo personaje ID 1	2025-11-30 21:38:54.135724
80	3	Registro personaje: Melchor	2025-11-30 21:39:32.721139
81	3	Editó personaje: Melchor	2025-11-30 21:40:56.83586
82	3	Registro personaje: Niño Jesus	2025-11-30 21:41:41.203311
83	3	Registro personaje: Virgen Maria	2025-11-30 21:42:06.237054
84	3	Registro personaje: San Jose	2025-11-30 21:42:20.525598
85	3	Registro personaje: Pastores	2025-11-30 21:42:51.515567
86	3	Registro personaje: Angeles	2025-11-30 21:43:19.398527
87	3	Registro personaje: Buey	2025-11-30 21:43:56.006362
88	3	Registro personaje: Asno	2025-11-30 21:44:16.129618
89	3	Registro personaje: Ovejas y Terneros	2025-11-30 21:44:39.33577
90	3	Creó dia 10 de la novena	2025-11-30 21:47:12.928773
91	3	Desactivó día 10 de la novena	2025-11-30 21:48:19.510045
92	3	Editó día 1 de la novena	2025-11-30 21:57:14.021381
93	3	Editó día 1 de la novena	2025-11-30 21:57:39.403582
94	3	Actualizó usuario ID 1	2025-11-30 21:57:59.71423
95	3	Actualizó usuario ID 1	2025-11-30 21:58:13.378593
96	3	Actualizó usuario ID 1	2025-11-30 22:06:27.463009
97	3	Editó día 1 de la novena	2025-11-30 22:06:35.423364
98	3	Editó personaje: Melchor	2025-11-30 22:06:46.967801
99	3	Inicio de sesión	2025-12-01 18:27:19.602042
100	3	Inicio de sesión	2025-12-01 18:30:21.894597
101	3	Inicio de sesión	2025-12-01 18:31:41.10222
102	3	Inicio de sesión	2025-12-01 18:32:26.526937
103	3	Cambió estado del usuario ID 4	2025-12-01 18:32:31.003991
104	4	Inicio de sesión	2025-12-01 18:32:42.259476
105	3	Inicio de sesión	2025-12-01 18:34:53.945993
106	2	Inicio de sesión	2025-12-01 18:37:32.751704
107	10	Registro de nuevo estudiante	2025-12-01 19:03:51.305063
108	10	Inicio de sesión	2025-12-01 19:04:01.466158
109	3	Inicio de sesión	2025-12-01 19:05:19.148817
110	11	Registro de nuevo estudiante	2025-12-01 19:23:32.996405
111	11	Inicio de sesión	2025-12-01 19:23:37.637698
112	11	Guardó puntaje de 160	2025-12-01 19:24:10.292783
113	11	Inicio de sesión	2025-12-01 19:27:04.831148
114	12	Registro de nuevo estudiante	2025-12-01 19:29:58.238874
115	12	Inicio de sesión	2025-12-01 19:30:30.33494
116	3	Cambió estado del usuario ID 12	2025-12-01 19:31:26.234815
117	3	Cambió estado del usuario ID 12	2025-12-01 19:31:30.122037
118	11	Inicio de sesión	2025-12-01 19:31:44.065027
119	12	Inicio de sesión	2025-12-01 19:33:30.755712
120	12	Inicio de sesión	2025-12-01 19:33:57.894466
121	12	Inicio de sesión	2025-12-01 19:38:18.224986
122	12	Inicio de sesión	2025-12-01 19:39:05.935627
123	12	Inicio de sesión	2025-12-01 19:39:49.999222
124	12	Inicio de sesión	2025-12-01 20:48:45.15284
125	3	Inicio de sesión	2025-12-01 20:49:08.040953
126	3	Inicio de sesión	2025-12-01 20:53:17.821488
\.


--
-- TOC entry 5131 (class 0 OID 16805)
-- Dependencies: 240
-- Data for Name: tb_estado_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_estado_usuario (id_est, descripcion_est) FROM stdin;
1	Activo
2	Bloqueado
\.


--
-- TOC entry 5117 (class 0 OID 16703)
-- Dependencies: 226
-- Data for Name: tb_estadocivil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_estadocivil (id_est, descripcion_est) FROM stdin;
1	Soltero
2	Casado
3	Divorciado
4	Unión libre
5	Viudo
\.


--
-- TOC entry 5113 (class 0 OID 16673)
-- Dependencies: 222
-- Data for Name: tb_pagina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_pagina (id_pag, descripcion_pag, path_pag) FROM stdin;
2	Novena	http://192.168.100.68:8080/pesebreP/novena.jsp
3	Villancicos	http://192.168.100.68:8080/pesebreP/villancicos.jsp
1	Inicio	http://192.168.100.68:8080/pesebreP/index.jsp
4	Personajes	http://192.168.100.68:8080/pesebreP/personajes.jsp
5	Juego	http://192.168.100.68:8080/pesebreP/juego.jsp
6	Gestion Usuarios	http://192.168.100.68:8080/pesebreP/admin_usuarios.jsp
7	Bitacora	http://192.168.100.68:8080/pesebreP/admin_bitacora.jsp
8	Gestión Novena	http://192.168.100.68:8080/pesebreP/admin_novena.jsp
9	Gestión Villancicos	http://192.168.100.68:8080/pesebreP/admin_villancicos.jsp
10	Gestión Personajes	http://192.168.100.68:8080/pesebreP/admin_personajes.jsp
11	Puntajes	http://192.168.100.68:8080/pesebreP/puntajes.jsp
\.


--
-- TOC entry 5111 (class 0 OID 16662)
-- Dependencies: 220
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_perfil (id_per, descripcion_per) FROM stdin;
1	Administrador
2	Estudiante
3	test
\.


--
-- TOC entry 5115 (class 0 OID 16685)
-- Dependencies: 224
-- Data for Name: tb_perfilpagina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_perfilpagina (id_perpag, id_per, id_pag) FROM stdin;
6	1	6
7	1	7
8	1	8
10	1	10
13	2	2
14	2	3
15	2	4
16	2	5
17	2	11
1	3	1
2	3	2
3	3	3
4	3	4
5	3	5
9	3	9
11	3	11
12	3	1
\.


--
-- TOC entry 5119 (class 0 OID 16714)
-- Dependencies: 228
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_usuario (id_us, id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) FROM stdin;
2	2	1	Alejandro	1750764175	alejo@gmail.com	alejandrocoronel
5	1	1	Patricio	1750764175	patricio@gmail.com	patricio12345
7	1	1	Juan	1750764175	juan@gmail.com	jaun12345
3	1	1	Bruce Wayne	1750764175	batman@gmail.com	batman
1	1	1	Jossue	1750764175	jossuep@gmail.com	jossuep12345
4	2	1	Alejandro Guachamin	1750764175	coronel@gmail.com	coronel12345
10	2	1	patricio	1750764175	patricio@hotmail.com	patricio12345
11	2	1	Abel	1727796847	abelchuros@gmail.com	abelchuros12345
12	2	1	Abel	1727796847	abelpgs@hotmail.com	123456789ja
\.


--
-- TOC entry 5123 (class 0 OID 16750)
-- Dependencies: 232
-- Data for Name: villancico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villancico (id_vill, titulo, imagen, audio, letra) FROM stdin;
\.


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 237
-- Name: bitacora_id_bit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_id_bit_seq', 1, false);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 229
-- Name: novena_id_nov_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.novena_id_nov_seq', 10, true);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 233
-- Name: personaje_id_perse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personaje_id_perse_seq', 15, true);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 235
-- Name: puntaje_id_score_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puntaje_id_score_seq', 5, true);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 241
-- Name: tb_bitacora_id_bit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_bitacora_id_bit_seq', 126, true);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 239
-- Name: tb_estado_usuario_id_est_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_estado_usuario_id_est_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_estadocivil_id_est_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_estadocivil_id_est_seq', 5, true);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_pagina_id_pag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_pagina_id_pag_seq', 11, true);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_perfil_id_per_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_perfil_id_per_seq', 2, true);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_perfilpagina_id_perpag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_perfilpagina_id_perpag_seq', 17, true);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_usuario_id_us_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_usuario_id_us_seq', 12, true);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 231
-- Name: villancico_id_vill_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villancico_id_vill_seq', 1, false);


--
-- TOC entry 4952 (class 2606 OID 16798)
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id_bit);


--
-- TOC entry 4942 (class 2606 OID 16748)
-- Name: novena novena_dia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.novena
    ADD CONSTRAINT novena_dia_key UNIQUE (dia);


--
-- TOC entry 4944 (class 2606 OID 16746)
-- Name: novena novena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.novena
    ADD CONSTRAINT novena_pkey PRIMARY KEY (id_nov);


--
-- TOC entry 4948 (class 2606 OID 16771)
-- Name: personaje personaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personaje
    ADD CONSTRAINT personaje_pkey PRIMARY KEY (id_perse);


--
-- TOC entry 4950 (class 2606 OID 16781)
-- Name: puntaje puntaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntaje
    ADD CONSTRAINT puntaje_pkey PRIMARY KEY (id_score);


--
-- TOC entry 4956 (class 2606 OID 16824)
-- Name: tb_bitacora tb_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bitacora
    ADD CONSTRAINT tb_bitacora_pkey PRIMARY KEY (id_bit);


--
-- TOC entry 4954 (class 2606 OID 16812)
-- Name: tb_estado_usuario tb_estado_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estado_usuario
    ADD CONSTRAINT tb_estado_usuario_pkey PRIMARY KEY (id_est);


--
-- TOC entry 4936 (class 2606 OID 16712)
-- Name: tb_estadocivil tb_estadocivil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_estadocivil
    ADD CONSTRAINT tb_estadocivil_pkey PRIMARY KEY (id_est);


--
-- TOC entry 4932 (class 2606 OID 16683)
-- Name: tb_pagina tb_pagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_pagina
    ADD CONSTRAINT tb_pagina_pkey PRIMARY KEY (id_pag);


--
-- TOC entry 4930 (class 2606 OID 16671)
-- Name: tb_perfil tb_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfil
    ADD CONSTRAINT tb_perfil_pkey PRIMARY KEY (id_per);


--
-- TOC entry 4934 (class 2606 OID 16691)
-- Name: tb_perfilpagina tb_perfilpagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_pkey PRIMARY KEY (id_perpag);


--
-- TOC entry 4938 (class 2606 OID 16728)
-- Name: tb_usuario tb_usuario_correo_us_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_correo_us_key UNIQUE (correo_us);


--
-- TOC entry 4940 (class 2606 OID 16726)
-- Name: tb_usuario tb_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (id_us);


--
-- TOC entry 4946 (class 2606 OID 16760)
-- Name: villancico villancico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villancico
    ADD CONSTRAINT villancico_pkey PRIMARY KEY (id_vill);


--
-- TOC entry 4961 (class 2606 OID 16799)
-- Name: bitacora bitacora_id_us_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_id_us_fkey FOREIGN KEY (id_us) REFERENCES public.tb_usuario(id_us);


--
-- TOC entry 4960 (class 2606 OID 16782)
-- Name: puntaje puntaje_id_us_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntaje
    ADD CONSTRAINT puntaje_id_us_fkey FOREIGN KEY (id_us) REFERENCES public.tb_usuario(id_us);


--
-- TOC entry 4962 (class 2606 OID 16825)
-- Name: tb_bitacora tb_bitacora_id_us_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bitacora
    ADD CONSTRAINT tb_bitacora_id_us_fkey FOREIGN KEY (id_us) REFERENCES public.tb_usuario(id_us);


--
-- TOC entry 4957 (class 2606 OID 16697)
-- Name: tb_perfilpagina tb_perfilpagina_id_pag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_id_pag_fkey FOREIGN KEY (id_pag) REFERENCES public.tb_pagina(id_pag);


--
-- TOC entry 4958 (class 2606 OID 16692)
-- Name: tb_perfilpagina tb_perfilpagina_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_perfilpagina
    ADD CONSTRAINT tb_perfilpagina_id_per_fkey FOREIGN KEY (id_per) REFERENCES public.tb_perfil(id_per);


--
-- TOC entry 4959 (class 2606 OID 16729)
-- Name: tb_usuario tb_usuario_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_id_per_fkey FOREIGN KEY (id_per) REFERENCES public.tb_perfil(id_per);


-- Completed on 2025-12-01 23:38:44

--
-- PostgreSQL database dump complete
--

\unrestrict sWrFwFoimbyJIEnwT2hs3qiC6jPCFlUag9sbL4o3kl6Vh5MXfvaNAfTmPXE2V2I

