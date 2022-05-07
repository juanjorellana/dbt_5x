/*
create or replace transient table INTERVIEW_DB.PLAYGROUND_Juan_Orellana.COVID_MODEL  as
(
*/
{{ config(materialized='table') }}


with COUNTRY_COVID as 
(
     select
country,	iso_code,	date,	total_vaccinations,	people_vaccinated,	
people_fully_vaccinated,	daily_vaccinations_raw,	daily_vaccinations,	
total_vaccinations_per_hundred,	people_vaccinated_per_hundred,	
people_fully_vaccinated_per_hundred,	daily_vaccinations_per_million,	
vaccines,	source_name,	source_website 
from {{ source('fivetran_Db', 'COUNTRY_COVID_VACCINATIONS_JUAN_ORELLANA') }}
)



--COUNTRY as ( SELECT DISTINCT iso_code, country  from COUNTRY_COVID),


Select DISTINCT source_name, source_website FROM COUNTRY_COVID


