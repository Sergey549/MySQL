11.
Найдите среднюю скорость ПК
```
select AVG(speed) 
from product join pc on product.model = pc.model
```
13.
Найдите среднюю скорость ПК, выпущенных производителем A
```
select AVG(speed) 
from product 
join pc on product.model = pc.model 
where product.maker = 'A'
```
14.
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий
```
select ships.class, name, country 
from ships 
join classes on ships.class = classes.class 
where classes.numguns >= 10
```
15.
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
```
select hd 
from pc 
group by hd 
having count(hd)>=2
```
18.
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
```
select maker, min(price) 
from product join printer on product.model=printer.model
group by maker 
having min(price)=(select min(price) from printer where color='y')
```

20.
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК
```
select maker, count(model) 
from product 
where type= 'pc' 
group by maker 
having count(model)>=3
```
Задание 5.1
Вывести всех пользователей, имя которых начинается с той же буквы, на которую и заканчивается(пример “Alexandra” - буква “а” и первая, и последняя);
```
SELECT username 
FROM user_accounts ua 
WHERE LEFT(username, 1) = RIGHT(username, 1) 
```
Задание 5.2
Вывести пользователей и их покупки(в строку, через запятую), которые совершили больше 15 покупок(транзакций). 
Пример записи из результирующей выборки: 
Вася | 21 | молоко, капуста, простокваша, ботинки, презервативы, etc
```
SELECT CONCAT_WS ("|", username, COUNT(product_id ), GROUP_CONCAT(title) ) FROM transactions t 
JOIN user_accounts ua2 ON ua2.id = t.account_id
JOIN products p ON t.product_id = p.id 
GROUP BY username HAVING COUNT(product_id)>=15
```
Задание 5.3*   
Найти всех пользователей, первая буква имени которых не встречается в названии стран, товары которых он покупал.
```
SELECT username, LOWER(LEFT(username , 1)) as first_user_name_letter /*Первая буква имени юзера*/, LOWER (replace(countryName, ' ', '' )) as lower_country_name_with_no_letterSpace /*Название страны без пробелов*/
FROM 
(SELECT username, countryName FROM user_accounts ua2 /*Подзапрос для выбора юзеров и продуктов, которые он покупал в компаниях и странах для этих компаний*/
JOIN transactions t ON ua2.id = t.account_id
JOIN products p ON p.id = t.product_id
JOIN companies c ON p.seller_id = c.id 
JOIN addresses a ON c.id = a.company_id 
JOIN countries c2 ON c2.id = a.country_id
GROUP BY username, countryName) as users_with_transactions 
WHERE INSTR(LOWER (replace(countryName, ' ', '' )) , LOWER(LEFT(username , 1)))=0 /*Условие, где первая буква имени юзеров не встречается в названии стран*/

```
Задание 6.1
Вывести логины пользователей, сумма чисел даты рождения которых(год+месяц+день) нечетна.
Пример: 2000-01-02, складываем числа: 2000+1+2, получаем 2003
```
SELECT username, birth_date, SUM(YEAR(birth_date)+ MONTH(birth_date ) + DAYOFMONTH(birth_date )) AS total_sum 
FROM user_accounts ua 
WHERE (SELECT MOD(SUM(YEAR(birth_date)+ MONTH(birth_date ) + DAYOFMONTH(birth_date )), 2) !=0 AS total_sum) 
GROUP BY id 
```
Задание 6.2
Вывести логины пользователей, у которых с даты рождения до даты первой покупки прошло больше 5000 дней
```
SELECT username, TO_DAYS(birth_date) AS birthday_days, MIN(TO_DAYS(transaction_date)) AS transaction_days, (MIN(TO_DAYS(transaction_date)) - TO_DAYS(birth_date)) AS raznitsa  
FROM user_accounts ua JOIN transactions t ON ua.id = t.account_id 
WHERE (SELECT MIN(TO_DAYS(transaction_date)) - TO_DAYS(birth_date) >= '5000') 
GROUP BY username 
```
Задание 6.3 
Вывести логины пользователей, сумму и количество покупок, которые за последние 5 лет совершили не менее (>=) 3 покупок суммарной стоимостью более 1000
```
SELECT username, transaction_date, CURDATE(), COUNT(product_id), SUM(price_with_sale)
FROM user_accounts ua 
JOIN transactions t ON ua.id = t.account_id 
WHERE STR_TO_DATE(transaction_date, '%Y-%m-%d')  > (STR_TO_DATE(CURDATE(), '%Y-%m-%d') - INTERVAL 5 YEAR) 
GROUP BY username 
HAVING COUNT(product_id)>=3 AND SUM(price_with_sale)>= 1000
```
Задание 7.1 (-- 52)

Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем, имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн
```
SELECT name
FROM ships s JOIN classes c ON s.class = c.class
WHERE 
CASE 
WHEN (bore < 19 or bore is NULL) AND (numGuns >=9 or numGuns is NULL) AND country = 'Japan' AND (displacement <= 65000 or displacement is NULL) AND type = 'bb' THEN 'true' 
END = 'true'
```
Задание 7.1 (-- 64)

Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот. Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день
```
select inc.point, inc.date, 'inc' as operation, sum(inc.inc)  
from income inc 
left join outcome out on inc.point=out.point and inc.date=out.date 
where out.date is null
group by inc.point, inc.date
union
select out.point, out.date, 'out' as operation, sum(out.out) 
from income inc 
right join outcome out on inc.point=out.point and inc.date=out.date 
where inc.date is null
group by out.point, out.date
```
Задание 8 (Процедуры и функции)

