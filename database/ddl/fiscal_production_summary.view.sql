CREATE OR REPLACE VIEW "public"."fiscal_production_summary" AS 
 SELECT a.location_type,
    a.land_category,
    a.fiscal_year,
    a.state_or_area,
    a.sum,
    a.commodity
   FROM (( SELECT 'State'::text AS location_type,
            location.land_category,
            period.fiscal_year,
                CASE
                    WHEN ((location.land_category)::text = 'Offshore'::text) THEN location.offshore_planning_area_code
                    ELSE location.state
                END AS state_or_area,
            sum(production.volume) AS sum,
            commodity.product AS commodity
           FROM (((production
             JOIN period USING (period_id))
             JOIN location USING (location_id))
             JOIN commodity USING (commodity_id))
          WHERE ((period.period)::text = 'Fiscal Year'::text)
          GROUP BY
                CASE
                    WHEN ((location.land_category)::text = 'Offshore'::text) THEN location.offshore_planning_area_code
                    ELSE location.state
                END, location.land_category, period.fiscal_year, commodity.product
          ORDER BY period.fiscal_year,
                CASE
                    WHEN ((location.land_category)::text = 'Offshore'::text) THEN location.offshore_planning_area_code
                    ELSE location.state
                END)
        UNION
        ( SELECT 'County'::text AS location_type,
            location.land_category,
            period.fiscal_year,
            location.fips_code AS state_or_area,
            sum(production.volume) AS sum,
            commodity.product AS commodity
           FROM (((production
             JOIN period USING (period_id))
             JOIN location USING (location_id))
             JOIN commodity USING (commodity_id))
          WHERE ((period.period)::text = 'Fiscal Year'::text)
          GROUP BY location.fips_code, location.land_category, period.fiscal_year, commodity.product
          ORDER BY period.fiscal_year, location.fips_code)
        UNION
        ( SELECT 'Nationwide Federal'::text AS location_type,
            'Nationwide Federal'::character varying AS land_category,
            period.fiscal_year,
            'Nationwide Federal'::text AS state_or_area,
            sum(production.volume) AS sum          ,
            commodity.product AS commodity
           FROM (((production
             JOIN period USING (period_id))
             JOIN location USING (location_id))
             JOIN commodity USING (commodity_id))
          WHERE (((period.period)::text = 'Fiscal Year'::text) AND ((location.land_class)::text = 'Federal'::text))
          GROUP BY 'Nationwide Federal'::text, period.fiscal_year, commodity.product
          ORDER BY period.fiscal_year, 'Nationwide Federal'::text)
        UNION
        ( SELECT 'Naive American'::text AS location_type,
            'Native American'::character varying AS land_category,
            period.fiscal_year,
            'Native American'::text AS state_or_area,
            sum(production.volume) AS sum          ,
            commodity.product AS commodity
           FROM (((production
             JOIN period USING (period_id))
             JOIN location USING (location_id))
             JOIN commodity USING (commodity_id))
          WHERE (((period.period)::text = 'Fiscal Year'::text) AND ((location.land_class)::text = 'Native American'::text))
          GROUP BY 'Native American'::text, period.fiscal_year, commodity.product
          ORDER BY period.fiscal_year, 'Native American'::text)) a
  ORDER BY a.fiscal_year, a.state_or_area;