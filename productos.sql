-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2024 a las 01:13:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nombredelproducto` varchar(45) NOT NULL,
  `imagenurl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `precio`, `descripcion`, `nombredelproducto`, `imagenurl`) VALUES
(1, 6000, 'manzana', 'manzana', 'https://tomatelavida.com.co/wp-content/uploads/2022/09/Manzana-Postob%C3%B3n-2022-P.png'),
(5, 6000, 'uva', 'uva', 'https://www.brigman.it/image/cache/catalog/product/img_5756-568x568.jpg'),
(6, 1200, 'piña', 'piña', 'https://mercadoslpineda.co/6079-thickbox_default/gaseosa-postobon-x-250-ml-pina.jpg'),
(7, 2000, 'naranja', 'naranja', 'https://tomatelavida.com.co/wp-content/uploads/2022/09/Naranja-Postob%C3%B3n-2022-P.png'),
(8, 2000, 'lux uva', 'lux uva', 'https://infonutricional.tomatelavida.com.co/wp-content/uploads/2023/06/UvaLUX300ml-1.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
