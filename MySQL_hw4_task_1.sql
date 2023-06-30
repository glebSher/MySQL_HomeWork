USE seminars;

DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (20),
    PRIMARY KEY (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");
	
DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (20),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
# 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT
	c.`name`, 
	s.`shopname`
FROM `cats` c
INNER JOIN `shops` s
ON c.shops_id = s.id;

# 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT
	s.`shopname`,
    c.`name`
FROM (SELECT `name`, shops_id FROM `cats` WHERE `name` = 'Murzik') c, `shops` s
WHERE s.id = c.shops_id;

# 3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT
	s.*,
    c.*
FROM `shops` s
LEFT JOIN (SELECT `name`, shops_id FROM `cats` WHERE `name` = 'Murzik' OR `name` = 'Zuza') c
ON c.shops_id = s.id
WHERE c.shops_id IS NULL;