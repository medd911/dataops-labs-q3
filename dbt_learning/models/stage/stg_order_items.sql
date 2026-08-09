with source as (

    select * from {{ ref('raw_order_items') }}

),

cleaned as (

    select
        order_item_id,
        order_id,
        product_id,
        quantity::integer as quantity,
        unit_price::numeric(12,2) as unit_price,
        coalesce(discount_pct, 0)::numeric(12,2) as discount_pct
    from source

)

select * from cleaned