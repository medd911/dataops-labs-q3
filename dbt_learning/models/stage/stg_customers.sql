with source as (

    select * from {{ ref('raw_customers') }}

),

cleaned as (

    select
        customer_id,
        initcap(trim(first_name)) as first_name,
        initcap(trim(last_name)) as last_name,
        lower(trim(email)) as email,
        trim(phone) as phone,
        signup_date::date as signup_date,
        trim(country) as country,
        trim(city) as city
    from source

)

select * from cleaned