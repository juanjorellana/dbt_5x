/*
create or replace transient table INTERVIEW_DB.PLAYGROUND_Juan_Orellana.COVID_MODEL  as
(
*/
{{ config(materialized='table') }}


WITH 
MANUFACTURER as 
( select
location as country,	date as MANU_DATE,	vaccine,	total_vaccinations as MANU_Total_vaccinations
from {{ source('fivetran_Db', 'COUNTRY_VACCINATIONS_BY_MANUFACTURER_JUAN_ORELLANA') }}
), 


 MANUFACTURERS as  ( 
 SELECT DISTINCT vaccine from MANUFACTURER ) 

Select * FROM MANUFACTURERS



