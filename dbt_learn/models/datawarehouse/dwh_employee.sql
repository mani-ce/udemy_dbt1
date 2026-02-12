{{ config(materialized='incremental',
tags=['emp_snapshot'],
query_tag='dbt_employee') }}

with cte_emp as(
    select * from {{ ref('stg_employee') }} 
)
select * from cte_emp s
where 1=1
{% if is_incremental() %}
 {#   and s.receiveddate>(select nvl(max(receiveddate),'1900-01-01') from {{this}} t ) #}
   and not exists (
        select 'record_there' from {{this}} t
        where t.employeeid=s.employeeid
        and t.receiveddate=s.receiveddate
    )
{% endif %}