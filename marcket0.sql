-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2020 a las 00:59:18
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `marcket`
--
CREATE DATABASE IF NOT EXISTS `marcket` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `marcket`;

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

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `unidades`
--
INSERT INTO `unidades` (`id`, `nombre`, `abreviatura`, `estatus`, `created_at`, `updated_at`) VALUES
(1, 'PIEZA', 'pza', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(2, 'METRO', 'm', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(3, 'LITRO', 'l', 'activo', '2020-11-11 02:03:32', '2020-11-11 02:03:32'),
(4, 'KILO', 'kg', 'activo', '2020-11-11 02:40:10', '2020-11-11 02:40:10');
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
(1, 'V-00000000', 'ADMINISTRADOR', 'ADMINISTRADOR', 'WORLD', '000-0000000', 'ADMINISTRADOR@EMAIL.COM', 'ADMINISTRADOR', 'ZXRlSml1a1p0akNsbTYwL2hnNEF2UT09', 'ACTIVO', 1, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(2, 'V-10000007', 'USUARIO', 'USUARIO', 'WORLD', '000-0000000', 'USUARIO@EMAIL.COM', 'USUARIO', 'ZXRlSml1a1p0akNsbTYwL2hnNEF2UT09', 'ACTIVO', 2, '2020-11-11 02:03:33', '2020-11-11 02:03:33'),
(3, 'V-27349264', 'HECTOR', 'NOGUERA', 'POR AHI', '04261587389', 'USUARIO123@GMAIL.COM', 'HECTOR10', 'OEF4NjV6QXMwT0grTTdJZ3BUZWIzUT09', 'ACTIVO', 1, '2020-11-29 01:47:37', '2020-11-29 01:47:37'),
(4, 'V-27349260', 'USUARIO', 'USERS', 'URB EDUARDO GIMENEZ', '04261587389', 'USUARIO12345@GMAIL.COM', 'USUARIO1', 'OEF4NjV6QXMwT0grTTdJZ3BUZWIzUT09', 'ELIMINADO', 1, '2020-11-29 02:04:40', '2020-11-29 02:04:40');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_compras`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,sum(`dc`.`cantidad`) AS `total` from ((`productos` `p` left join `detalle_compra` `dc` on((`p`.`id` = `dc`.`producto_id`))) left join `compras` `c` on((`dc`.`compra_id` = `c`.`id`))) where (`c`.`estatus` = 'ACTIVO') group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_entradas_recargo`
--
DROP TABLE IF EXISTS `v_entradas_recargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_recargo`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,sum(`de`.`cantidad`) AS `total` from ((`productos` `p` left join `detalle_entrada` `de` on((`p`.`id` = `de`.`producto_id`))) left join `entradas` `e` on((`de`.`entrada_id` = `e`.`id`))) where (`e`.`estatus` = 'ACTIVO') group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_entradas_totales`
--
DROP TABLE IF EXISTS `v_entradas_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_entradas_totales`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,ifnull(`vec`.`total`,0) AS `compras`,ifnull(`ver`.`total`,0) AS `cargos`,(ifnull(`vec`.`total`,0) + ifnull(`ver`.`total`,0)) AS `total` from ((`productos` `p` left join `v_entradas_compras` `vec` on((`vec`.`id` = `p`.`id`))) left join `v_entradas_recargo` `ver` on((`ver`.`id` = `vec`.`id`))) group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inventario`
--
DROP TABLE IF EXISTS `v_inventario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventario`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,`c`.`nombre` AS `categoria`,`p`.`precio_venta` AS `precio_venta`,ifnull(((`e`.`compras` + `e`.`cargos`) - (`s`.`ventas` + `s`.`descargos`)),0) AS `stock`,`p`.`stock_min` AS `stock_min`,`p`.`stock_max` AS `stock_max`,`p`.`estatus` AS `estatus` from (((`productos` `p` left join `v_entradas_totales` `e` on((`p`.`id` = `e`.`id`))) left join `v_salidas_totales` `s` on((`p`.`id` = `s`.`id`))) join `categorias` `c` on((`p`.`categoria_id` = `c`.`id`))) group by `p`.`id`,`p`.`codigo`,`p`.`nombre`,`p`.`precio_venta`,`p`.`stock_min`,`p`.`stock_max` order by `p`.`id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inventario1`
--
DROP TABLE IF EXISTS `v_inventario1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_inventario1`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,`c`.`nombre` AS `categoria`,`p`.`precio_venta` AS `precio_dolar`,(`p`.`precio_venta` * `d`.`precio`) AS `precio_Bolivares`,ifnull(((`e`.`compras` + `e`.`cargos`) - (`s`.`ventas` + `s`.`descargos`)),0) AS `stock`,`p`.`stock_min` AS `stock_min`,`p`.`stock_max` AS `stock_max`,`p`.`estatus` AS `estatus` from (((`dolar` `d` join (`productos` `p` left join `v_entradas_totales` `e` on((`p`.`id` = `e`.`id`)))) left join `v_salidas_totales` `s` on((`p`.`id` = `s`.`id`))) join `categorias` `c` on((`p`.`categoria_id` = `c`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_descargo`
--
DROP TABLE IF EXISTS `v_salidas_descargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_descargo`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,sum(`ds`.`cantidad`) AS `total` from ((`productos` `p` left join `detalle_salida` `ds` on((`p`.`id` = `ds`.`producto_id`))) left join `salidas` `s` on((`ds`.`salida_id` = `s`.`id`))) where (`s`.`estatus` = 'ACTIVO') group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_totales`
--
DROP TABLE IF EXISTS `v_salidas_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_totales`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,ifnull(`vsv`.`total`,0) AS `ventas`,ifnull(`vsd`.`total`,0) AS `descargos`,(ifnull(`vsv`.`total`,0) + ifnull(`vsd`.`total`,0)) AS `total` from ((`productos` `p` left join `v_salidas_ventas` `vsv` on((`vsv`.`id` = `p`.`id`))) left join `v_salidas_descargo` `vsd` on((`vsd`.`id` = `vsv`.`id`))) group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_ventas`
--
DROP TABLE IF EXISTS `v_salidas_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_ventas`  AS  select `p`.`id` AS `id`,`p`.`codigo` AS `codigo`,`p`.`nombre` AS `nombre`,sum(`dv`.`cantidad`) AS `total` from ((`productos` `p` left join `detalle_venta` `dv` on((`p`.`id` = `dv`.`producto_id`))) left join `ventas` `v` on((`dv`.`venta_id` = `v`.`id`))) where (`v`.`estatus` = 'ACTIVO') group by `p`.`id`,`p`.`codigo`,`p`.`nombre` ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dolar`
--
ALTER TABLE `dolar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_ventas1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
