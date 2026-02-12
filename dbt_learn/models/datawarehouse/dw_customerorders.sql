{{ config(materialized='incremental') }}

select * from {{ ref('stg_customerorders') }} s
where 1=1
{ % if is_incremental() % }
and not exists
(select 1 from {{this}} t
where s.c_name!=t.c_name
and s.o_orderdate>t.o_orderdate)
{ % endif % }