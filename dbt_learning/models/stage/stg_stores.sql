with source as (

    select * from {{ ref('raw_store_locations') }}

),

cleaned as (

    select
        store_id,
        trim(store_name) as store_name,
        trim(city) as city,
        trim(country) as country,
        upper(trim(region)) as region,
        opened_date::date as opened_date
    from source

)

select * from cleaned