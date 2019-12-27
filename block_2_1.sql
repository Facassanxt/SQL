-- 10.Выберите все поезда (название станций начала и конца маршрута) на которых от
-- станции «Царицыно» можно доехать до станции «Москва-Курская».

SELECT `id_train`,`name`,`time_arrive` FROM `stop`
JOIN `station` ON (`stop`.`id_station` = `station`.`id`) 
JOIN `trains` ON(`stop`.`id_train` = `trains`.`id`)
WHERE (`station`.`id`=10 or `station`.`id`=1) AND `trains`.`id_b_station` > 10
ORDER BY `stop`.`time_arrive` ASC