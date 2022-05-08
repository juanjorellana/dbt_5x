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
),

WEEKLY as (
SELECT  ISO_CODE, to_char(date,'yyyyMM') AS DATE_MONTH, YEAR(date)||WEEK(date) AS DATE_WEEK , 
AVG(daily_vaccinations_raw) as Vaccinated_weekly FROM COUNTRY_COVID 
group by ISO_CODE, YEAR(date)||WEEK(date), to_char(date,'yyyyMM') ) ,

QTY as (
    
Select ISO_CODE, MAX(REGEXP_COUNT(vaccines,',')+1) Vacc_QTY from COUNTRY_COVID
group by ISO_CODE 
)


SELECT B.*, A.Vaccinated_weekly,  C.Vacc_QTY  
FROM WEEKLY A JOIN COUNTRY_COVID B ON A.ISO_CODE = B.ISO_CODE AND A.DATE_WEEK = B.DATE_WEEK 
JOIN QTY C ON C.ISO_CODE = B.ISO_CODE
 
