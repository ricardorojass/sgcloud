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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    code character varying,
    version integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    description text,
    location character varying,
    origin integer DEFAULT 0 NOT NULL
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    remember_digest character varying,
    last_name character varying,
    role integer DEFAULT 0 NOT NULL,
    reset_digest character varying,
    reset_sent_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_digest; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_digest ON users USING btree (remember_digest);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150617175048');

INSERT INTO schema_migrations (version) VALUES ('20150617205408');

INSERT INTO schema_migrations (version) VALUES ('20150622224520');

INSERT INTO schema_migrations (version) VALUES ('20150623230155');

INSERT INTO schema_migrations (version) VALUES ('20150623230452');

INSERT INTO schema_migrations (version) VALUES ('20150625200812');

INSERT INTO schema_migrations (version) VALUES ('20150625221515');

INSERT INTO schema_migrations (version) VALUES ('20150626202523');

INSERT INTO schema_migrations (version) VALUES ('20150626202735');

INSERT INTO schema_migrations (version) VALUES ('20150702001449');

INSERT INTO schema_migrations (version) VALUES ('20150702013541');

INSERT INTO schema_migrations (version) VALUES ('20150708163345');

INSERT INTO schema_migrations (version) VALUES ('20150709161139');

INSERT INTO schema_migrations (version) VALUES ('20150709175315');

INSERT INTO schema_migrations (version) VALUES ('20150709212653');

INSERT INTO schema_migrations (version) VALUES ('20150709222728');

INSERT INTO schema_migrations (version) VALUES ('20150709223933');

INSERT INTO schema_migrations (version) VALUES ('20150709231038');

INSERT INTO schema_migrations (version) VALUES ('20150709231639');

INSERT INTO schema_migrations (version) VALUES ('20150717220304');

INSERT INTO schema_migrations (version) VALUES ('20150717221102');

INSERT INTO schema_migrations (version) VALUES ('20150718001338');

INSERT INTO schema_migrations (version) VALUES ('20150718002832');

INSERT INTO schema_migrations (version) VALUES ('20150723232921');

