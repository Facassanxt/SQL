-- 11.Выберите станцию или станции (названия) на которых останавливается больше
-- всего поездов.

CREATE TEMPORARY TABLE TEMP ( name VARCHAR(255) NOT NULL, count INT(255) NOT NULL);
INSERT INTO TEMP
SELECT `name`,COUNT(`name`) as count FROM `stop`
JOIN `station` ON (`stop`.`id_station` = `station`.`id`)
GROUP BY `name`;
SELECT @maxim := MAX(count) FROM TEMP;
SELECT * FROM TEMP WHERE count = @maxim;
DROP TABLE TEMP;