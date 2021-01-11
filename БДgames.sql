-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 25 2018 г., 15:01
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `games`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `filler`()
begin
	set @i=1;
	while (@i<100) do
		insert into transactions values (null,(select id from account order by rand() limit 1),(select id from game order by rand() limit 1));
		set @i=@i+1;
	end while;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `account_creation_date` date NOT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `account`
--

INSERT INTO `account` (`id`, `login`, `password`, `first_name`, `last_name`, `birth_date`, `account_creation_date`, `money`) VALUES
(1, 'warlock', 'warlock123', 'John', 'Peterson', '2017-02-27', '2018-05-14', 500),
(2, 'god', 'god', 'Paul', 'Anders', '2007-03-03', '2018-03-21', 10),
(3, 'Powerman', 'qwerty', 'Ivan', 'Popov', '2000-03-23', '2018-09-04', 1000),
(4, 'Super_killer', '20slayer09', 'John', 'Polovski', '2009-10-10', '2018-01-09', 8000),
(5, 'Vasyanya', 'vasyana_rulez', 'Vasilii', 'Petrov', '1998-05-26', '2016-09-30', 0),
(6, 'Java_guru', 'codeforever', 'Gregor', 'Bzhenjesceskevicz', '1980-01-15', '2016-09-11', 20000),
(7, 'Nastenka', 'mylittlepony', 'Anastasia', 'Bulevitskaya', '1996-04-21', '2018-01-22', 0),
(8, 'NLO', 'ufology', 'Alien', 'Inozemtsev', '1992-06-13', '2012-02-27', 1100),
(9, 'Elephant', 'q1w2e3r4t5', 'Dambo', 'Svarovski', '1985-12-06', '2015-01-30', 500),
(15, 'Angel&Devil', 'WelcomeToHell', 'first_name', 'last_name', '1951-11-07', '2012-12-28', 14000),
(16, 'Carnage', 'dev123', 'Doctor', 'Spinoza', '1995-07-21', '2016-02-25', 1400),
(17, '20papkaNogebator05', 'fsehNagnu!1!', 'Papka', 'Nogebator', '2005-01-01', '2016-10-18', 4100),
(18, 'Salieri', 'ireilas', 'Joshua', 'Gedenvaltz', '1990-06-23', '2013-02-07', 14200),
(19, 'Kusel', 'ReTwQ', 'Garreth', 'Coronel', '1970-12-31', '2014-08-19', 125000),
(20, 'MustDie!', '/.,mnzxv', 'Gades', 'Pierce', '1990-04-11', '2018-09-01', 0),
(21, 'Alextraza', 'juikmn', 'Vanessa', 'Karma', '1992-10-29', '2017-12-06', 10000),
(22, 'Fisherman', 'fish123qwerty', 'Nikolay', 'Fisherman', '1982-06-05', '2014-06-05', 1000),
(23, 'Kathode', 'electricity', 'Gregor', 'Loungres', '1990-01-25', '2018-10-02', 9846),
(24, 'Kenny', 'semetskiy', 'Petr', 'Johnka', '1982-09-13', '2018-10-02', 0),
(25, 'Chainsaw', 'vzhhh!', 'Karen', 'Movsesyan', '1995-01-20', '2017-08-21', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `foundation_date` date NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `id_3` (`id`),
  KEY `id_4` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`id`, `name`, `foundation_date`, `country`) VALUES
