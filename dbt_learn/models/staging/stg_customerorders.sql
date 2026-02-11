{{ config(materialized='table',
tag='sf_customer') }}

select c.c_name,c.c_nationkey,c.c_mktsegment,o.o_totalprice,o.o_orderdate,o.o_orderpriority
  from {{ source('snowflake_sample_data_tpch_sf1','customer') }} c
  left join {{ source('snowflake_sample_data_tpch_sf1','orders') }} o
  on c.c_custkey=o.o_custkey