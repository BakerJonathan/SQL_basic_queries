--Week 5 - Monday Questions
-- to see what a table looks like, just gonna switch the from as needed
select * from customer

--1. How many actors are there with the last name ‘Wahlberg’?
select first_name,last_name  from actor where last_name ='Wahlberg'; --There's 2
select count(last_name) from actor where last_name='Wahlberg'; -- counts 2, good


--2. How many payments were made between $3.99 and $5.99?
select * from payment where amount>-6 order by amount asc 
-- These two are basically double checking, there's nothing from -6 to 6
select payment_id, payment from payment where amount>=3.99 

select count(amount) from payment where amount>=3.99 and amount <=5.99 
--0



--3. What film does the store have the most of? (search in inventory)
select (count( distinct  film_id)) --958 different films, but that's not quite what we're looking for
from inventory

select film_id , count(film_id)
from inventory  
group by film_id
order by count(film_id) desc 
--that's a 72 way tie, starting with crossroad casualties

--4. How many customers have the last name ‘William’?
select count(last_name) from customer where last_name='William'; --same as first largely
--0 last named William
select last_name from customer where last_name like'W%'; -- double check, didn't like = instead of like here
-- while there's no William, there is a Williams last name


--5. What store employee (get the id) sold the most rentals?
select staff_id , count(staff_id)
from payment  
group by staff_id
order by count(staff_id) desc
--Jon Stephens by a small amount
-- like question 3


--6. How many different district names are there?
select count( distinct district)
from address 
--378

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id  , count(film_id)
from film_actor 
group by film_id
order by count(film_id) desc
--id 508, Lambs cincinatti
--like q 3 and 5

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name)  from customer  where last_name like'%es' and store_id =1; --says 13
select last_name, store_id  from customer  where last_name like'%es'; --double check, seems right



--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Starting off with the structure used in 3,5,7
select amount , count(amount)
from payment
where customer_id >=380 and customer_id <= 430 --add where clause for ids
group by amount
having count(amount)>250 --Clause to narrow to those that fit the bill, like where but for groups
order by count desc --3 found

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--similar structure to 3,5,7, kinda 9, to start, seems that's all we'll need
select rating  , count(rating)
from film f  
group by rating 
order by count(rating) desc
--there are 5 ratings - pg-13 nc-17 r pg and g 
--pg-13 has the most at 223