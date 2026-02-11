{{ config(materialized='table') }}
with cte as(
select 1 as num
union
select 3
union
select 2
)
select * from cte