{{
    config(
        enabled=True
    )
}}

{%- set source_model = "dbt.sat_customer_details" -%}
{%- set src_customer_pk = "customer_pk" -%}
{%- set src_customer_hashdiff = "customer_hashdiff" -%}
{%- set src_first_name = "first_name" -%}
{%- set src_last_name = "last_name" -%}
{%- set src_email = "email" -%}
{%- set src_effective_from = "effective_from" -%}
{%- set src_load_date = "load_date" -%}
{%- set src_record_source = "record_source" -%}


WITH vars (customer_key, search_date) AS (
   VALUES ('ec8956637a99787bd197eacd77acce5e', '2022-08-22 13:26:10')
)
SELECT 	
	ah.customer_pk, 
	ah.first_name , 
	ah.last_name , 
	ah.email , 
	ah.effective_from 
FROM 	
	dbt.all_history ah, vars v
WHERE 
	ah.customer_pk = v.customer_key
	AND to_timestamp(v.search_date, 'YYYY-MM_DD HH24:MI:SS')::timestamp without time zone >= effective_from
		AND to_timestamp(v.search_date, 'YYYY-MM_DD HH24:MI:SS')::timestamp without time zone < effective_to