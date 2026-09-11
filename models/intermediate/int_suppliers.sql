{{ config(materialized='incremental', unique_key='supplier_id' ) }}


with supplier as (

    select  supplier_id, n.sname supplier_name,* exclude (supplier_id,supplier_name) 
    from {{ ref('stg_suppliers') }} s
    join {{ref('supplier_names')}} n on s.supplier_id = n.skey

    {% if is_incremental() %}

        where updated_time > (
            select max(updated_time)
            from {{ this }}
        )

    {% endif %}

)

select * from supplier



 