-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 05 2023 г., 12:12
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Diagnosis`
--

CREATE TABLE `Diagnosis` (
  `DiagnosisCode` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Diagnosis`
--

INSERT INTO `Diagnosis` (`DiagnosisCode`, `Name`) VALUES
(1, 'ОРВ'),
(2, 'Ангина'),
(3, 'Мегрень'),
(4, 'Грипп');

-- --------------------------------------------------------

--
-- Структура таблицы `Doctor`
--

CREATE TABLE `Doctor` (
  `DoctorNumber` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Specialty` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Doctor`
--

INSERT INTO `Doctor` (`DoctorNumber`, `Name`, `Specialty`, `Category`) VALUES
(1, 'Петров Иван Федорович', 'Терапевт', '3'),
(2, 'Иванова Людмила Ивановна', 'Хирург', '1'),
(3, 'Петров Василий Иванович', 'Окулист', '1'),
(4, 'Лебедев Виктор Иванович', 'Хирург', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `Patient`
--

CREATE TABLE `Patient` (
  `MedicalCardNumber` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Adress` varchar(45) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Discount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Patient`
--

INSERT INTO `Patient` (`MedicalCardNumber`, `Name`, `BirthDay`, `Adress`, `Sex`, `Discount`) VALUES
(1, 'Смирнов Алексай Дмитриевич', '1990-02-10', 'Улица карла маркса 64', 'Мужчина', 5),
(2, 'Лисецких Елена Анатольевна', '1990-01-17', 'Улица Холодильная 12', 'Женщина', 10),
(3, 'Петухова Ирина Николаевна', '2000-12-05', 'Улица Газовиков 72', 'Женщина', 2),
(4, 'Глухой Анатолий Викторович', '1982-12-05', 'Улица Газовиков 12', 'Мужчина', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `Reception`
--

CREATE TABLE `Reception` (
  `Ticket` int NOT NULL,
  `Patient` int NOT NULL,
  `DateOfReceipt` date DEFAULT NULL,
  `PurposeOfVisit` varchar(255) DEFAULT NULL,
  `VisitAmount` int DEFAULT NULL,
  `Diagnosis` int NOT NULL,
  `Doctor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Reception`
--

INSERT INTO `Reception` (`Ticket`, `Patient`, `DateOfReceipt`, `PurposeOfVisit`, `VisitAmount`, `Diagnosis`, `Doctor`) VALUES
(8, 1, '2023-12-05', 'Боль', 1000, 1, 1),
(9, 2, '2023-12-10', 'Температура', 1500, 2, 2),
(10, 3, '2023-12-11', 'Белое пятно в глазу', 2000, 3, 3),
(11, 4, '2023-12-05', 'Головная боль', 15000, 4, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Diagnosis`
--
ALTER TABLE `Diagnosis`
  ADD PRIMARY KEY (`DiagnosisCode`);

--
-- Индексы таблицы `Doctor`
--
ALTER TABLE `Doctor`
  ADD PRIMARY KEY (`DoctorNumber`);

--
-- Индексы таблицы `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`MedicalCardNumber`);

--
-- Индексы таблицы `Reception`
--
ALTER TABLE `Reception`
  ADD PRIMARY KEY (`Ticket`,`Patient`,`Diagnosis`,`Doctor`),
  ADD KEY `fk_Reception_Patient_idx` (`Patient`),
  ADD KEY `fk_Reception_Diagnosis1_idx` (`Diagnosis`),
  ADD KEY `fk_Reception_Doctor1_idx` (`Doctor`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Reception`
--
ALTER TABLE `Reception`
  MODIFY `Ticket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Reception`
--
ALTER TABLE `Reception`
  ADD CONSTRAINT `fk_Reception_Diagnosis1` FOREIGN KEY (`Diagnosis`) REFERENCES `Diagnosis` (`DiagnosisCode`),
  ADD CONSTRAINT `fk_Reception_Doctor1` FOREIGN KEY (`Doctor`) REFERENCES `Doctor` (`DoctorNumber`),
  ADD CONSTRAINT `fk_Reception_Patient` FOREIGN KEY (`Patient`) REFERENCES `Patient` (`MedicalCardNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