CREATE DEFINER=`root`@`localhost`PROCEDURE `sandboxsqlterentyev`.`cena_so_skidkoi`(price float(10, 2),sale_percent float(2, 2))
BEGIN
	select price-(price*sale_percent) as rezult;
END

---------------------------------------

CREATE PROCEDURE `sandboxsqlterentyev`.`product_list`(username varchar(50))
BEGIN
	select username, title from transactions t 
	join user_accounts ua on t.account_id = ua.id 
	join products p on t.product_id = p.id 
	where ua.username=username;
END

---------------------------------------




CREATE FUNCTION `sandboxsqlterentyev`.`product_count`(username varchar(50))
RETURNS INT
BEGIN
	declare cnt int;
set cnt = (select COUNT(ua.username )  
	from transactions t 
	join user_accounts ua on t.account_id = ua.id 
	join products p on t.product_id = p.id 
	where ua.username=username);
RETURN cnt;
END

select username, COUNT(title) from transactions t 
join user_accounts ua on t.account_id = ua.id 
join products p on t.product_id = p.id 
group BY username HAVING COUNT(title) > product_count('John');

---------------------------------------

CREATE FUNCTION `sandboxsqlterentyev`.`user_status`(username varchar(50))
RETURNS varchar(50)

BEGIN

declare cnt int;
declare status varchar(50);

set cnt = (select COUNT(ua.username )  
	from transactions t 
	join user_accounts ua on t.account_id = ua.id 
	join products p on t.product_id = p.id 
	where ua.username=username);

case 
when cnt < 10 then set status = 'Freshman';
when  cnt < 15 then set status = 'Active';
else set status = 'VIP';
end case;
return status;
END

select user_status(username),count(user_status(username)) from user_accounts ua group by user_status(username)


---------------------------------------

SQL инструмент тестировщиков: 

Получить ID пользователя , который за один заказ принес нам больше всего денег. Не забыть учесть скидки.

SELECT  u.id, name,  ROUND(sum(price*(1-discount)), 2) AS max_price_with_disc
FROM Users u JOIN Orders o ON u.id = o.user_id 
GROUP BY u.id, name HAVING max_price_with_disc >= ALL (SELECT ROUND(sum(price*(1-discount)), 2) AS max_price_with_disc  
FROM Users u join Orders o on u.id = o.user_id 
GROUP BY u.id, name)


Получить пользователей, которые не сделали ни одно о заказа.

SELECT u.id, u.name, o.id FROM Users u 
left join Orders o on u.id = o.user_id 
WHERE o.id IS NULL  
GROUP BY u.id, u.name, o.id 


Примеры из вебинара: 

Посчитать количество котов каждой породы в каждом магазине

Select Shops.id, Shops.name, Breeds.name, count(*) as amount
From Cats, Shops, Breeds
Where Cats.shop_id = Shops.id AND Cats.breed_id = Breeds.id
Group by Shop.id, Shops.name, Breeds.name
Order by amount DESC


