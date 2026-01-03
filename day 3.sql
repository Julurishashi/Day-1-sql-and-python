-- create table customer_orders3 (
-- order_id integer,
-- customer_id integer,
-- order_date date,
-- order_amount integer
-- );

-- insert into customer_orders3 values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
-- ,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
-- ,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);

-- select co.* , fo.first_date from customer_orders3 co inner join first_order fo on co.customer_id=fo.customer_id;

with first_order as ( select customer_id , min(order_date) as first_date from customer_orders3 group by customer_id)  


-- visit_flag as (

select co.order_date ,
 sum(case when co.order_date=fo.first_date then 1 else 0  end) as first_visit_flag  , 
 sum( case when co.order_date!=fo.first_date then 1 else 0 end ) as repeat_visit_flag  
from customer_orders3 co inner join first_order fo on co.customer_id=fo.customer_id  group by co.order_date ;

-- select order_date,sum(first_visit_flag) as num_of_new_customers , sum(repeat_visit_flag) as repeated_customers from visit_flag group by order_date;
