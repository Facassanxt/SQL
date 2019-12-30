-- 10.Выберите все поезда (название станций начала и конца маршрута) на которых от
-- станции «Царицыно» можно доехать до станции «Москва-Курская».

SELECT `s1`.`id_train` FROM `stop` AS `s1`
JOIN `stop` AS `s2` ON (`s1`.`id_train` = `s2`.`id_train`) 
WHERE (`s1`.`id_station`=10 AND `s2`.`id_station`=1 AND `s1`.`time_arrive` < `s2`.`time_arrive`)