--
-- PostgreSQL database dump
--

\restrict 2ecUM8ldwvGGvwkHMA9dcYPULLSl5AxPkaYpAEKfSzg8KHlgm5uEkca79JmOeKk

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-21 11:33:57

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
-- TOC entry 218 (class 1259 OID 16408)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    cust_id integer NOT NULL,
    cust_name character varying(100) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: customers_cust_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_cust_id_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: customers_cust_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_cust_id_seq OWNED BY public.customers.cust_id;


--
-- TOC entry 224 (class 1259 OID 16436)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    items_id integer NOT NULL,
    ord_id integer,
    p_id integer,
    quantity integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16435)
-- Name: order_items_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_items_id_seq OWNER TO postgres;

--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_items_id_seq OWNED BY public.order_items.items_id;


--
-- TOC entry 220 (class 1259 OID 16415)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    ord_id integer NOT NULL,
    ord_date date NOT NULL,
    cust_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: orders_ord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_ord_id_seq OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_ord_id_seq OWNED BY public.orders.ord_id;


--
-- TOC entry 222 (class 1259 OID 16427)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    p_id integer NOT NULL,
    p_name character varying(100),
    price numeric NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16426)
-- Name: products_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_p_id_seq OWNER TO postgres;

--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_p_id_seq OWNED BY public.products.p_id;


--
-- TOC entry 4656 (class 2604 OID 16411)
-- Name: customers cust_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN cust_id SET DEFAULT nextval('public.customers_cust_id_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 16439)
-- Name: order_items items_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN items_id SET DEFAULT nextval('public.order_items_items_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16418)
-- Name: orders ord_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN ord_id SET DEFAULT nextval('public.orders_ord_id_seq'::regclass);


--
-- TOC entry 4658 (class 2604 OID 16430)
-- Name: products p_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN p_id SET DEFAULT nextval('public.products_p_id_seq'::regclass);


--
-- TOC entry 4817 (class 0 OID 16408)
-- Dependencies: 218
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (cust_id, cust_name) FROM stdin;
1	Raju
2	Sham
3	Paul
4	Alex
\.


--
-- TOC entry 4823 (class 0 OID 16436)
-- Dependencies: 224
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (items_id, ord_id, p_id, quantity) FROM stdin;
7	1	1	1
8	1	4	2
9	2	1	1
10	3	2	1
11	3	4	5
12	4	3	1
\.


--
-- TOC entry 4819 (class 0 OID 16415)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (ord_id, ord_date, cust_id) FROM stdin;
1	2024-01-01	1
2	2024-02-01	2
3	2024-03-01	3
4	2024-04-04	2
\.


--
-- TOC entry 4821 (class 0 OID 16427)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (p_id, p_name, price) FROM stdin;
1	Laptop	55000.00
2	Mouse	500
3	Keyboard	800.00
4	Cable	250.00
\.


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 217
-- Name: customers_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_cust_id_seq', 4, true);


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_items_id_seq', 12, true);


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_ord_id_seq', 4, true);


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_p_id_seq', 4, true);


--
-- TOC entry 4661 (class 2606 OID 16413)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (cust_id);


--
-- TOC entry 4667 (class 2606 OID 16441)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (items_id);


--
-- TOC entry 4663 (class 2606 OID 16420)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 4665 (class 2606 OID 16434)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (p_id);


--
-- TOC entry 4669 (class 2606 OID 16447)
-- Name: order_items order_items_ord_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_ord_id_fkey FOREIGN KEY (ord_id) REFERENCES public.orders(ord_id);


--
-- TOC entry 4670 (class 2606 OID 16442)
-- Name: order_items order_items_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.products(p_id);


--
-- TOC entry 4668 (class 2606 OID 16421)
-- Name: orders orders_cust_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_cust_id_fkey FOREIGN KEY (cust_id) REFERENCES public.customers(cust_id);


-- Completed on 2025-09-21 11:33:57

--
-- PostgreSQL database dump complete
--

\unrestrict 2ecUM8ldwvGGvwkHMA9dcYPULLSl5AxPkaYpAEKfSzg8KHlgm5uEkca79JmOeKk

