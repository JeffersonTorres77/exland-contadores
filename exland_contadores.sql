-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-10-2021 a las 01:59:45
-- Versión del servidor: 10.2.40-MariaDB-cll-lve
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `exlandcl_santiagocontadores`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros_costo`
--

CREATE TABLE `centros_costo` (
  `idCentroCosto` int(11) NOT NULL COMMENT 'ID 1: Gastos Personal Jose [Obligatorio]',
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `centros_costo`
--

INSERT INTO `centros_costo` (`idCentroCosto`, `nombre`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(1, 'Contabilidad', '2020-10-20 17:54:28', '2021-03-24 11:28:54', 0),
(2, 'Gastos Personal Jose', '2020-10-30 02:42:14', '2021-03-24 11:28:58', 0),
(3, 'Oficina Virtual', '2020-10-20 17:55:08', '2020-11-03 10:45:34', 0),
(4, 'Jurídico', '2020-11-02 18:41:54', '2020-11-03 10:45:36', 0),
(14, 'tusociedad.cl', '2021-06-11 10:15:05', '2021-06-11 10:15:05', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros_adicionales`
--

CREATE TABLE `cobros_adicionales` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `monto` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cobros_adicionales`
--

INSERT INTO `cobros_adicionales` (`id`, `empresa_id`, `descripcion`, `monto`, `created_at`, `updated_at`) VALUES
(3, 65, 'Firma electrónica poder', 5000, '2021-07-27 17:37:16', '2021-07-27 17:37:16'),
(5, 62, 'Adicional 2 trabajadores', 12000, '2021-07-27 17:57:05', '2021-07-27 17:57:05'),
(7, 15, 'Firma electrónica poder FAC N° 1275', 5000, '2021-08-17 12:05:06', '2021-09-15 08:56:52'),
(9, 70, 'Adicional 1 trabajador', 5000, '2021-09-02 18:16:26', '2021-09-02 18:16:26'),
(10, 80, 'Adicional remuneraciones 5', 32500, '2021-10-06 10:16:30', '2021-10-07 15:20:31'),
(11, 82, 'adicional remuneraciones 5', 32500, '2021-10-07 15:20:07', '2021-10-07 15:20:21'),
(12, 87, 'ADICIONAL TRABAJADORES 1', 6500, '2021-10-18 16:56:25', '2021-10-18 16:56:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros_adicionales_periodos`
--

