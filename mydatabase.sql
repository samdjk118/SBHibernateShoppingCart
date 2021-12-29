-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2018 a las 11:47:09
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydatabase`
--

-- --------------------------------------------------------
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydatabase` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mydatabase`;
--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `Accounts` (
  `USER_NAME` varchar(20) NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) NOT NULL,
  `USER_ROLE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `Accounts` (`USER_NAME`, `ACTIVE`, `ENCRYTED_PASSWORD`, `USER_ROLE`) VALUES
('employee1', b'1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_EMPLOYEE'),
('manager1', b'1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'ROLE_MANAGER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `Orders` (
  `ID` varchar(50) NOT NULL,
  `AMOUNT` double NOT NULL,
  `CUSTOMER_ADDRESS` varchar(255) NOT NULL,
  `CUSTOMER_EMAIL` varchar(128) NOT NULL,
  `CUSTOMER_NAME` varchar(255) NOT NULL,
  `CUSTOMER_PHONE` varchar(128) NOT NULL,
  `ORDER_DATE` datetime NOT NULL,
  `ORDER_NUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE `Order_Details` (
  `ID` varchar(50) NOT NULL,
  `AMOUNT` double NOT NULL,
  `PRICE` double NOT NULL,
  `QUANITY` int(11) NOT NULL,
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `Products` (
  `CODE` varchar(20) NOT NULL,
  `IMAGE` longblob,
  `NAME` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `CREATE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `Products` (`CODE`, `IMAGE`, `NAME`, `PRICE`, `CREATE_DATE`) VALUES
('1', NULL, 'Core Java', 100, '2018-07-15 00:00:00'),
('2', NULL, 'Spring for Beginners', 50, '2018-07-15 00:00:00'),
('3', NULL, 'Swift for Beginners', 120, '2018-07-15 00:00:00'),
('4', NULL, 'Oracle XML Parser', 120, '2018-07-15 00:00:00'),
('5', NULL, 'CSharp Tutorial for Beginers', 110, '2018-07-15 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`USER_NAME`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ORDER_UK` (`ORDER_NUM`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `Order_Details`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ORDER_DETAIL_ORD_FK` (`ORDER_ID`),
  ADD KEY `ORDER_DETAIL_PROD_FK` (`PRODUCT_ID`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`CODE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `order_details`
--
ALTER TABLE `Order_Details`
  ADD CONSTRAINT `ORDER_DETAIL_ORD_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `Orders` (`ID`),
  ADD CONSTRAINT `ORDER_DETAIL_PROD_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `Products` (`CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
