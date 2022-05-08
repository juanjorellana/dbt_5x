
{{ config(materialized='table') }}

with VACCINES_RATES as ( 
SELECT * 
FROM {{ ref('VACCINES_RAW')}} ) 


SELECT TO_CHAR(MANU_DATE, 'YYYYMM') as VAC_MONTH , vaccine, 
COUNT( DISTINCT COUNTRY) qty_country, SUM(manu_total_vaccinations) qty_vaccinations
from VACCINES_RATES
group by vaccine, TO_CHAR(MANU_DATE, 'YYYYMM')
order by 1 desc, 2 