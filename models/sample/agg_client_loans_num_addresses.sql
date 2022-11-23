{{config(materialized="table",tags=["demo"])}}

with cte_do_not_call (client_id, do_not_call_loans_count)
as (
    select client_id, count(*) as do_not_call_loans_count
    from {{source('progresso_production', 'loans')}}
    where do_not_call == 1
    group by client_id
)

select
    c.client_id,
    c.do_not_call_loans_count,
    t.number_of_addresses

from cte_do_not_call as c
left join {{ref('agg_client_num_addresses')}} as t on c.client_id = t.client_id
where c.do_not_call_loans_count > 1
