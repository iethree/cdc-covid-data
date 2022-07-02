CREATE TABLE IF NOT EXISTS "county_view_state_data" (
    record_id SERIAL,
    created_at TIMESTAMP DEFAULT NOW(),
    "state" VARCHAR(8),
    "date" DATE,
    "statename" VARCHAR(64),
    "new_cases_07" INT,
    "new_deaths_07" INT,
    "percent_positive_7_day_range" VARCHAR(32),
    "sum_previous_day_pediatric_and_adult_7DayAvg" FLOAT,
    "Series_Complete_12PlusPop_Pct" FLOAT,
    "Series_Complete_5PlusPop_Pct" FLOAT
);

CREATE TABLE IF NOT EXISTS US_MAP_DATA (
    record_id SERIAL,
    created_at TIMESTAMP DEFAULT NOW(),
    "abbr" VARCHAR(8),
    "tot_cases" INT,
    "tot_cases_last_24_hours" INT,
    "conf_cases" INT,
    "prob_cases" INT,
    "new_cases07" INT,
    "new_deaths07" INT,
    "Seven_day_avg_new_cases_per_100k" FLOAT,
    "Seven_day_avg_new_deaths_per_100k"FLOAT,
    "Seven_day_cum_new_cases_per_100k" FLOAT,
    "Seven_day_cum_new_deaths_per_100k"FLOAT,
    "tot_death" INT,
    "tot_death_last_24_hours" INT,
    "conf_death" INT,
    "prob_death" INT,
    "death_100k" INT,
    "incidence" INT,
    "id" INT,
    "fips" INT,
    "name" VARCHAR(30),
    "us_trend_new_case" INT,
    "us_trend_new_death" INT,
    "us_trend_maxdate" DATE
);

CREATE TABLE IF NOT EXISTS "integrated_county_latest_external_data" (
    record_id SERIAL,
    created_at TIMESTAMP DEFAULT NOW(),
    "fips_code" INT,
    "State" VARCHAR(8),
    "State_name" VARCHAR(64),
    "County" VARCHAR(128),
    "positivity_start_date" DATE,
    "positivity_end_date" DATE,
    "total_positive_test_results_reported_7_day_count_change" INT,
    "Cases_7_day_count_change" INT,
    "cases_per_100K_7_day_count_change" FLOAT,
    "new_cases_week_over_week_percent_change" FLOAT,
    "percent_test_results_reported_positive_last_7_days" FLOAT,
    "percent_test_results_reported_positive_last_7_days_7_day_count_change"FLOAT,
    "total_test_results_reported_7_day_count_change" INT,
    "total_test_results_reported_7_day_count_change_per_100K" FLOAT,
    "total_new_test_results_reported_week_over_week_percent_change" FLOAT,
    "deaths_7_day_count_change" INT,
    "deaths_per_100K_7_day_count_change" FLOAT,
    "new_deaths_week_over_week_percent_change" FLOAT,
    "population_density_2019" FLOAT,
    "avg_hh_size" FLOAT,
    "percent_uninsured_2019" FLOAT,
    "poverty_rate_2019" FLOAT,
    "percent_65_plus" FLOAT,
    "percent_american_indian_ak_native" FLOAT,
    "svi_rank" FLOAT,
    "ccvi_score"FLOAT,
    "report_date"DATE,
    "case_death_start_date" DATE,
    "case_death_end_date" DATE,
    "testing_start_date" DATE,
    "testing_end_date" DATE,
    "hospital_data_collection_date" DATE,
    "total_hospitals_reporting" INT,
    "admissions_covid_confirmed_last_7_days" INT,
    "admissions_covid_confirmed_last_7_days_per_100_beds" FLOAT,
    "admissions_covid_confirmed_week_over_week_percent_change" FLOAT,
    "percent_adult_inpatient_beds_used_confirmed_covid" FLOAT,
    "percent_adult_inpatient_beds_used_confirmed_covid_week_over_week_absolute_change" FLOAT,
    "percent_adult_icu_beds_used_confirmed_covid" FLOAT,
    "percent_adult_icu_beds_used_confirmed_covid_week_over_week_absolute_change" FLOAT,
    "community_transmission_level" VARCHAR(64),
    "community_transmission_level_integer" INT,
    "population_density_2019_state_avg" FLOAT,
    "avg_hh_size_state_avg" FLOAT,
    "percent_uninsured_2019_state_avg" FLOAT,
    "poverty_rate_2019_state_avg" FLOAT,
    "percent_65_plus_state_avg" FLOAT,
    "population_density_2019_US_avg" FLOAT,
    "avg_hh_size_US_avg" FLOAT,
    "percent_uninsured_2019_US_avg" FLOAT,
    "poverty_rate_2019_US_avg" FLOAT,
    "percent_65_plus_US_avg" FLOAT,
    "total_population_2019" INT,
    "Metro_status" VARCHAR(64),
    "NCHS_status" VARCHAR(64),
    "rucc_description" VARCHAR(128),
    "state_population" INT,
    "US_population" INT,
    "admissions_covid_confirmed_last_7_days_per_100k_population" FLOAT,
    "hsa_num" INT,
    "CCL_report_date" DATE,
    "CCL_case_death_end_date" DATE,
    "CCL_case_death_start_date" DATE,
    "CCL_hospital_data_collection_date" DATE,
    "CCL_community_burden_level" VARCHAR(64),
    "CCL_community_burden_level_integer" INT,
    "CCL_cases_per_100K_7_day_count_change" FLOAT,
    "CCL_admissions_covid_confirmed_last_7_days_per_100k_population" FLOAT,
    "CCL_percent_adult_inpatient_beds_used_confirmed_covid" FLOAT
);

