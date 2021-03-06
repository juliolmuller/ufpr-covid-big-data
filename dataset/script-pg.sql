
DROP DATABASE IF EXISTS <DB_PG_DATABASE>;

CREATE DATABASE <DB_PG_DATABASE> WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'English_United States.1252'
  LC_CTYPE = 'English_United States.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS <DB_PG_TABLE>;

CREATE TABLE <DB_PG_TABLE>(
  city VARCHAR,
  city_ibge_code INTEGER,
  date DATE,
  epidemiological_week INTEGER,
  estimated_population INTEGER,
  estimated_population_2019 INTEGER,
  is_last BOOLEAN,
  is_repeated BOOLEAN,
  last_available_confirmed INTEGER,
  last_available_confirmed_per_100k_inhabitants DECIMAL,
  last_available_date DATE,
  last_available_death_rate DECIMAL,
  last_available_deaths INTEGER,
  order_for_place INTEGER,
  place_type VARCHAR,
  state CHAR(2),
  new_confirmed INTEGER,
  new_deaths INTEGER
);

COPY <DB_PG_TABLE>(
  city,
  city_ibge_code,
  date,
  epidemiological_week,
  estimated_population,
  estimated_population_2019,
  is_last,
  is_repeated,
  last_available_confirmed,
  last_available_confirmed_per_100k_inhabitants,
  last_available_date,
  last_available_death_rate,
  last_available_deaths,
  order_for_place,
  place_type,
  state,
  new_confirmed,
  new_deaths
) FROM '<absolute path to DATASET_FILE>'
  DELIMITER ','
  CSV HEADER;

-- COPY (
--   SELECT
--     ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(tbl)))
--   FROM
--     (SELECT * FROM covid_cases)
--   AAS tbl
-- ) TO 'C:\path\to\project\dataset\casos-full.json';
