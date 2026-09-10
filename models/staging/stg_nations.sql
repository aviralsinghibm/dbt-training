with nations as (
    select 
    n_nationkey  nation_id,
    n_name name,
    n_regionkey region,
    n_comment comment
    from {{ source('src','nations')}}
)

select * from nations