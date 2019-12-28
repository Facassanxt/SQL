-- 12.Выберите день или дни недели (если их несколько) в которые ходит меньше всего
-- поездов.

CREATE TEMPORARY TABLE TEMP ( name VARCHAR(255) NOT NULL, count INT(255) NOT NULL);
INSERT INTO TEMP
SELECT `name`, COUNT(`id`) FROM `days_of_week`
JOIN `work_day` ON (`days_of_week`.`id` = `work_day`.`id_day`)  
GROUP BY `name`;
SELECT @maxim := MIN(count) FROM TEMP;
SELECT `name` FROM TEMP WHERE count = @maxim;
DROP TABLE TEMP;