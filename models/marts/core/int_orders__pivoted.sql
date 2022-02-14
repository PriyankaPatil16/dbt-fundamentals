{%set payment_methods = ['coupon','credit_card','gift_card','bank_transfer']%}
with 
paymentss as
 (select * from {{ref('stg_payments')}} ),

 pivoted as (
   select order_id,
          {%-for payment_method in payment_methods-%}
          sum(case when payment_method = '{{payment_method}}' then amount else 0 end) as {{payment_method}}_amount
          {%-if not loop.last-%}
          ,
          {% endif-%}
          {%-endfor-%}
  from paymentss
  where status = 'success'
  group by 1
 )
 select * from pivoted