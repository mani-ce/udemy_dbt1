{{ config(materialized='table') }}

select * from {{ source('snowflake_sample_data_tpch_sf1','customer') }}