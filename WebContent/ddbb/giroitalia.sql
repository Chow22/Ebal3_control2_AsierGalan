-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2017 a las 12:46:52
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `giroitalia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id_corredor` int(11) NOT NULL,
  `id_etapa` int(11) NOT NULL,
  `posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_corredor`, `id_etapa`, `posicion`) VALUES
(1, 1, 4),
(1, 2, 5),
(5, 1, 5),
(9, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredor`
--

CREATE TABLE `corredor` (
  `id` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `equipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `corredor`
--

INSERT INTO `corredor` (`id`, `nombre`, `apellido`, `equipo`) VALUES
(1, 'Nairo', 'Quintana', 'Movistar'),
(2, 'Gorka', 'Izagirre', 'Movistar'),
(4, 'Jesus', 'Herrada', 'Movistar'),
(5, 'Winner', 'Anacona', 'Movistar'),
(6, 'Joaquin', 'Rojas', 'Movistar'),
(7, 'Javier', 'Moreno', 'Bahrain'),
(8, 'Vincenzo', 'Nibali', 'Bahrain'),
(9, 'Valerio', 'Agnoli', 'Bahrain'),
(10, 'Peio', 'Bilbao', 'Astana'),
(11, 'Dario', 'Cataldo', 'Astana'),
(12, 'Luis Leon', 'Sanchez', 'Astana'),
(13, 'Igor', 'Anton', 'Dimension Data'),
(14, 'Omar', 'Fraile', 'Dimension Data'),
(15, 'Ryan', 'Gibbons', 'Dimension Data'),
(16, 'Angel', 'Vicioso', 'Katusha'),
(17, 'Alberto', 'Losada', 'Katusha'),
(18, 'Ilnur', 'Zakarin', 'Katusha'),
(19, 'Mikel', 'Landa', 'Sky'),
(20, 'Sebastian', 'Henao', 'Sky'),
(21, 'Tom', 'Dumoulin', 'SunWeb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapa`
--

CREATE TABLE `etapa` (
  `id` int(11) NOT NULL,
  `km` int(11) NOT NULL,
  `salida` varchar(25) NOT NULL,
  `llegada` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `etapa`
--

INSERT INTO `etapa` (`id`, `km`, `salida`, `llegada`) VALUES
(1, 206, 'Alghero', 'Olbia'),
(2, 221, 'Olbia', 'Tortoli'),
(3, 190, 'Pordenano', 'Asiago'),
(4, 29, 'Monza', 'Milano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id_corredor`,`id_etapa`),
  ADD KEY `id_etapa` (`id_etapa`);

--
-- Indices de la tabla `corredor`
--
ALTER TABLE `corredor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `corredor`
--
ALTER TABLE `corredor`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `etapa`
--
ALTER TABLE `etapa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_1` FOREIGN KEY (`id_etapa`) REFERENCES `etapa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`id_corredor`) REFERENCES `corredor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
