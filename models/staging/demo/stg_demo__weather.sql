with 

source as (

    select * from {{ source('demo', 'weather') }}

),

renamed as (

    select

    from source

)

select * from renamed