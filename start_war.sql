-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `starship_category`;
CREATE TABLE `starship_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Deactive',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `starship_category` (`id`, `name`, `status`, `created_date`) VALUES
(1,	'Corvette',	1,	'2021-06-15 18:41:53'),
(2,	'Frigate',	1,	'2021-06-15 18:41:53'),
(3,	'Rebel Blockade',	1,	'2021-06-15 18:41:53'),
(4,	'Ghost ',	1,	'2021-06-15 18:41:53');

DROP TABLE IF EXISTS `start_war_ship`;
CREATE TABLE `start_war_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `crew_size` varchar(255) DEFAULT NULL,
  `cost` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>Active, 0=>Deactive',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `start_war_ship` (`id`, `category_id`, `name`, `length`, `crew_size`, `cost`, `status`, `created_date`) VALUES
(1,	1,	'Millennium Falcon',	'10x50',	'5',	'50000',	1,	'2021-06-15 18:42:31'),
(2,	1,	'x-wing',	'20x50',	'10',	'100000',	1,	'2021-06-15 18:42:31'),
(3,	2,	'TIE Fighter',	'50x80',	'15',	'540000',	1,	'2021-06-15 18:42:31'),
(4,	2,	'Super Star Destroyer',	'50x80',	'15',	'540000',	1,	'2021-06-15 18:42:31');

-- 2021-06-15 13:44:17
