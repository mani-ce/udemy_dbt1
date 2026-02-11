{{ config(materialized='table')}}

select o_custkey,o_orderdate,sum(o_totalprice) over(partition by o_custkey order by o_orderdate asc) cum_total
from {{ source('snowflake_sample_data_tpch_sf1','orders') }}