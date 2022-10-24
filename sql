select customer_id
from customer 
inner join address 
on customer.address_id = address.address_id 
where district = 'Texas'

select first_name, last_name
from customer 
inner join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99

select first_name, last_name
from customer
where customer_id in (
select customer_id 
from payment 
group by customer_id 
having sum(amount) > 175
)

select customer_id
from customer 
full join address
on customer.address_id = address.address_id 
where city_id in (select city_id from city where city = 'Nepal')

select staff_id, count(staff_id)
from payment 
group by staff_id
having count(staff_id) = (select max(a) from (select staff_id, count(staff_id) as a from payment group by staff_id) as b)

select rating, count(rating)
from film 
group by rating

select customer_id, amount, count(amount)
from (
	select customer_id, amount
	from payment 
	group by 1, 2
	having amount > 6.99) a
group by 1,2
having count(amount) = 1


select count(amount)
from (select amount from payment group by 1 having amount = 0.00) as a
