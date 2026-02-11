{{ config(materialized='view') }}

select * from {{ ref('my_fmodel') }} order by 1