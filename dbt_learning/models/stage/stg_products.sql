with source as (

    select * from {{ ref('raw_products') }}

),

cleaned as (

    select
        product_id,
        trim(product_name) as product_name,
        trim(category) as category,
        trim(subcategory) as subcategory,
        cost_price::numeric(12,2) as cost_price,
        list_price::numeric(12,2) as list_price,
        trim(currency) as currency,
        launch_date::date as launch_date,
        is_active::boolean as is_active
    from source

)

select * from cleaned