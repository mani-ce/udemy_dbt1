{{ config(materialized='incremental') }}

select * from {{ source('db_mschema_m','time_dim') }} s
where 1=1
{# --comment symbol in dbt
{% if is_incremental() %}
    and not exists
    (select 'exist' as val from {{this}} t 
    where t.t_time!=s.t_time)
{% endif %}
#}
{% if is_incremental() %}
    and not exists
    (select 'exist' as val from {{this}} t 
    where t.t_time=s.t_time)
{% endif %}