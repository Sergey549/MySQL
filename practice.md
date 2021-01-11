
*Вывести всех пользователей, имя которых начинается с той же буквы, на которую и заканчивается(пример “Alexandra” - буква “а” и первая, и последняя)*

```
SELECT username 
FROM user_accounts ua 
WHERE LEFT(username, 1) = RIGHT(username, 1) 
```
Вывести пользователей и их покупки(в строку, через запятую), которые совершили больше 15 покупок(транзакций). 
Пример записи из результирующей выборки: 
Вася | 21 | молоко, капуста, простокваша, ботинки, презервативы, etc
```
SELECT CONCAT_WS ("|", username, COUNT(product_id ), GROUP_CONCAT(title) ) FROM transactions t 
JOIN user_accounts ua2 ON ua2.id = t.account_id
JOIN products p ON t.product_id = p.id 
GROUP BY username HAVING COUNT(product_id)>=15
```
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
Вывести логины пользователей, сумма чисел даты рождения которых(год+месяц+день) нечетна.
Пример: 2000-01-02, складываем числа: 2000+1+2, получаем 2003
```
SELECT username, birth_date, SUM(YEAR(birth_date)+ MONTH(birth_date ) + DAYOFMONTH(birth_date )) AS total_sum 
FROM user_accounts ua 
WHERE (SELECT MOD(SUM(YEAR(birth_date)+ MONTH(birth_date ) + DAYOFMONTH(birth_date )), 2) !=0 AS total_sum) 
GROUP BY id 
```
Вывести логины пользователей, у которых с даты рождения до даты первой покупки прошло больше 5000 дней
```
SELECT username, TO_DAYS(birth_date) AS birthday_days, MIN(TO_DAYS(transaction_date)) AS transaction_days, (MIN(TO_DAYS(transaction_date)) - TO_DAYS(birth_date)) AS raznitsa  
FROM user_accounts ua JOIN transactions t ON ua.id = t.account_id 
WHERE (SELECT MIN(TO_DAYS(transaction_date)) - TO_DAYS(birth_date) >= '5000') 
GROUP BY username 
```
Вывести логины пользователей, сумму и количество покупок, которые за последние 5 лет совершили не менее (>=) 3 покупок суммарной стоимостью более 1000
```
SELECT username, transaction_date, CURDATE(), COUNT(product_id), SUM(price_with_sale)
FROM user_accounts ua 
JOIN transactions t ON ua.id = t.account_id 
WHERE STR_TO_DATE(transaction_date, '%Y-%m-%d')  > (STR_TO_DATE(CURDATE(), '%Y-%m-%d') - INTERVAL 5 YEAR) 
GROUP BY username 
HAVING COUNT(product_id)>=3 AND SUM(price_with_sale)>= 1000
```
