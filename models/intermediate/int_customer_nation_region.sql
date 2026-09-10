with customer as (
    select * from {{ ref('stg_customers') }}
),

nations as (
    select * from {{ ref('stg_nations') }}
),

regions as (
    select * from {{ ref('stg_regions') }}
)

select
    c.* exclude (comment) rename (name as customer_name),
    n.name as nation_name,
    r.name as region_name
from customer c

left join nations n
    on c.nation_id = n.nation_id

left join regions r
    on n.region = r.regionkey