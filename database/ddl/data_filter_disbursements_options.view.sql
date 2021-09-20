--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg100+1)
-- Dumped by pg_dump version 12.8 (Debian 12.8-1.pgdg100+1)

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
-- Name: data_filter_disbursements_options; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.data_filter_disbursements_options AS
 SELECT location.offshore_region,
    location.location_name,
    location.state_name,
    location.region_type,
    location.state,
    commodity.commodity,
    commodity.commodity_order,
        CASE
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMESA'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMesa'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'U.S. Treasury - GoMESA'::text) THEN 'U.S. Treasury'::character varying
            WHEN ((fund.recipient)::text = 'County'::text) THEN 'State and local governments'::character varying
            ELSE fund.recipient
        END AS recipient,
    fund.source,
    period.fiscal_year,
    period.calendar_year,
    'Fiscal Year'::character varying(255) AS period,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('Offshore ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('2 Offshore ', location.location_name))::character varying
            WHEN ((location.region_type)::text = ''::text) THEN (concat('1 ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name_sort
   FROM ((((public.commodity
     JOIN public.disbursement USING (commodity_id))
     JOIN public.period USING (period_id))
     JOIN public.location USING (location_id))
     JOIN public.fund USING (fund_id))
  WHERE ((period.period)::text = 'Fiscal Year'::text)
  GROUP BY location.offshore_region, location.location_name, location.state_name, location.region_type, location.state, commodity.commodity, commodity.commodity_order, fund.recipient, fund.source, period.fiscal_year, period.calendar_year, period.period
UNION
 SELECT location.offshore_region,
    location.location_name,
    location.state_name,
    location.region_type,
    location.state,
    commodity.commodity,
    commodity.commodity_order,
        CASE
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMESA'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMesa'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'U.S. Treasury - GoMESA'::text) THEN 'U.S. Treasury'::character varying
            WHEN ((fund.recipient)::text = 'County'::text) THEN 'State and local governments'::character varying
            ELSE fund.recipient
        END AS recipient,
    fund.source,
    period.fiscal_year,
    period.calendar_year,
    'Calendar Year'::character varying(255) AS period,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('Offshore ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('2 Offshore ', location.location_name))::character varying
            WHEN ((location.region_type)::text = ''::text) THEN (concat('1 ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name_sort
   FROM ((((public.commodity
     JOIN public.disbursement USING (commodity_id))
     JOIN public.period USING (period_id))
     JOIN public.location USING (location_id))
     JOIN public.fund USING (fund_id))
  WHERE ((period.period)::text = 'Calendar Year'::text)
  GROUP BY location.offshore_region, location.location_name, location.state_name, location.region_type, location.state, commodity.commodity, commodity.commodity_order, fund.recipient, fund.source, period.fiscal_year, period.calendar_year, period.period
UNION
 SELECT location.offshore_region,
    location.location_name,
    location.state_name,
    location.region_type,
    location.state,
    commodity.commodity,
    commodity.commodity_order,
        CASE
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMESA'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'Land & Water Conservation Fund - GoMesa'::text) THEN 'Land and Water Conservation Fund'::character varying
            WHEN ((fund.recipient)::text = 'U.S. Treasury - GoMESA'::text) THEN 'U.S. Treasury'::character varying
            WHEN ((fund.recipient)::text = 'County'::text) THEN 'State and local governments'::character varying
            ELSE fund.recipient
        END AS recipient,
    fund.source,
    period.fiscal_year,
    period.calendar_year,
    'Monthly'::character varying(255) AS period,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('Offshore ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name,
        CASE
            WHEN ((location.region_type)::text = 'County'::text) THEN location.state_name
            WHEN ((location.region_type)::text = 'Offshore'::text) THEN (concat('2 Offshore ', location.location_name))::character varying
            WHEN ((location.region_type)::text = ''::text) THEN (concat('1 ', location.location_name))::character varying
            ELSE location.location_name
        END AS state_offshore_name_sort
   FROM ((((public.commodity
     JOIN public.disbursement USING (commodity_id))
     JOIN public.period USING (period_id))
     JOIN public.location USING (location_id))
     JOIN public.fund USING (fund_id))
  WHERE ((period.period)::text = 'Monthly'::text)
  GROUP BY location.offshore_region, location.location_name, location.state_name, location.region_type, location.state, commodity.commodity, commodity.commodity_order, fund.recipient, fund.source, period.fiscal_year, period.calendar_year, period.period;


ALTER TABLE public.data_filter_disbursements_options OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