CREATE TABLE IF NOT EXISTS vaccination_county_condensed_data (
    record_id SERIAL,
    created_at TIMESTAMP DEFAULT NOW(),
    "Date" DATE,
    "FIPS" VARCHAR(16),
    "StateName" VARCHAR(64),
    "StateAbbr" VARCHAR(16),
    "County" VARCHAR(128),
    "Series_Complete_5Plus" INT,
    "Series_Complete_5PlusPop_Pct" FLOAT,
    "Series_Complete_5to17" INT,
    "Series_Complete_5to17Pop_Pct" FLOAT,
    "Series_Complete_18Plus" INT,
    "Series_Complete_18PlusPop_Pct" FLOAT,
    "Series_Complete_65Plus" INT,
    "Series_Complete_65PlusPop_Pct" FLOAT,
    "Series_Complete_Yes" INT,
    "Series_Complete_Pop_Pct" FLOAT,
    "Completeness_pct" FLOAT,
    "Census2019_12PlusPop" INT,
    "Series_Complete_12Plus" INT,
    "Series_Complete_12PlusPop_Pct" FLOAT,
    "Administered_Dose1_Recip" INT,
    "Administered_Dose1_Recip_5Plus" INT,
    "Administered_Dose1_Recip_12Plus" INT,
    "Administered_Dose1_Recip_18Plus" INT,
    "Administered_Dose1_Recip_65Plus" INT,
    "Administered_Dose1_Pop_Pct" FLOAT,
    "Administered_Dose1_Recip_5PlusPop_Pct" FLOAT,
    "Administered_Dose1_Recip_12PlusPop_Pct" FLOAT,
    "Administered_Dose1_Recip_18PlusPop_Pct" FLOAT,
    "Administered_Dose1_Recip_65PlusPop_Pct" FLOAT,
    "Series_Complete_Pop_Pct_SVI" INT,
    "Series_Complete_5PlusPop_Pct_SVI" INT,
    "Series_Complete_12PlusPop_Pct_SVI" INT,
    "Series_Complete_5to17Pop_Pct_SVI" INT,
    "Series_Complete_18PlusPop_Pct_SVI" INT,
    "Series_Complete_65PlusPop_Pct_SVI" INT,
    "SVI_CTGY" VARCHAR(8),
    "series_complete_pop_pct_UR_Equity" INT,
    "Series_Complete_5PlusPop_Pct_UR_Equity" INT,
    "series_complete_12PlusPop_pct_UR_Equity" INT,
    "Series_Complete_5to17Pop_Pct_UR_Equity" INT,
    "series_complete_18PlusPop_pct_UR_Equity" INT,
    "series_complete_65PlusPop_pct_UR_Equity" INT,
    "metro_status" VARCHAR(64),
    "Booster_Doses" INT,
    "Booster_Doses_12Plus" INT,
    "Booster_Doses_18Plus" INT,
    "Booster_Doses_65Plus" INT,
    "Booster_Doses_Vax_Pct" FLOAT,
    "Booster_Doses_12Plus_Vax_Pct" FLOAT,
    "Booster_Doses_18Plus_Vax_Pct" FLOAT,
    "Booster_Doses_65Plus_Vax_Pct" FLOAT,
    "Booster_Doses_Vax_Pct_SVI" INT,
    "Booster_Doses_12PlusVax_Pct_SVI" INT,
    "Booster_Doses_18PlusVax_Pct_SVI" INT,
    "Booster_Doses_65PlusVax_Pct_SVI" INT,
    "Booster_Doses_Vax_Pct_UR_Equity" INT,
    "Booster_Doses_12PlusVax_Pct_UR_Equity" INT,
    "Booster_Doses_18PlusVax_Pct_UR_Equity" INT,
    "Booster_Doses_65PlusVax_Pct_UR_Equity" INT
);

CREATE UNIQUE INDEX "unique_idx" ON "county_view_state_data"(state, date);

CREATE UNIQUE INDEX "unique_idx_us_map" ON "us_map_data"(id, us_trend_maxdate);

CREATE UNIQUE INDEX "unique_idx_county_covid" ON "integrated_county_latest_external_data"(fips_code, "CCL_report_date");

CREATE UNIQUE INDEX "unique_idx_county_vax" ON "vaccination_county_condensed_data"("FIPS", "Date");
