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


SELECT *, to_char(date,'yyyyMM') AS DATE_MONTH FROM COUNTRY_COVID 