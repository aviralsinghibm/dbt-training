
with source as (

    select * 
    from {{ ref('stg_lineitems') }}

),

changed as (

    select

        -- keys
        order_id,
        part_id,
        supplier_id,

        -- descriptions
        line_number,
        comment,
        ship_mode,
        ship_instructions,

        -- numbers
        quantity,
        extended_price as extended_price_usd,
        extended_price * 0.86 as extended_price_eur,
        discount_percentage,
        tax_rate,

        -- status
        status_code,
        return_flag,

        -- dates
        ship_date,
        commit_date,
        receipt_date

    from source

)

select * 
from changed
