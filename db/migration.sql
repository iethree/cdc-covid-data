-- add unique ids
alter table vaccination_county_condensed_data
add column record_id SERIAL;

alter table integrated_county_latest_external_data
add column record_id SERIAL;

alter table us_map_data
add column record_id SERIAL;

alter table county_view_state_data
add column record_id SERIAL;

-- add created_at

alter table vaccination_county_condensed_data
add column created_at TIMESTAMP DEFAULT NOW();

alter table integrated_county_latest_external_data
add column created_at TIMESTAMP DEFAULT NOW();

alter table us_map_data
add column created_at TIMESTAMP DEFAULT NOW();

alter table county_view_state_data
add column created_at TIMESTAMP DEFAULT NOW();

-- us_map_data umd
SELECT id, us_trend_maxdate, count(id) from us_map_data
group BY
  us_trend_maxdate, id;

DELETE FROM
    us_map_data a
        USING us_map_data b
WHERE
    a.record_id < b.record_id
    AND a.us_trend_maxdate = b.us_trend_maxdate
    and a.id = b.id;

-- county_view_state_data
SELECT date, state, count(*) from county_view_state_data
group BY
  date, state;

DELETE FROM
    county_view_state_data a
        USING county_view_state_data b
WHERE
    a.record_id < b.record_id
    AND a.state = b.state
    and a.date = b.date;

-- integrated_county_latest_external_data
SELECT "CCL_report_date", fips_code, count(*) from integrated_county_latest_external_data
group BY
  fips_code, "CCL_report_date";

DELETE FROM
    integrated_county_latest_external_data a
        USING integrated_county_latest_external_data b
WHERE
    a.record_id < b.record_id
    AND a.fips_code = b.fips_code
    and a."CCL_report_date" = b."CCL_report_date";

-- vaccination_county_condensed_data

SELECT "Date", "FIPS", count(*) from vaccination_county_condensed_data
group BY
  "FIPS", "Date";

DELETE FROM
    vaccination_county_condensed_data a
        USING vaccination_county_condensed_data b
WHERE
    a.record_id < b.record_id
    AND a."FIPS" = b."FIPS"
    and a."Date" = b."Date";

-- add unique indexes

CREATE UNIQUE INDEX "unique_idx" ON "county_view_state_data"(state, date);

CREATE UNIQUE INDEX "unique_idx_us_map" ON "us_map_data"(id, us_trend_maxdate);

CREATE UNIQUE INDEX "unique_idx_county_covid" ON "integrated_county_latest_external_data"(fips_code, "CCL_report_date");

CREATE UNIQUE INDEX "unique_idx_county_vax" ON "vaccination_county_condensed_data"("FIPS", "Date");
