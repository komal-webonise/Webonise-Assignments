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


SET search_path = public, pg_catalog;

--
-- Name: add_payment_details(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_payment_details(order_id integer, payment_method_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float;
dis int;
payment_mode text;
status varchar;
total_cost float;
BEGIN
select total_price into price from  ecommerce.orders as p1 where p1.id=order_id;
select payment_method into payment_mode from ecommerce.payment_methods as p1 where p1.id=payment_method_id;
select discount into dis from ecommerce.payment_methods as p1 where p1.id=payment_method_id;
total_cost := price - (0.01*dis); 
status:='Completed';
insert into ecommerce.payments(order_id,payment_method_id,amount_paid,payment_status) values (order_id,payment_method_id,total_cost,status);
END;
$$;


ALTER FUNCTION public.add_payment_details(order_id integer, payment_method_id integer) OWNER TO postgres;

--
-- Name: update_prices(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_prices() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;

total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost := total_cost + price;
update ecommerce.orders set total_price = total_cost where ecommerce.orders.id=ecommerce.order_details.order_id;return NEW; 
END;$$;


ALTER FUNCTION public.update_prices() OWNER TO postgres;

--
-- Name: update_prices_cost(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_prices_cost() RETURNS trigger
    LANGUAGE plpgsql
    AS $$                         
DECLARE 
price float ;
orderid int;

total_cost float;
BEGIN
select order_id into orderid from  ecommerce.orders as p1 , ecommerce.order_details  as p2 where p1.id=p2.order_id;
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost := total_cost + price;

update ecommerce.orders set total_price = total_cost where id=orderid;return NEW; 
END;$$;


ALTER FUNCTION public.update_prices_cost() OWNER TO postgres;

--
-- Name: update_pricess(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_pricess() RETURNS trigger
    LANGUAGE plpgsql
    AS $$                         
DECLARE 
price float ;

total_cost float;
BEGIN

select product_price into price from  ecommerce.product_details as p1  where p1.id=new.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3 where
p3.id=new.order_id;
total_cost := total_cost + price;

update ecommerce.orders set total_price = total_cost where id=new.order_id;return NEW; 
END;$$;


ALTER FUNCTION public.update_pricess() OWNER TO postgres;

--
-- Name: updateprice(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updateprice() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;

total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost := total_cost + price;
update ecommerce.orders set total_price = total_cost ; 
END;$$;


ALTER FUNCTION public.updateprice() OWNER TO postgres;

--
-- Name: updateprices(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updateprices() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;

total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost=total_cost + price;
update ecommerce.orders set total_price = total_cost ; 
END;$$;


ALTER FUNCTION public.updateprices() OWNER TO postgres;

--
-- Name: updatepricess(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updatepricess() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;

total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost := total_cost + price;
update ecommerce.orders set total_price = total_cost ;return NEW; 
END;$$;


ALTER FUNCTION public.updatepricess() OWNER TO postgres;

--
-- Name: updatetotalprice(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updatetotalprice() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;
total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details where ecommerce.product_details.id=ecommerce.order_details.product_detail_id;
select  total_price into total_cost from ecommerce.orders where
ecommerce.orders.id=ecommerce.order_details.order_id;
total_cost=total_cost + price;
update ecommerce.orders set total_price = total_cost ; 
END;$$;


ALTER FUNCTION public.updatetotalprice() OWNER TO postgres;

--
-- Name: updatetotalprices(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updatetotalprices() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
price float ;

total_cost float;
BEGIN
select product_price into price from  ecommerce.product_details as p1 , ecommerce.order_details  as p2 where p1.id=p2.product_detail_id;
select  total_price into total_cost from ecommerce.orders as p3,ecommerce.order_details as p4 where
p3.id=p4.order_id;
total_cost=total_cost + price;
update ecommerce.orders set total_price = total_cost ; 
END;$$;


ALTER FUNCTION public.updatetotalprices() OWNER TO postgres;

SET search_path = ecommerce, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: order_details; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details (
    order_id integer NOT NULL,
    product_detail_id integer NOT NULL
);


ALTER TABLE ecommerce.order_details OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    order_date date NOT NULL,
    total_price real NOT NULL
);


ALTER TABLE ecommerce.orders OWNER TO postgres;

--
-- Name: payment_methods; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    payment_method text NOT NULL,
    discount integer NOT NULL
);


ALTER TABLE ecommerce.payment_methods OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE payments (
    order_id integer NOT NULL,
    payment_method_id integer NOT NULL,
    amount_paid real,
    payment_status text
);


ALTER TABLE ecommerce.payments OWNER TO postgres;

--
-- Name: product_details; Type: TABLE; Schema: ecommerce; Owner: postgres; Tablespace: 
--

CREATE TABLE product_details (
    id integer NOT NULL,
    product_id integer NOT NULL,
    product_colour text NOT NULL,
    product_price real NOT NULL
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
-- Name: order_details_last_30; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_details_last_30 (
    "Order Id" integer,
    "order date" date,
    "product names" text,
    "product cost" text,
    "user" text,
    email text
);


ALTER TABLE public.order_details_last_30 OWNER TO postgres;

--
-- Name: orderdetail_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW orderdetail_view AS
 SELECT o.id,
    o.total_price,
    o.order_date,
    pay_mode.discount,
    pay_mode.payment_method,
    pay.payment_status
   FROM ecommerce.orders o,
    ecommerce.payment_methods pay_mode,
    ecommerce.payments pay
  WHERE ((o.id = pay.order_id) AND (pay.payment_method_id = pay_mode.id));


ALTER TABLE public.orderdetail_view OWNER TO postgres;

SET search_path = ecommerce, pg_catalog;

--
-- Data for Name: order_details; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY order_details (order_id, product_detail_id) FROM stdin;
1004	2008
1005	2005
1001	2001
1002	2012
1003	2008
1003	2007
1003	2009
1005	2010
1002	2003
1001	2006
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY orders (id, user_id, order_date, total_price) FROM stdin;
1002	3	2016-07-16	0
1003	4	2016-06-25	0
1005	1	2016-08-12	0
1001	1	2016-08-15	0
1004	6	2016-08-11	13800
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY payment_methods (id, payment_method, discount) FROM stdin;
5001	credit card	10
5002	debit card	10
5003	cash	0
5004	coupons	12
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY payments (order_id, payment_method_id, amount_paid, payment_status) FROM stdin;
1004	5001	13799.9004	Completed
\.


--
-- Data for Name: product_details; Type: TABLE DATA; Schema: ecommerce; Owner: postgres
--

COPY product_details (id, product_id, product_colour, product_price) FROM stdin;
2001	111	blue	1000
2002	111	black	1200
2003	111	white	1350
2004	112	black	999.5
2005	112	red	710
2006	112	green	650
2007	113	black	2500
2008	113	white	1380
2009	114	black	800
2010	114	grey	1300
2011	115	silver	5000
2012	115	golden	7000
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
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: product_details_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


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
    ON SELECT TO order_details_last_30 DO INSTEAD  SELECT o.id AS "Order Id",
    o.order_date AS "order date",
    string_agg(p.product_name, ','::text) AS "product names",
    array_to_string(array_agg(p1.product_price), ','::text) AS "product cost",
    u.name AS "user",
    u.email
   FROM ecommerce.orders o,
    ecommerce.users u,
    ecommerce.products p,
    ecommerce.product_details p1,
    ecommerce.order_details o1
  WHERE (((((o.user_id = u.id) AND (o.id = o1.order_id)) AND (o1.product_detail_id = p1.id)) AND (p.id = p1.product_id)) AND (o.order_date > (('now'::text)::date - '30 days'::interval day)))
  GROUP BY o.id, u.id;


SET search_path = ecommerce, pg_catalog;

--
-- Name: update_trigger; Type: TRIGGER; Schema: ecommerce; Owner: postgres
--

CREATE TRIGGER update_trigger AFTER INSERT ON order_details FOR EACH ROW EXECUTE PROCEDURE public.update_prices_cost();


--
-- Name: order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: order_details_product_detail_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_product_detail_id_fkey FOREIGN KEY (product_detail_id) REFERENCES product_details(id);


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
-- Name: payments_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: postgres
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id);


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

