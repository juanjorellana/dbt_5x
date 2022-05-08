{{ config(materialized='table') }}


with COUNTRY_COVID as 
(
     select
country,	iso_code,	date,	total_vaccinations,	people_vaccinated,	
people_fully_vaccinated,	daily_vaccinations_raw,	daily_vaccinations,	
total_vaccinations_per_hundred,	people_vaccinated_per_hundred,	
people_fully_vaccinated_per_hundred,	daily_vaccinations_per_million,	
vaccines,	source_name,	source_website , YEAR(date)||WEEK(date) AS DATE_WEEK
from {{ source('fivetran_Db', 'COUNTRY_COVID_VACCINATIONS_JUAN_ORELLANA') }}
)

select to_char(date,'YYYY/MM') as YearMonth, iso_code, SUM(daily_vaccinations) monthly_vaccination,
sum(daily_vaccinations_per_million) monthly_vaccinations_per_million, MAX(people_fully_vaccinated_per_hundred) Fully_Vaccinated 
FROM COUNTRY_COVID 
Group by to_char(date,'YYYY/MM'), iso_code
ORDER BY 1, 2

