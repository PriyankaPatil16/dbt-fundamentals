select status,sum(amount) as totol_revenue from {{ ref("stg_payments")}}
group by status
having status = 'success' ;

with payments as (
select * from {{ ref('stg_payments') }}
),

aggregated as (
select
sum(amount) as total_revenue
from payments
where status = 'success'
)

select * from aggregated