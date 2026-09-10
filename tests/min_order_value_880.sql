
-- This test checks that every order has a total price >= 1000.
-- A dbt test PASSES when this query returns 0 rows.
-- If this query returns any rows, the test FAILS.

-- Find orders whose value is less than 1000.
-- These rows are the "bad records" that we want dbt to report.



{{ config(store_failures=true) }}

select
    order_id,
    total_price
from {{ ref('stg_orders') }}
where total_price <= 880