(1, 'Blizzard Entertainment', '1986-04-26', 'USA'),
(2, 'CD Project', '1988-01-01', 'Poland'),
(4, 'id Software', '1991-02-01', 'USA'),
(5, 'Riot Games', '2006-01-01', 'USA'),
(6, 'Bioware', '1995-01-01', 'Canada'),
(7, 'Epic Games', '1991-01-01', 'USA'),
(8, 'GSC Gameworld', '1995-01-01', 'Ukraine'),
(9, 'Ubisoft', '1986-01-01', 'France'),
(10, 'Electronic Arts', '1982-05-28', 'USA'),
(11, 'Bethesda', '1986-06-28', 'USA'),
(12, 'Rockstar', '1998-01-01', 'USA'),
(14, 'NCSoft', '1997-03-01', 'South Korea'),
(15, 'ArenaNet', '2000-04-01', 'USA'),
(16, 'Valve', '1996-08-24', 'USA');

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Game_name` varchar(50) NOT NULL,
  `Release_date` date DEFAULT NULL,
  `Genre` varchar(10) NOT NULL,
  `Developer` int(11) NOT NULL,
  `Is_online` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Game_name` (`Game_name`),
  UNIQUE KEY `id` (`id`),
  KEY `Developer` (`Developer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`id`, `Game_name`, `Release_date`, `Genre`, `Developer`, `Is_online`, `price`) VALUES
(1, 'Gears of War', '2006-11-07', '1', 7, 0, 500),
(2, 'S.T.A.L.K.E.R.: Shadow of Chernobyl', '2007-02-20', '1', 8, 0, 100),
(3, 'The Witcher 3', '2015-05-19', '2', 2, 0, 1000),
(4, 'World of Warcraft', '2004-11-23', '2', 1, 1, 3500),
(5, 'Mass Effect', '2007-10-20', '1-2', 6, 0, 300),
(7, 'Mass Effect 2', '2010-01-26', '1-2', 6, 0, 500),
(8, 'The Witcher', '2006-10-30', '2', 2, 0, 500),
(10, 'The Witcher 2', '2011-05-16', '2', 2, 0, 500),
(11, 'Overwatch', '2016-05-26', '1', 1, 1, 1500),
(12, 'Diablo', '1996-11-30', '4', 1, 0, 200),
(13, 'Diablo 2', '2000-06-29', '4', 1, 0, 400),
(14, 'Diablo 3', '2012-06-15', '4', 1, 0, 1000),
(15, 'Quake', '1996-06-22', '1', 4, 0, 100),
(16, 'Quake 2', '1997-12-09', '1', 4, 0, 100),
(17, 'Quake 3 Arena', '1999-12-02', '1', 4, 1, 200),
(18, 'Quake 4', '2005-10-18', '1', 4, 0, 200),
(19, 'Doom', '1993-12-10', '1', 4, 0, 100),
(20, 'Doom 2', '1994-10-10', '1', 4, 0, 100),
(21, 'Doom 3', '2004-09-11', '1-5', 4, 0, 300),
(22, 'League of Legends', '2009-10-27', '6', 5, 1, 0),
(23, 'Mass Effect 3', '2010-12-12', '1', 6, 0, 700),
(24, 'Mass Effect: Andromeda', '2017-03-21', '1', 6, 0, 1000),
(25, 'Unreal Tournament', '1999-11-30', '1', 7, 1, 10),
(26, 'Unreal Tournament 3', '2007-10-28', '1', 7, 1, 200),
(27, 'Gears of War 2', '2008-11-07', '1', 7, 0, 400),
(29, 'Gears of War 3', '2011-09-20', '1', 7, 0, 600),
(30, 'Bulletstorm', '2011-02-22', '1', 7, 0, 600),
(31, 'S.T.A.L.K.E.R.: Clear Sky', '2008-08-22', '1', 8, 0, 500),
(32, 'S.T.A.L.K.E.R.: Call of Pripyat', '2009-10-02', '1', 8, 0, 700),
(33, 'Серия Assassins Creed', '2007-11-13', '1', 9, 0, 700),
(35, 'Dark Messiah of Might and Magic', '2006-12-21', '1-2', 9, 0, 500),
(36, 'Серия Far Cry', '2004-03-23', '1', 9, 0, 5000),
(37, 'Серия Prince of Persia', '2003-11-21', '1', 9, 0, 2000),
(38, 'Серия Command & Conquer', '1995-08-01', '3', 10, 0, 1500),
(39, 'Серия Battlefield', '2002-09-20', '1', 10, 0, 8000),
(40, 'Серия Terminator', '1991-01-01', '1', 11, 0, 1000),
(41, 'Серия The Elder Scrolls', '1994-04-05', '2', 11, 1, 5000),
(42, 'Fallout 3', '2008-10-28', '2', 11, 0, 500),
(43, 'Fallout : New Vegas', '2010-10-19', '2', 11, 0, 500),
(44, 'Dishonored', '2012-10-09', '1-2', 11, 0, 560),
(45, 'Fallout 4', '2015-11-10', '2', 11, 0, 1000),
(46, 'Doom 4', '2016-05-13', '1', 11, 0, 1000),
(47, 'Серия Grand Theft Auto', '1997-11-08', '1', 12, 0, 5000),
(49, 'Lineage 2', '2003-10-01', '2', 14, 1, 50),
(50, 'Guild Wars 2', '2012-08-28', '2', 14, 1, 500),
(51, 'PUBG', '2017-03-23', '7', 15, 1, 1500),
(52, 'Dota 2', '2013-06-09', '6', 16, 1, 0),
(53, 'Heroes of the Storm', '2015-06-02', '6', 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_3` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'RPG'),
(3, 'RTS'),
(4, 'Hack''n''Slash'),
(5, 'Horror'),
(6, 'MOBA'),
(7, 'Battle Royale');

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=312 ;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`id`, `account_id`, `game_id`) VALUES
(1, 1, 4),
(2, 23, 5),
(4, 9, 23),
(5, 7, 39),
(6, 24, 31),
(7, 24, 41),
(8, 1, 52),
(9, 22, 4),
(10, 15, 43),
(11, 4, 35),
(12, 18, 24),
(14, 9, 2),
(15, 18, 17),
(16, 3, 51),
(18, 8, 36),
(19, 7, 45),
(20, 8, 46),
(21, 17, 1),
(22, 21, 32),
(23, 15, 32),
(24, 5, 24),
(25, 9, 19),
(26, 2, 44),
(27, 9, 29),
(30, 15, 7),
(31, 6, 25),
(33, 22, 21),
(34, 18, 7),
(35, 15, 51),
(39, 21, 1),
(40, 1, 8),
(41, 20, 3),
(42, 15, 42),
(43, 7, 12),
(44, 8, 47),
(45, 5, 30),
(46, 4, 41),
(47, 7, 52),
(49, 4, 32),
(50, 21, 12),
(51, 9, 26),
(52, 1, 46),
(53, 1, 53),
(54, 23, 19),
(55, 2, 39),
(56, 15, 16),
(57, 3, 20),
(58, 8, 32),
(59, 25, 3),
(60, 2, 2),
(61, 4, 7),
(63, 5, 20),
(64, 15, 20),
(65, 25, 19),
(66, 5, 8),
(67, 18, 20),
(68, 19, 8),
(69, 2, 4),
(70, 6, 13),
(71, 17, 17),
(73, 5, 52),
(76, 21, 24),
(78, 6, 14),
(79, 20, 33),
(80, 8, 26),
(81, 21, 51),
(82, 5, 26),
(84, 23, 49),
(86, 8, 7),
(87, 23, 31),
(88, 1, 36),
(89, 16, 14),
(91, 23, 12),
(92, 2, 20),
(93, 7, 47),
(94, 23, 40),
(95, 8, 41),
(96, 19, 17),
(100, 19, 16),
(101, 17, 4),
(102, 20, 22),
(105, 15, 19),
(107, 25, 31),
(108, 4, 26),
(109, 3, 53),
(110, 21, 53),
(111, 17, 10),
(112, 6, 35),
(114, 1, 30),
(115, 3, 23),
(116, 24, 18),
(117, 24, 23),
(118, 16, 18),
(119, 6, 52),
(120, 5, 44),
(121, 15, 52),
(122, 22, 35),
(123, 22, 11),
(124, 7, 40),
(126, 15, 3),
(127, 15, 39),
(129, 25, 12),
(132, 3, 49),
(133, 7, 7),
(134, 19, 52),
(135, 19, 3),
(137, 16, 46),
(138, 15, 5),
(139, 22, 53),
(140, 19, 33),
(141, 1, 14),
(144, 7, 35),
(145, 9, 7),
(146, 9, 18),
(149, 24, 14),
(150, 17, 22),
(152, 16, 40),
(153, 1, 10),
(154, 23, 46),
(155, 2, 25),
(156, 25, 49),
(157, 17, 20),
(158, 22, 3),
(159, 9, 46),
(160, 15, 2),
(161, 2, 24),
(162, 22, 26),
(164, 16, 43),
(165, 18, 39),
(166, 22, 45),
(167, 23, 50),
(169, 5, 19),
(170, 5, 22),
(172, 22, 13),
(173, 9, 14),
(174, 6, 49),
(175, 1, 23),
(177, 2, 26),
(178, 22, 29),
(179, 18, 31),
(180, 24, 19),
(181, 7, 19),
(182, 3, 42),
(183, 23, 11),
(184, 23, 45),
(185, 23, 25),
(186, 23, 29),
(187, 4, 53),
(188, 19, 46),
(189, 25, 37),
(190, 2, 31),
(191, 18, 3),
(192, 16, 24),
(194, 25, 39),
(195, 23, 41),
(196, 7, 17),
(197, 25, 46),
(198, 7, 5),
(199, 7, 18),
(201, 18, 13),
(202, 20, 38),
(203, 21, 43),
(204, 8, 42),
(205, 2, 41),
(207, 22, 1),
(208, 20, 16),
(209, 24, 44),
(210, 20, 15),
(211, 20, 20),
(212, 5, 45),
(213, 9, 50),
(214, 25, 35),
(215, 24, 33),
(216, 17, 15),
(217, 3, 17),
(218, 9, 27),
(219, 5, 49),
(221, 1, 11),
(222, 9, 21),
(224, 17, 39),
(225, 24, 7),
(226, 8, 22),
(227, 20, 40),
(228, 6, 32),
(229, 16, 12),
(230, 21, 22),
(231, 19, 20),
(232, 3, 24),
(234, 4, 36),
(237, 6, 18),
(240, 16, 20),
(241, 2, 52),
(242, 6, 22),
(243, 23, 20),
(244, 8, 52),
(245, 18, 46),
(246, 5, 42),
(247, 17, 36),
(248, 24, 50),
(249, 15, 27),
(250, 22, 32),
(251, 2, 14),
(252, 16, 29),
(253, 24, 8),
(254, 17, 38),
(255, 18, 27),
(257, 7, 38),
(258, 19, 14),
(259, 7, 20),
(260, 5, 47),
(262, 6, 3),
(263, 18, 21),
(264, 9, 42),
(265, 2, 7),
(266, 9, 40),
(267, 25, 40),
(268, 18, 42),
(269, 24, 2),
(273, 18, 25),
(274, 9, 43),
(275, 25, 24),
(276, 15, 49),
(277, 15, 46),
(279, 24, 22),
(280, 7, 29),
(281, 4, 14),
(282, 7, 44),
(285, 3, 14),
(286, 4, 15),
(287, 7, 37),
(288, 8, 25),
(289, 7, 11),
(290, 16, 13),
(291, 16, 33),
(292, 23, 8),
(293, 1, 3),
(294, 7, 22),
(295, 16, 41),
(296, 8, 30),
(297, 20, 17),
(298, 25, 13),
(302, 21, 49),
(303, 3, 25),
(304, 23, 30),
(305, 25, 8),
(306, 23, 53),
(307, 19, 21),
(309, 18, 35),
(310, 8, 17),
(311, 18, 16);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
