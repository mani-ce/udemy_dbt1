{{ config(materialized='table',
transient=True,
tags=['emp_snapshot'],
query_tag='dbt_employee'
) }}

with cte_emp as(
    select * from {{ source('db_mschema_m','employee') }}
)
select * from cte_emp