{{
    config(
        enabled=True
    )
}}

{%- set source_model = "dbt.sat_customer_details" -%}
{%- set source_model = "dbt.hub_customer" -%}
{%- set src_customer_pk = "customer_pk" -%}
{%- set src_first_name = "first_name" -%}
{%- set src_last_name = "last_name" -%}
{%- set src_email = "email" -%}
{%- set src_effective_from = "effective_from" -%}

SELECT 
		hc.customer_pk , 
    	scd.first_name , 
    	scd.last_name , 
    	scd.email , 
    	scd.effective_from , 
    	COALESCE(lead(effective_from) OVER (PARTITION BY hc.customer_pk ORDER BY scd.effective_from), '9999-12-31') 
			AS effective_to
FROM dbt.hub_customer hc 
		LEFT JOIN dbt.sat_customer_details scd ON scd.customer_pk = hc.customer_pk;