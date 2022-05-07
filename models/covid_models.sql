with COUNTRY_COVID as 
( select
country,	iso_code,	date,	total_vaccinations,	people_vaccinated,	
people_fully_vaccinated,	daily_vaccinations_raw,	daily_vaccinations,	
total_vaccinations_per_hundred,	people_vaccinated_per_hundred,	
people_fully_vaccinated_per_hundred,	daily_vaccinations_per_million,	
vaccines,	source_name	source_website
from {{ source('fivetran_Db', 'COUNTRY_COVID_VACCINATIONS_JUAN_ORELLANA') }}
), 
MANUFACTURER as 
( select
location as country,	date,	vaccine,	total_vaccinations
from {{ source('fivetran_Db', 'COUNTRY_VACCINATIONS_BY_MANUFACTURER_JUAN_ORELLANA') }}
), 


final as (
    select * from MANUFACTURER full outer join COUNTRY_COVID using(country)
)

Select * FROM final