CREATE TABLE `cobros_adicionales_periodos` (
  `cobro_adicional_id` int(11) NOT NULL,
  `periodo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cobros_adicionales_periodos`
--

INSERT INTO `cobros_adicionales_periodos` (`cobro_adicional_id`, `periodo_id`) VALUES
(5, 59),
(5, 51),
(3, 51),
(9, 59),
(9, 51),
(7, 50),
(11, 59),
(11, 53),
(10, 59),
(10, 53),
(12, 59),
(12, 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `idEgreso` int(11) NOT NULL,
  `fecha` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `detalle` text COLLATE utf8_spanish_ci NOT NULL,
  `montoCLP` float NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  `idStatus` int(11) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`idEgreso`, `fecha`, `detalle`, `montoCLP`, `idCentroCosto`, `idUsuario`, `observacion`, `idStatus`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, '2021-03-12', 'pago remuneraciones', 10000, 2, 8, 'pago remuneraciones semana 05 2020', 2, '2021-03-12 23:49:55', '2021-03-12 23:57:55'),
(2, '2021-03-17', 'sueldo daniela', 35000, 2, 8, 'semana desde 01-20-21 al 30-05-21..', 2, '2021-03-17 23:16:37', '2021-03-21 17:37:34'),
(3, '2021-03-25', 'Sueldo Daniela ', 20000, 1, 8, '', 2, '2021-03-25 12:37:50', '2021-03-25 12:38:54'),
(4, '2020-01-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 12:48:25', '2021-03-25 12:48:25'),
(5, '2020-01-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 12:49:26', '2021-03-25 12:49:26'),
(6, '2020-02-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 12:53:06', '2021-03-25 12:53:06'),
(7, '2020-02-15', 'Software de Contabilidad ', 15000, 1, 9, 'transferencia', 1, '2021-03-25 12:53:38', '2021-03-25 12:53:38'),
(8, '2020-03-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 12:54:05', '2021-03-25 12:54:05'),
(9, '2020-03-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 12:54:37', '2021-03-25 12:54:37'),
(10, '2020-04-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 12:55:35', '2021-03-25 12:55:35'),
(11, '2020-04-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 12:57:01', '2021-03-25 12:57:01'),
(12, '2020-05-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 12:59:31', '2021-03-25 12:59:31'),
(13, '2020-05-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:05:27', '2021-03-25 13:05:27'),
(14, '2020-06-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 13:05:55', '2021-03-25 13:05:55'),
(15, '2020-06-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:06:16', '2021-03-25 13:06:16'),
(16, '2020-07-14', 'Software de Facturación ', 5950, 1, 9, 'Transferencia', 1, '2021-03-25 13:06:55', '2021-03-25 13:06:55'),
(17, '2020-07-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:09:36', '2021-03-25 13:09:36'),
(18, '2020-07-17', 'Sueldo Mauricio', 20000, 1, 9, 'Giro Facil', 1, '2021-03-25 13:10:53', '2021-03-25 13:10:53'),
(19, '2020-07-24', 'Sueldo Mauricio', 20000, 1, 9, 'Transferencia', 1, '2021-03-25 13:11:26', '2021-03-25 13:11:26'),
(20, '2020-07-31', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:12:18', '2021-03-25 13:12:18'),
(21, '2020-08-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 13:14:03', '2021-03-25 13:14:03'),
(22, '2020-08-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:14:24', '2021-03-25 13:14:24'),
(23, '2020-08-07', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:15:16', '2021-03-25 13:16:24'),
(24, '2020-08-14', 'Sueldo Mauricio', 20000, 1, 9, 'Giro Facil', 1, '2021-03-25 13:15:54', '2021-03-25 13:16:04'),
(25, '2020-08-21', 'Sueldo Mauricio', 20000, 1, 9, 'Giro Facil', 1, '2021-03-25 13:19:02', '2021-03-25 13:19:02'),
(26, '2020-08-28', 'Sueldo Mauricio', 26300, 1, 9, 'Giro facil', 1, '2021-03-25 13:19:35', '2021-03-25 13:19:35'),
(27, '2020-09-04', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:20:28', '2021-03-25 13:20:28'),
(28, '2020-09-11', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:21:50', '2021-03-25 13:21:50'),
(29, '2020-09-18', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:32:11', '2021-03-25 13:32:11'),
(30, '2020-09-25', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:34:10', '2021-03-25 13:34:10'),
(31, '2020-09-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 13:35:15', '2021-03-25 13:35:15'),
(32, '2020-09-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:36:59', '2021-03-25 13:36:59'),
(33, '2020-10-02', 'Sueldo Mauricio', 24079, 1, 9, 'Giro facil', 1, '2021-03-25 13:44:25', '2021-03-25 13:44:25'),
(34, '2020-10-09', 'Sueldo Mauricio', 15921, 1, 9, 'Giro facil', 1, '2021-03-25 13:45:00', '2021-03-25 13:45:00'),
(35, '2020-10-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 13:46:34', '2021-03-25 13:46:34'),
(36, '2020-10-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:47:06', '2021-03-25 13:47:06'),
(37, '2020-10-16', 'Sueldo Mauricio', 20000, 1, 9, 'Giro facil', 1, '2021-03-25 13:47:29', '2021-03-25 13:47:29'),
(38, '2020-10-23', 'Sueldo Mauricio', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:48:18', '2021-03-25 13:48:18'),
(39, '2020-10-30', 'Sueldo Mauricio', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:49:00', '2021-03-25 13:49:00'),
(40, '2020-11-06', 'Sueldo Mauricio', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:49:43', '2021-03-25 13:49:43'),
(41, '2020-11-13', 'Sueldo Mauricio', 35000, 1, 9, 'Transferencia', 1, '2021-03-25 13:50:09', '2021-03-25 13:50:09'),
(42, '2020-11-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 13:50:39', '2021-03-25 13:50:39'),
(43, '2020-11-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:51:44', '2021-03-25 13:51:44'),
(44, '2020-11-20', 'Sueldo Mauricio', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:54:09', '2021-03-25 13:54:09'),
(45, '2020-11-27', 'Sueldo Daniela', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:54:59', '2021-03-25 13:54:59'),
(46, '2020-12-04', 'Sueldo Daniela', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:55:21', '2021-03-25 13:55:21'),
(47, '2020-12-11', 'Sueldo Daniela', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:56:24', '2021-03-25 13:56:24'),
(48, '2020-12-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 13:56:45', '2021-03-25 13:56:45'),
(49, '2020-12-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 13:57:38', '2021-03-25 13:57:38'),
(50, '2020-12-18', 'Sueldo Daniela', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 13:59:11', '2021-03-25 13:59:11'),
(51, '2020-12-24', 'Sueldo Daniela', 35000, 1, 9, 'Giro facil', 1, '2021-03-25 14:00:05', '2021-03-25 14:00:05'),
(52, '2020-12-30', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:00:37', '2021-03-25 14:00:55'),
(53, '2021-01-08', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:01:40', '2021-03-25 14:01:40'),
(54, '2021-01-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 14:02:14', '2021-03-25 14:02:14'),
(55, '2021-01-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 14:02:32', '2021-03-25 14:02:32'),
(56, '2021-01-15', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:03:43', '2021-03-25 14:03:43'),
(57, '2021-01-22', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:06:35', '2021-03-25 14:06:35'),
(58, '2021-01-29', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:08:01', '2021-03-25 14:08:01'),
(59, '2021-02-05', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:08:56', '2021-03-25 14:08:56'),
(60, '2021-02-12', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:09:20', '2021-03-25 14:09:20'),
(61, '2021-02-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 14:10:19', '2021-03-25 14:10:19'),
(62, '2021-02-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 14:11:25', '2021-03-25 14:11:25'),
(63, '2021-02-19', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:11:55', '2021-03-25 14:11:55'),
(64, '2021-02-26', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:12:18', '2021-03-25 14:12:18'),
(65, '2021-03-05', 'Sueldo Daniela', 35000, 1, 9, 'Remesa', 1, '2021-03-25 14:12:45', '2021-03-25 14:12:45'),
(66, '2021-03-13', 'Sueldo Daniela', 42000, 1, 9, 'Remesa', 1, '2021-03-25 14:13:20', '2021-03-25 14:13:20'),
(67, '2021-03-14', 'Software de Facturación ', 5742, 1, 9, 'Transferencia', 1, '2021-03-25 14:13:39', '2021-03-25 14:13:39'),
(68, '2021-03-15', 'Software de Contabilidad ', 15000, 1, 9, 'Transferencia', 1, '2021-03-25 14:13:58', '2021-03-25 14:13:58'),
(69, '2021-03-19', 'Sueldo Daniela', 51049, 1, 9, 'Transferencia ', 1, '2021-03-25 14:14:49', '2021-03-25 14:14:49'),
(70, '2021-03-26', 'Sueldo Daniela', 51194, 1, 9, 'Transferencia', 1, '2021-03-26 10:50:32', '2021-03-26 10:50:32'),
(71, '2021-04-30', 'Sueldo Daniela', 51191, 1, 9, 'Transferencia efectiva para el lunes 05-04-2021', 1, '2021-04-01 10:31:47', '2021-04-01 10:31:47'),
(72, '2021-04-01', 'Pago Desire', 21000, 1, 9, 'Remesa (Por Trabajar 3 días) ', 1, '2021-04-01 10:32:52', '2021-04-01 10:32:52'),
(73, '2021-04-14', 'software de facturacion', 5742, 1, 9, 'transferencia', 1, '2021-04-16 16:13:49', '2021-04-16 16:13:49'),
(74, '2021-04-15', 'software de contabilidad', 15000, 1, 9, 'transferencia', 1, '2021-04-16 16:14:22', '2021-04-16 16:14:22'),
(75, '2021-04-16', 'Sueldo Daniela', 52168, 1, 9, 'giro facil', 1, '2021-04-16 16:14:41', '2021-04-23 10:56:28'),
(76, '2021-04-23', 'Sueldo Daniela', 56000, 1, 9, 'Giro Facil', 1, '2021-04-23 12:54:18', '2021-04-23 12:54:18'),
(77, '2021-04-30', 'Sueldo Desire', 33000, 1, 9, 'Remesa', 1, '2021-04-30 12:50:13', '2021-04-30 13:19:13'),
(78, '2021-04-30', 'Sueldo Daniela', 52000, 1, 9, 'Giro Facil', 1, '2021-04-30 12:50:38', '2021-04-30 12:50:38'),
(79, '2021-05-07', 'Sueldo Desire', 33000, 1, 9, 'Remesa', 1, '2021-05-07 09:30:12', '2021-05-07 09:30:12'),
(80, '2021-05-07', 'Sueldo Daniela', 51460, 1, 9, 'Remesa', 1, '2021-05-07 13:33:46', '2021-05-07 13:33:46'),
(81, '2021-05-14', 'Sueldo Desire', 41250, 1, 9, 'Remesa', 1, '2021-05-21 09:20:33', '2021-05-21 09:20:33'),
(82, '2021-05-14', 'Sueldo Daniela', 54000, 1, 9, 'Giro facil', 1, '2021-05-21 09:20:56', '2021-05-21 09:20:56'),
(83, '2021-05-14', 'software de facturacion', 5742, 1, 9, 'Transferencia', 1, '2021-05-21 09:21:43', '2021-05-21 09:21:43'),
(84, '2021-05-15', 'software de contabilidad', 15000, 1, 9, 'Transferencia', 1, '2021-05-21 09:22:19', '2021-05-21 09:22:19'),
(85, '2021-05-21', 'Sueldo Desire', 33000, 1, 9, 'Remesa', 1, '2021-05-21 09:22:59', '2021-05-21 09:22:59'),
(86, '2021-05-21', 'Sueldo Daniela', 54000, 1, 9, 'Giro Facil', 1, '2021-05-21 09:38:03', '2021-05-21 09:38:03'),
(87, '2021-05-28', 'Sueldo Desire', 33000, 1, 9, 'REMESA', 1, '2021-05-28 11:36:40', '2021-05-28 11:36:40'),
(88, '2021-05-28', 'Sueldo Daniela', 54000, 1, 9, 'Giro Facil', 1, '2021-05-28 11:45:24', '2021-05-28 11:45:24'),
(89, '2021-06-04', 'Sueldo Desire', 53000, 1, 9, 'Remesa', 1, '2021-06-04 10:38:07', '2021-06-04 10:38:07'),
(90, '2021-06-04', 'Sueldo Daniela', 73000, 1, 9, 'Giro Facil', 1, '2021-06-04 10:39:14', '2021-06-04 10:49:16'),
(91, '2021-05-29', 'Google Ads', 145000, 14, 11, '', 1, '2021-06-11 11:26:41', '2021-06-11 11:26:41'),
(92, '2021-01-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-06-11 11:27:24', '2021-06-11 11:27:24'),
(93, '2021-02-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-06-11 11:27:51', '2021-06-11 11:27:51'),
(94, '2021-03-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-06-11 11:28:11', '2021-06-11 11:28:11'),
(95, '2021-04-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-06-11 11:28:38', '2021-06-11 11:28:38'),
(96, '2021-05-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-06-11 11:29:01', '2021-06-11 11:29:01'),
(97, '2021-06-11', 'Sueldo Desire', 33000, 1, 11, 'Remesas', 1, '2021-06-14 09:29:13', '2021-06-14 09:29:13'),
(98, '2021-06-11', 'Sueldo Daniela ', 54000, 1, 11, 'Remesas', 1, '2021-06-14 09:30:02', '2021-06-14 09:30:02'),
(99, '2021-06-18', 'Sueldo Desire', 33000, 1, 11, 'Remesas', 1, '2021-06-18 10:49:53', '2021-06-18 10:49:53'),
(100, '2021-06-18', 'Sueldo Daniela ', 54000, 1, 11, 'Remesas\r\n', 1, '2021-06-18 10:50:20', '2021-06-18 10:50:20'),
(101, '2021-06-14', 'software de facturacion', 5742, 1, 11, '', 1, '2021-06-18 12:32:24', '2021-06-18 12:32:24'),
(102, '2021-06-15', 'software de contabilidad', 15000, 1, 11, '', 1, '2021-06-18 12:33:24', '2021-06-18 12:33:24'),
(103, '2021-06-25', 'Sueldo Desire', 33000, 1, 11, 'Remesas', 1, '2021-06-25 12:30:44', '2021-06-25 12:30:44'),
(104, '2021-06-25', 'Sueldo Daniela ', 54000, 1, 11, 'Remesas', 1, '2021-06-25 12:31:03', '2021-06-25 12:31:03'),
(105, '2021-06-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-07-01 10:51:26', '2021-07-01 10:51:26'),
(106, '2021-06-29', 'Google Ads', 456000, 14, 11, '', 1, '2021-07-01 10:52:00', '2021-07-05 09:57:40'),
(107, '2021-07-02', 'Sueldo Desire', 33000, 1, 11, 'Remesas', 1, '2021-07-02 16:10:09', '2021-07-02 16:10:09'),
(108, '2021-07-02', 'Sueldo Daniela ', 54000, 1, 11, 'Remesas', 1, '2021-07-02 16:10:26', '2021-07-02 16:10:26'),
(109, '2021-07-01', 'Gasto Oficina Virtual', 660000, 3, 11, '', 1, '2021-07-05 09:58:29', '2021-07-05 09:58:29'),
(110, '2021-07-08', 'Honorario de Abogado ', 100000, 14, 11, 'Marca Coper', 1, '2021-07-08 13:53:02', '2021-07-08 13:53:02'),
(111, '2021-07-08', 'Honorario de Abogado ', 100000, 14, 11, 'Marca All tiro ', 1, '2021-07-08 13:53:52', '2021-07-08 13:53:52'),
(112, '2021-07-09', 'Sueldo Desire', 33000, 1, 11, 'remesas', 1, '2021-07-09 18:20:45', '2021-07-09 18:20:45'),
(113, '2021-07-09', 'Sueldo Daniela ', 54000, 1, 11, 'remesas', 1, '2021-07-09 18:21:00', '2021-07-09 18:21:00'),
(114, '2021-07-16', 'Sueldo Desire', 33000, 1, 11, 'remesas\r\n', 1, '2021-07-16 13:00:11', '2021-07-16 13:00:11'),
(115, '2021-07-16', 'Sueldo Daniela ', 55000, 1, 11, 'giro facil', 1, '2021-07-16 13:00:33', '2021-07-16 13:01:02'),
(116, '2021-07-16', 'Fac Business factory', 183000, 14, 11, 'Servicios Clientes Mayo (5-2), Junio (5-7)\r\nfactura Nº 1207', 2, '2021-07-16 16:46:32', '2021-07-20 11:14:17'),
(117, '2021-07-19', 'Sueldo Daniela', 55000, 1, 9, 'Adelantado semana 19-23 de julio\r\nGiro facil', 1, '2021-07-19 15:25:17', '2021-07-19 15:25:17'),
(118, '2021-07-15', 'software de facturacion', 11881, 1, 11, 'Pago mes de Junio-Julio se hizo el 20 de julio', 1, '2021-07-20 12:02:50', '2021-07-30 15:55:37'),
(119, '2021-07-21', 'Firma Digital', 16541, 1, 11, 'Judith Firma ', 1, '2021-07-21 17:27:07', '2021-07-21 17:27:07'),
(120, '2021-07-23', 'Sueldo Desire', 33000, 1, 11, 'remesas', 1, '2021-07-26 09:06:29', '2021-07-26 09:06:29'),
(121, '2021-07-23', 'Sueldo Jhon', 14000, 1, 11, 'Giro facil', 1, '2021-07-26 09:06:55', '2021-07-26 09:06:55'),
(122, '2021-07-14', 'software de contabilidad', 15000, 1, 11, '', 1, '2021-07-30 15:56:45', '2021-07-30 15:56:45'),
(123, '2021-07-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-07-30 15:57:51', '2021-07-30 15:57:51'),
(124, '2021-07-29', 'Google Ads', 428000, 14, 11, '', 1, '2021-07-30 16:03:47', '2021-08-25 13:33:03'),
(125, '2021-07-30', 'Sueldo Desire', 33000, 1, 11, 'remesa venezuela', 1, '2021-07-30 16:04:36', '2021-07-30 16:04:36'),
(126, '2021-07-30', 'Sueldo Daniela ', 55500, 1, 11, 'giro facil', 1, '2021-07-30 16:05:04', '2021-07-30 16:05:04'),
(127, '2021-07-30', 'Sueldo Jhon', 17500, 1, 11, 'giro facil', 1, '2021-07-30 16:05:33', '2021-07-30 16:05:33'),
(128, '2021-08-06', 'Sueldo Daniela ', 55500, 14, 11, 'giro facil', 1, '2021-08-25 13:28:56', '2021-08-25 13:34:52'),
(129, '2021-08-06', 'Sueldo Jhon', 35000, 1, 11, 'giro facil', 1, '2021-08-25 13:30:20', '2021-08-26 15:58:29'),
(130, '2021-08-06', 'Sueldo Desire', 35330, 1, 11, 'remesas', 1, '2021-08-25 13:35:22', '2021-08-26 15:58:43'),
(131, '2021-08-13', 'Sueldo Daniela ', 55500, 1, 11, 'giro facil', 1, '2021-08-25 13:35:57', '2021-08-25 13:35:57'),
(132, '2021-08-13', 'Sueldo Jhon', 35000, 1, 11, 'giro facil', 1, '2021-08-25 13:36:22', '2021-08-26 15:56:32'),
(133, '2021-08-13', 'Sueldo Desire', 35500, 1, 11, 'remesas', 1, '2021-08-25 13:36:51', '2021-08-26 15:57:02'),
(134, '2021-08-14', 'software de contabilidad', 15000, 1, 11, '', 1, '2021-08-25 13:38:08', '2021-08-25 13:38:08'),
(135, '2021-08-15', 'software de facturacion', 0, 1, 11, '', 1, '2021-08-25 13:38:46', '2021-10-06 15:57:12'),
(136, '2021-08-20', 'Sueldo Daniela ', 56500, 1, 11, 'giro facil', 1, '2021-08-25 13:39:17', '2021-08-26 15:57:16'),
(137, '2021-08-20', 'Sueldo Jhon', 35000, 1, 11, 'giro facil', 1, '2021-08-25 13:39:41', '2021-08-26 15:57:31'),
(138, '2021-08-20', 'Sueldo Desire', 35549, 1, 11, 'remesas', 1, '2021-08-25 13:40:06', '2021-08-26 15:57:49'),
(139, '2021-08-27', 'Sueldo Daniela ', 31500, 1, 11, 'giro facil', 1, '2021-08-25 15:39:59', '2021-08-30 18:56:35'),
(140, '2021-08-27', 'Sueldo Jhon', 35000, 1, 11, 'giro facil', 1, '2021-08-25 15:40:26', '2021-08-30 18:56:58'),
(141, '2021-08-27', 'Sueldo Desire', 60328, 1, 11, '35.328 DESIRE + 25.000 DANIELA remesas', 1, '2021-08-25 15:40:48', '2021-08-30 18:57:46'),
(142, '2021-08-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-08-25 15:41:06', '2021-08-25 15:41:06'),
(143, '2021-08-29', 'Google Ads', 366000, 14, 11, '', 1, '2021-08-25 15:42:08', '2021-08-25 15:42:08'),
(144, '2021-09-02', 'Pack 70 FAO', 131250, 14, 11, 'tu firma digital', 1, '2021-09-02 19:10:50', '2021-09-02 19:10:50'),
(145, '2021-09-03', 'Sueldo Daniela ', 71000, 1, 11, 'giro facil', 1, '2021-09-07 12:31:49', '2021-09-07 12:31:49'),
(146, '2021-09-03', 'Sueldo Jhon', 40000, 1, 11, 'giro facil', 1, '2021-09-07 12:32:15', '2021-09-07 12:32:15'),
(147, '2021-09-03', 'Sueldo Desire', 45076, 1, 11, 'remesas ', 1, '2021-09-07 12:32:39', '2021-09-07 12:32:39'),
(148, '2021-09-10', 'Sueldo daniela', 56500, 1, 11, 'Giro facil', 1, '2021-09-13 09:54:50', '2021-09-13 09:54:50'),
(149, '2021-09-10', 'Sueldo Jhon ', 35000, 1, 11, 'Giro facil', 1, '2021-09-13 09:55:43', '2021-09-13 09:55:43'),
(150, '2021-09-10', 'Sueldo desire', 35608, 1, 11, 'remesas', 1, '2021-09-13 09:56:06', '2021-09-13 09:56:06'),
(151, '2021-09-14', 'software de contabilidad', 15000, 1, 11, '', 1, '2021-09-20 12:33:03', '2021-09-20 12:33:03'),
(152, '2021-09-15', 'Software de Facturación', 0, 1, 11, '', 1, '2021-09-20 12:33:57', '2021-09-20 12:33:57'),
(153, '2021-09-17', 'Sueldo Daniela', 56500, 1, 11, 'Giro facil', 1, '2021-09-20 12:37:47', '2021-09-20 16:39:26'),
(154, '2021-09-17', 'Sueldo Jhon', 35000, 1, 11, 'giro facil', 1, '2021-09-20 12:38:21', '2021-09-20 16:39:37'),
(155, '2021-09-17', 'Sueldo Desire', 35183, 1, 11, 'remesas', 1, '2021-09-20 12:38:43', '2021-09-20 16:39:58'),
(156, '2021-09-24', 'Reprogramación siste. gestión', 22637, 1, 11, 'pago jefferson 58$ 1 era parte', 1, '2021-09-20 12:39:57', '2021-09-20 16:40:24'),
(157, '2021-09-24', 'Sueldo Jhon ', 35000, 1, 11, 'Giro facil', 1, '2021-09-28 16:04:27', '2021-09-28 16:04:27'),
(158, '2021-09-24', 'Sueldo Daniela', 36500, 1, 11, 'De los 56.500 enviados 20.000 a desire', 1, '2021-09-28 16:06:06', '2021-09-28 16:06:06'),
(159, '2021-09-24', 'Sueldo Desire', 35426, 1, 11, 'Remesas. Se me adelanto el sueldo de la semana del 1er de octubre, mas 20.000 que daniela me envio', 1, '2021-09-28 16:07:29', '2021-09-28 16:07:29'),
(160, '2021-10-01', 'Sueldo Desire', 35426, 1, 11, 'Remesas, sueldo pagado el día 24 de septiembre Adelanto', 1, '2021-09-28 16:09:11', '2021-09-28 16:09:11'),
(161, '2021-09-28', 'Celular Jose', 15000, 1, 11, '', 1, '2021-10-06 15:56:47', '2021-10-08 10:00:29'),
(162, '2021-09-29', 'Google ADS', 215000, 14, 11, '', 1, '2021-10-06 15:58:14', '2021-10-08 10:00:41'),
(163, '2021-10-01', 'Sueldo Daniela', 57000, 1, 11, 'giro fácil', 1, '2021-10-06 16:10:55', '2021-10-06 16:10:55'),
(164, '2021-10-01', 'Sueldo Jhon', 35000, 1, 11, 'giro fácil', 1, '2021-10-06 16:11:37', '2021-10-06 16:11:37'),
(165, '2021-10-06', '1ra cuota Jeferson', 64850, 1, 11, '50% del sistema de firma', 1, '2021-10-06 16:14:29', '2021-10-06 16:14:29'),
(166, '2021-10-08', 'Sueldo Jhon', 40000, 1, 11, 'Giro Facil', 1, '2021-10-08 16:32:52', '2021-10-08 16:32:52'),
(167, '2021-10-08', 'Sueldo Daniela', 63000, 1, 11, 'Remesa (monto enviado a cuenta de Desire Acosta)', 1, '2021-10-08 16:35:32', '2021-10-08 16:35:32'),
(168, '2021-10-08', 'Sueldo Desire', 41613, 1, 11, 'Remesa', 1, '2021-10-08 16:36:34', '2021-10-08 16:36:34'),
(169, '2021-10-08', 'Sueldo Deysi', 30400, 1, 11, 'Remesa ', 1, '2021-10-08 16:37:27', '2021-10-08 16:37:27'),
(170, '2021-10-12', 'Compra de firmas', 100000, 1, 11, '', 1, '2021-10-12 17:21:10', '2021-10-12 17:21:10'),
(171, '2021-10-14', 'Software de Contabilidad', 15000, 1, 11, 'Transferencia', 1, '2021-10-14 10:29:33', '2021-10-14 10:29:33'),
(172, '2021-10-15', 'Software de Facturacion', 0, 1, 11, '', 1, '2021-10-15 10:51:13', '2021-10-15 10:51:13'),
(173, '2021-10-15', 'Sueldo Desire', 41756, 1, 11, 'Remesas', 1, '2021-10-15 16:20:06', '2021-10-15 16:20:06'),
(174, '2021-10-15', 'Sueldo Jhon', 40000, 1, 11, 'Giro fácil', 1, '2021-10-15 16:21:42', '2021-10-15 16:21:42'),
(175, '2021-10-15', 'Sueldo Daniela', 66000, 1, 11, 'Giro facil', 1, '2021-10-15 16:22:35', '2021-10-15 16:22:35'),
(176, '2021-10-15', 'Sueldo Deysi', 38000, 1, 11, 'Remesa', 1, '2021-10-15 16:28:18', '2021-10-15 16:28:18'),
(177, '2021-10-19', 'Compra de firmas', 50000, 1, 11, '', 1, '2021-10-19 18:59:27', '2021-10-19 18:59:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `idEmpresa` int(11) NOT NULL,
  `rut` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `razon_social` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `idPlan` int(11) DEFAULT NULL,
  `idPlan_sinMovimiento` int(11) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`idEmpresa`, `rut`, `razon_social`, `correo`, `idPlan`, `idPlan_sinMovimiento`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(1, '76.910.161-6', 'CRIMAT CHILE SPA', 'crimat.chile.spa@gmail.com', 17, NULL, '1994-06-12 00:00:00', '2021-05-10 17:21:10', 0),
(2, '76.803.777-9', 'INDUS PRODUCCIONES', 'gerencia@indusproducciones.cl', 2, NULL, '1994-06-12 00:00:00', '2021-03-24 18:47:44', 0),
(3, '77.037.906-7', 'Panaderia el Chato Spa', 'jimenezcarquin@hotmail.com', 4, NULL, '1994-06-12 00:00:00', '2021-03-25 10:44:56', 0),
(4, '77.062.667-6', 'Body Clinic Spa', 'acorredor@bodyclinic.cl', 8, NULL, '1994-06-12 00:00:00', '2021-03-26 09:56:04', 0),
(5, '77.092.243-7', 'RARO DISEÑO SPA', 'gustavo.rarodiseno@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 14:45:54', 0),
(6, '76.955.246-4', 'R&G SOLUCIONES SPA', 'hro.ca@hotmail.com', 6, NULL, '1994-06-12 00:00:00', '2021-03-25 12:47:31', 0),
(7, '76.962.965-3', 'KIUVO DISEÑO SPA', 'Ventas.kiuvo@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-24 12:20:41', 0),
(8, '76.943.726-6', 'INVERTU SPA', 'contactoinvertu@gmail.com', NULL, NULL, '1994-06-12 00:00:00', '1994-06-12 00:00:00', 0),
(9, '77.077.461-6', 'JOSSELIN MENDEZ BARRETO SPA', 'administracion@sexshoptouchme.cl', 7, NULL, '1994-06-12 00:00:00', '2021-03-26 09:53:23', 0),
(10, '77.096.549-7', 'Transportes Chacana Spa', 'transportesyenn@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-24 12:23:59', 0),
(11, '77.094.623-9', 'Lexum Corp Spa.', 'dplaza@lexumcorp.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 18:01:25', 0),
(12, '79.655.910-1', 'SECOR ECHEVERRIA SPA', 'artech@secor.cl', 3, NULL, '1994-06-12 00:00:00', '2021-03-26 13:27:45', 0),
(13, '76.706.963-4', 'AIEM SPA', 'alexis@aiem.cl', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 14:46:22', 0),
(14, '77.139.966-5', 'ART CONSTRUCCIONES SPA', 'artconstruccionesfm@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 12:47:59', 0),
(15, '76.921.163-2', 'HILMAR STUDIO SPA', 'hilmarchipi@hotmail.com', 5, NULL, '1994-06-12 00:00:00', '2021-03-25 11:08:21', 0),
(16, '77.111.961-1', 'MARBE STUDIO LASH SPA', 'Marbetdv@gmail.com', 5, NULL, '1994-06-12 00:00:00', '2021-03-25 11:08:43', 0),
(17, '77169413-6', 'TRANS MEBA SPA', 'ediwa.meba@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 14:46:49', 0),
(18, '76.948.688-7', 'AMBROSIAND SPA (juan pablo)', 'ambrosiandchile@gmail.com', 6, NULL, '1994-06-12 00:00:00', '2021-03-26 13:28:25', 0),
(19, '77.196.918-6', 'INVERSIONES RB SpA (ricardo)', 'Rpbc1968@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-26 13:29:57', 0),
(20, '77.174.942-9', 'SERVICIOS LOGISTICOS INTEGRALES SPA', 'pedro_rios1969@hotmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-26 09:58:43', 0),
(21, '77.201.011-7', 'Minimarket Segovia SpA', 'ale25303334@gmail.com', NULL, NULL, '1994-06-12 00:00:00', '1994-06-12 00:00:00', 0),
(22, '77.208.847-7', 'DIALMA CENTRO INTEGRAL FAMILIAR SPA', 'Cnunez@dialma.cl', 12, NULL, '1994-06-12 00:00:00', '2021-09-13 10:02:13', 0),
(23, '77.205.042-9', 'ACADEMIA CAPACITA. HILMAR DOMINGUEZ SpA', 'hilmarchipi@hotmail.com', 5, NULL, '1994-06-12 00:00:00', '2021-03-26 09:58:00', 0),
(24, '77.174.875-9', 'COMPAÑÍA GENERAL DE PRODUCTOS SPA', 'dplaza@lexumcorp.com', 9, NULL, '1994-06-12 00:00:00', '2021-04-06 17:14:21', 0),
(25, '77.234.268-3', 'Emi A Y J SpA', 'administracion@emibellezza.cl', 9, NULL, '1994-06-12 00:00:00', '2021-04-06 17:14:00', 0),
(26, '77.239.106-4', 'GABRIEL AGUILAR MUEBLES & DISEÑO SPA', 'muebles.g.a@hotmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-25 18:02:00', 0),
(27, '77.239.105-6', 'MURKEFEN SpA', 'fabianmunozneira@gmail.com', 1, NULL, '1994-06-12 00:00:00', '2021-03-26 13:30:28', 0),
(28, '7.626.506-2', 'YOLANDA DEL CARMEN AMESTICA ROBLES', 'MISSYOLIAMESTICA@GMAIL.COM', 1, NULL, '2020-01-10 00:00:00', '2021-03-26 18:28:35', 0),
(29, '77.258.129-7', 'SOKAN SPA', 'sanfernando@varmontt.cl', 1, NULL, '0000-00-00 00:00:00', '2021-03-25 18:00:34', 0),
(30, '76.909.008-8', 'INVERSIONES ZUBIAUR SPA', 'staff@bestfriends.cl', 1, NULL, '1994-06-12 00:00:00', '2021-03-26 18:29:26', 0),
(31, '76.612.285-K', 'SÁEZ Y SANTA MARÍA LIMITADA', 'CENTROLIBREPIENSA@GMAIL.COM', 1, NULL, '1994-06-12 00:00:00', '2021-03-30 12:12:17', 0),
(32, '76.999.332-0', 'OVPERSONAL SPA', 'vicenteovalles@gmail.com', 5, NULL, '2020-11-12 00:00:00', '2021-03-30 12:07:43', 0),
(33, '77.271.926-4', 'DISTRIBUIDORA DONDE EL CHATO SPA', 'jimenezcarquin@hotmail.com', 5, NULL, '2020-12-12 00:00:00', '2021-03-26 18:29:57', 0),
(34, '77.268.278-6', 'INVERSIONES SAN BENITO SPA', 'leidysvsj@gmail.com', 5, NULL, '2020-11-12 00:00:00', '2021-03-26 13:30:47', 0),
(35, '77.278.355-8', 'KRIYA KIN SPA', 'loreto.i.castillo.salvo@gmail.com', 1, NULL, '2021-05-01 00:00:00', '2021-03-26 18:30:45', 0),
(36, '12.853.791-0', 'JOSE LUIS VALLADARES PANCHILLA', 'MARCOMARTINEZ65@HOTMAIL.COM', 6, NULL, '0000-00-00 00:00:00', '2021-04-06 16:53:22', 0),
(37, '77.055.577-9', 'ISYGO SPA', 'farenas@tedespacho.cl', 16, NULL, '0000-00-00 00:00:00', '2021-05-04 14:27:14', 0),
(38, '76.320.999-7', 'SOCIEDAD COMERCIAL URUWASHI LIMITADA', 'wuhan513@hotmail.com', 12, NULL, '2021-12-02 00:00:00', '2021-04-06 16:57:40', 0),
(39, '77.201.489-9', 'SERVICIOS LA MAGA SPA', 'patriciagonzalezm@gmail.com', 1, NULL, '0000-00-00 00:00:00', '2021-03-30 12:15:14', 0),
(40, '77.010.318-5', 'EMPORIO DE GIORGIS SPA', 'Macadegiorgis@hotmail.com', 1, NULL, '0000-00-00 00:00:00', '2021-03-30 12:15:42', 0),
(41, '76.615.751-3', 'JARDIN INFANTIL MACARENA DE GIORGIS CONTRERAS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA', 'Macadegiorgis@hotmail.com', 1, NULL, '0000-00-00 00:00:00', '2021-03-30 12:20:16', 0),
(42, '77.268.956-K', 'MUSA SPA', 'Macadegiorgis@hotmail.com', 1, NULL, '0000-00-00 00:00:00', '2021-03-30 12:20:34', 0),
(43, '77.295.068-3', 'EL YOLITO SPA', 'MISSYOLIAMESTICA@GMAIL.COM', 1, NULL, '0000-00-00 00:00:00', '2021-03-30 12:18:08', 0),
(44, '77.048.321-2', 'SERVICIOS CONTRERAS SPA', 'Irmacontreras@gmail.com', 11, NULL, '2021-03-03 00:00:00', '2021-03-30 12:24:35', 0),
(45, '13484484-1', 'IRMA ELENA CONTRERAS LARA', 'Irmacontreras@gmail.com', 9, NULL, '2021-03-03 00:00:00', '2021-03-30 12:25:27', 0),
(46, '77146417-3', 'CAPITAL INVESTMENTS SPA', 'contacto@capitalinvestments.cl', 1, NULL, '0000-00-00 00:00:00', '2021-04-06 11:54:23', 0),
(47, 'ERROR NO USAR ', 'ERROR NO USAR ', 'Gp320399@gmail.com', 9, NULL, '2021-04-14 16:00:21', '2021-07-27 17:34:04', 0),
(48, '1-9', 'OTROS CLIENTES NO MENSUALES', 'jose@santiagocontadores.cl', NULL, NULL, '2021-04-19 20:48:14', '2021-04-19 20:48:14', 0),
(49, ' 77.352.282-0', 'DRA. ELIZABETH COFRE RIQUELME SPA', 'e.cofreriquelme@hotmail.com', 15, NULL, '2021-04-27 17:23:52', '2021-04-27 17:34:39', 0),
(50, '16.521.997-K', 'GLADYS DEL PILAR PAREDES CABELLO', 'Gp320399@gmail.com', 17, NULL, '2021-04-27 17:23:56', '2021-07-20 18:25:11', 0),
(51, '77.333.432-3', 'VIBU CHILE SPA', 'a.villanuevacabello@gmail.com', 9, NULL, '2021-04-27 18:54:52', '2021-05-04 10:33:22', 0),
(52, '77.351.487-9', 'TESORO DIDACTICOS SPA', 'Cnunez@dialma.cl', 8, NULL, '2021-05-06 11:10:17', '2021-07-07 12:14:13', 0),
(53, '77.267.333-7', 'PERFUMERIA MERCEDES SPA', 'jose@santiagocontadores.cl', NULL, NULL, '2021-05-11 18:45:23', '2021-05-11 18:45:23', 0),
(54, '77.206.084-K', 'TECNOLOGÍA REDPROVE SPA', 'Diego.cerda@redprove.cl', NULL, NULL, '2021-05-17 10:29:32', '2021-05-17 10:29:32', 0),
(55, '77.366.699-7', 'MONS SHOP SR SPA', 'soraya.rclau@gmail.com', 1, NULL, '2021-05-21 09:42:01', '2021-06-11 09:10:59', 0),
(56, '1-8', 'TuSociedad.cl', 'jose@santiagocontadores.cl', 9, NULL, '2021-06-10 23:51:46', '2021-06-10 23:51:46', 0),
(57, '77.391.765-5', 'Vekahairstyle SpA', 'mqvc.31@gmail.com', 13, NULL, '2021-06-28 13:32:21', '2021-06-28 13:32:21', 0),
(58, '77.391.566-0', 'MULTISERVICIOS ÑUÑOA SPA', 'karlmarinez2000@gmail.com', 1, NULL, '2021-07-01 12:06:07', '2021-07-01 12:06:07', 0),
(59, '2-8', 'TuMarcaComercial.cl', 'j@j.cl', 9, NULL, '2021-07-06 18:21:42', '2021-07-06 18:22:23', 0),
(60, '3-8', 'TuOficinaVirtualSantiago.cl', 'j@j.cl', 9, NULL, '2021-07-06 18:23:33', '2021-07-06 18:23:33', 0),
(61, '77.391.608-k', 'ZONA CLICK ', 'jopazo24@gmail.com', 1, NULL, '2021-07-07 11:02:47', '2021-07-07 11:02:47', 0),
(62, '77.096.427-K', 'COPER CONSULTING GROUP SpA', 'andres@coper.cl', 8, NULL, '2021-07-08 13:46:54', '2021-07-20 12:06:50', 0),
(63, '76.741.683-0', 'RMS INGENIERIA ELECTRICA SPA ', 'Grimanmaria@hotmail.com', NULL, NULL, '2021-07-20 09:46:02', '2021-09-14 21:41:21', 0),
(64, '76.698.612-9 ', ' BUSINESS FACTORY SPA', 'andres@adnauditores.cl', NULL, NULL, '2021-07-20 09:47:04', '2021-07-20 09:47:04', 0),
(65, '77345117-6', 'BOUTIQUE BRAVE & STUDIO DAMS SPA', 'Arredondoandreyna@gmail.com', 1, NULL, '2021-07-20 09:47:49', '2021-07-20 09:47:49', 0),
(66, '77.361.952-2', 'ZULIANO EXPRES INVERSIONES SPA', 'juanriverabrix@gmail.com', 1, NULL, '2021-08-03 14:01:54', '2021-08-03 14:01:54', 0),
(67, '77.378.296-2', 'K-MOTOR SPA', 'miramiaviso@gmail.com', 1, NULL, '2021-08-03 14:02:37', '2021-08-03 14:02:37', 0),
(68, '76305352-0', 'SOLUCIONES INTEGRALES EN INFORMÁTICA FRANCHESCO GEOVANNI BEZZOLO GATICA E.I.R.L.', 'franchesco.bezzolo@gmail.com', NULL, NULL, '2021-08-17 13:12:45', '2021-08-17 13:12:45', 0),
(69, '77407419-8', 'RN GLASS SPA', 'rab.acuna.cc@gmail.com', 1, NULL, '2021-08-19 13:58:02', '2021-08-19 13:58:02', 0),
(70, '77.375.959-6', 'COMERCIALIZADORA MUNDOPLUS SPA', 'Rudy.sierra@gmail.com', 1, NULL, '2021-08-30 18:52:35', '2021-08-30 18:52:35', 0),
(71, '77434457-8', 'PRIMATES SPA ', 'valentinaalvarezt@gmail.com', 1, NULL, '2021-09-02 18:29:24', '2021-09-02 18:29:24', 0),
(72, '77.420.035-5', 'TEAM GARVILA SPA', 'Garciapaezjc@gmail.com', 1, NULL, '2021-09-02 18:32:23', '2021-09-02 18:32:23', 0),
(73, '77.419.997-7', 'BITPRO SPA', 'Franchesco.bezzolo@gmail.com', 1, NULL, '2021-09-02 18:33:17', '2021-09-02 18:33:17', 0),
(74, '77.423.872-7', 'OLDVELVET SPA', 'lorenzo.caro@gmail.com', 1, NULL, '2021-09-02 18:34:18', '2021-09-15 09:11:02', 0),
(75, '13561779-2', 'FABIOLA YAMILET NAVARRO PAREDES', 'NOTIENE@NOTIENE.COM', 1, NULL, '2021-09-02 18:35:09', '2021-09-15 09:11:17', 0),
(76, '77.423.618-k', 'DOBLETRACCION AUTOMOTRIZ SPA', 'Diego.rodriguez@dobletraccion.cl', 1, NULL, '2021-09-08 09:16:24', '2021-09-08 09:16:24', 0),
(77, '77356472-8', 'PYME FELIZ SPA', 'j@j.cl', 1, NULL, '2021-09-13 18:04:55', '2021-09-13 18:04:55', 0),
(78, '77.429.977-7', 'M&M FIJACIONES SPA', 'maximiliano@cie.cl', 1, NULL, '2021-10-01 10:12:39', '2021-10-04 13:48:54', 0),
(79, '77386463-2', 'CASOLEGAL SPA', 'abogadomoraga@gmail.com', 5, NULL, '2021-10-01 10:14:54', '2021-10-04 13:49:26', 0),
(80, '77.435.386-0', 'JPL CONSTRUCCIONES SPA', 'juanpozolira@gmail.com', 1, NULL, '2021-10-01 10:16:09', '2021-10-04 13:50:09', 0),
(81, '77.429.055-9', 'IMPERIO VEGANO SPA', 'tapiapapa0418@gmail.com', 1, NULL, '2021-10-01 10:22:04', '2021-10-04 13:47:48', 0),
(82, '77.421.906-4', 'JMBA CONSTRUCCIONES SPA', 'Jmedinagalaz2@gmail.com', 1, NULL, '2021-10-01 10:22:52', '2021-10-04 13:48:19', 0),
(83, '77.345.509-0', 'ASSET ADVISORS SPA', 'Jmjadue@gmail.com', 1, 5, '2021-10-01 10:23:40', '2021-10-01 10:23:40', 0),
(84, '77.426.125-7', 'TIENDA LINDA LUNA SPA', 'tiendalindaluna@gmail.com', 1, NULL, '2021-10-04 13:51:02', '2021-10-04 13:51:02', 0),
(85, '77.456.112-9', 'IBADAJANI SPA', 'cla.toledo.rrpp@gmail.com', 1, NULL, '2021-10-14 19:06:43', '2021-10-14 19:06:43', 0),
(86, '77.429.871-1', 'CUCHAU INVERSIONES SPA', 'rsosay@uft.edu', 1, NULL, '2021-10-14 19:07:31', '2021-10-14 19:07:31', 0),
(87, '77445851-4', 'AGCO SPA', 'williamsaguilerabarrera@gmail.com', 1, NULL, '2021-10-18 16:54:22', '2021-10-18 16:54:22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_tareas`
--

CREATE TABLE `estados_tareas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `color_class` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados_tareas`
--

INSERT INTO `estados_tareas` (`id`, `nombre`, `color_class`) VALUES
(1, 'Pendiente', 'primary'),
(2, 'Vencido', 'danger'),
(3, 'Anulado', 'danger'),
(4, 'Cerrado', 'secondary');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` bigint(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idPlan` int(11) DEFAULT NULL,
  `idPeriodoContable` int(11) NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `valorPlan` float DEFAULT NULL,
  `cobros_adicionales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `valorCobrar` float NOT NULL,
  `con_movimiento` tinyint(1) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `servicio` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `numeroFactura` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCobro` date NOT NULL,
  `fechaVencimiento` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idStatus` int(11) NOT NULL,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  `idMetodoPago` int(11) DEFAULT NULL,
  `fechaPago` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `idUsuario`, `idEmpresa`, `idPlan`, `idPeriodoContable`, `idCentroCosto`, `valorPlan`, `cobros_adicionales`, `valorCobrar`, `con_movimiento`, `idServicio`, `servicio`, `numeroFactura`, `fechaCobro`, `fechaVencimiento`, `idStatus`, `observacion`, `idMetodoPago`, `fechaPago`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 10, 2, 2, 39, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '727', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-24 18:49:12', '2021-09-28 17:33:54'),
(2, 10, 2, 2, 40, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '735', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-24 18:52:19', '2021-09-28 17:33:54'),
(3, 10, 2, 2, 41, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '776', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-03', '2021-03-25 09:35:39', '2021-09-28 17:33:54'),
(4, 10, 2, 2, 42, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '821', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-03', '2021-03-25 09:38:39', '2021-09-28 17:33:54'),
(5, 10, 2, 2, 43, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '862', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-06', '2021-03-25 09:39:39', '2021-09-28 17:33:54'),
(6, 10, 2, 2, 44, 1, 102842, '[]', 102842, 1, 1, 'Contabilidad Mensual', '906', '2021-02-01', '2021-03-20', 4, '', 3, '2021-02-03', '2021-03-25 09:53:56', '2021-09-28 17:33:54'),
(7, 10, 2, 2, 45, 1, 102842, '[]', 102842, 1, 1, 'Contabilidad Mensual', '946', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-08', '2021-03-25 09:56:29', '2021-09-28 17:33:54'),
(9, 10, 3, 4, 39, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '701', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 10:46:31', '2021-09-28 17:33:54'),
(10, 10, 3, 4, 40, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '736', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-22', '2021-03-25 10:47:16', '2021-09-28 17:33:54'),
(11, 10, 3, 4, 41, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '777', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-24', '2021-03-25 10:47:53', '2021-09-28 17:33:54'),
(12, 10, 3, 4, 42, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '822', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-22', '2021-03-25 10:48:37', '2021-09-28 17:33:54'),
(13, 10, 3, 4, 43, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '863', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-19', '2021-03-25 10:50:32', '2021-09-28 17:33:54'),
(14, 10, 3, 4, 44, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '908', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-22', '2021-03-25 10:52:01', '2021-09-28 17:33:54'),
(15, 10, 3, 4, 45, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '947', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-30', '2021-03-25 10:53:16', '2021-09-28 17:33:54'),
(16, 10, 7, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '706', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 11:02:54', '2021-09-28 17:33:54'),
(17, 10, 7, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '740', '2020-10-01', '2020-10-20', 4, '', 3, '2020-11-26', '2021-03-25 11:03:37', '2021-09-28 17:33:54'),
(18, 10, 7, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '781', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-10', '2021-03-25 11:04:41', '2021-09-28 17:33:54'),
(19, 10, 7, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '826', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-07', '2021-03-25 11:05:56', '2021-09-28 17:33:54'),
(20, 10, 7, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '867', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-07', '2021-03-25 11:06:50', '2021-09-28 17:33:54'),
(21, 10, 7, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '912', '2021-02-01', '2021-02-20', 4, '', 3, '2021-04-13', '2021-03-25 11:07:38', '2021-09-28 17:33:54'),
(22, 10, 7, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '951', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-19', '2021-03-25 11:08:12', '2021-09-28 17:33:54'),
(23, 10, 10, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '710', '2020-09-01', '2020-09-20', 4, '', 3, '2020-11-05', '2021-03-25 11:14:13', '2021-09-28 17:33:54'),
(24, 10, 10, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '746', '2020-10-01', '2020-10-20', 4, '', 3, '2020-11-05', '2021-03-25 11:14:52', '2021-09-28 17:33:54'),
(25, 10, 10, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '785', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-05', '2021-03-25 11:16:30', '2021-09-28 17:33:54'),
(26, 10, 10, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '830', '2020-12-01', '2020-12-20', 2, '', NULL, NULL, '2021-03-25 11:17:40', '2021-09-28 17:33:54'),
(27, 10, 10, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '871', '2021-01-01', '2021-01-20', 2, '', NULL, NULL, '2021-03-25 11:18:16', '2021-09-28 17:33:54'),
(28, 10, 10, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '916', '2021-02-01', '2021-02-20', 2, '', NULL, NULL, '2021-03-25 11:18:44', '2021-09-28 17:33:54'),
(29, 10, 10, 1, 45, 1, 30000, '[]', 25000, 1, 1, 'Contabilidad Mensual', '955', '2021-03-01', '2021-03-20', 2, '', 3, '2021-03-25', '2021-03-25 11:19:09', '2021-09-28 17:33:54'),
(30, 10, 15, 5, 39, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '715', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 11:37:14', '2021-09-28 17:33:54'),
(31, 10, 15, 5, 40, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '754', '2020-10-01', '2020-10-20', 4, '', 3, '2020-11-05', '2021-03-25 11:37:54', '2021-09-28 17:33:54'),
(32, 10, 15, 5, 41, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '791', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-18', '2021-03-25 11:38:35', '2021-09-28 17:33:54'),
(33, 10, 15, 5, 42, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '836', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-18', '2021-03-25 11:39:10', '2021-09-28 17:33:54'),
(34, 10, 15, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '877', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-29', '2021-03-25 11:39:44', '2021-09-28 17:33:54'),
(35, 10, 15, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '922', '2021-02-01', '2021-02-20', 4, '', 3, '2021-03-23', '2021-03-25 11:40:17', '2021-09-28 17:33:54'),
(36, 10, 15, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '961', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-22', '2021-03-25 11:40:46', '2021-09-28 17:33:54'),
(37, 10, 16, 5, 39, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '717', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 11:48:28', '2021-09-28 17:33:54'),
(38, 10, 16, 5, 40, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '756', '2020-10-01', '2020-10-20', 4, '', 3, '2020-12-16', '2021-03-25 11:52:07', '2021-09-28 17:33:54'),
(39, 10, 16, 5, 41, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '792', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-16', '2021-03-25 12:08:16', '2021-09-28 17:33:54'),
(40, 10, 16, 5, 42, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '838', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-16', '2021-03-25 12:09:03', '2021-09-28 17:33:54'),
(41, 10, 16, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '878', '2021-01-01', '2021-01-20', 4, '', 3, '2021-04-12', '2021-03-25 12:09:39', '2021-09-28 17:33:54'),
(42, 10, 16, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '923', '2021-02-01', '2021-02-20', 4, '', 3, '2021-04-12', '2021-03-25 12:10:15', '2021-09-28 17:33:54'),
(43, 10, 16, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '962', '2021-03-01', '2021-03-20', 4, '', 3, '2021-04-12', '2021-03-25 12:10:58', '2021-09-28 17:33:54'),
(44, 10, 6, 6, 39, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '705', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 12:54:04', '2021-09-28 17:33:54'),
(45, 10, 6, 6, 40, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '739', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-25 12:54:40', '2021-09-28 17:33:54'),
(46, 10, 6, 6, 41, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '780', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-05', '2021-03-25 12:55:15', '2021-09-28 17:33:54'),
(47, 10, 6, 6, 42, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '825', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-08', '2021-03-25 12:57:03', '2021-09-28 17:33:54'),
(48, 10, 6, 6, 43, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '866', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-11', '2021-03-25 12:57:46', '2021-09-28 17:33:54'),
(49, 10, 6, 6, 44, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '911', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-03', '2021-03-25 12:58:16', '2021-09-28 17:33:54'),
(50, 10, 6, 6, 45, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '950', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-11', '2021-03-25 12:59:07', '2021-09-28 17:33:54'),
(51, 10, 14, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '716', '2020-09-01', '2020-09-20', 4, '', 3, '2020-10-12', '2021-03-25 14:33:46', '2021-09-28 17:33:54'),
(52, 10, 14, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '752', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-20', '2021-03-25 14:34:23', '2021-09-28 17:33:54'),
(53, 10, 14, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '790', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-01', '2021-03-25 14:34:58', '2021-09-28 17:33:54'),
(54, 10, 14, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '835', '2020-12-01', '2020-12-20', 4, '', 3, '2021-01-12', '2021-03-25 14:35:43', '2021-09-28 17:33:54'),
(55, 10, 14, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '876', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-22', '2021-03-25 14:36:20', '2021-09-28 17:33:54'),
(56, 10, 14, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '921', '2021-02-01', '2021-02-20', 4, '', 3, '2021-03-24', '2021-03-25 14:37:05', '2021-09-28 17:33:54'),
(57, 10, 14, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '960', '2021-03-01', '2021-03-20', 4, '', 3, '2021-05-12', '2021-03-25 14:37:54', '2021-09-28 17:33:54'),
(58, 10, 13, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '726', '2020-09-01', '2020-09-20', 4, '', 3, '2020-12-04', '2021-03-25 14:56:46', '2021-09-28 17:33:54'),
(59, 10, 13, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '751', '2020-10-01', '2020-10-20', 4, '', 3, '2020-12-04', '2021-03-25 14:57:24', '2021-09-28 17:33:54'),
(60, 10, 13, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '789', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-11', '2021-03-25 14:58:07', '2021-09-28 17:33:54'),
(61, 10, 13, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '834', '2020-12-01', '2020-12-20', 4, '', 3, '2021-01-08', '2021-03-25 14:58:45', '2021-09-28 17:33:54'),
(62, 10, 13, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '875', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-15', '2021-03-25 15:16:59', '2021-09-28 17:33:54'),
(63, 10, 13, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '920', '2021-02-01', '2021-02-20', 4, '', 3, '2021-04-13', '2021-03-25 15:17:36', '2021-09-28 17:33:54'),
(64, 10, 13, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '959', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-12', '2021-03-25 15:18:03', '2021-09-28 17:33:54'),
(65, 10, 5, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '704', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 15:24:17', '2021-09-28 17:33:54'),
(66, 10, 5, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '738', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-25 15:25:12', '2021-09-28 17:33:54'),
(67, 10, 5, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '779', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-30', '2021-03-25 15:25:50', '2021-09-28 17:33:54'),
(68, 10, 5, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '824', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-24', '2021-03-25 15:26:34', '2021-09-28 17:33:54'),
(69, 10, 5, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '865', '2021-01-01', '2021-01-20', 4, '', 3, '2021-04-06', '2021-03-25 15:30:39', '2021-09-28 17:33:54'),
(70, 10, 5, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '910', '2021-02-01', '2021-02-20', 4, '', 3, '2021-05-06', '2021-03-25 15:31:08', '2021-09-28 17:33:54'),
(71, 10, 5, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '949', '2021-03-01', '2021-03-20', 4, '', 3, '2021-05-06', '2021-03-25 15:31:37', '2021-09-28 17:33:54'),
(72, 10, 17, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '731', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-25 16:58:37', '2021-09-28 17:33:54'),
(73, 10, 17, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '757', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-25 16:59:18', '2021-09-28 17:33:54'),
(74, 10, 17, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '793', '2020-11-01', '2020-11-20', 4, '', 3, '2021-03-25', '2021-03-25 16:59:55', '2021-09-28 17:33:54'),
(75, 10, 17, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '839', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-03', '2021-03-25 17:00:25', '2021-09-28 17:33:54'),
(76, 10, 17, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '879', '2021-01-01', '2021-01-20', 2, '', NULL, NULL, '2021-03-25 17:01:12', '2021-09-28 17:33:54'),
(77, 10, 17, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '924', '2021-02-01', '2021-02-20', 2, '', NULL, NULL, '2021-03-25 17:01:53', '2021-09-28 17:33:54'),
(78, 10, 17, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '963', '2021-03-01', '2021-03-20', 2, '', NULL, NULL, '2021-03-25 17:02:32', '2021-09-28 17:33:54'),
(79, 10, 29, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '852', '2020-12-01', '2020-12-20', 4, '', 3, '2021-01-18', '2021-03-25 18:29:14', '2021-09-28 17:33:54'),
(80, 10, 29, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '892', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-29', '2021-03-25 18:30:35', '2021-09-28 17:33:54'),
(81, 10, 29, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '936', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-20', '2021-03-25 18:31:27', '2021-09-28 17:33:54'),
(82, 10, 29, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '975', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-20', '2021-03-25 18:32:40', '2021-09-28 17:33:54'),
(83, 10, 11, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '711', '2020-09-01', '2020-09-20', 4, '', 3, '2021-01-07', '2021-03-25 18:36:30', '2021-09-28 17:33:54'),
(84, 10, 11, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '747', '2020-10-01', '2020-10-20', 4, '', 3, '2021-01-07', '2021-03-25 18:37:05', '2021-09-28 17:33:54'),
(85, 10, 11, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '786', '2020-11-01', '2020-11-20', 4, '', 3, '2021-01-07', '2021-03-25 18:37:40', '2021-09-28 17:33:54'),
(86, 10, 11, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '831', '2020-12-01', '2020-12-20', 4, '', 3, '2021-01-07', '2021-03-25 18:38:10', '2021-09-28 17:33:54'),
(87, 10, 11, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '872', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-07', '2021-03-25 18:39:01', '2021-09-28 17:33:54'),
(88, 10, 11, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '917', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-25', '2021-03-25 18:39:48', '2021-09-28 17:33:54'),
(89, 10, 11, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '956', '2021-03-01', '2021-03-20', 4, '', 3, '2021-06-02', '2021-03-25 18:40:19', '2021-09-28 17:33:54'),
(90, 10, 26, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '771', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-16', '2021-03-25 18:53:57', '2021-09-28 17:33:54'),
(91, 10, 26, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '805', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-05', '2021-03-25 18:56:02', '2021-09-28 17:33:54'),
(92, 10, 26, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '849', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-07', '2021-03-25 18:57:05', '2021-09-28 17:33:54'),
(93, 10, 26, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '889', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-07', '2021-03-25 18:57:36', '2021-09-28 17:33:54'),
(94, 10, 26, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '933', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-03', '2021-03-25 18:58:23', '2021-09-28 17:33:54'),
(95, 10, 26, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '972', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-04', '2021-03-25 18:59:02', '2021-09-28 17:33:54'),
(96, 10, 4, 8, 39, 1, 38195, '[]', 0, 1, 1, 'Contabilidad Mensual', '583', '2020-09-01', '2020-09-20', 4, '', 3, '2020-10-12', '2021-03-26 10:21:26', '2021-09-28 17:33:54'),
(97, 10, 4, 8, 40, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '703', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-26 10:22:05', '2021-09-28 17:33:54'),
(98, 10, 4, 8, 41, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '737', '2020-11-01', '2020-11-20', 4, '', 3, '2020-10-12', '2021-03-26 10:22:54', '2021-09-28 17:33:54'),
(99, 10, 4, 8, 42, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '778', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-14', '2021-03-26 10:23:45', '2021-09-28 17:33:54'),
(100, 10, 4, 8, 43, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '823', '2021-01-01', '2021-01-20', 4, '', 3, '2020-12-14', '2021-03-26 10:24:20', '2021-09-28 17:33:54'),
(101, 10, 4, 8, 44, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '864', '2021-02-01', '2021-02-20', 4, '', 3, '2021-03-08', '2021-03-26 10:24:51', '2021-09-28 17:33:54'),
(102, 10, 4, 8, 45, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '909', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-08', '2021-03-26 10:25:15', '2021-09-28 17:33:54'),
(103, 10, 4, 8, 46, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '948', '2021-04-01', '2021-04-20', 4, '', 3, '2021-03-08', '2021-03-26 10:25:49', '2021-09-28 17:33:54'),
(104, 10, 9, 7, 39, 1, 150000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '709', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-26 10:33:54', '2021-09-28 17:33:54'),
(105, 10, 9, 7, 40, 1, 150000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '744', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-16', '2021-03-26 10:34:38', '2021-09-28 17:33:54'),
(106, 10, 9, 7, 41, 1, 150000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '813', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-28', '2021-03-26 10:35:38', '2021-09-28 17:33:54'),
(107, 10, 9, 7, 42, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '856', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-28', '2021-03-26 10:36:31', '2021-09-28 17:33:54'),
(108, 10, 9, 7, 43, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '870', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-01', '2021-03-26 10:37:23', '2021-09-28 17:33:54'),
(109, 10, 9, 7, 44, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '915', '2021-02-01', '2021-02-20', 4, '', 3, '2021-05-04', '2021-03-26 10:37:58', '2021-09-28 17:33:54'),
(110, 10, 9, 7, 45, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '954', '2021-03-01', '2021-03-20', 4, '', 3, '2021-05-04', '2021-03-26 10:38:26', '2021-09-28 17:33:54'),
(111, 10, 22, 8, 39, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '723', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-26 11:18:03', '2021-09-28 17:33:54'),
(112, 10, 22, 8, 40, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '763', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-20', '2021-03-26 11:18:33', '2021-09-28 17:33:54'),
(113, 10, 22, 8, 41, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '798', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-19', '2021-03-26 11:19:13', '2021-09-28 17:33:54'),
(114, 10, 22, 8, 42, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '844', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-22', '2021-03-26 11:19:42', '2021-09-28 17:33:54'),
(115, 10, 22, 8, 43, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '884', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-20', '2021-03-26 11:20:16', '2021-09-28 17:33:54'),
(116, 10, 22, 8, 44, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '929', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-09', '2021-03-26 11:20:49', '2021-09-28 17:33:54'),
(117, 10, 22, 8, 45, 1, 38195, '[]', 38195, 1, 1, 'Contabilidad Mensual', '968', '2021-03-01', '2021-03-20', 4, '', 3, '2021-05-04', '2021-03-26 11:21:17', '2021-09-28 17:33:54'),
(118, 10, 23, 5, 39, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '725', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-26 11:41:59', '2021-09-28 17:33:54'),
(119, 10, 23, 5, 40, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '765', '2020-10-01', '2020-10-20', 4, '', 3, '2020-11-05', '2021-03-26 11:43:05', '2021-09-28 17:33:54'),
(120, 10, 23, 5, 41, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '800', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-18', '2021-03-26 11:43:51', '2021-09-28 17:33:54'),
(121, 10, 23, 5, 42, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '846', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-18', '2021-03-26 11:56:07', '2021-09-28 17:33:54'),
(122, 10, 23, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '886', '2021-01-01', '2021-01-20', 4, '', 3, '2021-03-23', '2021-03-26 11:56:38', '2021-09-28 17:33:54'),
(123, 10, 23, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '931', '2021-02-01', '2021-02-20', 3, 'Aut Jose ', NULL, NULL, '2021-03-26 11:57:42', '2021-09-28 17:33:54'),
(124, 10, 23, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '970', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-22', '2021-03-26 11:59:41', '2021-09-28 17:33:54'),
(125, 10, 20, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '719', '2020-09-01', '2020-09-20', 4, '', 3, '2020-10-14', '2021-03-26 12:06:47', '2021-09-28 17:33:54'),
(126, 10, 20, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '760', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-20', '2021-03-26 12:07:17', '2021-09-28 17:33:54'),
(127, 10, 20, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '796', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-07', '2021-03-26 12:07:51', '2021-09-28 17:33:54'),
(128, 10, 20, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '842', '2020-12-01', '2020-12-20', 4, '', 3, '2021-01-26', '2021-03-26 12:08:26', '2021-09-28 17:33:54'),
(129, 10, 20, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '882', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-09', '2021-03-26 12:09:00', '2021-09-28 17:33:54'),
(130, 10, 20, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '927', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-09', '2021-03-26 12:09:33', '2021-09-28 17:33:54'),
(131, 10, 20, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '966', '2021-03-01', '2021-03-20', 4, '', 3, '2021-05-04', '2021-03-26 12:09:59', '2021-09-28 17:33:54'),
(132, 10, 12, 3, 39, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '712', '2020-09-01', '2020-09-20', 4, '', 3, '2020-10-19', '2021-03-26 14:34:37', '2021-09-28 17:33:54'),
(133, 10, 12, 3, 40, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '748', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-16', '2021-03-26 14:36:19', '2021-09-28 17:33:54'),
(134, 10, 12, 3, 41, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '787', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-26', '2021-03-26 14:37:30', '2021-09-28 17:33:54'),
(135, 10, 12, 3, 42, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '832', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-07', '2021-03-26 14:38:31', '2021-09-28 17:33:54'),
(136, 10, 12, 3, 43, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '873', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-13', '2021-03-26 14:39:34', '2021-09-28 17:33:54'),
(137, 10, 12, 3, 44, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '918', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-08', '2021-03-26 14:40:32', '2021-09-28 17:33:54'),
(138, 10, 12, 3, 45, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '957', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-11', '2021-03-26 14:41:02', '2021-09-28 17:33:54'),
(139, 10, 18, 6, 39, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '720', '2020-09-01', '2020-09-20', 4, '', 3, '2020-09-29', '2021-03-26 15:23:35', '2021-09-28 17:33:54'),
(140, 10, 18, 6, 40, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '758', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-12', '2021-03-26 15:28:51', '2021-09-28 17:33:54'),
(141, 10, 18, 6, 41, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '794', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-05', '2021-03-26 15:30:18', '2021-09-28 17:33:54'),
(142, 10, 18, 6, 42, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '840', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-11', '2021-03-26 15:31:15', '2021-09-28 17:33:54'),
(143, 10, 18, 6, 43, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '880', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-07', '2021-03-26 15:32:08', '2021-09-28 17:33:54'),
(144, 10, 18, 6, 44, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '925', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-08', '2021-03-26 15:33:27', '2021-09-28 17:33:54'),
(145, 10, 18, 6, 45, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '964', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-16', '2021-03-26 15:34:01', '2021-09-28 17:33:54'),
(146, 10, 19, 1, 39, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '718', '2020-09-01', '2020-09-20', 4, '', 3, '2020-10-15', '2021-03-26 16:32:51', '2021-09-28 17:33:54'),
(147, 10, 19, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '759', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-15', '2021-03-26 16:33:40', '2021-09-28 17:33:54'),
(148, 10, 19, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '795', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-05', '2021-03-26 16:35:04', '2021-09-28 17:33:54'),
(149, 10, 19, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '841', '2020-12-01', '2020-12-20', 4, '', 3, '2021-07-01', '2021-03-26 16:35:46', '2021-09-28 17:33:54'),
(150, 10, 19, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '881', '2021-01-01', '2021-01-20', 4, '', 3, '2021-07-01', '2021-03-26 16:37:04', '2021-09-28 17:33:54'),
(151, 10, 19, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '926', '2021-02-01', '2021-02-20', 4, '', 3, '2021-07-01', '2021-03-26 16:38:00', '2021-09-28 17:33:54'),
(152, 10, 19, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '965', '2021-03-01', '2021-03-20', 4, '', 3, '2021-07-01', '2021-03-26 16:38:30', '2021-09-28 17:33:54'),
(153, 10, 27, 1, 40, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '770', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-15', '2021-03-26 16:56:31', '2021-09-28 17:33:54'),
(154, 10, 27, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '806', '2020-11-01', '2020-11-20', 4, '', 3, '2020-12-10', '2021-03-26 16:57:18', '2021-09-28 17:33:54'),
(155, 10, 27, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '850', '2020-12-01', '2020-12-20', 4, '', 3, '2021-02-05', '2021-03-26 16:58:02', '2021-09-28 17:33:54'),
(156, 10, 27, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '890', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-05', '2021-03-26 16:58:49', '2021-09-28 17:33:54'),
(157, 10, 27, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '934', '2021-02-01', '2021-02-20', 4, '', 3, '2021-03-09', '2021-03-26 16:59:33', '2021-09-28 17:33:54'),
(158, 10, 27, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '973', '2021-03-01', '2021-03-20', 4, '', 3, '2021-04-05', '2021-03-26 17:00:01', '2021-09-28 17:33:54'),
(159, 10, 34, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '897', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-12', '2021-03-26 17:15:11', '2021-09-28 17:33:54'),
(160, 10, 34, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '941', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-15', '2021-03-26 17:15:43', '2021-09-28 17:33:54'),
(161, 10, 34, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '980', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-13', '2021-03-26 17:16:08', '2021-09-28 17:33:54'),
(162, 10, 28, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '807', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-23', '2021-03-26 18:37:09', '2021-09-28 17:33:54'),
(163, 10, 28, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '851', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-23', '2021-03-26 18:37:38', '2021-09-28 17:33:54'),
(164, 10, 28, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '891', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-08', '2021-03-26 18:38:06', '2021-09-28 17:33:54'),
(165, 10, 28, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '935', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-25', '2021-03-26 18:38:38', '2021-09-28 17:33:54'),
(166, 10, 28, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '974', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-04', '2021-03-26 18:38:59', '2021-09-28 17:33:54'),
(167, 10, 30, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '853', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-16', '2021-03-26 18:40:48', '2021-09-28 17:33:54'),
(168, 10, 30, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '893', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-13', '2021-03-26 18:41:17', '2021-09-28 17:33:54'),
(169, 10, 30, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '937', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-22', '2021-03-26 18:41:48', '2021-09-28 17:33:54'),
(170, 10, 30, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '976', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-18', '2021-03-26 18:42:25', '2021-09-28 17:33:54'),
(171, 10, 33, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '896', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-19', '2021-03-26 18:44:16', '2021-09-28 17:33:54'),
(172, 10, 33, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '940', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-22', '2021-03-26 18:44:55', '2021-09-28 17:33:54'),
(173, 10, 33, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '979', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-30', '2021-03-26 18:45:20', '2021-09-28 17:33:54'),
(174, 10, 35, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '943', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-04', '2021-03-26 18:46:30', '2021-09-28 17:33:54'),
(175, 10, 35, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '981', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-08', '2021-03-26 18:46:57', '2021-09-28 17:33:54'),
(176, 10, 32, 5, 43, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '895', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-29', '2021-03-30 12:50:49', '2021-09-28 17:33:54'),
(177, 10, 32, 5, 44, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '939', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-03', '2021-03-30 12:51:46', '2021-09-28 17:33:54'),
(178, 10, 32, 5, 45, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '978', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-02', '2021-03-30 12:52:34', '2021-09-28 17:33:54'),
(179, 10, 39, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '984', '2021-03-01', '2021-03-20', 4, '', 3, '2021-04-12', '2021-03-30 12:56:29', '2021-09-28 17:33:54'),
(180, 10, 40, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '985', '2021-03-01', '2021-03-20', 4, '', 3, '2021-06-08', '2021-03-30 12:57:20', '2021-09-28 17:33:54'),
(181, 10, 43, 1, 45, 1, 30000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '988', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-04', '2021-03-30 12:58:13', '2021-09-28 17:33:54'),
(182, 10, 41, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '986', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-16', '2021-03-30 12:59:13', '2021-09-28 17:33:54'),
(183, 10, 37, 10, 43, 1, 55000, '[]', 55000, 1, 1, 'Contabilidad Mensual', '900', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-20', '2021-03-30 14:08:35', '2021-09-28 17:33:54'),
(184, 10, 37, 10, 44, 1, 55000, '[]', 55000, 1, 1, 'Contabilidad Mensual', '942', '2021-02-01', '2021-02-20', 4, '', 3, '2021-01-20', '2021-03-30 14:09:11', '2021-09-28 17:33:54'),
(185, 10, 37, 10, 45, 1, 55000, '[]', 55000, 1, 1, 'Contabilidad Mensual', '982', '2021-03-01', '2021-03-20', 4, '', 3, '2021-02-22', '2021-03-30 14:09:39', '2021-09-28 17:33:54'),
(186, 10, 42, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '987', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-16', '2021-03-30 14:12:17', '2021-09-28 17:33:54'),
(187, 10, 44, 11, 45, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '989', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-23', '2021-03-30 14:13:32', '2021-09-28 17:33:54'),
(188, 10, 31, 1, 41, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '817', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-23', '2021-03-30 14:14:54', '2021-09-28 17:33:54'),
(189, 10, 31, 1, 42, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '854', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-08', '2021-03-30 14:15:23', '2021-09-28 17:33:54'),
(190, 10, 31, 1, 43, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '894', '2021-01-01', '2021-01-20', 4, '', 3, '2021-01-29', '2021-03-30 14:16:11', '2021-09-28 17:33:54'),
(191, 10, 31, 1, 44, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '938', '2021-02-01', '2021-02-20', 4, '', 3, '2021-04-13', '2021-03-30 15:04:47', '2021-09-28 17:33:54'),
(192, 10, 31, 1, 45, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '977', '2021-03-01', '2021-03-20', 4, '', 3, '2021-04-12', '2021-03-30 15:05:23', '2021-09-28 17:33:54'),
(193, 10, 1, 5, 39, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '700', '2020-09-01', '2020-09-20', 4, '', 3, '2021-03-30', '2021-03-30 15:14:03', '2021-09-28 17:33:54'),
(194, 10, 1, 5, 40, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '734', '2020-10-01', '2020-10-20', 4, '', 3, '2020-10-20', '2021-03-30 15:14:41', '2021-09-28 17:33:54'),
(195, 10, 1, 5, 41, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '775', '2020-11-01', '2020-11-20', 4, '', 3, '2020-11-20', '2021-03-30 15:15:30', '2021-09-28 17:33:54'),
(196, 10, 1, 5, 42, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '820', '2020-12-01', '2020-12-20', 4, '', 3, '2020-12-20', '2021-03-30 15:16:33', '2021-09-28 17:33:54'),
(197, 10, 1, 5, 43, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '861', '2021-01-01', '2021-01-20', 4, '', 3, '2021-02-20', '2021-03-30 15:17:46', '2021-09-28 17:33:54'),
(198, 10, 1, 5, 44, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '907', '2021-02-01', '2021-02-20', 4, '', 3, '2021-02-20', '2021-03-30 15:18:41', '2021-09-28 17:33:54'),
(199, 10, 1, 5, 45, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '945', '2021-03-01', '2021-03-20', 4, '', 3, '2021-03-20', '2021-03-30 15:19:43', '2021-09-28 17:33:54'),
(200, 9, 1, 5, 46, 1, 20000, '[]', 0, 1, 1, 'Contabilidad Mensual', '996', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-12', '2021-04-05 12:16:30', '2021-09-28 17:33:54'),
(201, 9, 2, 2, 46, 1, 102835, '[]', 102915, 1, 1, 'Contabilidad Mensual', '997', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-05', '2021-04-05 12:37:14', '2021-09-28 17:33:54'),
(202, 9, 3, 4, 46, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '998', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-20', '2021-04-05 12:43:23', '2021-09-28 17:33:54'),
(203, 9, 4, 8, 46, 1, 38195, '[]', 38226, 1, 1, 'Contabilidad Mensual', '999', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Abril 2021', 3, '2021-05-19', '2021-04-05 12:52:43', '2021-09-28 17:33:54'),
(204, 9, 5, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1000', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-05-06', '2021-04-05 14:17:27', '2021-09-28 17:33:54'),
(205, 9, 6, 6, 46, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1001', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-09', '2021-04-05 14:25:33', '2021-09-28 17:33:54'),
(206, 9, 7, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1002', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-13', '2021-04-05 14:29:08', '2021-09-28 17:33:54'),
(207, 9, 8, NULL, 46, 1, NULL, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1004', '2021-04-05', '2021-04-20', 2, 'Servicios Contables Periodo Marzo 2021', NULL, NULL, '2021-04-05 14:47:01', '2021-09-28 17:33:54'),
(208, 9, 9, 7, 46, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1005', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Marzo 2021', 3, '2021-05-04', '2021-04-05 14:56:58', '2021-09-28 17:33:54'),
(209, 9, 10, 1, 46, 1, 30000, '[]', 25000, 1, 1, 'Contabilidad Mensual', '1006', '2021-04-05', '2021-04-20', 2, 'Servicios Contables Periodo Marzo 2021', NULL, NULL, '2021-04-05 14:59:32', '2021-09-28 17:33:54'),
(210, 9, 11, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1007', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-06-02', '2021-04-05 15:05:55', '2021-09-28 17:33:54'),
(211, 9, 12, 3, 46, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1008', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Marzo 2021', 3, '2021-04-16', '2021-04-05 16:49:15', '2021-09-28 17:33:54'),
(212, 9, 13, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1009', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-04-13', '2021-04-05 16:54:06', '2021-09-28 17:33:54'),
(213, 9, 14, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1010', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Periodo Marzo 2021', 3, '2021-05-12', '2021-04-05 17:00:15', '2021-09-28 17:33:54'),
(214, 9, 15, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1011', '2021-04-05', '2021-04-20', 3, 'Servicios Contables Marzo 2021', NULL, NULL, '2021-04-05 17:05:56', '2021-09-28 17:33:54'),
(215, 9, 16, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1012', '2021-04-05', '2021-04-20', 4, 'Servicios Contables Marzo 2021', 3, '2021-04-12', '2021-04-05 17:06:34', '2021-09-28 17:33:54'),
(216, 10, 1, 5, 56, 1, 20000, '[]', 0, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-04-12', '2021-04-06 12:04:07', '2021-09-28 17:33:54'),
(217, 10, 1, 5, 56, 1, 20000, '[]', 0, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-04-12', '2021-04-06 12:06:02', '2021-09-28 17:33:54'),
(218, 10, 2, 2, 56, 1, 102914, '[]', 85000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, 'Incluye\r\nGrupo Indus\r\nMakarena', 3, '2021-02-05', '2021-04-06 12:09:09', '2021-09-28 17:33:54'),
(219, 10, 2, 2, 56, 1, 102914, '[]', 85000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, 'incluye\r\nGrupo indus\r\nmakarena', 3, '2021-03-05', '2021-04-06 12:09:45', '2021-09-28 17:33:54'),
(220, 10, 3, 4, 56, 1, 26998, '[]', 32500, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1143', '2021-02-01', '2021-02-05', 4, '', 3, '2021-07-20', '2021-04-06 12:28:34', '2021-09-28 17:33:54'),
(221, 10, 3, 4, 56, 1, 26998, '[]', 32500, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1143', '2021-03-01', '2021-03-05', 4, '', 3, '2021-07-20', '2021-04-06 12:29:04', '2021-09-28 17:33:54'),
(222, 10, 4, 8, 56, 1, 38225, '[]', 47500, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-08', '2021-04-06 12:33:39', '2021-09-28 17:33:54'),
(223, 10, 4, 8, 56, 1, 38225, '[]', 47500, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-08', '2021-04-06 12:34:12', '2021-09-28 17:33:54'),
(224, 8, 46, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '991', '2021-03-01', '2021-03-20', 4, 'cobro por adelantado ', 3, '2021-03-23', '2021-04-06 12:35:58', '2021-09-28 17:33:54'),
(225, 10, 5, 1, 56, 1, 30000, '[]', 35000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-08', '2021-04-06 12:37:41', '2021-09-28 17:33:54'),
(226, 10, 5, 1, 56, 1, 30000, '[]', 35000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-10', '2021-04-06 12:38:09', '2021-09-28 17:33:54'),
(227, 10, 6, 6, 56, 1, 40000, '[]', 40000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-11', '2021-04-06 12:45:19', '2021-09-28 17:33:54'),
(228, 10, 6, 6, 56, 1, 40000, '[]', 40000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-11', '2021-04-06 12:46:00', '2021-09-28 17:33:54'),
(229, 10, 7, 1, 56, 1, 30000, '[]', 35000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-01-28', '2021-04-06 12:48:34', '2021-09-28 17:33:54'),
(230, 10, 7, 1, 56, 1, 30000, '[]', 35000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 3, 'Anulada por Convenio con cliente. ', NULL, NULL, '2021-04-06 12:49:30', '2021-09-28 17:33:54'),
(231, 10, 8, NULL, 56, 1, NULL, '[]', 30000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-10', '2021-04-06 14:31:46', '2021-09-28 17:33:54'),
(232, 10, 8, NULL, 56, 1, NULL, '[]', 30000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-10', '2021-04-06 14:32:35', '2021-09-28 17:33:54'),
(233, 9, 17, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1013', '2021-04-06', '2021-04-20', 2, 'servicios contables periodo marzo 2021', NULL, NULL, '2021-04-06 14:38:33', '2021-09-28 17:33:54'),
(234, 10, 10, 1, 56, 1, 30000, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1146', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-06 14:42:32', '2021-09-28 17:33:54'),
(235, 10, 10, 1, 56, 1, 30000, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1146', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-06 14:43:37', '2021-09-28 17:33:54'),
(236, 9, 18, 6, 46, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1014', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-07', '2021-04-06 14:46:38', '2021-09-28 17:33:54'),
(237, 10, 11, 1, 56, 1, 30000, '[]', 10000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1150', '2021-02-01', '2021-02-05', 2, 'Honorarios del mes 30.000\r\nCliente Abona 20.000 con fecha 02-06-2021\r\nSaldo 10.000.- \r\nAl Momento de registrar el pago debe quedar en 30 mil. ', NULL, NULL, '2021-04-06 14:46:54', '2021-09-28 17:33:54'),
(238, 10, 11, 1, 56, 1, 30000, '[]', 30000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1150', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-06 14:47:37', '2021-09-28 17:33:54'),
(239, 9, 19, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1015', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-07-01', '2021-04-06 14:49:27', '2021-09-28 17:33:54'),
(240, 9, 20, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1016', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-05-04', '2021-04-06 14:54:50', '2021-09-28 17:33:54'),
(241, 10, 12, 3, 56, 1, 60000, '[]', 120000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1154', '2021-02-01', '2021-02-05', 4, 'Incluye:\r\narturo echeverria barrera\r\nsoc. inm. echeverria y bernales spa', 3, '2021-08-19', '2021-04-06 14:57:25', '2021-09-28 17:33:54'),
(242, 9, 21, NULL, 46, 1, NULL, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1017', '2021-04-06', '2021-04-20', 2, 'servicios contables marzo 2021', NULL, NULL, '2021-04-06 14:58:03', '2021-09-28 17:33:54'),
(243, 10, 12, 3, 56, 1, 60000, '[]', 120000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1154', '2021-03-01', '2021-03-05', 4, 'Incluye:\r\narturo echeverria barrera\r\nsoc. inm. echeverria y bernales spa', 3, '2021-08-19', '2021-04-06 14:58:28', '2021-09-28 17:33:54'),
(244, 10, 13, 1, 56, 1, 30000, '[]', 40000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-15', '2021-04-06 15:00:06', '2021-09-28 17:33:54'),
(245, 10, 13, 1, 56, 1, 30000, '[]', 40000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-12', '2021-04-06 15:00:48', '2021-09-28 17:33:54'),
(246, 9, 22, 8, 46, 1, 38225, '[]', 38225, 1, 1, 'Contabilidad Mensual', '1018', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-05-04', '2021-04-06 15:05:35', '2021-09-28 17:33:54'),
(247, 10, 14, 1, 56, 1, 30000, '[]', 35000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-24', '2021-04-06 15:11:59', '2021-09-28 17:33:54'),
(248, 10, 14, 1, 56, 1, 30000, '[]', 35000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-24', '2021-04-06 15:12:44', '2021-09-28 17:33:54'),
(249, 9, 23, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1019', '2021-04-06', '2021-04-20', 3, 'servicios contables periodo marzo 2021\n\nAnulada por acuerdo con cliente ', NULL, NULL, '2021-04-06 15:25:28', '2021-09-28 17:33:54'),
(250, 9, 26, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1020', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-27', '2021-04-06 15:28:50', '2021-09-28 17:33:54'),
(251, 10, 15, 5, 56, 1, 20000, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 3, 'Anulada por acuerdo con cliente ', NULL, NULL, '2021-04-06 15:29:32', '2021-09-28 17:33:54'),
(252, 10, 15, 5, 56, 1, 20000, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 3, 'Anulada por acuerdo con cliente ', NULL, NULL, '2021-04-06 15:30:04', '2021-09-28 17:33:54'),
(253, 10, 16, 5, 56, 1, 20000, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-09', '2021-04-06 15:30:54', '2021-09-28 17:33:54'),
(254, 10, 16, 5, 56, 1, 20000, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-02-09', '2021-04-06 15:31:24', '2021-09-28 17:33:54'),
(255, 9, 27, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1021', '2021-04-06', '2021-04-20', 2, 'servicios contables periodo marzo 2021', NULL, NULL, '2021-04-06 15:33:19', '2021-09-28 17:33:54'),
(256, 9, 28, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1022', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-20', '2021-04-06 15:35:44', '2021-09-28 17:33:54'),
(257, 9, 29, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1023', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-19', '2021-04-06 15:39:08', '2021-09-28 17:33:54'),
(258, 9, 30, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1024', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-08', '2021-04-06 15:42:20', '2021-09-28 17:33:54'),
(259, 10, 17, 1, 56, 1, 30000, '[]', 32500, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1147', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-06 15:46:45', '2021-09-28 17:33:54'),
(260, 10, 17, 1, 56, 1, 30000, '[]', 32500, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1147', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-06 15:47:28', '2021-09-28 17:33:54'),
(261, 9, 31, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1025', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-12', '2021-04-06 15:54:22', '2021-09-28 17:33:54'),
(262, 9, 32, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1026', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-07', '2021-04-06 15:59:38', '2021-09-28 17:33:54'),
(263, 9, 33, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1027', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-20', '2021-04-06 16:07:16', '2021-09-28 17:33:54'),
(264, 9, 34, 5, 46, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1028', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-16', '2021-04-06 16:13:45', '2021-09-28 17:33:54'),
(265, 9, 35, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1029', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-07', '2021-04-06 16:19:08', '2021-09-28 17:33:54'),
(266, 9, 37, 10, 46, 1, 55000, '[]', 55000, 1, 1, 'Contabilidad Mensual', '1030', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-03-22', '2021-04-06 16:27:04', '2021-09-28 17:33:54'),
(267, 9, 39, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1031', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-12', '2021-04-06 16:31:43', '2021-09-28 17:33:54'),
(268, 9, 40, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1032', '2021-04-06', '2021-04-20', 2, 'servicios contables marzo 2021', NULL, NULL, '2021-04-06 16:36:33', '2021-09-28 17:33:54');
INSERT INTO `facturas` (`idFactura`, `idUsuario`, `idEmpresa`, `idPlan`, `idPeriodoContable`, `idCentroCosto`, `valorPlan`, `cobros_adicionales`, `valorCobrar`, `con_movimiento`, `idServicio`, `servicio`, `numeroFactura`, `fechaCobro`, `fechaVencimiento`, `idStatus`, `observacion`, `idMetodoPago`, `fechaPago`, `fecha_registro`, `fecha_modificacion`) VALUES
(269, 9, 41, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1033', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-06-08', '2021-04-06 16:46:44', '2021-09-28 17:33:54'),
(270, 9, 42, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1034', '2021-04-06', '2021-04-20', 2, 'servicios contables periodo marzo 2021', NULL, NULL, '2021-04-06 16:49:09', '2021-09-28 17:33:54'),
(271, 9, 43, 1, 46, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1035', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-20', '2021-04-06 16:55:03', '2021-09-28 17:33:54'),
(272, 9, 44, 11, 46, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1036', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-05-05', '2021-04-06 16:57:37', '2021-09-28 17:33:54'),
(273, 9, 46, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1037', '2021-04-06', '2021-04-20', 3, 'Anulada autorizada por Jose', NULL, NULL, '2021-04-06 17:00:08', '2021-09-28 17:33:54'),
(274, 9, 36, 6, 46, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1038', '2021-04-06', '2021-04-20', 2, 'servicios contables periodo marzo 2021', NULL, NULL, '2021-04-06 17:04:04', '2021-09-28 17:33:54'),
(275, 9, 38, 12, 46, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1039', '2021-04-06', '2021-04-20', 4, 'servicios contables periodo marzo 2021', 3, '2021-04-07', '2021-04-06 17:06:16', '2021-09-28 17:33:54'),
(276, 10, 19, 1, 56, 1, 30000, '[]', 30000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-13', '2021-04-06 17:35:44', '2021-09-28 17:33:54'),
(277, 10, 19, 1, 56, 1, 30000, '[]', 30000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-13', '2021-04-06 17:36:11', '2021-09-28 17:33:54'),
(278, 10, 20, 1, 56, 1, 30000, '[]', 30000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-11', '2021-04-06 17:55:05', '2021-09-28 17:33:54'),
(279, 10, 20, 1, 56, 1, 30000, '[]', 30000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-11', '2021-04-06 17:55:35', '2021-09-28 17:33:54'),
(280, 10, 22, 8, 56, 1, 38225, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-09', '2021-04-06 17:58:06', '2021-09-28 17:33:54'),
(281, 10, 22, 8, 56, 1, 38225, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-16', '2021-04-06 17:59:18', '2021-09-28 17:33:54'),
(282, 10, 23, 5, 56, 1, 20000, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 3, 'Anulada por acuerdo con cliente ', NULL, NULL, '2021-04-06 18:36:06', '2021-09-28 17:33:54'),
(283, 10, 23, 5, 56, 1, 20000, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 3, 'Anulada por acuerdo con cliente ', NULL, NULL, '2021-04-06 18:36:35', '2021-09-28 17:33:54'),
(284, 10, 25, 9, 56, 1, 0, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 3, 'ANULADO POR PLAN GRUPAL', NULL, NULL, '2021-04-06 18:37:37', '2021-09-28 17:33:54'),
(285, 10, 25, 9, 56, 1, 0, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 3, 'ANULADAS PLAN GRUPAL', NULL, NULL, '2021-04-06 18:38:10', '2021-09-28 17:33:54'),
(286, 10, 26, 1, 56, 1, 30000, '[]', 25000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-01-25', '2021-04-06 18:41:29', '2021-09-28 17:33:54'),
(287, 10, 26, 1, 56, 1, 30000, '[]', 25000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-01-25', '2021-04-06 18:42:03', '2021-09-28 17:33:54'),
(288, 10, 27, 1, 56, 1, 30000, '[]', 20000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-04-05', '2021-04-06 18:47:21', '2021-09-28 17:33:54'),
(289, 10, 27, 1, 56, 1, 30000, '[]', 20000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1155', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-06 18:47:55', '2021-09-28 17:33:54'),
(290, 10, 28, 1, 56, 1, 30000, '[]', 35000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-08', '2021-04-06 18:53:50', '2021-09-28 17:33:54'),
(291, 10, 28, 1, 56, 1, 30000, '[]', 35000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-09', '2021-04-06 18:54:19', '2021-09-28 17:33:54'),
(292, 10, 30, 1, 56, 1, 30000, '[]', 35000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-03-10', '2021-04-06 18:58:42', '2021-09-28 17:33:54'),
(293, 10, 30, 1, 56, 1, 30000, '[]', 35000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-10', '2021-04-06 18:59:06', '2021-09-28 17:33:54'),
(294, 10, 31, 1, 56, 1, 30000, '[]', 30000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-04-13', '2021-04-07 12:40:29', '2021-09-28 17:33:54'),
(295, 10, 31, 1, 56, 1, 30000, '[]', 30000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-04-13', '2021-04-07 12:40:49', '2021-09-28 17:33:54'),
(296, 10, 33, 5, 56, 1, 20000, '[]', 10000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1144', '2021-02-01', '2021-02-05', 4, '', 3, '2021-07-20', '2021-04-07 12:41:25', '2021-09-28 17:33:54'),
(297, 10, 33, 5, 56, 1, 20000, '[]', 10000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1144', '2021-03-01', '2021-03-05', 4, '', 3, '2021-07-20', '2021-04-07 12:41:49', '2021-09-28 17:33:54'),
(298, 10, 36, 6, 56, 1, 40000, '[]', 70000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-07 12:42:37', '2021-09-28 17:33:54'),
(299, 10, 36, 6, 56, 1, 40000, '[]', 70000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-07 12:43:06', '2021-09-28 17:33:54'),
(300, 10, 37, 10, 56, 1, 55000, '[]', 37500, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-02-05', '2021-04-07 12:43:46', '2021-09-28 17:33:54'),
(301, 10, 37, 10, 56, 1, 55000, '[]', 37500, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-05', '2021-04-07 12:44:11', '2021-09-28 17:33:54'),
(302, 10, 38, 12, 56, 1, 120000, '[]', 0, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 4, '', 3, '2021-04-07', '2021-04-07 12:45:09', '2021-09-28 17:33:54'),
(303, 10, 38, 12, 56, 1, 120000, '[]', 0, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 4, '', 3, '2021-04-07', '2021-04-07 12:45:38', '2021-09-28 17:33:54'),
(304, 10, 39, 1, 56, 1, 30000, '[]', 20000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1043', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-07 14:10:45', '2021-09-28 17:33:54'),
(305, 10, 39, 1, 56, 1, 30000, '[]', 20000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1044', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-07 14:11:16', '2021-09-28 17:33:54'),
(306, 10, 40, 1, 56, 1, 30000, '[]', 15000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1156', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-07 14:12:31', '2021-09-28 17:33:54'),
(307, 10, 40, 1, 56, 1, 30000, '[]', 15000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1156', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-07 14:12:54', '2021-09-28 17:33:54'),
(308, 10, 41, 1, 56, 1, 30000, '[]', 15000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '1157', '2021-02-01', '2021-02-05', 2, '', NULL, NULL, '2021-04-07 14:13:27', '2021-09-28 17:33:54'),
(309, 10, 41, 1, 56, 1, 30000, '[]', 15000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '1157', '2021-03-01', '2021-03-05', 2, '', NULL, NULL, '2021-04-07 14:13:52', '2021-09-28 17:33:54'),
(310, 10, 43, 1, 56, 1, 30000, '[]', 10000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '00', '2021-02-01', '2021-02-05', 3, 'ANULADO POR CONVENIO\n', NULL, NULL, '2021-04-07 14:14:26', '2021-09-28 17:33:54'),
(311, 10, 43, 1, 56, 1, 30000, '[]', 10000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '00', '2021-03-01', '2021-03-05', 3, 'ANULADA POR CONVENIO', NULL, NULL, '2021-04-07 14:14:56', '2021-09-28 17:33:54'),
(312, 10, 44, 11, 56, 1, 45000, '[]', 45000, 1, 5, 'Operacion Renta AT 2021 - 50% Inicial', '990', '2021-02-01', '2021-02-05', 4, 'incluye \r\nirma elena contreras lara', 3, '2021-03-23', '2021-04-07 14:32:26', '2021-09-28 17:33:54'),
(313, 10, 44, 11, 56, 1, 45000, '[]', 45000, 1, 6, 'Operacion Renta AT 2021 - 50% Final	', '990', '2021-03-01', '2021-03-05', 4, '', 3, '2021-03-23', '2021-04-07 14:34:13', '2021-09-28 17:33:54'),
(314, 10, 1, 5, 32, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-02-01', '2020-02-20', 4, '', 3, '2020-11-03', '2021-04-13 15:16:51', '2021-09-28 17:33:54'),
(315, 10, 1, 5, 33, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-03-01', '2020-03-20', 4, '', 3, '2020-11-03', '2021-04-13 15:40:12', '2021-09-28 17:33:54'),
(316, 10, 1, 5, 34, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-04-01', '2020-04-20', 4, '', 3, '2020-11-03', '2021-04-13 15:42:14', '2021-09-28 17:33:54'),
(317, 10, 1, 5, 35, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-05-01', '2020-05-20', 4, '', 3, '2020-11-03', '2021-04-13 15:43:48', '2021-09-28 17:33:54'),
(318, 10, 1, 5, 36, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-06-01', '2020-06-20', 4, '', 3, '2020-11-03', '2021-04-13 15:45:12', '2021-09-28 17:33:54'),
(319, 10, 1, 5, 37, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-07-01', '2020-07-20', 4, '', 3, '2020-11-03', '2021-04-13 15:47:08', '2021-09-28 17:33:54'),
(320, 10, 1, 5, 38, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '11', '2020-08-01', '2020-08-20', 4, '', 3, '2020-11-03', '2021-04-13 15:48:45', '2021-09-28 17:33:54'),
(321, 10, 2, 2, 32, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-02-01', '2020-02-20', 4, '', 3, '2020-09-29', '2021-04-13 15:55:29', '2021-09-28 17:33:54'),
(322, 10, 2, 2, 33, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-03-01', '2020-03-20', 4, '', 3, '2020-09-29', '2021-04-13 16:03:25', '2021-09-28 17:33:54'),
(323, 10, 2, 2, 34, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-04-01', '2020-04-20', 4, '', 3, '2020-09-29', '2021-04-13 16:04:19', '2021-09-28 17:33:54'),
(324, 10, 2, 2, 35, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-05-01', '2020-05-20', 4, '', 3, '2020-09-29', '2021-04-13 16:07:33', '2021-09-28 17:33:54'),
(325, 10, 2, 2, 36, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-06-01', '2020-06-20', 4, '', 3, '2020-09-29', '2021-04-13 16:10:24', '2021-09-28 17:33:54'),
(326, 10, 2, 2, 37, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-07-01', '2020-07-20', 4, '', 3, '2020-09-29', '2021-04-13 16:13:21', '2021-09-28 17:33:54'),
(327, 10, 2, 2, 38, 1, 102914, '[]', 102914, 1, 1, 'Contabilidad Mensual', '11', '2020-08-01', '2020-08-20', 4, '', 3, '2020-09-29', '2021-04-13 16:14:38', '2021-09-28 17:33:54'),
(328, 10, 3, 4, 32, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '11', '2020-02-01', '2020-02-20', 4, '', 3, '2020-09-29', '2021-04-13 16:26:13', '2021-09-28 17:33:54'),
(329, 10, 3, 4, 33, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '11', '2020-03-02', '2020-03-20', 4, '', 3, '2020-09-29', '2021-04-13 16:30:00', '2021-09-28 17:33:54'),
(330, 10, 3, 4, 34, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '11', '2020-04-01', '2020-04-20', 4, '', 3, '2020-09-29', '2021-04-13 16:31:04', '2021-09-28 17:33:54'),
(331, 11, 36, 6, 1, 1, 40000, '[]', 175000, 1, 8, 'Regularización Empresa', '901', '2021-01-21', '2021-02-21', 4, '', 3, '2021-01-21', '2021-04-27 10:46:40', '2021-09-28 17:33:54'),
(332, 11, 36, 6, 1, 1, 40000, '[]', 175000, 1, 8, 'Regularización Empresa', '901', '2021-01-21', '2021-03-21', 2, '', NULL, NULL, '2021-04-27 10:48:01', '2021-09-28 17:33:54'),
(333, 11, 22, 8, 1, 4, 38225, '[]', 150000, 1, 9, 'Cambio Societario - SpA', '1040', '2021-04-27', '2021-05-15', 4, '', 3, '2021-04-29', '2021-04-27 17:32:13', '2021-09-28 17:33:54'),
(334, 11, 49, 15, 1, 1, 38000, '[]', 40000, 1, 8, 'Regularización Empresa', '1041', '2021-04-27', '2021-04-27', 4, '', 3, '2021-04-27', '2021-04-27 18:06:01', '2021-09-28 17:33:54'),
(335, 11, 20, 1, 1, 1, 30000, '[]', 15000, 1, 8, 'Regularización Empresa', '1042', '2021-04-29', '2021-04-30', 4, 'OPERACION RENTA ADICIONAL SOLICITADA POR EL CLIENTE EN LLAMADA TELEFONICA. ', 3, '2021-05-04', '2021-04-29 14:58:19', '2021-09-28 17:33:54'),
(336, 11, 7, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1045', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-03', '2021-05-03 12:11:34', '2021-09-28 17:33:54'),
(337, 11, 8, NULL, 47, 1, NULL, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1046', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 12:27:10', '2021-09-28 17:33:54'),
(338, 11, 9, 7, 47, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1047', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-04', '2021-05-03 12:33:52', '2021-09-28 17:33:54'),
(339, 11, 1, 5, 35, 1, 20000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1048', '2021-05-03', '2021-05-20', 4, '', 3, '2021-06-09', '2021-05-03 12:47:42', '2021-09-28 17:33:54'),
(340, 11, 2, 2, 47, 1, 103243, '[]', 103243, 1, 1, 'Contabilidad Mensual', '1049', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-04', '2021-05-03 13:00:54', '2021-09-28 17:33:54'),
(341, 11, 3, 4, 47, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1050', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-20', '2021-05-03 13:10:05', '2021-09-28 17:33:54'),
(342, 11, 4, 8, 48, 1, 38347, '[]', 38347, 1, 1, 'Contabilidad Mensual', '1051', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-19', '2021-05-03 13:16:45', '2021-09-28 17:33:54'),
(343, 11, 5, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1052', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-06', '2021-05-03 13:22:35', '2021-09-28 17:33:54'),
(344, 11, 6, 6, 47, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1053', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-07', '2021-05-03 13:30:41', '2021-09-28 17:33:54'),
(345, 11, 10, 1, 47, 1, 30000, '[]', 25000, 1, 1, 'Contabilidad Mensual', '1054', '2021-05-03', '2021-05-20', 2, 'Factura por 30.000, se realiza NC por 5.000 para ajustar valor Folio 35', NULL, NULL, '2021-05-03 13:42:28', '2021-09-28 17:33:54'),
(346, 11, 11, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1055', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 14:56:20', '2021-09-28 17:33:54'),
(347, 11, 12, 3, 47, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1056', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-06', '2021-05-03 15:04:57', '2021-09-28 17:33:54'),
(348, 11, 13, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1058', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-11', '2021-05-03 15:10:29', '2021-09-28 17:33:54'),
(349, 11, 14, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1057', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-20', '2021-05-03 15:19:02', '2021-09-28 17:33:54'),
(350, 11, 15, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1059', '2021-05-03', '2021-05-20', 4, '', 3, '2021-07-09', '2021-05-03 15:26:40', '2021-09-28 17:33:54'),
(351, 11, 16, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1060', '2021-05-03', '2021-05-20', 4, '', 3, '2021-06-17', '2021-05-03 15:34:15', '2021-09-28 17:33:54'),
(352, 11, 17, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1061', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 15:39:12', '2021-09-28 17:33:54'),
(353, 11, 18, 6, 47, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1062', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-03', '2021-05-03 15:44:08', '2021-09-28 17:33:54'),
(354, 11, 19, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1063', '2021-05-03', '2021-05-20', 4, '', 3, '2021-07-01', '2021-05-03 15:51:06', '2021-09-28 17:33:54'),
(355, 11, 20, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1064', '2021-05-03', '2021-05-20', 4, '', 3, '2021-06-10', '2021-05-03 15:55:27', '2021-09-28 17:33:54'),
(356, 11, 21, NULL, 47, 1, NULL, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1065', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 16:01:22', '2021-09-28 17:33:54'),
(357, 11, 22, 8, 47, 1, 38347, '[]', 38347, 1, 1, 'Contabilidad Mensual', '1066', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-04', '2021-05-03 16:04:22', '2021-09-28 17:33:54'),
(358, 11, 23, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1067', '2021-05-03', '2021-05-20', 4, '', 3, '2021-07-09', '2021-05-03 16:15:20', '2021-09-28 17:33:54'),
(359, 11, 26, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1068', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-03', '2021-05-03 16:21:43', '2021-09-28 17:33:54'),
(360, 11, 27, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1069', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 16:28:23', '2021-09-28 17:33:54'),
(361, 11, 28, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1070', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-11', '2021-05-03 16:31:49', '2021-09-28 17:33:54'),
(362, 11, 29, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1071', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-20', '2021-05-03 16:36:02', '2021-09-28 17:33:54'),
(363, 11, 30, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1072', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-07', '2021-05-03 16:40:38', '2021-09-28 17:33:54'),
(364, 11, 31, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1073', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-04', '2021-05-03 16:44:01', '2021-09-28 17:33:54'),
(365, 11, 32, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1074', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-07', '2021-05-03 16:52:44', '2021-09-28 17:33:54'),
(366, 11, 33, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1075', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-20', '2021-05-03 16:57:51', '2021-09-28 17:33:54'),
(367, 11, 34, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1076', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-10', '2021-05-03 17:02:54', '2021-09-28 17:33:54'),
(368, 11, 35, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1077', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-03', '2021-05-03 17:19:01', '2021-09-28 17:33:54'),
(369, 11, 37, 10, 47, 1, 55000, '[]', 55000, 1, 1, 'Contabilidad Mensual', '1078', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-03', '2021-05-03 17:21:06', '2021-09-28 17:33:54'),
(370, 11, 38, 12, 47, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1079', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-04', '2021-05-03 17:25:57', '2021-09-28 17:33:54'),
(371, 11, 39, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1080', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 17:29:58', '2021-09-28 17:33:54'),
(372, 11, 40, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1081', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 17:33:48', '2021-09-28 17:33:54'),
(373, 11, 41, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1082', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 17:37:46', '2021-09-28 17:33:54'),
(374, 11, 42, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1083', '2021-05-03', '2021-05-20', 2, '', NULL, NULL, '2021-05-03 17:42:22', '2021-09-28 17:33:54'),
(375, 11, 43, 1, 47, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1084', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-11', '2021-05-03 17:47:57', '2021-09-28 17:33:54'),
(376, 11, 44, 11, 47, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1085', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-05', '2021-05-03 17:53:20', '2021-09-28 17:33:54'),
(377, 11, 46, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1086', '2021-05-03', '2021-05-20', 4, '', 3, '2021-05-05', '2021-05-03 17:58:25', '2021-09-28 17:33:54'),
(378, 11, 47, 5, 47, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1087', '2021-05-03', '2021-05-20', 3, 'ERROR ', NULL, NULL, '2021-05-03 18:31:23', '2021-09-28 17:33:54'),
(379, 8, 50, 14, 47, 1, 15000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1087', '2021-05-04', '2021-05-20', 4, 'FACTURA POR 20.000 PERO SE EMITE DESCUENTO DE 5 MIL \r\nTOTAL A PAGAR 15.000', 3, '2021-05-19', '2021-05-04 10:32:44', '2021-09-28 17:33:54'),
(380, 11, 52, NULL, 1, 1, NULL, '[]', 39990, 1, 1, 'Contabilidad Mensual', '1088', '2021-05-06', '2021-05-20', 4, '', 3, '2021-05-07', '2021-05-06 11:24:18', '2021-09-28 17:33:54'),
(381, 11, 54, NULL, 57, 1, NULL, '[]', 25000, 1, 8, 'Regularización Empresa', '1090', '2021-05-11', '2021-05-20', 4, '50% inicial ', 3, '2021-05-20', '2021-05-17 10:33:45', '2021-09-28 17:33:54'),
(382, 11, 1, 17, 48, 1, 10000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1093', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-09', '2021-06-01 13:15:44', '2021-09-28 17:33:54'),
(383, 11, 2, 2, 48, 1, 103659, '[]', 103659, 1, 1, 'Contabilidad Mensual', '1094 ', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-03', '2021-06-01 13:26:32', '2021-09-28 17:33:54'),
(384, 11, 3, 4, 48, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1095', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-18', '2021-06-01 13:29:45', '2021-09-28 17:33:54'),
(385, 11, 4, 8, 49, 1, 38502, '[]', 38502, 1, 1, 'Contabilidad Mensual', '1096', '2021-06-01', '2021-06-20', 4, '', 3, '2021-07-01', '2021-06-01 13:35:43', '2021-09-28 17:33:54'),
(386, 11, 5, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1097', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-09', '2021-06-01 13:38:53', '2021-09-28 17:33:54'),
(387, 11, 8, NULL, 1, 1, NULL, '[]', 4000000, 1, 8, 'Regularización Empresa', '1092', '2021-06-01', '2021-06-01', 4, '', 3, '2021-05-30', '2021-06-01 13:40:35', '2021-09-28 17:33:54'),
(388, 11, 6, 6, 48, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1098', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-08', '2021-06-01 13:46:16', '2021-09-28 17:33:54'),
(389, 11, 7, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1099', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-03', '2021-06-01 13:49:16', '2021-09-28 17:33:54'),
(390, 11, 9, 7, 48, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1100', '2021-06-01', '2021-06-20', 4, '', 3, '2021-08-06', '2021-06-01 13:56:43', '2021-09-28 17:33:54'),
(391, 11, 10, 1, 48, 1, 30000, '[]', 25000, 1, 1, 'Contabilidad Mensual', '1101', '2021-06-01', '2021-06-20', 2, 'Factura por 30.000, se realiza NC por 5.000 para ajustar valor Folio 36', NULL, NULL, '2021-06-01 14:00:07', '2021-09-28 17:33:54'),
(392, 11, 11, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1102', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 14:03:11', '2021-09-28 17:33:54'),
(393, 11, 12, 3, 48, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1103', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-11', '2021-06-01 14:04:55', '2021-09-28 17:33:54'),
(394, 11, 13, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1104', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-29', '2021-06-01 14:09:12', '2021-09-28 17:33:54'),
(395, 11, 14, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1105', '2021-06-01', '2021-06-20', 4, '', 3, '2021-07-02', '2021-06-01 14:13:54', '2021-09-28 17:33:54'),
(396, 11, 15, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1106', '2021-06-01', '2021-06-20', 4, '', 3, '2021-08-04', '2021-06-01 14:17:26', '2021-09-28 17:33:54'),
(397, 11, 16, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1107', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-17', '2021-06-01 14:21:37', '2021-09-28 17:33:54'),
(398, 11, 17, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1108', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 14:24:03', '2021-09-28 17:33:54'),
(399, 11, 18, 6, 48, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1109', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-02', '2021-06-01 14:27:18', '2021-09-28 17:33:54'),
(400, 11, 19, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1110', '2021-06-01', '2021-06-20', 4, '', 3, '2021-07-01', '2021-06-01 14:31:42', '2021-09-28 17:33:54'),
(401, 11, 20, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1111', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-30', '2021-06-01 14:35:04', '2021-09-28 17:33:54'),
(402, 11, 22, 8, 48, 1, 38502, '[]', 38502, 1, 1, 'Contabilidad Mensual', '1112', '2021-06-01', '2021-06-20', 4, '', 3, '2021-07-01', '2021-06-01 14:38:10', '2021-09-28 17:33:54'),
(403, 11, 23, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1113', '2021-06-01', '2021-06-20', 4, '', 3, '2021-08-04', '2021-06-01 14:44:02', '2021-09-28 17:33:54'),
(404, 11, 26, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1114', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-02', '2021-06-01 14:48:01', '2021-09-28 17:33:54'),
(405, 11, 27, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1115', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 14:51:59', '2021-09-28 17:33:54'),
(406, 11, 28, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1116', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-22', '2021-06-01 14:55:15', '2021-09-28 17:33:54'),
(407, 11, 29, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1117', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-11', '2021-06-01 14:57:36', '2021-09-28 17:33:54'),
(408, 11, 30, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1118', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-08', '2021-06-01 15:00:04', '2021-09-28 17:33:54'),
(409, 11, 31, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1119', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-29', '2021-06-01 15:02:52', '2021-09-28 17:33:54'),
(410, 11, 32, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1120', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-07', '2021-06-01 15:05:42', '2021-09-28 17:33:54'),
(411, 11, 33, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1121', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-18', '2021-06-01 15:07:50', '2021-09-28 17:33:54'),
(412, 11, 34, 5, 48, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1122', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-07', '2021-06-01 15:10:19', '2021-09-28 17:33:54'),
(413, 11, 35, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1123', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-02', '2021-06-01 15:12:16', '2021-09-28 17:33:54'),
(414, 11, 37, 16, 48, 1, 50000, '[]', 50000, 1, 1, 'Contabilidad Mensual', '1124', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-02', '2021-06-01 15:34:52', '2021-09-28 17:33:54'),
(415, 11, 38, 12, 48, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1125', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-07', '2021-06-01 15:37:40', '2021-09-28 17:33:54'),
(416, 11, 39, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1126', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 15:39:53', '2021-09-28 17:33:54'),
(417, 11, 40, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1127', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 15:41:54', '2021-09-28 17:33:54'),
(418, 11, 41, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1128', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 15:43:01', '2021-09-28 17:33:54'),
(419, 11, 42, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1129', '2021-06-01', '2021-06-20', 2, '', NULL, NULL, '2021-06-01 15:45:37', '2021-09-28 17:33:54'),
(420, 11, 43, 1, 48, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1130', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-22', '2021-06-01 15:47:08', '2021-09-28 17:33:54'),
(421, 11, 44, 11, 48, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1131', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-30', '2021-06-01 15:49:09', '2021-09-28 17:33:54'),
(422, 11, 46, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1132', '2021-06-01', '2021-06-20', 4, '', 3, '2021-07-02', '2021-06-01 15:51:11', '2021-09-28 17:33:54'),
(423, 11, 49, 15, 48, 1, 38000, '[]', 38000, 1, 1, 'Contabilidad Mensual', '1133', '2021-06-01', '2021-06-20', 4, 'Cliente pago 40.000 pesos a la fecha, queda pendiente por devolver 2.000  ', 3, '2021-06-18', '2021-06-01 15:57:06', '2021-09-28 17:33:54'),
(424, 11, 50, 14, 48, 1, 15000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1134', '2021-06-01', '2021-06-20', 4, '', 3, '2021-06-18', '2021-06-01 16:02:40', '2021-09-28 17:33:54'),
(425, 11, 31, 1, 1, 1, 30000, '[]', 115000, 1, 8, 'Regularización Empresa', '1140', '2021-06-08', '2021-06-20', 4, '', 3, '2021-06-08', '2021-06-08 16:22:38', '2021-09-28 17:33:54'),
(426, 11, 56, 9, 1, 14, 0, '[]', 150000, 1, 10, 'Constitucion de Sociedad ', '1135', '2021-06-02', '2021-06-02', 4, 'Zuliano Expres Inversiones Spa\r\n77.361.952-2', 3, '2021-06-11', '2021-06-11 10:34:28', '2021-09-28 17:33:54'),
(427, 11, 56, 9, 1, 14, 0, '[]', 250000, 1, 10, 'Constitucion de Sociedad ', '1136', '2021-06-03', '2021-06-03', 4, 'MONS SHOP SR SpA\r\n77.366.699-7', 3, '2021-06-03', '2021-06-11 10:36:32', '2021-09-28 17:33:54'),
(428, 11, 56, 9, 1, 14, 0, '[]', 150000, 1, 10, 'Constitucion de Sociedad ', '1137', '2021-06-03', '2021-06-03', 4, 'A tu gusto Chile Spa\r\n77.372.226-9', 3, '2021-06-03', '2021-06-11 10:40:54', '2021-09-28 17:33:54'),
(429, 11, 56, 9, 1, 14, 0, '[]', 250000, 1, 10, 'Constitucion de Sociedad ', '1138', '2021-06-03', '2021-06-03', 4, 'Comercializadora MundoPlus SpA\r\n77.375.959-6', 3, '2021-06-03', '2021-06-11 10:49:36', '2021-09-28 17:33:54'),
(430, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 1, 'Contabilidad Mensual', '1091', '2021-05-31', '2021-05-31', 4, 'FERREVARG SpA \r\n77.373.756-8', 3, '2021-05-31', '2021-06-11 10:53:10', '2021-09-28 17:33:54'),
(431, 11, 56, 9, 1, 14, 0, '[]', 250000, 1, 10, 'Constitucion de Sociedad ', '1139', '2021-06-08', '2021-06-08', 4, 'K-MOTOR SPA\r\n77.378.296-2', 3, '2021-06-08', '2021-06-11 10:55:49', '2021-09-28 17:33:54'),
(432, 11, 56, 9, 1, 14, 0, '[]', 250000, 1, 10, 'Constitucion de Sociedad ', '1141', '2021-06-11', '2021-06-11', 4, 'HERRERA GALLEGOS SpA\r\n77.380.451-6', 3, '2021-06-10', '2021-06-11 11:45:21', '2021-09-28 17:33:54'),
(433, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1142', '2021-06-14', '2021-06-14', 4, 'CKC SPA\r\n77381541-0', 3, '2021-06-14', '2021-06-14 17:14:54', '2021-09-28 17:33:54'),
(434, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1145', '2021-06-16', '2021-06-16', 4, 'CONSTRUCTORA SRDM SPA\r\n77.384.392-9', 3, '2021-06-15', '2021-06-16 17:16:50', '2021-09-28 17:33:54'),
(435, 11, 56, 9, 1, 14, 0, '[]', 90000, 1, 10, 'Constitucion de Sociedad ', '1149', '2021-06-22', '2021-06-22', 4, 'MILENIAL PROPIEDADES SPA \r\n77.388.137-5', 3, '2021-06-22', '2021-06-23 12:14:59', '2021-09-28 17:33:54'),
(436, 11, 56, 9, 1, 14, 0, '[]', 39990, 1, 10, 'Constitucion de Sociedad ', '1148', '2021-06-23', '2021-06-23', 4, 'MACALLAN SPA\r\n77.389.453-1', 3, '2021-06-23', '2021-06-23 12:21:42', '2021-09-28 17:33:54'),
(437, 8, 54, NULL, 58, 1, NULL, '[]', 25000, 1, 8, 'Regularización Empresa', '1090', '2021-05-11', '2021-05-20', 2, '', NULL, NULL, '2021-06-28 13:02:22', '2021-09-28 17:33:54'),
(438, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1151', '2021-06-29', '2021-06-29', 4, 'Zona Click SpA\r\n77391608-k', 3, '2021-06-29', '2021-06-29 12:27:48', '2021-09-28 17:33:54'),
(439, 11, 56, 9, 1, 14, 0, '[]', 140000, 1, 10, 'Constitucion de Sociedad ', '1152', '2021-06-29', '2021-06-29', 4, 'Vekahairstyle SpA\r\n77.391.765-5', 3, '2021-06-29', '2021-06-29 12:29:28', '2021-09-28 17:33:54'),
(440, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1153', '2021-06-30', '2021-06-30', 4, 'MULTISERVICIOS ÑUÑOA SPA\r\n77.391.566-0', 3, '2021-06-30', '2021-06-30 08:54:13', '2021-09-28 17:33:54'),
(441, 11, 19, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1158', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-31', '2021-07-01 10:07:06', '2021-09-28 17:33:54'),
(442, 11, 1, 17, 49, 1, 10000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1159', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 11:31:52', '2021-09-28 17:33:54'),
(443, 11, 2, 2, 49, 1, 103659, '[]', 103659, 1, 1, 'Contabilidad Mensual', '1160', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-02', '2021-07-01 11:39:46', '2021-09-28 17:33:54'),
(444, 11, 3, 4, 49, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1161', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-01 11:56:28', '2021-09-28 17:33:54'),
(445, 11, 58, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1162', '2021-07-01', '2021-07-20', 4, 'MES ANTICIPADO', 3, '2021-07-01', '2021-07-01 12:07:22', '2021-09-28 17:33:54'),
(446, 11, 5, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1163', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-21', '2021-07-01 12:17:13', '2021-09-28 17:33:54'),
(447, 11, 6, 6, 49, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1164', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 12:19:40', '2021-09-28 17:33:54'),
(448, 11, 4, 8, 50, 1, 38626, '[]', 38626, 1, 1, 'Contabilidad Mensual', '1165', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 12:30:33', '2021-09-28 17:33:54'),
(449, 11, 7, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1166', '2021-07-01', '2021-07-20', 4, '', 3, '2021-08-02', '2021-07-01 12:33:57', '2021-09-28 17:33:54'),
(450, 11, 9, 7, 49, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1167', '2021-07-01', '2021-07-20', 4, '', 3, '2021-08-06', '2021-07-01 12:47:27', '2021-09-28 17:33:54'),
(451, 11, 11, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1168', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 13:12:56', '2021-09-28 17:33:54'),
(452, 11, 12, 3, 49, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1169', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-21', '2021-07-01 13:25:01', '2021-09-28 17:33:54'),
(453, 11, 13, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1170', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-06', '2021-07-01 13:31:15', '2021-09-28 17:33:54'),
(454, 11, 14, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1171', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-30', '2021-07-01 13:37:13', '2021-09-28 17:33:54'),
(455, 11, 15, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1172', '2021-07-01', '2021-07-20', 4, '', 3, '2021-08-04', '2021-07-01 13:40:54', '2021-09-28 17:33:54'),
(456, 11, 16, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1173', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-29', '2021-07-01 13:44:44', '2021-09-28 17:33:54'),
(457, 11, 18, 6, 49, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1174', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 13:52:32', '2021-09-28 17:33:54'),
(458, 11, 20, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1175', '2021-07-01', '2021-07-20', 4, '', 3, '2021-08-09', '2021-07-01 13:55:32', '2021-09-28 17:33:54'),
(459, 11, 22, 8, 49, 1, 38626, '[]', 38626, 1, 1, 'Contabilidad Mensual', '1176', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 13:59:19', '2021-09-28 17:33:54'),
(460, 11, 23, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1177', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 14:04:32', '2021-09-28 17:33:54'),
(461, 11, 26, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1178', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 14:06:54', '2021-09-28 17:33:54'),
(462, 11, 27, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1179', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 14:10:59', '2021-09-28 17:33:54'),
(463, 11, 28, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1180', '2021-07-01', '2021-07-20', 3, 'se anula el cobro al cliente en base a situaciones económicas por las cuales esta pasando. ', NULL, NULL, '2021-07-01 14:12:19', '2021-09-28 17:33:54'),
(464, 11, 29, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1181', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-13', '2021-07-01 14:15:26', '2021-09-28 17:33:54'),
(465, 11, 30, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1182', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-01 14:18:20', '2021-09-28 17:33:54'),
(466, 11, 31, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1183', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-01 15:32:09', '2021-09-28 17:33:54'),
(467, 11, 32, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1184', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 15:35:29', '2021-09-28 17:33:54'),
(468, 11, 33, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1185', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-01 15:40:37', '2021-09-28 17:33:54'),
(469, 11, 34, 5, 49, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1186', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-21', '2021-07-01 15:45:34', '2021-09-28 17:33:54'),
(470, 11, 35, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1187', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-02', '2021-07-01 15:49:26', '2021-09-28 17:33:54'),
(471, 11, 37, 16, 49, 1, 50000, '[]', 50000, 1, 1, 'Contabilidad Mensual', '1188', '2021-07-01', '2021-07-20', 4, '', 3, '2021-09-02', '2021-07-01 15:52:30', '2021-09-28 17:33:54'),
(472, 11, 38, 12, 49, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1189', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-01', '2021-07-01 15:58:09', '2021-09-28 17:33:54'),
(473, 11, 39, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1190', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 16:01:36', '2021-09-28 17:33:54'),
(474, 11, 40, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1191', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 16:05:33', '2021-09-28 17:33:54'),
(475, 11, 41, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1192', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 16:07:32', '2021-09-28 17:33:54'),
(476, 11, 42, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1193', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 16:11:55', '2021-09-28 17:33:54'),
(477, 11, 43, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1194', '2021-07-01', '2021-07-20', 3, 'se anula cobro por situación económica del cliente ', NULL, NULL, '2021-07-01 16:15:11', '2021-09-28 17:33:54'),
(478, 11, 44, 11, 49, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1195', '2021-07-01', '2021-07-20', 2, '', NULL, NULL, '2021-07-01 16:22:25', '2021-09-28 17:33:54'),
(479, 11, 46, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1196', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-30', '2021-07-01 16:31:40', '2021-09-28 17:33:54'),
(480, 11, 49, 15, 49, 1, 38000, '[]', 38000, 1, 1, 'Contabilidad Mensual', '1197', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-21', '2021-07-01 16:36:40', '2021-09-28 17:33:54'),
(481, 11, 50, 14, 49, 1, 15000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1198', '2021-07-01', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-01 16:43:33', '2021-09-28 17:33:54'),
(482, 11, 57, 13, 49, 1, 35000, '[]', 35000, 1, 1, 'Contabilidad Mensual', '1199', '2021-07-01', '2021-07-20', 3, 'No debia registrar', NULL, NULL, '2021-07-01 16:49:51', '2021-09-28 17:33:54'),
(483, 11, 59, 9, 1, 1, 0, '[]', 300000, 1, 1, 'Contabilidad Mensual', '1200', '2021-07-06', '2021-07-06', 4, 'COPER CONSULTING GROUP SpA\r\n77.096.427-K', 3, '2021-07-06', '2021-07-06 18:33:23', '2021-09-28 17:33:54'),
(484, 11, 55, 1, 49, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1201', '2021-07-07', '2021-07-20', 4, '', 3, '2021-07-08', '2021-07-07 10:57:26', '2021-09-28 17:33:54'),
(485, 11, 61, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1202', '2021-07-07', '2021-07-20', 4, 'Anticipado', 3, '2021-07-07', '2021-07-07 11:09:44', '2021-09-28 17:33:54'),
(486, 11, 52, 8, 49, 1, 38626, '[]', 29712, 1, 1, 'Contabilidad Mensual', '1203', '2021-07-07', '2021-07-20', 4, '1 uf Junio\r\na partir de Julio 1.3 uf (ya modificado plan)', 3, '2021-07-20', '2021-07-07 12:37:12', '2021-09-28 17:33:54'),
(487, 11, 62, 18, 49, 1, 50650, '[]', 50650, 1, 1, 'Contabilidad Mensual', '1204', '2021-07-08', '2021-07-20', 4, '', 3, '2021-07-08', '2021-07-08 13:49:16', '2021-09-28 17:33:54'),
(488, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 1, 'Contabilidad Mensual', '1205', '2021-07-08', '2021-07-20', 4, 'COMERCIALIZADORA DUOLI LIMITADA\r\n77.398.833-1', 3, '2021-07-08', '2021-07-08 17:12:49', '2021-09-28 17:33:54'),
(489, 11, 63, NULL, 57, 1, NULL, '[]', 90000, 1, 8, 'Regularización Empresa', '1206', '2021-07-12', '2021-07-12', 4, 'Operación Renta AT 2020', 3, '2021-03-20', '2021-07-20 09:51:37', '2021-09-28 17:33:54'),
(490, 11, 63, NULL, 58, 1, NULL, '[]', 90000, 1, 8, 'Regularización Empresa', '1206', '2021-07-20', '2021-07-20', 2, 'Operación Renta AT 2021', NULL, NULL, '2021-07-20 09:54:14', '2021-09-28 17:33:54'),
(491, 11, 65, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1208', '2021-07-20', '2021-07-20', 4, '', 3, '2021-07-20', '2021-07-20 10:18:47', '2021-09-28 17:33:54'),
(492, 11, 64, NULL, 1, 14, NULL, '[]', 183000, 1, 8, 'Regularización Empresa', '1207', '2021-07-16', '2021-07-16', 4, 'Servicios Clientes Mayo (5-2), Junio (5-7)\r\n', 3, '2021-07-20', '2021-07-20 11:13:32', '2021-09-28 17:33:54'),
(493, 11, 29, 1, 1, 1, 30000, '[]', 21500, 1, 8, 'Regularización Empresa', '1209', '2021-07-21', '2021-07-21', 4, '', 3, '2021-07-21', '2021-07-21 16:50:36', '2021-09-28 17:33:54'),
(494, 11, 60, 9, 1, 3, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1210', '2021-07-22', '2021-07-22', 3, 'INVERSIONES KUYEN SPA\n77.406.663-2', NULL, NULL, '2021-07-22 17:04:09', '2021-09-28 17:33:54'),
(495, 11, 60, 9, 1, 3, 0, '[]', 60000, 1, 10, 'Constitucion de Sociedad ', '1211', '2021-07-22', '2021-07-22', 4, 'OFICINA VIRTUAL \r\nINVERSIONES KUYEN SPA\r\n77.406.663-2', 3, '2021-07-22', '2021-07-22 17:05:35', '2021-09-28 17:33:54'),
(496, 8, 47, 9, 37, 1, 0, '[{\"id\":1,\"descripcion\":\"cobro adicional servicios eletronicos\",\"monto\":5000}]', 5000, 1, 1, 'Contabilidad Mensual', '666666', '2021-07-22', '2021-08-20', 3, 'ok', NULL, NULL, '2021-07-22 17:24:34', '2021-09-28 17:33:54'),
(497, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1210', '2021-07-22', '2021-07-22', 4, 'INVERSIONES KUYEN SPA\r\n77.406.663-2', 3, '2021-07-22', '2021-07-22 17:28:58', '2021-09-28 17:33:54'),
(498, 11, 56, 9, 1, 14, 0, '[]', 190000, 1, 10, 'Constitucion de Sociedad ', '1212', '2021-07-26', '2021-07-26', 4, 'HR GAMIFICACIÓN SPA\r\n77.397.458-6', 3, '2021-07-26', '2021-07-26 12:51:58', '2021-09-28 17:33:54'),
(499, 8, 47, 10, 50, 1, 55000, '[{\"id\":2,\"descripcion\":\"prueba  5\",\"monto\":15000}]', 70000, 1, 1, 'Contabilidad Mensual', '555555555', '2021-07-27', '2021-07-31', 3, 'ok ', NULL, NULL, '2021-07-27 17:32:23', '2021-09-28 17:33:54'),
(500, 11, 2, 2, 50, 1, 104158, '[]', 104158, 1, 1, 'Contabilidad Mensual', '1213', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-04', '2021-08-02 09:54:09', '2021-09-28 17:33:54'),
(501, 11, 3, 4, 50, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1214', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 11:01:41', '2021-09-28 17:33:54'),
(502, 11, 4, 8, 51, 1, 38687, '[]', 38687, 1, 1, 'Contabilidad Mensual', '1215', '2021-08-02', '2021-08-20', 4, '', 3, '2021-10-07', '2021-08-02 11:07:31', '2021-10-07 12:27:22'),
(503, 11, 5, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1216', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-27', '2021-08-02 11:14:55', '2021-09-28 17:33:54'),
(504, 11, 6, 6, 50, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1217', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-05', '2021-08-02 11:34:48', '2021-09-28 17:33:54'),
(505, 11, 7, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1218', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-02', '2021-08-02 11:39:19', '2021-09-28 17:33:54'),
(506, 11, 9, 7, 50, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1219', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-06', '2021-08-02 12:20:35', '2021-09-28 17:33:54'),
(507, 11, 11, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1220', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 12:25:38', '2021-09-28 17:33:54'),
(508, 11, 12, 3, 50, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1221', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-19', '2021-08-02 12:33:57', '2021-09-28 17:33:54'),
(509, 11, 13, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1222', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-09', '2021-08-02 12:40:55', '2021-09-28 17:33:54'),
(510, 11, 14, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1223', '2021-08-02', '2021-08-20', 4, '', 3, '2021-10-01', '2021-08-02 12:47:17', '2021-10-04 09:24:35'),
(511, 11, 15, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1224', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 12:52:58', '2021-09-28 17:33:54'),
(512, 11, 16, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1225', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 12:58:41', '2021-09-28 17:33:54'),
(513, 11, 18, 6, 50, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1226', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-09', '2021-08-02 13:01:52', '2021-09-28 17:33:54'),
(514, 11, 19, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1227', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-03', '2021-08-02 13:08:00', '2021-09-28 17:33:54'),
(515, 11, 20, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1228', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-09', '2021-08-02 13:15:53', '2021-09-28 17:33:54'),
(516, 11, 22, 8, 50, 1, 38687, '[]', 38687, 1, 1, 'Contabilidad Mensual', '1229', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-10', '2021-08-02 13:21:16', '2021-09-28 17:33:54'),
(517, 11, 23, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1230', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 13:25:14', '2021-09-28 17:33:54'),
(518, 11, 26, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1231', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-02', '2021-08-02 13:32:16', '2021-09-28 17:33:54'),
(519, 11, 27, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1232', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 13:39:45', '2021-09-28 17:33:54'),
(520, 11, 28, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1233', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-04', '2021-08-02 13:50:34', '2021-09-28 17:33:54'),
(521, 11, 29, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1234', '2021-08-02', '2021-08-20', 4, '', 3, '2021-09-16', '2021-08-02 13:54:06', '2021-09-28 17:33:54'),
(522, 11, 30, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1235', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-25', '2021-08-02 14:02:58', '2021-09-28 17:33:54'),
(523, 11, 31, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1236', '2021-08-02', '2021-08-20', 3, 'Servicio a empresa finalizado', NULL, NULL, '2021-08-02 14:19:17', '2021-09-28 17:33:54'),
(524, 11, 32, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1237', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-02', '2021-08-02 15:31:01', '2021-09-28 17:33:54'),
(525, 11, 33, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1238', '2021-08-02', '2021-08-20', 4, '', 3, '2021-07-20', '2021-08-02 15:36:17', '2021-10-06 12:14:04'),
(526, 11, 34, 5, 50, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1239', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-09', '2021-08-02 15:41:42', '2021-09-28 17:33:54'),
(527, 11, 35, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1240', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-09', '2021-08-02 15:49:35', '2021-09-28 17:33:54'),
(528, 11, 37, 16, 50, 1, 50000, '[]', 50000, 1, 1, 'Contabilidad Mensual', '1241', '2021-08-02', '2021-08-20', 4, '', 3, '2021-09-01', '2021-08-02 15:54:41', '2021-09-28 17:33:54'),
(529, 11, 38, 12, 50, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1242', '2021-08-02', '2021-08-20', 4, '', 3, '2021-07-23', '2021-08-02 17:06:24', '2021-09-28 17:33:54'),
(530, 11, 39, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1243', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 17:11:32', '2021-09-28 17:33:54'),
(531, 11, 40, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1244', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 17:42:30', '2021-09-28 17:33:54'),
(532, 11, 41, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1245', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 17:48:45', '2021-09-28 17:33:54');
INSERT INTO `facturas` (`idFactura`, `idUsuario`, `idEmpresa`, `idPlan`, `idPeriodoContable`, `idCentroCosto`, `valorPlan`, `cobros_adicionales`, `valorCobrar`, `con_movimiento`, `idServicio`, `servicio`, `numeroFactura`, `fechaCobro`, `fechaVencimiento`, `idStatus`, `observacion`, `idMetodoPago`, `fechaPago`, `fecha_registro`, `fecha_modificacion`) VALUES
(533, 11, 42, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1246', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 17:52:46', '2021-09-28 17:33:54'),
(534, 11, 43, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1247', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-04', '2021-08-02 17:58:25', '2021-09-28 17:33:54'),
(535, 11, 44, 11, 50, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1248', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 18:03:14', '2021-09-28 17:33:54'),
(536, 11, 46, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1249', '2021-08-02', '2021-08-20', 2, '', NULL, NULL, '2021-08-02 18:06:14', '2021-09-28 17:33:54'),
(537, 11, 49, 15, 50, 1, 38000, '[]', 38000, 1, 1, 'Contabilidad Mensual', '1250', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-20', '2021-08-02 18:13:18', '2021-09-28 17:33:54'),
(538, 11, 50, 17, 50, 1, 10000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1251', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-20', '2021-08-02 18:20:15', '2021-09-28 17:33:54'),
(539, 11, 52, 8, 50, 1, 38687, '[]', 38687, 1, 1, 'Contabilidad Mensual', '1252', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-10', '2021-08-02 18:26:49', '2021-09-28 17:33:54'),
(540, 11, 57, 13, 50, 1, 35000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1263', '2021-08-02', '2021-08-20', 4, 'Fac Nº 1254 anulada por cuenta sin movimiento ', 3, '2021-08-13', '2021-08-02 18:38:02', '2021-09-28 17:33:54'),
(541, 11, 58, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1255', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-02', '2021-08-02 18:44:02', '2021-09-28 17:33:54'),
(542, 11, 55, 1, 50, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1256', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-04', '2021-08-02 18:47:46', '2021-09-28 17:33:54'),
(543, 11, 61, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1257', '2021-08-02', '2021-08-20', 4, '', 3, '2021-08-16', '2021-08-02 18:54:01', '2021-09-28 17:33:54'),
(544, 11, 65, 1, 51, 1, 30000, '[{\"id\":3,\"descripcion\":\"Firma electr\\u00f3nica poder\",\"monto\":5000}]', 35000, 1, 1, 'Contabilidad Mensual', '1259', '2021-08-06', '2021-08-20', 4, '', 3, '2021-08-23', '2021-08-06 10:36:24', '2021-09-28 17:33:54'),
(545, 11, 62, 8, 51, 1, 38687, '[{\"id\":5,\"descripcion\":\"Adicional 2 trabajadores\",\"monto\":12000}]', 50687, 1, 1, 'Contabilidad Mensual', '1260', '2021-08-06', '2021-08-20', 4, '', 3, '2021-10-07', '2021-08-06 10:38:34', '2021-10-07 12:32:57'),
(546, 11, 66, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1261', '2021-08-06', '2021-08-20', 4, '', 3, '2021-09-06', '2021-08-06 10:42:24', '2021-09-28 17:33:54'),
(547, 11, 67, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1262', '2021-08-06', '2021-08-20', 4, '', 3, '2021-08-25', '2021-08-06 10:45:27', '2021-09-28 17:33:54'),
(548, 11, 11, 1, 1, 1, 30000, '[]', 5000, 1, 8, 'Regularización Empresa', '1264', '2021-08-06', '2021-08-20', 3, 'Habilitación de empresa', NULL, NULL, '2021-08-06 10:47:41', '2021-09-28 17:33:54'),
(549, 11, 56, 9, 1, 1, 0, '[]', 110000, 1, 10, 'Constitucion de Sociedad ', '1266', '2021-08-09', '2021-08-09', 4, 'RN GLASS SPA\r\n77407419-8', 3, '2021-08-09', '2021-08-09 17:54:59', '2021-09-28 17:33:54'),
(550, 11, 60, 9, 1, 3, 0, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1267', '2021-08-09', '2021-08-09', 4, 'RN GLASS SPA\r\n77407419-8', 3, '2021-08-09', '2021-08-09 17:56:50', '2021-09-28 17:33:54'),
(551, 11, 2, 2, 1, 1, 104158, '[]', 5000000, 1, 8, 'Regularización Empresa', '0000', '2021-07-30', '2021-07-30', 4, 'Convenio capacitación personal\r\nPagada en efectivo', 3, '2021-07-30', '2021-08-10 10:41:35', '2021-09-28 17:33:54'),
(552, 11, 11, 1, 1, 1, 30000, '[]', 15000, 1, 8, 'Regularización Empresa', '1271', '2021-08-17', '2021-08-20', 2, 'Habilitación de Empresa', NULL, NULL, '2021-08-17 12:10:48', '2021-09-28 17:33:54'),
(553, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1272', '2021-08-17', '2021-08-17', 4, 'TEAM GARVILA \r\n77.420.035-5\r\n\r\nOficina Virtual 6 meses', 3, '2021-08-17', '2021-08-17 12:56:35', '2021-09-28 17:33:54'),
(554, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1273', '2021-08-17', '2021-08-17', 4, 'BITPRO SPA\r\n77.419.997-7\r\n\r\nOFICINA VIRTUAL 6 MESES ', 3, '2021-08-17', '2021-08-17 13:05:55', '2021-09-28 17:33:54'),
(555, 11, 60, 9, 1, 3, 0, '[]', 40000, 1, 10, 'Constitucion de Sociedad ', '1274', '2021-08-17', '2021-08-17', 4, 'SOLUCIONES INTEGRALES EN INFORMÁTICA FRANCHESCO GEOVANNI BEZZOLO GATICA E.I.R.L\r\n76.305.352-0\r\n\r\nOFICINA VIRTUAL 6 meses', 3, '2021-08-17', '2021-08-17 13:11:09', '2021-09-28 17:33:54'),
(556, 11, 68, NULL, 1, 1, NULL, '[]', 195000, 1, 8, 'Regularización Empresa', '1274', '2021-08-17', '2021-08-17', 4, 'Servicio Termino de Giro $80.000\r\nGastos Disolución Sociedad $55.000\r\nHonorarios Disolución Sociedad $60.000', 3, '2021-08-17', '2021-08-17 13:17:59', '2021-09-28 17:33:54'),
(557, 11, 69, 1, 50, 1, 30000, '[]', 0, 1, 1, 'Contabilidad Mensual', '0000', '2021-08-19', '2021-07-20', 4, 'Mes de Julio no se cobro porque tenia pocos días activo el cliente ', 3, '2021-08-19', '2021-08-19 14:00:21', '2021-09-28 17:33:54'),
(558, 11, 69, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1276', '2021-08-19', '2021-08-20', 4, '', 3, '2021-08-19', '2021-08-19 14:01:56', '2021-09-28 17:33:54'),
(559, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1277', '2021-08-23', '2021-08-23', 4, 'Oldvelvet SpA		\r\n77.423.872-7\r\n\r\nSantiago centro 6 meses ', 3, '2021-08-23', '2021-08-23 11:02:47', '2021-09-28 17:33:54'),
(560, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1278', '2021-08-23', '2021-08-23', 4, 'Educación Dirasa SpA		\r\n77.422.844-6\r\n\r\nSantiago centro 6 meses ', 3, '2021-08-23', '2021-08-23 11:04:38', '2021-09-28 17:33:54'),
(561, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1279', '2021-08-23', '2021-08-23', 4, 'Tienda Linda Luna SpA		\r\n77.426.125-7\r\n\r\nSantiago centro 6 meses', 3, '2021-08-23', '2021-08-23 16:25:04', '2021-09-28 17:33:54'),
(562, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1280', '2021-08-24', '2021-08-24', 4, 'SportsPlace SpA\r\n77.426.181-8	\r\n\r\n6 meses Santiago centro', 3, '2021-08-24', '2021-08-24 10:08:16', '2021-09-28 17:33:54'),
(563, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1281', '2021-08-24', '2021-08-24', 4, 'MULTIFLETES EXPRESS SPA\r\n77.427.514-2', 3, '2021-08-24', '2021-08-24 15:30:34', '2021-09-28 17:33:54'),
(564, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1282', '2021-08-24', '2021-08-24', 4, 'WORKS.E.G. SPA\r\n77.426.388-8', 3, '2021-08-24', '2021-08-24 15:45:26', '2021-09-28 17:33:54'),
(565, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1283', '2021-08-25', '2021-08-25', 4, 'EL IMPERIO VEGANO SPA\r\n77.429.055-9', 3, '2021-08-25', '2021-08-25 12:41:59', '2021-09-28 17:33:54'),
(566, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1284', '2021-08-26', '2021-08-26', 4, 'CUCHAU INVERSIONES SpA		\r\n77.429.871-1', 3, '2021-08-26', '2021-08-26 17:53:19', '2021-09-28 17:33:54'),
(567, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1285', '2021-08-26', '2021-08-26', 4, 'M&M FIJACIONES SPA		\r\n77.429.977-7', 3, '2021-08-26', '2021-08-26 17:54:49', '2021-09-28 17:33:54'),
(568, 11, 70, 1, 50, 1, 30000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1287', '2021-08-30', '2021-08-20', 2, '', NULL, NULL, '2021-08-30 18:53:46', '2021-09-28 17:33:54'),
(569, 11, 19, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1288', '2021-09-01', '2021-09-20', 4, '', 3, '2021-09-11', '2021-09-01 19:01:17', '2021-09-28 17:33:54'),
(570, 11, 2, 2, 51, 1, 104799, '[]', 104799, 1, 1, 'Contabilidad Mensual', '1289', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-03', '2021-09-02 09:29:18', '2021-09-28 17:33:54'),
(571, 11, 3, 4, 51, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1290', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 09:43:23', '2021-09-28 17:33:54'),
(572, 11, 4, 8, 52, 1, 38925, '[]', 38925, 1, 1, 'Contabilidad Mensual', '1291', '2021-09-02', '2021-09-20', 4, '', 3, '2021-10-07', '2021-09-02 10:00:53', '2021-10-07 12:28:34'),
(573, 11, 5, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1292', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:12:59', '2021-09-28 17:33:54'),
(574, 11, 6, 6, 51, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1293', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-01', '2021-09-02 13:16:08', '2021-09-28 17:33:54'),
(575, 11, 7, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1294', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-06', '2021-09-02 13:18:42', '2021-09-28 17:33:54'),
(576, 11, 9, 7, 51, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1295', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:22:04', '2021-09-28 17:33:54'),
(577, 11, 11, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1296', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:25:23', '2021-09-28 17:33:54'),
(578, 11, 12, 3, 51, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1297', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-13', '2021-09-02 13:29:27', '2021-09-28 17:33:54'),
(579, 11, 13, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1298', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:32:43', '2021-09-28 17:33:54'),
(580, 11, 14, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1299', '2021-09-02', '2021-09-20', 4, '', 3, '2021-10-02', '2021-09-02 13:35:33', '2021-10-04 09:27:27'),
(581, 11, 15, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1300', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:38:13', '2021-09-28 17:33:54'),
(582, 11, 16, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1301', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:41:18', '2021-09-28 17:33:54'),
(583, 11, 18, 6, 51, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1302', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-07', '2021-09-02 13:43:21', '2021-10-07 10:26:35'),
(584, 11, 20, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1303', '2021-09-02', '2021-09-20', 4, '', 3, '2021-10-06', '2021-09-02 13:46:08', '2021-10-06 16:21:47'),
(585, 11, 22, 8, 51, 1, 38925, '[]', 38925, 1, 1, 'Contabilidad Mensual', '1304', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:48:51', '2021-09-28 17:33:54'),
(586, 11, 23, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1305', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 13:51:37', '2021-09-28 17:33:54'),
(587, 11, 26, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1306', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-01', '2021-09-02 13:55:27', '2021-09-28 17:33:54'),
(588, 11, 27, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1307', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 14:00:22', '2021-09-28 17:33:54'),
(589, 11, 28, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1308', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-02', '2021-09-02 14:02:30', '2021-09-28 17:33:54'),
(590, 11, 29, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1309', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-16', '2021-09-02 14:06:04', '2021-09-28 17:33:54'),
(591, 11, 30, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1310', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-24', '2021-09-02 14:09:16', '2021-10-06 09:35:07'),
(592, 11, 32, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1311', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-03', '2021-09-02 16:29:33', '2021-10-06 11:54:17'),
(593, 11, 33, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1312', '2021-09-02', '2021-09-20', 4, '', 3, '2021-07-20', '2021-09-02 16:31:38', '2021-10-06 12:15:57'),
(594, 11, 34, 5, 51, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1313', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-06', '2021-09-02 16:33:33', '2021-09-28 17:33:54'),
(595, 11, 35, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1314', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-14', '2021-09-02 16:37:26', '2021-09-28 17:33:54'),
(596, 11, 37, 16, 51, 1, 50000, '[]', 50000, 1, 1, 'Contabilidad Mensual', '1315', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:38:55', '2021-09-28 17:33:54'),
(597, 11, 38, 12, 51, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1316', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:41:50', '2021-09-28 17:33:54'),
(598, 11, 40, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1317', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:47:39', '2021-09-28 17:33:54'),
(599, 11, 41, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1318', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:48:49', '2021-09-28 17:33:54'),
(600, 11, 42, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1319', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:51:24', '2021-09-28 17:33:54'),
(601, 11, 43, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1320', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-02', '2021-09-02 16:52:54', '2021-09-28 17:33:54'),
(602, 11, 44, 11, 51, 1, 45000, '[]', 45000, 1, 1, 'Contabilidad Mensual', '1321', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:54:02', '2021-09-28 17:33:54'),
(603, 11, 46, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1322', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 16:58:56', '2021-09-28 17:33:54'),
(604, 11, 49, 15, 51, 1, 38000, '[]', 38000, 1, 1, 'Contabilidad Mensual', '1323', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-22', '2021-09-02 17:03:09', '2021-09-28 17:33:54'),
(605, 11, 50, 17, 51, 1, 10000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1324', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 17:06:43', '2021-09-28 17:33:54'),
(606, 11, 52, 8, 51, 1, 38925, '[]', 38925, 1, 1, 'Contabilidad Mensual', '1325', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 17:12:08', '2021-09-28 17:33:54'),
(607, 11, 62, 8, 52, 1, 38925, '[]', 38925, 1, 1, 'Contabilidad Mensual', '1326', '2021-09-02', '2021-09-20', 4, '', 3, '2021-10-07', '2021-09-02 17:14:57', '2021-10-07 12:34:02'),
(608, 11, 55, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1327', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-16', '2021-09-02 17:18:06', '2021-09-28 17:33:54'),
(609, 11, 57, 13, 51, 1, 35000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1328', '2021-09-02', '2021-09-20', 4, '', 3, '2021-10-13', '2021-09-02 17:23:32', '2021-10-13 16:01:13'),
(610, 11, 58, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1329', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-13', '2021-09-02 17:26:30', '2021-09-28 17:33:54'),
(611, 11, 61, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1330', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-08', '2021-09-02 17:31:13', '2021-09-28 17:33:54'),
(612, 11, 67, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1331', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 17:38:58', '2021-09-28 17:33:54'),
(613, 11, 69, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1332', '2021-09-02', '2021-09-20', 4, '', 3, '2021-09-06', '2021-09-02 17:52:19', '2021-09-28 17:33:54'),
(614, 11, 70, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1333', '2021-09-02', '2021-09-20', 3, 'error defactura', NULL, NULL, '2021-09-02 18:15:18', '2021-09-28 17:33:54'),
(615, 11, 70, 1, 51, 1, 30000, '[{\"id\":9,\"descripcion\":\"Adicional 1 trabajador\",\"monto\":5000}]', 35000, 1, 1, 'Contabilidad Mensual', '1333', '2021-09-02', '2021-09-20', 2, '', NULL, NULL, '2021-09-02 18:20:33', '2021-09-28 17:33:54'),
(616, 11, 72, 1, 1, 1, 30000, '[]', 5000, 1, 8, 'Regularización Empresa', '1334', '2021-09-07', '2021-09-20', 2, 'Firma poder tributario', NULL, NULL, '2021-09-07 13:51:17', '2021-09-28 17:33:54'),
(617, 11, 74, 1, 1, 1, 30000, '[]', 5000, 1, 1, 'Contabilidad Mensual', '1335', '2021-09-07', '2021-09-20', 4, 'Firma poder tributario ', 3, '2021-10-16', '2021-09-07 13:54:49', '2021-10-18 16:07:43'),
(618, 11, 73, 1, 1, 1, 30000, '[]', 5000, 1, 1, 'Contabilidad Mensual', '1336', '2021-09-07', '2021-09-20', 4, 'Firma poder tributario ', 3, '2021-09-14', '2021-09-07 13:55:49', '2021-09-28 17:33:54'),
(619, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1340', '2021-09-07', '2021-09-07', 4, 'Representaciones R&D SpA		\r\n77.427.582-7', 3, '2021-09-07', '2021-09-07 14:02:25', '2021-09-28 17:33:54'),
(620, 11, 66, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1341', '2021-09-07', '2021-09-20', 4, '', 3, '2021-09-06', '2021-09-07 14:05:27', '2021-09-28 17:33:54'),
(621, 11, 71, 1, 1, 1, 30000, '[]', 11000, 1, 1, 'Contabilidad Mensual', '1342 ', '2021-09-07', '2021-09-20', 2, 'Firma de poder tributario \r\nadicional remuneraciones 1', NULL, NULL, '2021-09-07 14:12:51', '2021-09-28 17:33:54'),
(622, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 1, 'Contabilidad Mensual', '1343', '2021-09-07', '2021-09-20', 4, 'SMILEARTS LAB SPA		\r\n77.435.361-5', 3, '2021-09-07', '2021-09-07 14:20:27', '2021-09-28 17:33:54'),
(623, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1344', '2021-09-07', '2021-09-07', 4, 'JPL Construcciones SpA		\r\n77.435.386-0', 3, '2021-09-07', '2021-09-07 15:20:33', '2021-09-28 17:33:54'),
(624, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1345', '2021-09-07', '2021-09-07', 4, '', 3, '2021-09-07', '2021-09-07 15:33:08', '2021-09-28 17:33:54'),
(625, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1346', '2021-09-07', '2021-09-07', 4, 'PRIMATES SPA		\r\n77.434.457-8', 3, '2021-09-07', '2021-09-07 15:36:14', '2021-09-28 17:33:54'),
(626, 11, 76, 1, 51, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1347', '2021-09-08', '2021-09-20', 4, '', 3, '2021-09-14', '2021-09-08 09:17:51', '2021-09-28 17:33:54'),
(627, 11, 76, 1, 1, 1, 30000, '[]', 15000, 1, 8, 'Regularización Empresa', '1348', '2021-09-08', '2021-09-20', 4, '', 3, '2021-09-14', '2021-09-08 09:18:33', '2021-09-28 17:33:54'),
(628, 11, 60, 9, 1, 3, 0, '[]', 40000, 1, 8, 'Regularización Empresa', '1349', '2021-09-08', '2021-09-20', 4, 'DOBLETRACCION AUTOMOTRIZ SPA\r\n77.423.618-K', 3, '2021-09-14', '2021-09-08 16:21:13', '2021-09-28 17:33:54'),
(629, 8, 77, 1, 47, 1, 30000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1352', '2021-04-20', '2021-05-20', 2, '', NULL, NULL, '2021-09-13 18:08:08', '2021-09-28 17:33:54'),
(630, 8, 77, 1, 36, 1, 30000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1352', '2021-05-01', '2021-06-20', 2, '', NULL, NULL, '2021-09-13 18:13:46', '2021-09-28 17:33:54'),
(631, 8, 77, 1, 25, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1352', '2021-06-01', '2021-07-20', 2, '', NULL, NULL, '2021-09-13 18:14:23', '2021-09-28 17:33:54'),
(632, 8, 77, 1, 50, 1, 30000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1352', '2021-07-01', '2021-08-20', 2, '', NULL, NULL, '2021-09-13 18:15:02', '2021-09-28 17:33:54'),
(633, 8, 77, 1, 51, 1, 30000, '[]', 15000, 1, 1, 'Contabilidad Mensual', '1352', '2021-08-01', '2021-09-20', 2, '', NULL, NULL, '2021-09-13 18:15:36', '2021-09-28 17:33:54'),
(634, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1353', '2021-09-21', '2021-09-21', 4, 'RPMAX SPA\r\n77.442.457-1', 3, '2021-09-21', '2021-09-21 17:03:33', '2021-09-28 17:33:54'),
(635, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 1, 'Contabilidad Mensual', '1354', '2021-09-21', '2021-09-21', 4, 'MAN FOR HEALTH SpA		\r\n77.442.142-4', 3, '2021-09-21', '2021-09-21 17:05:38', '2021-09-28 17:33:54'),
(636, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1355', '2021-09-21', '2021-09-21', 4, 'DISTRIBUIDORA GUINDA SPA		\r\n77.444.138-7', 3, '2021-09-21', '2021-09-21 17:08:12', '2021-09-28 17:33:54'),
(637, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1356', '2021-09-21', '2021-09-21', 4, 'ASSET ADVISOR CONTABLE SPA\r\n77.345.509-0', 3, '2021-09-21', '2021-09-21 17:48:26', '2021-09-28 17:33:54'),
(638, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1357', '2021-09-28', '2021-09-28', 4, 'MUEBLES RIVAS SPA\r\n77.445.363-6', 3, '2021-09-28', '2021-09-28 16:14:55', '2021-09-28 17:33:54'),
(639, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1358', '2021-09-28', '2021-09-28', 4, 'ANDES SPA\r\n77.444.473-4', 3, '2021-09-28', '2021-09-28 16:18:27', '2021-09-28 17:33:54'),
(640, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1359', '2021-09-28', '2021-09-28', 4, 'NEED CHILE SPA\r\n77.447.729-2', 3, '2021-09-28', '2021-09-28 16:22:17', '2021-09-28 17:33:54'),
(641, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1360', '2021-09-28', '2021-09-28', 4, 'DONDE JUANITO SPA\r\n77.446.277-5', 3, '2021-09-28', '2021-09-28 16:24:37', '2021-09-28 17:33:54'),
(642, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1361', '2021-09-28', '2021-09-28', 4, 'SANTISHE SPA\r\n77.446.321-6', 3, '2021-09-28', '2021-09-28 16:26:27', '2021-09-28 17:33:54'),
(643, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1362', '2021-09-28', '2021-09-28', 4, 'COMERCIAL M SPA\r\n77.429.446-5', 3, '2021-09-28', '2021-09-28 16:28:10', '2021-09-28 17:33:54'),
(644, 11, 56, 9, 1, 14, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1363', '2021-09-28', '2021-09-28', 4, 'AGCO SPA\r\n77.445.851-4', 3, '2021-09-28', '2021-09-28 16:32:34', '2021-09-28 18:07:21'),
(645, 11, 2, 2, 52, 1, 105323, '[]', 105323, 1, 1, 'Contabilidad Mensual', '1364', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 16:23:00', '2021-10-06 11:39:25'),
(646, 11, 3, 4, 52, 1, 26998, '[]', 26998, 1, 1, 'Contabilidad Mensual', '1365', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:31:57', '2021-10-05 17:31:57'),
(647, 11, 4, 8, 53, 1, 39120, '[]', 39120, 1, 1, 'Contabilidad Mensual', '1366', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-07', '2021-10-05 17:37:30', '2021-10-07 12:29:29'),
(648, 11, 5, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1367', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:40:16', '2021-10-05 17:40:16'),
(649, 11, 6, 6, 52, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1368', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-12', '2021-10-05 17:44:02', '2021-10-12 16:31:26'),
(650, 11, 7, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1369', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 17:46:14', '2021-10-06 10:06:50'),
(651, 11, 9, 7, 52, 1, 150000, '[]', 150000, 1, 1, 'Contabilidad Mensual', '1370', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:47:32', '2021-10-05 17:47:32'),
(652, 11, 12, 3, 52, 1, 60000, '[]', 60000, 1, 1, 'Contabilidad Mensual', '1371', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:48:53', '2021-10-05 17:48:53'),
(653, 11, 13, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1372', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:50:21', '2021-10-05 17:50:21'),
(654, 11, 14, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1373', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:51:56', '2021-10-05 17:51:56'),
(655, 11, 15, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1374', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:53:15', '2021-10-05 17:53:15'),
(656, 11, 16, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1375', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:54:22', '2021-10-05 17:54:22'),
(657, 11, 18, 6, 52, 1, 40000, '[]', 40000, 1, 1, 'Contabilidad Mensual', '1376', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-06', '2021-10-05 17:55:26', '2021-10-07 10:15:20'),
(658, 11, 20, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1377', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-07', '2021-10-05 17:56:30', '2021-10-07 16:29:17'),
(659, 11, 22, 12, 52, 1, 120000, '[]', 120000, 1, 1, 'Contabilidad Mensual', '1378', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:57:33', '2021-10-05 17:57:33'),
(660, 11, 23, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1379', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 17:58:42', '2021-10-05 17:58:42'),
(661, 11, 26, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1380', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-04', '2021-10-05 18:00:13', '2021-10-06 12:00:57'),
(662, 11, 27, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1381', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:01:23', '2021-10-05 18:01:23'),
(663, 11, 28, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1382', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-02', '2021-10-05 18:04:41', '2021-10-06 09:44:00'),
(664, 11, 29, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1383', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-18', '2021-10-05 18:06:47', '2021-10-18 18:39:43'),
(665, 11, 30, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1384', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:08:19', '2021-10-05 18:08:19'),
(666, 11, 32, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1385', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 18:09:59', '2021-10-06 11:56:22'),
(667, 11, 33, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1386', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:11:18', '2021-10-05 18:11:18'),
(668, 11, 34, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1387', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:12:30', '2021-10-05 18:12:30'),
(669, 11, 35, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1388', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:13:35', '2021-10-05 18:13:35'),
(670, 11, 37, 16, 52, 1, 50000, '[]', 50000, 1, 1, 'Contabilidad Mensual', '1389', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:14:42', '2021-10-05 18:14:42'),
(671, 11, 43, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1390', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-02', '2021-10-05 18:15:52', '2021-10-06 09:49:19'),
(672, 11, 46, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1391', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:17:28', '2021-10-05 18:17:28'),
(673, 11, 49, 15, 52, 1, 38000, '[]', 38000, 1, 1, 'Contabilidad Mensual', '1392', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:18:37', '2021-10-05 18:18:37'),
(674, 11, 50, 17, 52, 1, 10000, '[]', 10000, 1, 1, 'Contabilidad Mensual', '1393', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:20:31', '2021-10-05 18:20:31'),
(675, 11, 52, 8, 52, 1, 39120, '[]', 39120, 1, 1, 'Contabilidad Mensual', '1394', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:21:44', '2021-10-05 18:21:44'),
(676, 11, 55, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1395', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-11', '2021-10-05 18:22:46', '2021-10-12 16:33:24'),
(677, 11, 57, 13, 52, 1, 35000, '[]', 35000, 1, 1, 'Contabilidad Mensual', '1396', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-13', '2021-10-05 18:24:30', '2021-10-13 16:01:57'),
(678, 11, 58, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1397', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-11', '2021-10-05 18:25:31', '2021-10-12 10:22:29'),
(679, 11, 61, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1398', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 18:26:48', '2021-10-11 11:12:30'),
(680, 11, 62, 8, 53, 1, 39120, '[]', 39120, 1, 1, 'Contabilidad Mensual', '1399', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-07', '2021-10-05 18:28:16', '2021-10-07 12:34:58'),
(681, 11, 66, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1400', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:29:22', '2021-10-05 18:29:22'),
(682, 11, 67, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1401', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:31:23', '2021-10-05 18:31:23'),
(683, 11, 69, 1, 53, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1402', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:32:25', '2021-10-05 18:32:25'),
(684, 11, 70, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1403', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:37:04', '2021-10-05 18:37:04'),
(685, 11, 72, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1404', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 18:38:07', '2021-10-06 11:45:01'),
(686, 11, 73, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1405', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-05', '2021-10-05 18:39:01', '2021-10-06 16:19:42'),
(687, 11, 74, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1406', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-15', '2021-10-05 18:40:24', '2021-10-15 12:59:11'),
(688, 11, 76, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1407', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-06', '2021-10-05 18:41:25', '2021-10-06 11:47:06'),
(689, 11, 78, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1408', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-12', '2021-10-05 18:42:41', '2021-10-13 10:47:24'),
(690, 11, 79, 5, 52, 1, 20000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1409', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-06', '2021-10-05 18:43:41', '2021-10-11 11:14:03'),
(691, 11, 81, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1410', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:45:51', '2021-10-05 18:45:51'),
(692, 11, 84, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1411', '2021-10-05', '2021-10-20', 4, '', 3, '2021-10-06', '2021-10-05 18:46:49', '2021-10-06 16:17:39'),
(693, 11, 83, 1, 52, 1, 30000, '[]', 20000, 1, 1, 'Contabilidad Mensual', '1412', '2021-10-05', '2021-10-20', 1, '', NULL, NULL, '2021-10-05 18:49:25', '2021-10-05 18:50:50'),
(694, 11, 56, 9, 1, 14, 0, '[]', 39990, 1, 10, 'Constitucion de Sociedad ', '1413', '2021-10-07', '2021-10-07', 4, 'IBADAJANI SPA\r\n77.456.112-9', 3, '2021-10-07', '2021-10-07 11:02:36', '2021-10-07 11:26:35'),
(695, 11, 56, 9, 1, 1, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1414', '2021-10-07', '2021-10-07', 4, 'Soluciones Informáticas ALDIFRA SPA\r\n77.456.143-9', 3, '2021-10-07', '2021-10-07 11:25:45', '2021-10-07 11:27:43'),
(696, 11, 56, 9, 1, 1, 0, '[]', 100000, 1, 10, 'Constitucion de Sociedad ', '1415', '2021-10-07', '2021-10-07', 4, '77.457.091-8\r\nAVICA SPA', 3, '2021-10-07', '2021-10-07 13:52:40', '2021-10-07 13:57:07'),
(697, 11, 56, 9, 1, 14, 0, '[]', 49990, 1, 10, 'Constitucion de Sociedad ', '1418', '2021-10-14', '2021-10-14', 4, 'IBADAJANI\r\n77.456.112-9', 3, '2021-10-14', '2021-10-14 09:29:17', '2021-10-14 13:58:32'),
(698, 11, 86, 1, 1, 1, 30000, '[]', 13000, 1, 1, 'Contabilidad Mensual', '1417', '2021-10-14', '2021-10-20', 4, 'Adicional 2 remuneraciones', 3, '2021-10-15', '2021-10-14 19:10:13', '2021-10-15 12:57:32'),
(699, 11, 86, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1419', '2021-10-14', '2021-10-20', 4, '', 3, '2021-10-15', '2021-10-14 19:12:19', '2021-10-15 12:58:01'),
(700, 11, 82, 1, 52, 1, 30000, '[]', 30000, 1, 1, 'Contabilidad Mensual', '1420', '2021-10-18', '2021-10-20', 1, '', NULL, NULL, '2021-10-18 12:02:59', '2021-10-18 12:02:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia_cobro`
--

CREATE TABLE `frecuencia_cobro` (
  `idFrecuenciaCobro` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `frecuencia_cobro`
--

INSERT INTO `frecuencia_cobro` (`idFrecuenciaCobro`, `nombre`, `frecuencia`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Unico', 0, '2020-10-14 12:36:45', '2020-10-14 12:37:06'),
(3, 'Semanal', 7, '2020-10-14 12:36:45', '2020-10-14 17:56:07'),
(4, 'Quincenal', 15, '2020-10-14 12:36:45', '2020-10-14 17:56:06'),
(5, 'Mensual', 31, '2020-10-14 12:36:45', '2020-10-14 17:56:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_tareas`
--

CREATE TABLE `historial_tareas` (
  `id` bigint(20) NOT NULL,
  `tarea_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_spanish_ci NOT NULL,
  `anulado` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `historial_tareas`
--

INSERT INTO `historial_tareas` (`id`, `tarea_id`, `usuario_id`, `comentario`, `anulado`, `created_at`) VALUES
(1, 2, 8, 'Se ha cambiado el estado de la tarea a: Cerrado', 0, '2021-04-19 14:54:39'),
(2, 2, 8, 'Se ha cambiado el estado de la tarea a: Pendiente', 0, '2021-04-19 14:54:42'),
(3, 2, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-19 14:59:33'),
(4, 2, 8, 'Se ha cambiado el estado de la tarea a <b>Pendiente</b>', 0, '2021-04-19 14:59:35'),
(5, 2, 8, 'Prueba del sistema', 0, '2021-04-19 15:11:06'),
(6, 2, 8, 'Ok jose', 0, '2021-04-19 15:58:36'),
(7, 2, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 1, '2021-04-19 15:59:42'),
(8, 2, 8, 'Se ha cambiado el estado de la tarea a <b>Pendiente</b>', 0, '2021-04-19 20:12:31'),
(9, 2, 8, 'Se ha cambiado el estado de la tarea a <b>Anulado</b> por:<br>Caso de prueba\n', 0, '2021-04-19 20:12:59'),
(10, 3, 8, 'se conversa con cliente el cual se compromete en enviar datos para constitución dia martes 20 de abril 2021 ', 0, '2021-04-19 20:17:12'),
(11, 9, 8, 'SE CARGA EL RCV LAS DIN QUEDA PENDIENTE ENVIAR A CLIENTE EL F29 ACTUALIZADO. \r\n\r\nPD: enviar a jose por whatsapp\r\n', 0, '2021-04-19 20:42:21'),
(12, 10, 8, 'SE CONVERSA CON CLIENTE RESPECTO A SITUACION ACTUAL DE LA EMPRESA DONDE SE LE INFORMA QUE LA EMPRESA ESTA CON PROBLEMAS TRIBUTARIO Y NO SE PUEDE EMITIR BOLETAS. ', 0, '2021-04-19 20:46:45'),
(13, 10, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-19 20:47:01'),
(14, 12, 8, 'Se ha actualizado la tarea.', 0, '2021-04-19 21:08:10'),
(15, 16, 8, 'Se ha actualizado la tarea.', 0, '2021-04-19 21:08:39'),
(16, 11, 8, 'Se ha actualizado la tarea.', 0, '2021-04-19 22:13:07'),
(17, 18, 8, 'Se ha cambiado el estado de la tarea a <b>Anulado</b> por:<br>TAREA REPETIDA', 0, '2021-04-19 22:13:44'),
(18, 6, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 1, '2021-04-20 09:49:55'),
(19, 9, 8, 'Se ha actualizado la tarea.', 0, '2021-04-20 09:57:45'),
(20, 9, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-20 09:58:12'),
(21, 9, 8, 'Se ha cambiado el estado de la tarea a <b>Pendiente</b>', 0, '2021-04-20 09:58:18'),
(22, 6, 9, 'Sigue pendiente', 0, '2021-04-20 10:04:56'),
(23, 6, 9, 'Se ha cambiado el estado de la tarea a <b>Pendiente</b>', 0, '2021-04-20 10:06:19'),
(24, 6, 9, 'Se ha actualizado la tarea.', 0, '2021-04-20 10:06:49'),
(25, 15, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-20 10:09:18'),
(26, 3, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-21 09:33:18'),
(27, 9, 8, 'ENVIADO  OK', 0, '2021-04-21 14:32:03'),
(28, 9, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-21 14:32:06'),
(29, 19, 8, 'Se ha actualizado la tarea.', 0, '2021-04-21 14:33:09'),
(30, 21, 8, 'Se ha cambiado el estado de la tarea a <b>Anulado</b> por:<br>REPETIDA\n', 0, '2021-04-21 16:45:01'),
(31, 23, 8, ' SE LE SOLICITA A DANIEL PLAZA ACCESO AL CORREO CORPORATIVO PARA TERMINAR SOLICITUD \r\n', 0, '2021-04-22 17:26:47'),
(32, 19, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-23 09:29:59'),
(33, 24, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-23 10:45:55'),
(34, 25, 8, 'se le envia f29 empresa y socio \r\n', 0, '2021-04-24 09:11:47'),
(35, 25, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-24 09:11:51'),
(36, 23, 8, 'se intenta recuperar contraseña per sistema del sii no permite por codigo aun vigente ', 0, '2021-04-24 09:42:36'),
(37, 27, 9, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-04-26 09:50:07'),
(38, 6, 8, 'Se ha cambiado el estado de la tarea a <b>Cerrado</b>', 0, '2021-05-12 15:02:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_a`
--

CREATE TABLE `menus_a` (
  `idMenuA` int(11) NOT NULL,
  `label` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `link` text COLLATE utf8_spanish_ci NOT NULL,
  `conOpciones` tinyint(1) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus_a`
--

INSERT INTO `menus_a` (`idMenuA`, `label`, `seccion`, `image`, `link`, `conOpciones`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Reportes', 'Reportes', 'far fa-circle', 'Reportes/', 0, '2021-03-24 10:11:36', '2021-03-24 10:11:56'),
(10, 'Egresos', 'Gestion', 'fas fa-credit-card', 'Egresos/', 0, '2020-10-27 15:25:42', '2021-09-21 13:52:28'),
(15, 'Tareas', 'Tareas', 'far fa-circle', 'Tareas/', 0, '2021-04-19 15:14:35', '2021-09-21 13:52:28'),
(20, 'Facturas', 'Gestion', 'fas fa-money-bill-wave', 'Facturas/', 1, '2020-10-16 12:10:32', '2021-09-21 13:52:28'),
(22, 'Cobros Adicionales', 'Gestion', 'fas fa-file-invoice-dollar', 'Cobros_Adicionales/', 0, '2021-07-22 17:07:44', '2021-09-21 13:52:28'),
(25, 'Caja', 'Reportes', 'fas fa-money-bill-wave', 'Caja/', 0, '2021-03-17 12:23:21', '2021-09-21 13:52:28'),
(30, 'Periodo contable', 'Mantenedores', 'fas fa-circle', 'Periodo_Contable/', 0, '2020-10-14 00:12:58', '2021-09-21 13:52:28'),
(40, 'Centros de costo', 'Mantenedores', 'fas fa-circle', 'Centros_costo/', 0, '2020-10-19 18:38:09', '2021-09-21 13:52:28'),
(50, 'Metodos de pago', 'Mantenedores', 'fas fa-circle', 'Metodos_pago/', 0, '2020-10-19 18:38:09', '2021-09-21 13:52:28'),
(60, 'Empresas', 'Empresas', 'fas fa-store', 'Empresas/', 0, '2020-10-08 15:49:47', '2021-03-17 12:22:36'),
(70, 'Planes', 'Mantenedores', 'fas fa-file-invoice-dollar', 'Planes/', 0, '2020-10-14 00:12:43', '2021-09-21 13:52:28'),
(75, 'Servicios', 'Mantenedores', 'far fa-circle', 'Servicios/', 0, '2021-03-24 09:18:21', '2021-09-21 13:52:28'),
(80, 'Frecuencia de cobro', 'Mantenedores', 'fas fa-circle', 'Frecuencia_Cobro/', 0, '2020-10-14 00:12:43', '2021-09-21 13:52:28'),
(90, 'Monedas', 'Mantenedores', 'fas fa-money-bill', 'Monedas/', 0, '2020-10-14 00:12:58', '2021-09-21 13:52:28'),
(100, 'Gestion de sistema', 'Sistema', 'fas fa-cogs', 'Gestion_Sistema/', 1, '2020-10-08 15:49:26', '2020-10-19 16:40:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_a_permisos`
--

CREATE TABLE `menus_a_permisos` (
  `idRol` int(11) NOT NULL,
  `idMenuA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus_a_permisos`
--

INSERT INTO `menus_a_permisos` (`idRol`, `idMenuA`) VALUES
(1, 100),
(1, 10),
(1, 20),
(1, 30),
(1, 40),
(1, 50),
(1, 60),
(1, 70),
(1, 80),
(1, 90),
(2, 25),
(2, 60),
(2, 70),
(2, 90),
(1, 25),
(1, 75),
(1, 1),
(2, 20),
(2, 10),
(2, 75),
(3, 20),
(1, 15),
(2, 15),
(3, 15),
(1, 22),
(2, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_b`
--

CREATE TABLE `menus_b` (
  `idMenuB` int(11) NOT NULL,
  `idMenuA` int(11) NOT NULL,
  `label` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `link` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus_b`
--

INSERT INTO `menus_b` (`idMenuB`, `idMenuA`, `label`, `image`, `link`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 100, 'Usuarios', 'far fa-circle', 'Gestion_Sistema/Usuarios/', '2020-10-08 15:52:43', '2020-10-08 16:41:55'),
(2, 100, 'Roles', 'far fa-circle', 'Gestion_Sistema/Roles/', '2020-10-08 15:52:43', '2020-10-08 16:41:57'),
(3, 20, 'Por generar', 'far fa-circle', 'Facturas/Por_Generar/', '2020-10-19 22:37:58', '2021-03-17 12:22:51'),
(4, 20, 'Reporte General', 'far fa-circle', 'Facturas/Index/', '2020-10-19 22:37:58', '2021-03-17 12:22:53'),
(5, 20, 'Pendientes', 'far fa-circle', 'Facturas/Pendientes/', '2021-03-17 10:26:42', '2021-03-17 12:22:58'),
(6, 20, 'Anulados', 'far fa-circle', 'Facturas/Anulados/', '2021-03-17 10:26:42', '2021-03-17 12:22:54'),
(7, 20, 'Vencidos', 'far fa-circle', 'Facturas/Vencidos/', '2021-03-17 10:28:50', '2021-03-17 12:22:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_b_permisos`
--

CREATE TABLE `menus_b_permisos` (
  `idRol` int(11) NOT NULL,
  `idMenuB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus_b_permisos`
--

INSERT INTO `menus_b_permisos` (`idRol`, `idMenuB`) VALUES
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 1),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(1, 3),
(2, 3),
(3, 4),
(3, 6),
(3, 3),
(3, 5),
(3, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `idMetodoPago` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`idMetodoPago`, `nombre`, `descripcion`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(3, 'Transferencia Bancaria', '', '2020-10-20 17:53:05', '2020-10-20 17:53:05', 0),
(4, 'Tarjeta Credito', '', '2020-10-20 17:53:14', '2020-10-20 17:53:14', 0),
(5, 'Tarjeta Debito ', '', '2020-10-20 17:53:24', '2020-10-20 17:53:24', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `idMoneda` int(11) NOT NULL COMMENT 'ID: 1 -> moneda nacional [obligatoria]',
  `codigoMiIndicador` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `simbolo` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `decimales` int(11) NOT NULL,
  `precioCLP` float NOT NULL,
  `classCard` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`idMoneda`, `codigoMiIndicador`, `nombre`, `simbolo`, `decimales`, `precioCLP`, `classCard`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, '', 'Moneda nacional', 'CLP', 0, 1, 'bg-info text-white', '2020-10-05 19:49:39', '2020-10-26 04:07:19'),
(2, 'uf', 'Unidad de fomento', 'UF', 2, 30092.4, 'bg-warning', '2020-10-05 19:49:39', '2021-10-01 09:45:27'),
(3, 'dolar', 'Dolar', '$', 2, 811.9, 'bg-success text-white', '2020-10-23 22:17:03', '2021-10-01 09:45:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos_contables`
--

CREATE TABLE `periodos_contables` (
  `idPeriodoContable` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `es_fijo` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `periodos_contables`
--

INSERT INTO `periodos_contables` (`idPeriodoContable`, `nombre`, `es_fijo`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(1, 'Otros Cobros ', 0, '2020-10-14 14:24:03', '2020-10-14 14:24:18', 0),
(8, 'Enero 2018', 0, '2020-10-20 18:22:37', '2020-10-20 18:22:37', 0),
(9, 'Febrero 2018', 0, '2020-10-21 10:34:17', '2020-10-21 10:34:17', 0),
(10, 'Marzo 2018', 0, '2020-10-21 10:41:38', '2020-10-21 10:41:38', 0),
(11, 'Abril 2018', 0, '2020-10-21 10:45:58', '2020-10-21 10:45:58', 0),
(12, 'Mayo 2018', 0, '2020-10-21 10:46:11', '2020-10-21 10:46:11', 0),
(13, 'Junio 2018', 0, '2020-10-21 10:46:23', '2020-10-21 10:46:23', 0),
(14, 'Julio 2018', 0, '2020-10-21 10:47:18', '2020-10-21 10:47:18', 0),
(15, 'Agosto 2018', 0, '2020-10-21 10:48:44', '2020-10-21 10:48:44', 0),
(16, 'Septiembre 2018', 0, '2020-10-21 10:48:54', '2020-10-21 10:48:54', 0),
(17, 'Octubre 2018', 0, '2020-10-21 10:49:19', '2020-10-21 10:49:19', 0),
(18, 'Noviembre 2018', 0, '2020-10-21 10:49:29', '2020-10-21 10:49:29', 0),
(19, 'Diciembre 2018', 0, '2020-10-21 10:49:41', '2020-10-21 10:49:41', 0),
(20, 'Enero 2019', 0, '2020-10-21 10:50:59', '2020-10-21 10:50:59', 0),
(21, 'Febrero 2019', 0, '2020-10-21 10:51:09', '2020-10-21 10:51:09', 0),
(22, 'Marzo 2019', 0, '2020-10-21 10:51:19', '2020-10-21 10:51:19', 0),
(23, 'Abril 2019', 0, '2020-10-21 10:51:33', '2020-10-21 10:51:33', 0),
(24, 'Mayo 2019', 0, '2020-10-21 10:51:51', '2020-10-21 10:51:51', 0),
(25, 'Junio 2019', 0, '2020-10-21 10:52:03', '2020-10-21 10:52:03', 0),
(26, 'Julio 2019', 0, '2020-10-21 10:52:14', '2020-10-21 10:52:14', 0),
(27, 'Agosto 2019', 0, '2020-10-21 10:52:21', '2020-10-21 10:52:21', 0),
(28, 'Septiembre 2019', 0, '2020-10-21 10:52:37', '2020-10-21 10:52:37', 0),
(29, 'Octubre 2019', 0, '2020-10-21 10:52:50', '2020-10-21 10:52:50', 0),
(30, 'Noviembre 2019', 0, '2020-10-21 10:52:57', '2020-10-21 10:52:57', 0),
(31, 'Diciembre 2019', 0, '2020-10-21 10:53:07', '2020-10-21 10:53:07', 0),
(32, 'Enero 2020', 0, '2020-10-21 10:53:14', '2020-10-21 10:53:14', 0),
(33, 'Febrero 2020', 0, '2020-10-21 10:53:23', '2020-10-21 10:53:23', 0),
(34, 'Marzo 2020', 0, '2020-10-21 10:53:30', '2020-10-21 10:53:30', 0),
(35, 'Abril 2020', 0, '2020-10-21 10:53:36', '2020-10-21 10:53:36', 0),
(36, 'Mayo 2020', 0, '2020-10-21 10:53:47', '2020-10-21 10:53:47', 0),
(37, 'Junio 2020', 0, '2020-10-21 10:53:56', '2020-10-21 10:53:56', 0),
(38, 'Julio 2020', 0, '2020-10-21 10:54:03', '2020-10-21 10:54:03', 0),
(39, 'Agosto 2020', 0, '2020-10-21 10:54:11', '2020-10-21 10:54:11', 0),
(40, 'Septiembre 2020', 0, '2020-10-21 10:54:23', '2020-10-21 10:54:23', 0),
(41, 'Octubre 2020', 0, '2020-10-21 10:54:32', '2020-10-21 10:54:32', 0),
(42, 'Noviembre 2020', 0, '2020-10-21 10:54:41', '2020-10-21 10:54:41', 0),
(43, 'Diciembre 2020', 0, '2020-10-21 10:54:49', '2020-10-21 10:54:49', 0),
(44, 'Enero 2021', 0, '2020-10-21 10:55:02', '2020-10-21 10:55:02', 0),
(45, 'Febrero 2021', 0, '2020-10-21 10:55:10', '2020-10-21 10:55:10', 0),
(46, 'Marzo 2021', 0, '2020-10-21 10:55:17', '2020-10-21 10:55:17', 0),
(47, 'Abril 2021', 0, '2020-10-21 10:55:24', '2020-10-21 10:55:24', 0),
(48, 'Mayo 2021', 0, '2020-10-21 10:55:39', '2020-10-21 10:55:39', 0),
(49, 'Junio 2021', 0, '2020-10-21 10:55:52', '2020-10-21 10:55:52', 0),
(50, 'Julio 2021', 0, '2020-10-21 10:56:30', '2020-10-21 10:56:30', 0),
(51, 'Agosto 2021', 0, '2020-10-21 10:56:37', '2020-10-21 10:56:37', 0),
(52, 'Septiembre 2021', 0, '2020-10-21 10:56:59', '2020-10-21 10:56:59', 0),
(53, 'Octubre 2021', 0, '2020-10-21 10:57:10', '2020-10-21 10:57:10', 0),
(54, 'Noviembre 2021', 0, '2020-10-21 10:57:20', '2020-10-21 10:57:20', 0),
(55, 'Diciembre 2021', 0, '2020-10-21 10:57:29', '2020-10-21 10:57:29', 0),
(56, 'Operacion Renta At 2021', 0, '2021-03-12 23:45:44', '2021-03-12 23:45:44', 0),
(57, '50% Inicial ', 0, '2021-06-28 13:01:08', '2021-06-28 13:01:08', 0),
(58, '50% Final', 0, '2021-06-28 13:01:15', '2021-06-28 13:01:15', 0),
(59, 'Todos los Meses', 1, '2021-07-22 17:22:13', '2021-07-22 17:22:56', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `idPlan` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `idFrecuenciaCobro` int(11) NOT NULL,
  `monto` float NOT NULL,
  `detalle` text COLLATE utf8_spanish_ci NOT NULL,
  `idMoneda` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`idPlan`, `codigo`, `nombre`, `idFrecuenciaCobro`, `monto`, `detalle`, `idMoneda`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(1, '5555', 'Plan Emprende Pyme 30', 5, 30000, 'Libro Contables Segun  Regimen\r\nAsesoria Mensual\r\n\r\nNo incluye Remuneraciones ', 1, '2021-03-21 17:32:57', '2021-03-21 17:32:57', 0),
(2, '5532', 'Plan Especial 3,5 UF (101.000)', 5, 3.5, '', 2, '2021-03-24 18:47:26', '2021-03-25 10:38:16', 0),
(3, '5544', 'Plan Especial 60', 5, 60000, '', 1, '2021-03-25 10:37:47', '2021-03-25 10:44:38', 0),
(4, '3322', 'Plan Especial Chato', 5, 26998, '', 1, '2021-03-25 10:44:26', '2021-03-30 12:22:45', 0),
(5, '658', 'Plan Especial 20', 5, 20000, '', 1, '2021-03-25 11:07:47', '2021-03-25 11:08:06', 0),
(6, '083', 'Plan Especial 40', 5, 40000, '', 1, '2021-03-25 12:47:17', '2021-03-25 12:47:17', 0),
(7, '5533', 'Plan Especial 150', 5, 150000, '', 1, '2021-03-26 09:53:13', '2021-03-30 12:23:11', 0),
(8, '43555', 'Plan Especial 1.3 UF', 5, 1.3, '', 2, '2021-03-26 09:55:49', '2021-03-30 12:22:53', 0),
(9, 'Suspendido', 'No Emitir Suspendido', 5, 0, 'Cliente suspendido no hay que emitir Cobro', 1, '2021-03-30 12:09:09', '2021-03-30 12:09:09', 0),
(10, '5530', 'Plan Especial 55', 5, 55000, '', 1, '2021-03-30 12:13:21', '2021-03-30 12:23:02', 0),
(11, '5809', 'Plan Especial 45', 5, 45000, '', 1, '2021-03-30 12:22:27', '2021-03-30 12:22:27', 0),
(12, '888809', 'Plan Especial 120', 5, 120000, '', 1, '2021-04-06 16:57:04', '2021-04-06 16:57:04', 0),
(13, '56567', 'Plan Especial 35', 5, 35000, '', 1, '2021-04-27 17:21:13', '2021-04-27 17:21:13', 0),
(14, '888889', 'Plan Especial 15 ', 5, 15000, '', 1, '2021-04-27 17:21:26', '2021-04-27 17:21:34', 0),
(15, '55444', 'Plan Especial 38', 5, 38000, '', 1, '2021-04-27 17:34:19', '2021-04-27 17:34:19', 0),
(16, '466463', 'Plan Especial 50', 5, 50000, '', 1, '2021-05-04 14:26:37', '2021-05-04 14:26:37', 0),
(17, '58482', 'Plan Especial 10', 5, 10000, '', 1, '2021-05-10 17:20:35', '2021-05-10 17:20:35', 0),
(18, '0000', 'Plan especial', 5, 50650, '', 1, '2021-07-08 13:47:50', '2021-07-08 13:47:50', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombre`, `descripcion`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Administrador de sistema', 'Nivel 1', '2020-10-13 21:18:19', '2020-10-13 21:18:19'),
(2, 'Finanzas ', 'Nivel 2', '2020-10-05 19:45:29', '2021-03-25 12:17:38'),
(3, 'Digitalizador', 'Nivel 3', '2020-10-13 21:24:10', '2020-10-13 21:30:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` text COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 'Contabilidad Mensual', '', '2021-03-24 09:41:47', '2021-03-24 12:16:17'),
(5, 'Operacion Renta AT 2021 - 50% Inicial', '', '2021-03-24 12:11:28', '2021-03-24 12:22:24'),
(6, 'Operacion Renta AT 2021 - 50% Final	', '', '2021-03-24 12:12:32', '2021-03-24 12:18:30'),
(7, 'Declaración F29 Fuera de Plazo', 'Se sugiere cobrar por periodo mínimo 15.000.-', '2021-03-24 12:14:15', '2021-03-24 12:14:15'),
(8, 'Regularización Empresa', 'Se sugiere cobrar desde 150.000', '2021-03-24 12:15:07', '2021-03-24 12:15:07'),
(9, 'Cambio Societario - SpA', '', '2021-04-27 17:29:45', '2021-04-27 17:29:45'),
(10, 'Constitucion de Sociedad ', '', '2021-06-11 10:12:55', '2021-06-11 10:12:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_egresos`
--

CREATE TABLE `status_egresos` (
  `idStatus` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `status_egresos`
--

INSERT INTO `status_egresos` (`idStatus`, `nombre`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'Vigente', '2020-10-29 11:30:14', '2020-10-29 11:30:14'),
(2, 'Anulado', '2020-10-29 11:30:14', '2020-10-29 11:30:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_facturas`
--

CREATE TABLE `status_facturas` (
  `idStatus` int(11) NOT NULL COMMENT 'ID: 1 = Status PENDIENTE [obligatorio]',
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `status_facturas`
--

INSERT INTO `status_facturas` (`idStatus`, `nombre`, `fecha_registro`, `fecha_modificacion`) VALUES
(1, 'PENDIENTE', '2020-10-19 16:13:22', '2020-10-19 16:13:22'),
(2, 'VENCIDO', '2020-10-19 16:13:22', '2020-10-19 16:13:22'),
(3, 'ANULADO', '2020-10-19 16:13:22', '2020-10-19 16:13:22'),
(4, 'PAGADO', '2020-10-19 16:13:22', '2020-10-19 16:13:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `estado_id`, `empresa_id`, `usuario_id`, `descripcion`, `fecha_vencimiento`, `created_at`, `updated_at`) VALUES
(2, 3, 3, 1, 'Texto de ejemplo\r\npero muy\r\nlaaaaaaaaaaaaargo\r\nlaaaaaaaaaaaaargo\r\nlaaaaaaaaaaaaargo\r\nlaaaaaaaaaaaaargo', '2021-04-20', '2021-04-19 13:06:03', '2021-04-19 20:12:59'),
(3, 4, 22, 8, 'Creacion Sociedad Nueva \r\nValor cobrado 30 mil pesos', '2021-04-20', '2021-04-19 20:14:59', '2021-04-21 09:33:18'),
(4, 2, 28, 8, 'Tramitar licencias Carlos 2 pendientes', '2021-04-20', '2021-04-19 20:33:42', '2021-04-21 01:24:33'),
(5, 2, 28, 8, 'Licencia kevin trabajador yolanda ', '2021-04-20', '2021-04-19 20:35:15', '2021-04-21 01:24:33'),
(6, 4, 19, 8, 'ricardo consulta sobre operacion renta la cual aun no se termina.', '2021-04-21', '2021-04-19 20:36:29', '2021-05-12 15:02:34'),
(7, 2, 27, 8, 'Terminar y tramitar Renta Empresa', '2021-04-20', '2021-04-19 20:37:55', '2021-04-21 01:24:33'),
(8, 2, 39, 8, 'Terminar operacion Renta y enviar ', '2021-04-23', '2021-04-19 20:40:03', '2021-04-24 09:07:55'),
(9, 4, 38, 9, 'Iva Empresa falta enviar actualizado y cargar DIN Compra - Enviar por correo', '2021-04-20', '2021-04-19 20:41:07', '2021-04-21 14:32:06'),
(10, 4, 8, 8, 'CLIENTE SOLICITA FACTURA PARA FISCALIA REGION LOS LAGOS.', '2021-04-16', '2021-04-19 20:45:37', '2021-04-19 20:47:01'),
(11, 2, 48, 8, 'RMS \r\nSOLICITA REUNION PARA EVALUAR ESTADO DE SOCIEDAD Y RESULTADOS SEGUN BALANCE ', '2021-04-21', '2021-04-19 20:49:12', '2021-04-22 09:44:30'),
(12, 2, 48, 8, 'LUCEN SPA: SOLICITA ACTUALIZAR DEUDA DE IVAS PARA HACER CIERRE TRIBUTARIO.', '2021-04-30', '2021-04-19 20:50:28', '2021-05-01 00:32:30'),
(13, 2, 35, 8, 'CLIENTE SOLICITA REUNION PARA REVISAR OP RENTA AT 2021 ', '2021-04-20', '2021-04-19 20:51:24', '2021-04-21 01:24:33'),
(14, 2, 22, 8, 'CLIENTE SOLICITA RETOMAR VENTA DE ACCIONES CON ANDRES FIRMA 1 SERA ONLINE Y 2 EN NOTARIA SAN FERNANDO. ', '2021-04-20', '2021-04-19 20:52:48', '2021-04-21 01:24:33'),
(15, 4, 26, 9, 'ENVIAR IVA COMO ARCHIVO ADJUNTO POR CORREO ', '2021-04-20', '2021-04-19 20:53:40', '2021-04-20 10:09:18'),
(16, 2, 48, 8, 'Imprenta Gigi Stick Limitada\r\nAgendar reunion con cliente para hacer entrega operación renta.', '2021-04-21', '2021-04-19 21:07:23', '2021-04-22 09:44:30'),
(17, 2, 48, 8, 'EHOGAR CLIENTE SOLICITA ENVIO DOCUMENTOS TRIBUTARIOS OP RENTA AT 2021', '2021-04-20', '2021-04-19 22:12:27', '2021-04-21 01:24:33'),
(18, 3, 48, 8, 'EHOGAR CLIENTE SOLICITA ENVIO DOCUMENTOS TRIBUTARIOS OP RENTA AT 2021', '2021-04-20', '2021-04-19 22:12:33', '2021-04-19 22:13:44'),
(19, 4, 48, 9, 'ENVIAR F29 PAGADO\r\nSERV LOGISTICOS\r\nSECOR\r\nSOKAN \r\nR&G \r\nINDUS PRODUCCIONES \r\nKIUVO DISEÑO \r\nYOLANDA.\r\nPANADERIA EL CHATO \r\n', '2021-04-21', '2021-04-21 14:30:56', '2021-04-23 09:29:59'),
(20, 2, 22, 8, 'VENTA DE ACCIONES \r\nCLIENTE SOLICITA VENTA DE ACCIONES', '2021-04-23', '2021-04-21 16:44:21', '2021-04-24 09:07:55'),
(21, 3, 22, 8, 'VENTA DE ACCIONES \r\nCLIENTE SOLICITA VENTA DE ACCIONES', '2021-04-23', '2021-04-21 16:44:35', '2021-04-21 16:45:01'),
(22, 2, 18, 8, 'Activar Sistema de Facturacion', '2021-04-23', '2021-04-22 13:57:54', '2021-04-24 09:07:55'),
(23, 2, 48, 8, 'EASYCONT\r\nenviar a Orlando Fundacion copia clave sii', '2021-04-23', '2021-04-22 14:08:11', '2021-04-24 09:07:55'),
(24, 4, 8, 9, 'Cargar Boleta Honorarios Invertu SpA recibidas en el año 2020 en mascontable. ', '2021-04-23', '2021-04-23 00:26:00', '2021-04-23 10:45:55'),
(25, 4, 29, 8, 'ENVIAR F22 SOKAN Y JUDIT', '2021-04-23', '2021-04-23 00:56:01', '2021-04-24 09:11:51'),
(26, 2, 44, 8, 'Reunión con la sra Irma Contreras a las 2 pm asunto a tratar presentación de la renta AT2021 ', '2021-04-26', '2021-04-23 10:47:48', '2021-04-27 09:56:26'),
(27, 4, 37, 9, 'ENVIAR F29 PAGADO  DIC 2020', '2021-04-26', '2021-04-25 11:34:35', '2021-04-26 09:50:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `idRol` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `correo`, `clave`, `idRol`, `activo`, `fecha_registro`, `fecha_modificacion`, `isDeleted`) VALUES
(1, 'Jefferson Torres', 'jefersonugas@gmail.com', 'admin', 1, 1, '2020-10-08 14:03:20', '2020-10-08 15:24:25', 0),
(8, 'Jose Sanchez', 'JOSE@SANTIAGOCONTADORES.CL', 'asd1352', 1, 1, '2020-10-14 19:04:53', '2021-04-25 11:31:33', 0),
(9, 'Daniela Acosta', 'daniela.acosta@santiagocontadores.cl ', 'daniela1352', 2, 1, '2020-10-14 20:22:40', '2021-03-25 12:39:16', 0),
(10, 'Andreina', 'asistente.perfumeriamercedes@gmail.com', 'asistente1352', 3, 0, '2021-03-24 18:28:03', '2021-07-27 17:35:04', 0),
(11, 'Desire Acosta', 'desire.acosta@santiagocontadores.cl', 'comercial1352', 2, 1, '2021-04-26 14:28:00', '2021-04-26 14:28:00', 0),
(12, 'Jhon Franquis ', 'jhon.franquis@santiagocontadores.cl', 'ejecutivo1352', 2, 1, '2021-07-23 10:27:47', '2021-08-23 15:47:28', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centros_costo`
--
ALTER TABLE `centros_costo`
  ADD PRIMARY KEY (`idCentroCosto`);

--
-- Indices de la tabla `cobros_adicionales`
--
ALTER TABLE `cobros_adicionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`idEgreso`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `estados_tareas`
--
ALTER TABLE `estados_tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `frecuencia_cobro`
--
ALTER TABLE `frecuencia_cobro`
  ADD PRIMARY KEY (`idFrecuenciaCobro`);

--
-- Indices de la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historial_tareas_tareas1_idx` (`tarea_id`),
  ADD KEY `fk_historial_tareas_usuarios1_idx` (`usuario_id`);

--
-- Indices de la tabla `menus_a`
--
ALTER TABLE `menus_a`
  ADD PRIMARY KEY (`idMenuA`);

--
-- Indices de la tabla `menus_b`
--
ALTER TABLE `menus_b`
  ADD PRIMARY KEY (`idMenuB`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`idMetodoPago`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`idMoneda`);

--
-- Indices de la tabla `periodos_contables`
--
ALTER TABLE `periodos_contables`
  ADD PRIMARY KEY (`idPeriodoContable`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`idPlan`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_egresos`
--
ALTER TABLE `status_egresos`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indices de la tabla `status_facturas`
--
ALTER TABLE `status_facturas`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tareas_estados_tareas_idx` (`estado_id`),
  ADD KEY `fk_tareas_empresas1_idx` (`empresa_id`),
  ADD KEY `fk_tareas_usuarios1_idx` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `centros_costo`
--
ALTER TABLE `centros_costo`
  MODIFY `idCentroCosto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 1: Gastos Personal Jose [Obligatorio]', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cobros_adicionales`
--
ALTER TABLE `cobros_adicionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `idEgreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `estados_tareas`
--
ALTER TABLE `estados_tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT de la tabla `frecuencia_cobro`
--
ALTER TABLE `frecuencia_cobro`
  MODIFY `idFrecuenciaCobro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `menus_a`
--
ALTER TABLE `menus_a`
  MODIFY `idMenuA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `menus_b`
--
ALTER TABLE `menus_b`
  MODIFY `idMenuB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `idMetodoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `idMoneda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID: 1 -> moneda nacional [obligatoria]', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `periodos_contables`
--
ALTER TABLE `periodos_contables`
  MODIFY `idPeriodoContable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `idPlan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `status_egresos`
--
ALTER TABLE `status_egresos`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status_facturas`
--
ALTER TABLE `status_facturas`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID: 1 = Status PENDIENTE [obligatorio]', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_tareas`
--
ALTER TABLE `historial_tareas`
  ADD CONSTRAINT `fk_historial_tareas_tareas1` FOREIGN KEY (`tarea_id`) REFERENCES `tareas` (`id`),
  ADD CONSTRAINT `fk_historial_tareas_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `fk_tareas_empresas1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`idEmpresa`),
  ADD CONSTRAINT `fk_tareas_estados_tareas` FOREIGN KEY (`estado_id`) REFERENCES `estados_tareas` (`id`),
  ADD CONSTRAINT `fk_tareas_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
