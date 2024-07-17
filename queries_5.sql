--Написать запрос, который:
--1. Выведет актуальное состояние товаров на 2020-06-01
--2. Товары, купленные по цене больше или равно чем 3
--3. Сумму покупок клиента 1
--4. Сумма всех покупок до 2020-05-01 включительно
--5. Сумму всех заказов и среднее цена заказа поквартально


--1
select 
	i.name, o.order_date
from 
	orders3 o
left join 
	items2 i on i.item_id = o.item_id and i.update_date = o.order_date
where 
	o.order_date = '2020-06-01'

--2
select 
	i.name, i.price
from 
	orders3 o
left join 
	items2 i on i.item_id = o.item_id and i.update_date = o.order_date 
where 
	i.price >= 3

--3
select 
	sum(i.price)
from 
	orders3 o
left join 
	items2 i on i.item_id = o.item_id and i.update_date = o.order_date
where 
	o.user_id = 1

--4 
select 
	sum(i.price)
from 
	orders3 o
left join 
	items2 i on i.item_id = o.item_id and i.update_date = o.order_date
where 
	o.order_date <= '2020-05-01'


--5
select 
	date_trunc('quarter', o.order_date) as quarter,
	sum(i.price) as total_spent,
	avg(i.price) as avg_order_price
from 
	orders3 o
left join 
	items2 i on i.item_id = o.item_id and i.update_date = o.order_date
group by 
	quarter 
order by 
	quarter  

