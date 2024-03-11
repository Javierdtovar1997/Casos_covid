-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-03-2024 a las 22:00:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Casos_Covid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cases`
--

CREATE TABLE `Cases` (
  `id_case` int(11) NOT NULL,
  `id_municipality` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `id_gender` int(11) DEFAULT NULL,
  `id_type_Contagion` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `date_symptom` datetime DEFAULT NULL,
  `date_death` datetime DEFAULT NULL,
  `date_diagnosis` datetime DEFAULT NULL,
  `date_recovery` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departament`
--

CREATE TABLE `Departament` (
  `id_departament` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gender`
--

CREATE TABLE `Gender` (
  `id_gender` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Municipality`
--

CREATE TABLE `Municipality` (
  `id_municipality` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `id_departament` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Status`
--

CREATE TABLE `Status` (
  `id_status` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Type_Contagion`
--

CREATE TABLE `Type_Contagion` (
  `id_type_Contagion` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cases`
--
ALTER TABLE `Cases`
  ADD PRIMARY KEY (`id_case`),
  ADD KEY `id_municipality` (`id_municipality`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_type_Contagion` (`id_type_Contagion`),
  ADD KEY `id_status` (`id_status`);

--
-- Indices de la tabla `Departament`
--
ALTER TABLE `Departament`
  ADD PRIMARY KEY (`id_departament`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `Gender`
--
ALTER TABLE `Gender`
  ADD PRIMARY KEY (`id_gender`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `Municipality`
--
ALTER TABLE `Municipality`
  ADD PRIMARY KEY (`id_municipality`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_departament` (`id_departament`);

--
-- Indices de la tabla `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `Type_Contagion`
--
ALTER TABLE `Type_Contagion`
  ADD PRIMARY KEY (`id_type_Contagion`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Departament`
--
ALTER TABLE `Departament`
  MODIFY `id_departament` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Gender`
--
ALTER TABLE `Gender`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Municipality`
--
ALTER TABLE `Municipality`
  MODIFY `id_municipality` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Status`
--
ALTER TABLE `Status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Type_Contagion`
--
ALTER TABLE `Type_Contagion`
  MODIFY `id_type_Contagion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cases`
--
ALTER TABLE `Cases`
  ADD CONSTRAINT `Cases_ibfk_1` FOREIGN KEY (`id_municipality`) REFERENCES `Municipality` (`id_municipality`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cases_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `Gender` (`id_gender`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cases_ibfk_3` FOREIGN KEY (`id_type_Contagion`) REFERENCES `Type_Contagion` (`id_type_Contagion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cases_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `Status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Municipality`
--
ALTER TABLE `Municipality`
  ADD CONSTRAINT `Municipality_ibfk_1` FOREIGN KEY (`id_departament`) REFERENCES `Departament` (`id_departament`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
