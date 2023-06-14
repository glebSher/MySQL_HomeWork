# создание базы данных, если она не существует
create database if not exists seminar_1;

# подключение к базе данных 
use seminar_1;

# создание таблицы
DROP TABLE if EXISTS phones;
CREATE TABLE phones
(
	id INT PRIMARY KEY auto_increment,
    productName VARCHAR(45),
    manufacturer VARCHAR(45),
    productCount INT,
    price INT
);

# наполнение таблицы данными
INSERT phones (productName, manufacturer, productCount, price)
VALUES
	("Mate 50 Pro", "Huawei", 1, 80000),
    ("Galaxy A54", "Samsung", 2, 34000),
    ("Galaxy A52s", "Samsung", 3, 29000),
    ("X8a 6/128", "Honor", 2, 18000),
    ("iPhone 12", "Apple", 1, 67000),
    ("iPhone 14", "Apple", 1, 121000),
    ("iPhone 13", "Apple", 2, 72000),
    ("Poco C40", "Xiaomi", 3, 6000);
    
# вывод названия, производителя и цены для товаров, количество которых превышает 2
SELECT productName, manufacturer, price
FROM phones
WHERE productCount > 2;

# выборка отдельных значений в таблице исключая какой-то признак
SELECT * FROM phones
WHERE manufacturer = "Samsung";