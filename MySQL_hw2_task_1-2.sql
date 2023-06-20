use seminars;
/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/
DROP TABLE IF EXISTS sales; 

CREATE TABLE sales 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_data DATE,
	count_product INT
);

INSERT INTO sales (order_data, count_product)
VALUE 
	('2023-01-01', 350),
	('2023-02-02', 70),
	('2023-03-03', 105),
	('2023-04-04', 220),
	('2023-05-05', 550),
	('2023-06-06', 20);
    
SELECT id,
CASE
	WHEN count_product > 300
		THEN 'Большой заказ'
	WHEN count_product < 100
		THEN 'Маленький заказ'
	ELSE 'Средний заказ'
END AS result
FROM sales;
