/*
create or replace transient table INTERVIEW_DB.PLAYGROUND_Juan_Orellana.COVID_MODEL  as
(
*/
{{ config(materialized='table') }}



SELECT DISTINCT vaccine  
FROM {{ ref('VACCINES_RAW')}}  
 



