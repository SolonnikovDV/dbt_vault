{{
    config(
        enabled=True
    )
}}

{%- set source_model = "dbt.sat_order_details" -%}
{%- set src_week = "ORDER_WEEK" -%}
{%- set src_status = "STATUS" -%}
{%- set src_count = "COUNT" -%}


SELECT date_trunc('week', order_date::date) AS order_week, status, COUNT(*) as count_
FROM dbt.sat_order_details
group by order_week, status
order by order_week 