{{
    config(
        materialized="table",
        schema="default"
    )
}}
select
    client_id,
    postal_code,
    count(*) as number_of_addresses

from
    {{ ref('ref_progresso_production_addresses') }}

group by
    client_id,
    postal_code

having
    number_of_addresses > 1
