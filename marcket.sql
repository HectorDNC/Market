-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-11-2020 a las 12:56:31
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `world_computer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tabla` varchar(300) DEFAULT NULL,
  `accion` varchar(300) DEFAULT NULL,
  `viejo` varchar(300) DEFAULT NULL,
  `nuevo` varchar(300) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'REDES', 'REDES EN GENERAL', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'TELEFONIA', 'TELEFONOS EN GENERAL', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'PC', 'PC GENERAL', 'ELIMINADO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'VIVERES', 'VIVERES EN GENERAL', 'ACTIVO', '2020-11-11 02:24:22', '2020-11-11 02:24:22'),
(5, 'LACTEOS', 'DKNCDSVKDSN', 'ELIMINADO', '2020-11-24 15:11:06', '2020-11-24 15:11:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `documento`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'V-26945214', 'JOSNERY', 'DIAZ', 'LOS CREPUSCULOS', '000-1234567', 'josnery@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'V-27025411', 'CARLOS', 'RAMIREZ', 'BARQUISIMETO', '000-1234567', 'carlos@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'V-27022222', 'HECTOR', 'NOGUERA', 'BARQUISIMETO', '000-1234567', 'hector@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'V-26540950', 'JESUS', 'ARRIECHE', 'DUACA', '000-1234567', 'jesus@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(5, 'V-25648529', 'NILSON', 'ARANGUREN', 'ROTARIO', '02517171616', 'NILSON2608@GMAIL.COM', 'ACTIVO', '2020-11-11 02:09:10', '2020-11-11 02:09:10'),
(6, 'V-25648520', 'RAMON', 'ARANGUREN', 'ANDRES ELOY', '04245937812', 'RAMON@GMAIL.COM', 'ACTIVO', '2020-11-11 02:10:12', '2020-11-11 02:10:12'),
(7, 'V-7986402', 'JOSE', 'COLMENAREZ', 'SANTA ISABEL', '04149527573', 'JOSE@GMAIL.COM', 'ACTIVO', '2020-11-13 14:11:58', '2020-11-13 14:11:58'),
(8, 'V-12131231', 'RAMON', 'ROJAS', 'MAOSD', '12312324212', 'RAMON@GMAIL.COM', 'ACTIVO', '2020-11-25 03:36:10', '2020-11-25 03:36:10'),
(9, 'J-12121212', 'JJJJJ', 'JJJJ', '12321312', '01231321312', 'NILSON2608@GMAIL.COM', 'ACTIVO', '2020-11-25 03:36:54', '2020-11-25 03:36:54'),
(10, 'V-30075274', 'ALONDRA', 'MEJIAS', 'ROTARIO', '04245957122', 'ALONDRA@GMAIL.COM', 'ELIMINADO', '2020-11-25 03:38:18', '2020-11-25 03:38:18'),
(11, 'V-30075279', 'DOLAR', 'COLMENAREZ', 'ROTARIO', '04245937812', 'NILSON2608@GMAIL.COM', 'ELIMINADO', '2020-11-25 03:40:11', '2020-11-25 03:40:11'),
(12, 'V-12131232', 'NNN', '', 'ROTAROP', '', '', 'ELIMINADO', '2020-11-25 03:44:37', '2020-11-25 03:44:37'),
(13, 'V-20193421', 'EUDI', '', 'ROTARIO', '', '', 'ACTIVO', '2020-11-25 13:05:00', '2020-11-25 13:05:00'),
(14, 'V-25648528', 'NILSONA', '', 'RATOARA', '', '', 'ACTIVO', '2020-11-26 12:47:27', '2020-11-26 12:47:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `cod_ref` varchar(45) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `impuesto` varchar(45) DEFAULT '0',
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `proveedor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `codigo`, `cod_ref`, `fecha`, `impuesto`, `estatus`, `proveedor_id`, `created_at`, `updated_at`) VALUES
(1, '000001', NULL, '2020-11-11 03:03:33', '12,00', 'ACTIVO', 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, '000002', NULL, '2020-11-11 03:03:33', '0', 'ACTIVO', 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, '000003', NULL, '2020-11-11 03:03:33', '10,00', 'ACTIVO', 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, '000000004', 'HOLA', '2020-11-11 03:07:41', '0', 'ACTIVO', 3, '2020-11-11 02:07:41', '2020-11-11 02:07:41'),
(5, '000000005', 'HARINA', '2020-11-11 03:27:40', '0', 'ACTIVO', 4, '2020-11-11 02:27:40', '2020-11-11 02:27:40'),
(6, '000000006', 'JKLK', '2020-11-13 15:10:50', '0', 'ACTIVO', 2, '2020-11-13 14:10:50', '2020-11-13 14:10:50'),
(7, '000000007', '23212', '2020-11-25 14:21:12', '0', 'ACTIVO', 4, '2020-11-25 13:21:12', '2020-11-25 13:21:12'),
(8, '000000008', '', '2020-11-26 04:10:04', '0', 'ACTIVO', 2, '2020-11-26 03:10:04', '2020-11-26 03:10:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `costo` double NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `costo`, `cantidad`, `producto_id`, `compra_id`, `created_at`, `updated_at`) VALUES
(1, 2000, '5', 1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 1000, '3', 2, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 5000, '12', 3, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, 2000, '5', 1, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(5, 1000, '3', 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(6, 5000, '12', 3, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(7, 2000, '5', 1, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(8, 1000, '3', 2, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(9, 5000, '12', 3, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(10, 20000, '40', 4, 4, '2020-11-11 02:07:41', '2020-11-11 02:07:41'),
(11, 20000, '60', 1, 4, '2020-11-11 02:07:41', '2020-11-11 02:07:41'),
(12, 20000, '500', 6, 5, '2020-11-11 02:27:40', '2020-11-11 02:27:40'),
(13, 20000, '30', 3, 5, '2020-11-11 02:27:40', '2020-11-11 02:27:40'),
(14, 20000, '300', 6, 6, '2020-11-13 14:10:50', '2020-11-13 14:10:50'),
(15, 2335000, '50', 7, 7, '2020-11-25 13:21:12', '2020-11-25 13:21:12'),
(16, 100000, '1', 5, 8, '2020-11-26 03:10:04', '2020-11-26 03:10:04');

--
-- Disparadores `detalle_compra`
--
DELIMITER $$
CREATE TRIGGER `actualizar_precio_producto` AFTER INSERT ON `detalle_compra` FOR EACH ROW UPDATE productos SET precio_venta = (NEW.costo * (precio_porcentaje / 100)+ NEW.costo) WHERE id = NEW.producto_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

CREATE TABLE `detalle_entrada` (
  `id` int(11) NOT NULL,
  `cantidad` double DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `entrada_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_entrada`
--

INSERT INTO `detalle_entrada` (`id`, `cantidad`, `costo`, `producto_id`, `entrada_id`, `created_at`, `updated_at`) VALUES
(1, 20, NULL, 1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 20, NULL, 1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 20, NULL, 1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, 20, NULL, 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(5, 20, NULL, 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(6, 20, NULL, 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(7, 20, NULL, 3, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(8, 20, NULL, 3, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(9, 20, NULL, 3, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `id` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `salida_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_salida`
--

INSERT INTO `detalle_salida` (`id`, `cantidad`, `precio`, `producto_id`, `salida_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, 1, 1, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(2, 5, NULL, 1, 1, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(3, 5, NULL, 1, 1, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(4, 5, NULL, 2, 2, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(5, 5, NULL, 2, 2, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(6, 5, NULL, 2, 2, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(7, 5, NULL, 3, 3, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(8, 5, NULL, 3, 3, '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(9, 5, NULL, 3, 3, '2020-11-11 02:03:34', '2020-11-11 02:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE `detalle_servicio` (
  `id` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_servicio`
--

INSERT INTO `detalle_servicio` (`id`, `cantidad`, `precio`, `empleado_id`, `venta_id`, `servicio_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2000, 2, 1, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 1, 2000, 3, 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 1, 2000, 3, 3, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `cantidad`, `precio`, `producto_id`, `venta_id`, `created_at`, `updated_at`) VALUES
(1, '12', '2500', 1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, '6', '500', 2, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, '10', '200', 3, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, '12', '2500', 1, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(5, '6', '500', 2, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(6, '10', '200', 3, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(7, '12', '2500', 1, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(8, '6', '500', 2, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(9, '10', '200', 3, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(10, '84', '26000', 1, 4, '2020-11-11 02:20:05', '2020-11-11 02:20:05'),
(11, '20', '24000', 6, 5, '2020-11-11 02:28:44', '2020-11-11 02:28:44'),
(12, '20', '24000', 6, 6, '2020-11-12 12:19:27', '2020-11-12 12:19:27'),
(13, '30', '24000', 6, 7, '2020-11-13 02:14:00', '2020-11-13 02:14:00'),
(14, '30', '26000', 3, 7, '2020-11-13 02:14:00', '2020-11-13 02:14:00'),
(15, '20', '24000', 6, 8, '2020-11-13 14:13:10', '2020-11-13 14:13:10'),
(16, '2', '26000', 3, 8, '2020-11-13 14:13:10', '2020-11-13 14:13:10'),
(17, '10', '690000', 6, 9, '2020-11-24 16:56:37', '2020-11-24 16:56:37'),
(18, '2', '26000', 4, 9, '2020-11-24 16:56:37', '2020-11-24 16:56:37'),
(19, '10', '3035500', 7, 10, '2020-11-26 12:48:41', '2020-11-26 12:48:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dolar`
--

CREATE TABLE `dolar` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dolar`
--

INSERT INTO `dolar` (`id`, `nombre`, `precio`) VALUES
(1, 'DOLAR', 1000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cargo` varchar(25) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `documento`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `cargo`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'V-26945214', 'JUAN', 'DIAZ', 'LOS CREPUSCULOS', '000-1234567', 'josnery@gmail.com', 'ADMINISTRADOR', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'V-27025411', 'PEDRO', 'BETANCOURT', 'DON AURELIO', '000-1234567', 'maria@gmail.com', 'TECNICO', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'V-26540950', 'CARLOS', 'ARRIECHE', 'DUACA', '000-1234567', 'jesus@gmail.com', 'TECNICO', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `codigo`, `fecha`, `tipo`, `observacion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, '000001', '2020-11-11 03:03:33', 'APORTE', 'aporte de un socio', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, '000002', '2020-11-11 03:03:33', 'PRESTAMO', 'prestamo de mercancia', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, '000003', '2020-11-11 03:03:33', 'APORTE', 'aporte de un socio', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `valor` decimal(4,2) NOT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `impuestos`
--

INSERT INTO `impuestos` (`id`, `nombre`, `valor`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'iva', '12.00', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'iva2', '16.00', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'TP-LINK', NULL, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'CISCO', NULL, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'MERCUSYS', NULL, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id`, `nombre`, `description`, `marca_id`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'WF155', NULL, 1, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'MD399', NULL, 1, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'JD110', NULL, 1, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'A300', NULL, 2, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(5, 'A400', NULL, 2, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(6, 'A055', NULL, 2, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(7, 'MS100', NULL, 3, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(8, 'MS200', NULL, 3, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(9, 'MS300', NULL, 3, 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `autor` varchar(255) DEFAULT 'SISTEMA',
  `repeticion` int(2) DEFAULT '1',
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `descripcion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'usuarios', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 'registrar usuarios', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 'editar usuarios', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, 'eliminar usuarios', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(5, 'clientes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(6, 'registrar clientes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(7, 'editar clientes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(8, 'eliminar clientes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(9, 'empleados', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(10, 'registrar empleados', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(11, 'editar empleados', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(12, 'eliminar empleados', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(13, 'vehiculos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(14, 'registrar vehiculos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(15, 'editar vehiculos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(16, 'eliminar vehiculos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(17, 'ordenes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(18, 'registrar ordenes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(19, 'editar ordenes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(20, 'anular ordenes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(21, 'inventario', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(22, 'categorias', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(23, 'registrar categorias', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(24, 'editar categorias', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(25, 'eliminar categorias', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(26, 'productos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(27, 'registrar productos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(28, 'editar productos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(29, 'eliminar productos', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(30, 'proveedores', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(31, 'registrar proveedores', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(32, 'editar proveedores', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(33, 'eliminar proveedores', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(34, 'compras', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(35, 'registrar compras', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(36, 'anular compras', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(37, 'ventas', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(38, 'registrar ventas', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(39, 'anular ventas', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(40, 'reportes', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(41, 'roles', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(42, 'registrar roles', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(43, 'editar roles', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(44, 'eliminar roles', NULL, 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `precio_porcentaje` double DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `stock_min` int(11) DEFAULT '0',
  `stock_max` int(11) DEFAULT '0',
  `descuento` double DEFAULT NULL,
  `impuesto` varchar(45) DEFAULT '0',
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `categoria_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `precio_venta`, `precio_porcentaje`, `stock`, `stock_min`, `stock_max`, `descuento`, `impuesto`, `estatus`, `categoria_id`, `unidad_id`, `created_at`, `updated_at`) VALUES
(1, 'P456125', 'ROUTER 3400', NULL, 1.5, 30, 0, 0, 0, NULL, '0', 'ACTIVO', 3, 1, '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'P456123', 'MODEM-ROUTER AJ300', NULL, NULL, 30, 0, 0, 0, NULL, '0', 'ACTIVO', 3, 1, '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'P456154', 'ANTENA KE444', NULL, 26000, 30, 0, 0, 0, NULL, '0', 'ACTIVO', 3, 1, '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'P456165', 'CAMARA AL300', NULL, 26000, 30, 0, 0, 0, NULL, '0', 'ACTIVO', 2, 1, '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(5, 'P456187', 'ADAPTADOR 30K', NULL, 130000, 30, 0, 0, 0, NULL, '0', 'ACTIVO', 2, 1, '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(6, 'HN1', 'HARINA PAN', 'HARINA DE MAIZ', 690000, 20, 0, 1, 500, NULL, '0', 'ACTIVO', 4, 1, '2020-11-11 02:25:31', '2020-11-11 02:25:31'),
(7, 'P5624498', 'ACEITE 100% PURO DE MAIZ  MAZEITE', 'ACEITE MIZEITE', 3035500, 30, 0, 1, 3000, NULL, '0', 'ACTIVO', 4, 3, '2020-11-25 13:12:49', '2020-11-25 13:12:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `razon_social` varchar(45) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `documento`, `razon_social`, `direccion`, `telefono`, `email`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'J-26540950', 'MICROTECH', 'BARQUISIMETO', '0424-5294781', 'microtech@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'J-26543456', 'CARSYS', 'CARACAS', '0424-5294781', 'Carsys@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'J-26523234', 'SUPER TECH', 'BARINAS', '0424-5294781', 'supertech@gmail.com', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'J-40231321', 'MERCABAR', 'LARA', '04245937812', 'MERCABAR@GMAIL.COM', 'ACTIVO', '2020-11-11 02:26:16', '2020-11-11 02:26:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'Todos los permisos del sistema', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'Cajero', 'Permisos esenciales para inventario y venta', 'ACTIVO', '2020-11-11 02:03:32', '2020-11-11 02:03:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`rol_id`, `permiso_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 4, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 5, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 6, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 7, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 8, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 9, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 10, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 11, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 12, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 13, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 14, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 15, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 16, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 17, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 18, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 19, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 20, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 21, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 22, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 23, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 24, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 26, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 27, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 28, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 29, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 30, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 31, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 32, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 33, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 34, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 35, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 36, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 37, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 38, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 39, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 40, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 41, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 42, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 43, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(1, 44, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 5, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 6, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 7, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 8, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 9, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 10, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 11, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 12, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 13, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 14, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 15, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 16, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 17, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 18, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 19, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 20, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 21, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 22, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 23, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 24, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 25, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 26, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 27, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 28, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 29, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 30, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 31, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 32, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 33, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 34, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 35, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 36, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 37, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 38, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 39, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 40, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 41, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 42, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 43, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 44, '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `codigo`, `fecha`, `tipo`, `observacion`, `estatus`, `created_at`, `updated_at`) VALUES
(1, '000001', '2020-11-11 03:03:34', 'RETIRO', 'retiro de un socio', 'ACTIVO', '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(2, '000002', '2020-11-11 03:03:34', 'PRESTAMO', 'prestamo de mercancia', 'ACTIVO', '2020-11-11 02:03:34', '2020-11-11 02:03:34'),
(3, '000003', '2020-11-11 03:03:34', 'RETIRO', 'retiro de un socio', 'ACTIVO', '2020-11-11 02:03:34', '2020-11-11 02:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `precio`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'MANTENIMIENTO CAMARAS', 'Mantenimiento General', '6200', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 'REPARACION UPS', 'Reparacion ', '2000', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 'FORMATEO PC', 'Instalacion SO', '3500', 'ACTIVO', '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `abreviatura` varchar(5) DEFAULT NULL,
  `estatus` varchar(15) DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `abreviatura`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'PIEZA', 'pza', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'METRO', 'm', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'LITRO', 'l', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'kilo', 'k', 'activo', '2020-11-11 02:40:10', '2020-11-11 02:40:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'ACTIVO',
  `rol_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `documento`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `usuario`, `password`, `estatus`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 'V-00000000', 'ADMINISTRADOR', 'ADMINISTRADOR', 'WORLD', '000-0000000', 'administrador@email.com', 'administrador', 'ZXRlSml1a1p0akNsbTYwL2hnNEF2UT09', 'ACTIVO', 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 'V-10000000', 'USUARIO', 'USUARIO', 'WORLD', '000-0000000', 'usuario@email.com', 'usuario', 'ZXRlSml1a1p0akNsbTYwL2hnNEF2UT09', 'ACTIVO', 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `impuesto` varchar(45) DEFAULT '0',
  `estatus` varchar(15) DEFAULT 'ACTIVO',
  `cliente_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `fecha`, `impuesto`, `estatus`, `cliente_id`, `created_at`, `updated_at`) VALUES
(1, '000001', '2020-11-11 03:03:33', '0', 'ACTIVO', 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, '000002', '2020-11-11 03:03:33', '0', 'ACTIVO', 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, '000003', '2020-11-11 03:03:33', '0', 'ACTIVO', 3, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(4, '000000004', '2020-11-11 03:20:05', '0', 'ACTIVO', 1, '2020-11-11 02:20:05', '2020-11-11 02:20:05'),
(5, '000000005', '2020-11-11 03:28:44', '0', 'ACTIVO', 5, '2020-11-11 02:28:44', '2020-11-11 02:28:44'),
(6, '000000006', '2020-11-12 13:19:26', '0', 'ACTIVO', 5, '2020-11-12 12:19:26', '2020-11-12 12:19:26'),
(7, '000000007', '2020-11-13 03:14:00', '0', 'ACTIVO', 3, '2020-11-13 02:14:00', '2020-11-13 02:14:00'),
(8, '000000008', '2020-11-13 15:13:10', '0', 'ACTIVO', 7, '2020-11-13 14:13:10', '2020-11-13 14:13:10'),
(9, '000000009', '2020-11-24 17:56:37', '0', 'ACTIVO', 1, '2020-11-24 16:56:37', '2020-11-24 16:56:37'),
(10, '000000010', '2020-11-26 13:48:41', '0', 'ACTIVO', 14, '2020-11-26 12:48:41', '2020-11-26 12:48:41');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_entradas_compras`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_entradas_compras` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_entradas_recargo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_entradas_recargo` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_entradas_totales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_entradas_totales` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`compras` double
,`cargos` double
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_inventario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_inventario` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`categoria` varchar(45)
,`precio_venta` double
,`stock` double
,`stock_min` int(11)
,`stock_max` int(11)
,`estatus` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_inventario1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_inventario1` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`categoria` varchar(45)
,`precio_dolar` double
,`precio_Bolivares` double
,`stock` double
,`stock_min` int(11)
,`stock_max` int(11)
,`estatus` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_descargo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_descargo` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_totales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_totales` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`ventas` double
,`descargos` double
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_ventas` (
`id` int(11)
,`codigo` varchar(45)
,`nombre` varchar(45)
,`total` double
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_entradas_compras`
--
DROP TABLE IF EXISTS `v_entradas_compras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_compras`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, sum(`dc`.`cantidad`) AS `total` FROM ((`productos` `p` left join `detalle_compra` `dc` on((`p`.`id` = `dc`.`producto_id`))) left join `compras` `c` on((`dc`.`compra_id` = `c`.`id`))) WHERE (`c`.`estatus` = 'ACTIVO') GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_entradas_recargo`
--
DROP TABLE IF EXISTS `v_entradas_recargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_recargo`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, sum(`de`.`cantidad`) AS `total` FROM ((`productos` `p` left join `detalle_entrada` `de` on((`p`.`id` = `de`.`producto_id`))) left join `entradas` `e` on((`de`.`entrada_id` = `e`.`id`))) WHERE (`e`.`estatus` = 'ACTIVO') GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_entradas_totales`
--
DROP TABLE IF EXISTS `v_entradas_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_totales`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, ifnull(`vec`.`total`,0) AS `compras`, ifnull(`ver`.`total`,0) AS `cargos`, (ifnull(`vec`.`total`,0) + ifnull(`ver`.`total`,0)) AS `total` FROM ((`productos` `p` left join `v_entradas_compras` `vec` on((`vec`.`id` = `p`.`id`))) left join `v_entradas_recargo` `ver` on((`ver`.`id` = `vec`.`id`))) GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inventario`
--
DROP TABLE IF EXISTS `v_inventario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventario`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, `c`.`nombre` AS `categoria`, `p`.`precio_venta` AS `precio_venta`, ifnull(((`e`.`compras` + `e`.`cargos`) - (`s`.`ventas` + `s`.`descargos`)),0) AS `stock`, `p`.`stock_min` AS `stock_min`, `p`.`stock_max` AS `stock_max`, `p`.`estatus` AS `estatus` FROM (((`productos` `p` left join `v_entradas_totales` `e` on((`p`.`id` = `e`.`id`))) left join `v_salidas_totales` `s` on((`p`.`id` = `s`.`id`))) join `categorias` `c` on((`p`.`categoria_id` = `c`.`id`))) GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre`, `p`.`precio_venta`, `p`.`stock_min`, `p`.`stock_max` ORDER BY `p`.`id` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inventario1`
--
DROP TABLE IF EXISTS `v_inventario1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventario1`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, `c`.`nombre` AS `categoria`, `p`.`precio_venta` AS `precio_dolar`, (`p`.`precio_venta` * `d`.`precio`) AS `precio_Bolivares`, ifnull(((`e`.`compras` + `e`.`cargos`) - (`s`.`ventas` + `s`.`descargos`)),0) AS `stock`, `p`.`stock_min` AS `stock_min`, `p`.`stock_max` AS `stock_max`, `p`.`estatus` AS `estatus` FROM (((`dolar` `d` join (`productos` `p` left join `v_entradas_totales` `e` on((`p`.`id` = `e`.`id`)))) left join `v_salidas_totales` `s` on((`p`.`id` = `s`.`id`))) join `categorias` `c` on((`p`.`categoria_id` = `c`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_descargo`
--
DROP TABLE IF EXISTS `v_salidas_descargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_descargo`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, sum(`ds`.`cantidad`) AS `total` FROM ((`productos` `p` left join `detalle_salida` `ds` on((`p`.`id` = `ds`.`producto_id`))) left join `salidas` `s` on((`ds`.`salida_id` = `s`.`id`))) WHERE (`s`.`estatus` = 'ACTIVO') GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_totales`
--
DROP TABLE IF EXISTS `v_salidas_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_totales`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, ifnull(`vsv`.`total`,0) AS `ventas`, ifnull(`vsd`.`total`,0) AS `descargos`, (ifnull(`vsv`.`total`,0) + ifnull(`vsd`.`total`,0)) AS `total` FROM ((`productos` `p` left join `v_salidas_ventas` `vsv` on((`vsv`.`id` = `p`.`id`))) left join `v_salidas_descargo` `vsd` on((`vsd`.`id` = `vsv`.`id`))) GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_ventas`
--
DROP TABLE IF EXISTS `v_salidas_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_ventas`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`nombre` AS `nombre`, sum(`dv`.`cantidad`) AS `total` FROM ((`productos` `p` left join `detalle_venta` `dv` on((`p`.`id` = `dv`.`producto_id`))) left join `ventas` `v` on((`dv`.`venta_id` = `v`.`id`))) WHERE (`v`.`estatus` = 'ACTIVO') GROUP BY `p`.`id`, `p`.`codigo`, `p`.`nombre` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_compras_proveedores1` (`proveedor_id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_compra_productos1` (`producto_id`),
  ADD KEY `fk_detalle_compra_compras1` (`compra_id`);

--
-- Indices de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_cargo_productos1` (`producto_id`),
  ADD KEY `fk_detalle_cargo_cargos1` (`entrada_id`);

--
-- Indices de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_descargo_productos1` (`producto_id`),
  ADD KEY `fk_detalle_descargo_descargos1` (`salida_id`);

--
-- Indices de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicios_has_ventas_servicios1` (`servicio_id`),
  ADD KEY `fk_servicios_has_ventas_ventas1` (`venta_id`),
  ADD KEY `fk_servicio_venta_empleados1` (`empleado_id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_venta_productos1` (`producto_id`),
  ADD KEY `fk_detalle_venta_ventas1` (`venta_id`);

--
-- Indices de la tabla `dolar`
--
ALTER TABLE `dolar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_modelos_marcas1` (`marca_id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios_notificaciones` (`usuario_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_productos_categorias1` (`categoria_id`),
  ADD KEY `fk_productos_unidades1` (`unidad_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`rol_id`,`permiso_id`),
  ADD KEY `fk_roles_has_permisos_permisos1` (`permiso_id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `fk_usuarios_roles1` (`rol_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_ventas_clientes1` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `dolar`
--
ALTER TABLE `dolar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_proveedores1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_detalle_compra_compras1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_compra_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD CONSTRAINT `fk_detalle_cargo_cargos1` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_cargo_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD CONSTRAINT `fk_detalle_descargo_descargos1` FOREIGN KEY (`salida_id`) REFERENCES `salidas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_descargo_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `fk_servicio_venta_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicios_has_ventas_servicios1` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicios_has_ventas_ventas1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_ventas1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `fk_modelos_marcas1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_usuarios_notificaciones` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_productos_unidades1` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_roles_has_permisos_permisos1` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roles_has_permisos_roles1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
