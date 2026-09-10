
-- This test checks that every order has a total price >= 1000.
-- A dbt test PASSES when this query returns 0 rows.
-- If this query returns any rows, the test FAILS.

-- Find orders whose value is less than 1000.
-- These rows are the "bad records" that we want dbt to report.

{% test order_values(model, column_name, min_val) %}

-- {{ config(store_failures=true) }}

select
*
from {{ model }}
where {{column_name}} <= {{min_val}}

{% endtest %}