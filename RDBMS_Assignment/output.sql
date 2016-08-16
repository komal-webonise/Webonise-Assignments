--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: ecommerce; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ecommerce;


ALTER SCHEMA ecommerce OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

--
-- Name: add_payment_details(integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_payment_details(order_id integer, payment_mode text, payment_status text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into ecommerce.payments values (order_id,payment_mode,payment_status);END;$$;


ALTER FUNCTION public.add_payment_details(order_id integer, payment_mode text, payment_status text) OWNER TO postgres;

SET search_path = ecommerce, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: order_details; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_colour text NOT NULL,
    product_price real NOT NULL,
    dicount real NOT NULL
);


ALTER TABLE ecommerce.order_details OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    order_date date NOT NULL,
    total_price real NOT NULL,
    net_price real NOT NULL
);


ALTER TABLE ecommerce.orders OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE payments (
    order_id integer NOT NULL,
    payment_mode text NOT NULL,
    payment_status text NOT NULL
);


ALTER TABLE ecommerce.payments OWNER TO postgres;

--
-- Name: product_details; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE product_details (
    product_id integer NOT NULL,
    colour text NOT NULL,
    price real NOT NULL
);


ALTER TABLE ecommerce.product_details OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    product_name text NOT NULL
);


ALTER TABLE ecommerce.products OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    type text NOT NULL
);


ALTER TABLE ecommerce.users OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: order_details_view; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details_view (
    id integer,
    net_price real,
    order_date date,
    sum real
);


ALTER TABLE public.order_details_view OWNER TO postgres;

--
-- Name: order_details_view1; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details_view1 (
    id integer,
    net_price real,
    order_date date,
    sum real,
    payment_mode text,
    payment_status text
);


ALTER TABLE public.order_details_view1 OWNER TO postgres;

--
-- Name: order_details_view_first; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details_view_first (
    order_id integer,
    order_total real,
    date date,
    discount real,
    payment_method text,
    payment_status text
);


ALTER TABLE public.order_details_view_first OWNER TO postgres;

--
-- Name: temp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE temp (
    id integer,
    order_date date,
    product_name text,
    price real,
    total_price real,
    name text,
    email text
);


ALTER TABLE public.temp OWNER TO postgres;

SET search_path = ecommerce, pg_catalog;

--
-- Data for Name: order_details; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY order_details (order_id, product_id, product_colour, product_price, dicount) FROM stdin;
1001	111	blue	1000	100
1001	112	red	710	71
1002	115	silver	5000	500
1003	113	black	2500	0
1003	114	black	800	0
1004	113	white	1380	138
1005	111	white	1350	0
1005	112	green	650	0
1005	113	black	2500	0
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY orders (id, user_id, order_date, total_price, net_price) FROM stdin;
1001	1	2016-08-15	1710	1539
1002	3	2016-07-16	5000	4500
1003	4	2016-06-25	3300	3300
1004	6	2016-08-11	1380	1242
1005	1	2016-08-12	4500	4500
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY payments (order_id, payment_mode, payment_status) FROM stdin;
1001	credit card	done
1002	debit card	done
1003	cash	not done
1004	credit card	done
1005	cash	not done
\.


--
-- Data for Name: product_details; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY product_details (product_id, colour, price) FROM stdin;
111	blue	1000
111	black	1200
111	white	1350
112	black	999.5
112	red	710
112	green	650
113	black	2500
113	white	1380
114	black	800
114	grey	1300
115	silver	5000
115	golden	7000
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY products (id, product_name) FROM stdin;
111	jeans
112	top
113	shoes
114	bag
115	watch
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY users (id, name, email, password, type) FROM stdin;
1	komal	komal8332@gmail.com	komal1234	buyer
2	peter	peter880@gmail.com	petme@321	inventory manager
3	karan	karan81@yahoo.com	ka@4356ggg	buyer
4	bob	bobshopper@gmail.com	shopping%45	buyer
5	ruth	noname54@yahoo.com	ruthkesar456	inventory manager\t
6	john	john6754@rediffmail.com	john99987	buyer
7	kevin	kevin666@gmail.com	kevinadmin1	inventory manager\t\t
\.


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_details_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (product_id, colour);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE "_RETURN" AS
    ON SELECT TO order_details_view DO INSTEAD  SELECT orders.id,
    orders.net_price,
    orders.order_date,
    sum(order_details.dicount) AS sum
   FROM ecommerce.orders,
    ecommerce.payments,
    ecommerce.order_details
  WHERE ((orders.id = order_details.order_id) AND (orders.id = payments.order_id))
  GROUP BY orders.id
  ORDER BY orders.id;


--
-- Name: _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE "_RETURN" AS
    ON SELECT TO order_details_view1 DO INSTEAD  SELECT orders.id,
    orders.net_price,
    orders.order_date,
    sum(order_details.dicount) AS sum,
    payments.payment_mode,
    payments.payment_status
   FROM ecommerce.orders,
    ecommerce.payments,
    ecommerce.order_details
  WHERE ((orders.id = order_details.order_id) AND (orders.id = payments.order_id))
  GROUP BY orders.id, payments.payment_mode, payments.payment_status
  ORDER BY orders.id;


--
-- Name: _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE "_RETURN" AS
    ON SELECT TO order_details_view_first DO INSTEAD  SELECT orders.id AS order_id,
    orders.net_price AS order_total,
    orders.order_date AS date,
    sum(order_details.dicount) AS discount,
    payments.payment_mode AS payment_method,
    payments.payment_status
   FROM ecommerce.orders,
    ecommerce.payments,
    ecommerce.order_details
  WHERE ((orders.id = order_details.order_id) AND (orders.id = payments.order_id))
  GROUP BY orders.id, payments.payment_mode, payments.payment_status
  ORDER BY orders.id;


--
-- Name: _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE "_RETURN" AS
    ON SELECT TO temp DO INSTEAD  SELECT orders.id,
    orders.order_date,
    products.product_name,
    product_details.price,
    orders.total_price,
    users.name,
    users.email
   FROM ecommerce.users,
    ecommerce.products,
    ecommerce.orders,
    ecommerce.product_details,
    ecommerce.order_details
  WHERE (((((users.id = orders.user_id) AND (products.id = product_details.product_id)) AND (orders.id = order_details.order_id)) AND (order_details.product_id = products.id)) AND (order_details.product_id = product_details.product_id))
  GROUP BY orders.id, products.id, product_details.price, users.id;


SET search_path = ecommerce, pg_catalog;

--
-- Name: order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: orders_user_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: payments_order_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: product_details_product_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

