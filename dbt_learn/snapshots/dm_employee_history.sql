
{% snapshot emp_snapshot %}
  {{ config(
      target_database='dbt_db',
      target_schema='dbt_schema',
      tags=['emp_snapshot'],
      unique_key='employeeid',
      strategy='timestamp',
      updated_at='receiveddate',
      hard_deletes='invalidate'
  ) }}

with cte_emp as(
    select * from {{ ref('dwh_employee') }}
)
select * from cte_emp

{% endsnapshot %}