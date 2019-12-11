-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 12 2019 г., 02:52
-- Версия сервера: 5.7.23
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eshop`
--
CREATE DATABASE IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `eshop`;

-- --------------------------------------------------------

--
-- Структура таблицы `remarks`
--

CREATE TABLE `remarks` (
  `id` int(11) NOT NULL COMMENT '№',
  `users_id` int(11) NOT NULL COMMENT 'Член комиссии',
  `workshops_id` int(11) NOT NULL COMMENT 'Цех',
  `remark_type_id` int(11) NOT NULL COMMENT 'Тип замечания',
  `remark` varchar(500) NOT NULL COMMENT 'Замечание',
  `date` datetime NOT NULL COMMENT 'Дата'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `remarks`
--

INSERT INTO `remarks` (`id`, `users_id`, `workshops_id`, `remark_type_id`, `remark`, `date`) VALUES
(1, 1, 4, 2, 'Не выключен свет в душевой гардероба №3', '2019-11-14 13:15:00'),
(2, 1, 1, 3, 'Течет кран в гардеробе №1', '2019-12-02 10:30:00'),
(3, 5, 2, 1, 'Травит воздух из шланга пневматической сварки инв. №1043', '2019-12-03 08:15:00'),
(4, 4, 3, 3, 'Протекает трубопровод в цеху возле ворот №6', '2019-12-05 11:02:00'),
(5, 5, 4, 2, 'Во время обеденного перерыва включено местное освещение на рабочих местах.', '2019-12-06 12:15:00'),
(6, 1, 2, 1, 'Травит воздух из шланга краскопульта инв. №1520', '2019-12-09 11:25:00'),
(7, 4, 4, 3, 'Протекает радиатор отопления в кабинете Главного инженера', '2019-12-10 10:20:00'),
(8, 4, 3, 2, 'Заточной станок включен, сотрудник отсутствует на рабочем месте.', '2019-12-11 15:15:00'),
(9, 5, 2, 2, 'Включено уличное освещение над воротами №2 в светлое время суток.', '2019-12-11 15:10:00');

-- --------------------------------------------------------

--
-- Структура таблицы `remark_type`
--

CREATE TABLE `remark_type` (
  `id` int(11) NOT NULL COMMENT '№',
  `remark_type` varchar(50) NOT NULL COMMENT 'Тип замечания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `remark_type`
--

INSERT INTO `remark_type` (`id`, `remark_type`) VALUES
(1, 'Воздух'),
(2, 'Электричество'),
(3, 'Вода');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT '№',
  `login` varchar(45) DEFAULT NULL COMMENT 'Логин',
  `pass` varchar(45) DEFAULT NULL COMMENT 'Пароль',
  `name` varchar(45) DEFAULT NULL COMMENT 'Имя',
  `surname` varchar(45) DEFAULT NULL COMMENT 'Фамилия',
  `user_group_id` int(11) NOT NULL COMMENT 'Группа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `name`, `surname`, `user_group_id`) VALUES
(1, 'admin', '111', 'Марат', 'Гефтер', 1),
(2, 'boss', '111', 'Василий', 'Иванов', 2),
(3, 'guest', '111', 'Петр', 'Савельев', 3),
(4, 'energy', '111', 'Савелий', 'Степанов', 2),
(5, 'evgen_master', '111', 'Евгений', 'Семенов', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL COMMENT '№',
  `cod` varchar(45) DEFAULT NULL COMMENT 'Код',
  `description` varchar(45) DEFAULT NULL COMMENT 'Описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`id`, `cod`, `description`) VALUES
(1, 'adm', 'Администратор'),
(2, 'usr', 'Ответственное лицо'),
(3, 'dft', 'Сотрудник');

-- --------------------------------------------------------

--
-- Структура таблицы `workshops`
--

CREATE TABLE `workshops` (
  `id` int(11) NOT NULL COMMENT '№',
  `name` varchar(45) NOT NULL COMMENT 'Наименование цеха'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `workshops`
--

INSERT INTO `workshops` (`id`, `name`) VALUES
(1, 'Цех №1'),
(2, 'Цех №2'),
(3, 'Цех №3'),
(4, 'Главный производственный корпус');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `remarks`
--
ALTER TABLE `remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_remarks_users1_idx` (`users_id`),
  ADD KEY `fk_remarks_workshops1_idx` (`workshops_id`),
  ADD KEY `fk_remarks_remark_type1_idx` (`remark_type_id`);

--
-- Индексы таблицы `remark_type`
--
ALTER TABLE `remark_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`user_group_id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `fk_users_user_group1_idx` (`user_group_id`);

--
-- Индексы таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cod` (`cod`);

--
-- Индексы таблицы `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `remarks`
--
ALTER TABLE `remarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `remark_type`
--
ALTER TABLE `remark_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `workshops`
--
ALTER TABLE `workshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№', AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `remarks`
--
ALTER TABLE `remarks`
  ADD CONSTRAINT `fk_remarks_remark_type1` FOREIGN KEY (`remark_type_id`) REFERENCES `remark_type` (`id`),
  ADD CONSTRAINT `fk_remarks_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_remarks_workshops1` FOREIGN KEY (`workshops_id`) REFERENCES `workshops` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_user_group1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
