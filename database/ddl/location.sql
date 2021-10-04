--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg110+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg110+1)

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
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    location_name character varying(255) DEFAULT ''::character varying NOT NULL,
    fips_code character varying(5) DEFAULT ''::character varying NOT NULL,
    state character varying(255) DEFAULT ''::character varying NOT NULL,
    state_name character varying(255) DEFAULT ''::character varying NOT NULL,
    county character varying(255) DEFAULT ''::character varying NOT NULL,
    land_class character varying(255) DEFAULT ''::character varying NOT NULL,
    land_category character varying(255) DEFAULT ''::character varying NOT NULL,
    land_type character varying(255) DEFAULT ''::character varying NOT NULL,
    region_type character varying(255) DEFAULT ''::character varying NOT NULL,
    district_type character varying(255) DEFAULT ''::character varying NOT NULL,
    offshore_region character varying(255) DEFAULT ''::character varying NOT NULL,
    location_order character varying(5) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.location ALTER COLUMN location_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location location_fips_code_state_county_land_class_land_category_of_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_fips_code_state_county_land_class_land_category_of_key UNIQUE (fips_code, state, county, land_class, land_category, offshore_region);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- PostgreSQL database dump complete
--

