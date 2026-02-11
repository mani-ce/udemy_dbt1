{{ config(materialized='table',
alias='stg_my_first_model'
) }}

with cte as(
    select 1 as id
    union all
    select 1 
    union all
    select null
    )
    select *,{{ var('my_first_variable') }} as val from cte
    where id is not null
