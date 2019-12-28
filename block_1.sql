/*4. Описание расписания пригородных электропоездов одного направления.
Включает в себя: станции, график движения электропоездов, стоимости билетов.
Станции описываются: названием, тарифной зоной, порядковым номером на
направлении. График движения электропоездов описывается: указанием станции
начала маршрута, указанием станции, завершающей маршрут, списком станций,
на которых поезд не останавливается, временем прибытия на каждую станцию, на
которой поезд останавливается, списком дней недели, по которым данный
маршрут работает. Стоимости билетов описываются: количеством пересекаемых
зон и, непосредственно, самой стоимостью.
a. Поезда ходят в обе стороны, но направление не содержит ответвлений (одна
прямая ветка).
*/

CREATE TABLE `days_of_week` (
 `id` int(20) NOT NULL AUTO_INCREMENT,
 `name` char(2) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
CREATE TABLE `price_tickets` (
 `number_of_zone` int(20) NOT NULL,
 `price` float NOT NULL,
 PRIMARY KEY (`number_of_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `station` (
 `id` int(20) NOT NULL AUTO_INCREMENT,
 `name` varchar(255) NOT NULL,
 `number` int(255) NOT NULL,
 `tariff_zone` int(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `tariff_zone` (`tariff_zone`),
 CONSTRAINT `station_ibfk_1` FOREIGN KEY (`tariff_zone`) REFERENCES `price_tickets` (`number_of_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
CREATE TABLE `trains` (
 `id` int(20) NOT NULL AUTO_INCREMENT,
 `id_b_station` int(20) NOT NULL,
 `id_e_station` int(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `id_b_station` (`id_b_station`),
 KEY `id_e_station` (`id_e_station`),
 CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`id_b_station`) REFERENCES `station` (`id`),
 CONSTRAINT `trains_ibfk_2` FOREIGN KEY (`id_e_station`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `stop` (
 `id_station` int(20) NOT NULL,
 `id_train` int(20) NOT NULL,
 `time_arrive` datetime DEFAULT NULL,
 KEY `id_station` (`id_station`),
 KEY `id_train` (`id_train`),
 CONSTRAINT `stop_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `station` (`id`),
 CONSTRAINT `stop_ibfk_2` FOREIGN KEY (`id_train`) REFERENCES `trains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `work_day` (
 `id_day` int(20) NOT NULL,
 `id_train` int(20) NOT NULL,
 KEY `id_day` (`id_day`),
 KEY `id_train` (`id_train`),
 CONSTRAINT `work_day_ibfk_1` FOREIGN KEY (`id_day`) REFERENCES `days_of_week` (`id`),
 CONSTRAINT `work_day_ibfk_2` FOREIGN KEY (`id_train`) REFERENCES `trains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `days_of_week` (`id`, `name`) VALUES (NULL, 'пн'), (NULL, 'вт'), (NULL, 'ср'), (NULL, 'чт'), (NULL, 'пт'), (NULL, 'сб'), (NULL, 'вс');
INSERT INTO `price_tickets` (`number_of_zone`, `price`) VALUES ('0', '0'), ('1', '36'), ('2', '36'), ('3', '69'), ('4', '92'), ('5', '115'), ('6', '138');
INSERT INTO `station` (`id`, `name`, `number`, `tariff_zone`) VALUES (NULL, 'Москва (Курский вокзал)', '8', '0'), (NULL, 'Москва Товарная Курская', '8', '1'), (NULL, 'Калитники', '8', '1'), (NULL, 'Новохохловская', '8', '2'), (NULL, 'Текстильщики', '8', '2'), (NULL, 'Кубанская', '8', '2'), (NULL, 'Депо (Курское направление)', '8', '2'), (NULL, 'Перерва', '8', '2'), (NULL, 'Москворечье', '8', '3'), (NULL, 'Царицыно', '8', '3'), (NULL, 'Покровское', '8', '3'), (NULL, 'Красный Строитель', '8', '4');
INSERT INTO `trains` (`id`, `id_b_station`, `id_e_station`) VALUES (NULL, '12', '1'), (NULL, '1', '12');
INSERT INTO `stop` (`id_station`, `id_train`, `time_arrive`) VALUES
(1, 1, '2019-12-27 23:38:00'),
(1, 2, '2019-12-27 10:40:00'),
(2, 1, '2019-12-27 23:32:00'),
(3, 1, '2019-12-27 23:29:00'),
(4, 1, '2019-12-27 23:27:00'),
(5, 1, '2019-12-27 23:24:00'),
(6, 1, '2019-12-27 23:21:00'),
(7, 1, '2019-12-27 23:18:00'),
(8, 1, '2019-12-27 23:16:00'),
(9, 1, '2019-12-27 23:11:00'),
(10, 1, '2019-12-27 23:07:00'),
(10, 2, '2019-12-27 11:13:00'),
(11, 1, '2019-12-27 23:03:00'),
(12, 1, '2019-12-27 23:00:00');
INSERT INTO `work_day` (`id_day`, `id_train`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(7, 2);