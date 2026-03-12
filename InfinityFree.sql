-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql209.infinityfree.com
-- Tiempo de generación: 09-03-2026 a las 21:46:11
-- Versión del servidor: 11.4.10-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_39881623_cambalache`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nivel` varchar(20) DEFAULT 'admin' COMMENT 'admin, super_admin',
  `activo` tinyint(1) DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `email`, `password`, `nivel`, `activo`, `ultimo_acceso`, `fecha_creacion`) VALUES
(1, 'Administrador', 'admin@done.com', '$2y$10$fbEHAL0612L7UYW9OjbC2Ogg.zDAsnmS/91WXv3Zvfa6dT3u6CfZa', 'super_admin', 1, '2026-03-09 08:51:18', '2025-12-26 18:05:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `badges`
--

CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `label` varchar(100) NOT NULL DEFAULT '',
  `svg_path` varchar(255) NOT NULL,
  `orden` int(11) DEFAULT 0,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `badges`
--

INSERT INTO `badges` (`id`, `nombre`, `slug`, `descripcion`, `label`, `svg_path`, `orden`, `activo`, `created_at`, `updated_at`) VALUES
(9, 'Delivery', 'Delivery', 'Delivery', '', 'assets/img/badges/badge_69aeec9475998_1773071508.svg', 1, 1, '2026-03-09 15:51:48', '2026-03-09 15:51:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busquedas`
--

CREATE TABLE `busquedas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `termino` varchar(255) NOT NULL,
  `resultados` int(11) DEFAULT 0,
  `ip` varchar(45) DEFAULT NULL,
  `fecha_busqueda` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `usuario_calificado_id` int(11) NOT NULL,
  `usuario_calificador_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `icono`, `descripcion`, `activo`) VALUES
(1, 'Vehículos', 'fas fa-car', 'Autos, motos, camiones y más', 1),
(2, 'Celulares', 'fas fa-mobile-alt', 'Smartphones y accesorios', 0),
(3, 'Electrodomésticos', 'fas fa-tv', 'Para el hogar y cocina', 1),
(4, 'Computadoras', 'fas fa-laptop', 'PCs, laptops y componentes', 0),
(5, 'Dispositivos', '', NULL, 1),
(6, 'Prendas', '', NULL, 1),
(7, 'Muebles', '', NULL, 1),
(8, 'Inmuebles', '', NULL, 1),
(9, 'Juguetes', '', NULL, 1),
(10, 'Herramientas', '', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `nombre`, `departamento`) VALUES
(1, 'La Paz', 'La Paz'),
(2, 'El Alto', 'La Paz'),
(3, 'Viacha', 'La Paz'),
(4, 'Achocalla', 'La Paz'),
(5, 'Caranavi', 'La Paz'),
(6, 'Copacabana', 'La Paz'),
(7, 'Coroico', 'La Paz'),
(8, 'Desaguadero', 'La Paz'),
(9, 'Patacamaya', 'La Paz'),
(10, 'Sorata', 'La Paz'),
(11, 'Achacachi', 'La Paz'),
(12, 'Ancoraimes', 'La Paz'),
(13, 'Apolo', 'La Paz'),
(14, 'Aucapata', 'La Paz'),
(15, 'Ayata', 'La Paz'),
(16, 'Batallas', 'La Paz'),
(17, 'Caquiaviri', 'La Paz'),
(18, 'Carabuco', 'La Paz'),
(19, 'Catacora', 'La Paz'),
(20, 'Chacarilla', 'La Paz'),
(21, 'Charaña', 'La Paz'),
(22, 'Chulumani', 'La Paz'),
(23, 'Colquencha', 'La Paz'),
(24, 'Colquiri', 'La Paz'),
(25, 'Combaya', 'La Paz'),
(26, 'Coripata', 'La Paz'),
(27, 'Curva', 'La Paz'),
(28, 'Escoma', 'La Paz'),
(29, 'Guanay', 'La Paz'),
(30, 'Guaqui', 'La Paz'),
(31, 'Humanata', 'La Paz'),
(32, 'Ichoca', 'La Paz'),
(33, 'Inquisivi', 'La Paz'),
(34, 'Irupana', 'La Paz'),
(35, 'Ixiamas', 'La Paz'),
(36, 'Laja', 'La Paz'),
(37, 'Licoma', 'La Paz'),
(38, 'Luribay', 'La Paz'),
(39, 'Mapiri', 'La Paz'),
(40, 'Mecapaca', 'La Paz'),
(41, 'Mocomoco', 'La Paz'),
(42, 'Nazacara de Pacajes', 'La Paz'),
(43, 'Palca', 'La Paz'),
(44, 'Palos Blancos', 'La Paz'),
(45, 'Papel Pampa', 'La Paz'),
(46, 'Pelechuco', 'La Paz'),
(47, 'Puerto Acosta', 'La Paz'),
(48, 'Puerto Carabuco', 'La Paz'),
(49, 'Pucarani', 'La Paz'),
(50, 'Quiabaya', 'La Paz'),
(51, 'Quime', 'La Paz'),
(52, 'San Buenaventura', 'La Paz'),
(53, 'San Pedro de Curahuara', 'La Paz'),
(54, 'Santiago de Callapa', 'La Paz'),
(55, 'Santiago de Machaca', 'La Paz'),
(56, 'Sapahaqui', 'La Paz'),
(57, 'Tacacoma', 'La Paz'),
(58, 'Taraco', 'La Paz'),
(59, 'Teoponte', 'La Paz'),
(60, 'Tiahuanacu', 'La Paz'),
(61, 'Tipuani', 'La Paz'),
(62, 'Tito Yupanqui', 'La Paz'),
(63, 'Umala', 'La Paz'),
(64, 'Waldo Ballivián', 'La Paz'),
(65, 'Yanacachi', 'La Paz'),
(66, 'Santa Cruz de la Sierra', 'Santa Cruz'),
(67, 'Montero', 'Santa Cruz'),
(68, 'La Guardia', 'Santa Cruz'),
(69, 'Warnes', 'Santa Cruz'),
(70, 'Cotoca', 'Santa Cruz'),
(71, 'El Torno', 'Santa Cruz'),
(72, 'Camiri', 'Santa Cruz'),
(73, 'Puerto Suárez', 'Santa Cruz'),
(74, 'San Ignacio de Velasco', 'Santa Cruz'),
(75, 'Portachuelo', 'Santa Cruz'),
(76, 'Yapacaní', 'Santa Cruz'),
(77, 'Buena Vista', 'Santa Cruz'),
(78, 'Pailón', 'Santa Cruz'),
(79, 'San Julián', 'Santa Cruz'),
(80, 'Concepción', 'Santa Cruz'),
(81, 'Vallegrande', 'Santa Cruz'),
(82, 'Ascensión de Guarayos', 'Santa Cruz'),
(83, 'Boyuibe', 'Santa Cruz'),
(84, 'Cabezas', 'Santa Cruz'),
(85, 'Charagua', 'Santa Cruz'),
(86, 'Colpa Bélgica', 'Santa Cruz'),
(87, 'Comarapa', 'Santa Cruz'),
(88, 'Cuatro Cañadas', 'Santa Cruz'),
(89, 'Cuevo', 'Santa Cruz'),
(90, 'El Puente', 'Santa Cruz'),
(91, 'Fernández Alonso', 'Santa Cruz'),
(92, 'General Saavedra', 'Santa Cruz'),
(93, 'Gutiérrez', 'Santa Cruz'),
(94, 'Hardeman', 'Santa Cruz'),
(95, 'Lagunillas', 'Santa Cruz'),
(96, 'Mairana', 'Santa Cruz'),
(97, 'Mineros', 'Santa Cruz'),
(98, 'Moro Moro', 'Santa Cruz'),
(99, 'Okinawa Uno', 'Santa Cruz'),
(100, 'Pampa Grande', 'Santa Cruz'),
(101, 'Postrer Valle', 'Santa Cruz'),
(102, 'Puerto Quijarro', 'Santa Cruz'),
(103, 'Quirusillas', 'Santa Cruz'),
(104, 'Robore', 'Santa Cruz'),
(105, 'Saipina', 'Santa Cruz'),
(106, 'Samaipata', 'Santa Cruz'),
(107, 'San Antonio de Lomerío', 'Santa Cruz'),
(108, 'San Carlos', 'Santa Cruz'),
(109, 'San José de Chiquitos', 'Santa Cruz'),
(110, 'San Juan del Surutú', 'Santa Cruz'),
(111, 'San Matías', 'Santa Cruz'),
(112, 'San Miguel de Velasco', 'Santa Cruz'),
(113, 'San Pedro', 'Santa Cruz'),
(114, 'San Rafael', 'Santa Cruz'),
(115, 'San Ramón', 'Santa Cruz'),
(116, 'Santa Rosa del Sara', 'Santa Cruz'),
(117, 'Trigal', 'Santa Cruz'),
(118, 'Urubichá', 'Santa Cruz'),
(119, 'Cochabamba', 'Cochabamba'),
(120, 'Sacaba', 'Cochabamba'),
(121, 'Quillacollo', 'Cochabamba'),
(122, 'Colcapirhua', 'Cochabamba'),
(123, 'Tiquipaya', 'Cochabamba'),
(124, 'Vinto', 'Cochabamba'),
(125, 'Sipe Sipe', 'Cochabamba'),
(126, 'Punata', 'Cochabamba'),
(127, 'Cliza', 'Cochabamba'),
(128, 'Villa Tunari', 'Cochabamba'),
(129, 'Aiquile', 'Cochabamba'),
(130, 'Arani', 'Cochabamba'),
(131, 'Arbieto', 'Cochabamba'),
(132, 'Arque', 'Cochabamba'),
(133, 'Bolívar', 'Cochabamba'),
(134, 'Capinota', 'Cochabamba'),
(135, 'Cercado', 'Cochabamba'),
(136, 'Chimoré', 'Cochabamba'),
(137, 'Colomi', 'Cochabamba'),
(138, 'Cuchumuela', 'Cochabamba'),
(139, 'Entre Ríos', 'Cochabamba'),
(140, 'Independencia', 'Cochabamba'),
(141, 'Irpa Irpa', 'Cochabamba'),
(142, 'Mizque', 'Cochabamba'),
(143, 'Morochata', 'Cochabamba'),
(144, 'Omereque', 'Cochabamba'),
(145, 'Pasorapa', 'Cochabamba'),
(146, 'Pojo', 'Cochabamba'),
(147, 'Sacabamba', 'Cochabamba'),
(148, 'San Benito', 'Cochabamba'),
(149, 'Santivañez', 'Cochabamba'),
(150, 'Shinahota', 'Cochabamba'),
(151, 'Tacopaya', 'Cochabamba'),
(152, 'Tapacarí', 'Cochabamba'),
(153, 'Tarata', 'Cochabamba'),
(154, 'Tiraque', 'Cochabamba'),
(155, 'Toco', 'Cochabamba'),
(156, 'Tolata', 'Cochabamba'),
(157, 'Totora', 'Cochabamba'),
(158, 'Vacas', 'Cochabamba'),
(159, 'Vila Vila', 'Cochabamba'),
(160, 'Villa Rivero', 'Cochabamba'),
(161, 'Sucre', 'Chuquisaca'),
(162, 'Monteagudo', 'Chuquisaca'),
(163, 'Camargo', 'Chuquisaca'),
(164, 'Tarabuco', 'Chuquisaca'),
(165, 'Azurduy', 'Chuquisaca'),
(166, 'Culpina', 'Chuquisaca'),
(167, 'El Villar', 'Chuquisaca'),
(168, 'Huacaya', 'Chuquisaca'),
(169, 'Huacareta', 'Chuquisaca'),
(170, 'Icla', 'Chuquisaca'),
(171, 'Incahuasi', 'Chuquisaca'),
(172, 'Las Carreras', 'Chuquisaca'),
(173, 'Macharetí', 'Chuquisaca'),
(174, 'Mojocoya', 'Chuquisaca'),
(175, 'Padilla', 'Chuquisaca'),
(176, 'Poroma', 'Chuquisaca'),
(177, 'Presto', 'Chuquisaca'),
(178, 'San Lucas', 'Chuquisaca'),
(179, 'San Pablo de Huacareta', 'Chuquisaca'),
(180, 'Sopachuy', 'Chuquisaca'),
(181, 'Tarvita', 'Chuquisaca'),
(182, 'Tomina', 'Chuquisaca'),
(183, 'Villa Abecia', 'Chuquisaca'),
(184, 'Villa Alcalá', 'Chuquisaca'),
(185, 'Villa Azurduy', 'Chuquisaca'),
(186, 'Villa Mojocoya', 'Chuquisaca'),
(187, 'Villa Serrano', 'Chuquisaca'),
(188, 'Villa Vaca Guzmán', 'Chuquisaca'),
(189, 'Yamparáez', 'Chuquisaca'),
(190, 'Zudáñez', 'Chuquisaca'),
(191, 'Tarija', 'Tarija'),
(192, 'Yacuiba', 'Tarija'),
(193, 'Villamontes', 'Tarija'),
(194, 'Bermejo', 'Tarija'),
(195, 'Caraparí', 'Tarija'),
(196, 'El Puente', 'Tarija'),
(197, 'Entre Ríos', 'Tarija'),
(198, 'Padcaya', 'Tarija'),
(199, 'San Lorenzo', 'Tarija'),
(200, 'Uriondo', 'Tarija'),
(201, 'Yunchará', 'Tarija'),
(202, 'Oruro', 'Oruro'),
(203, 'Huanuni', 'Oruro'),
(204, 'Challapata', 'Oruro'),
(205, 'Caracollo', 'Oruro'),
(206, 'Antequera', 'Oruro'),
(207, 'Belén de Andamarca', 'Oruro'),
(208, 'Chipaya', 'Oruro'),
(209, 'Choque Cota', 'Oruro'),
(210, 'Corque', 'Oruro'),
(211, 'Cruz de Machacamarca', 'Oruro'),
(212, 'Curahuara de Carangas', 'Oruro'),
(213, 'El Choro', 'Oruro'),
(214, 'Escara', 'Oruro'),
(215, 'Esmeralda', 'Oruro'),
(216, 'Eucaliptus', 'Oruro'),
(217, 'Huachacalla', 'Oruro'),
(218, 'Huayllamarca', 'Oruro'),
(219, 'La Rivera', 'Oruro'),
(220, 'Machacamarca', 'Oruro'),
(221, 'Nor Carangas', 'Oruro'),
(222, 'Pampa Aullagas', 'Oruro'),
(223, 'Poopó', 'Oruro'),
(224, 'Sabaya', 'Oruro'),
(225, 'Salinas de Garci Mendoza', 'Oruro'),
(226, 'Santiago de Andamarca', 'Oruro'),
(227, 'Santiago de Huari', 'Oruro'),
(228, 'Santuario de Quillacas', 'Oruro'),
(229, 'Todos Santos', 'Oruro'),
(230, 'Toledo', 'Oruro'),
(231, 'Totora', 'Oruro'),
(232, 'Turco', 'Oruro'),
(233, 'Yunguyo de Litoral', 'Oruro'),
(234, 'Potosí', 'Potosí'),
(235, 'Llallagua', 'Potosí'),
(236, 'Uyuni', 'Potosí'),
(237, 'Tupiza', 'Potosí'),
(238, 'Villazón', 'Potosí'),
(239, 'Betanzos', 'Potosí'),
(240, 'Uncía', 'Potosí'),
(241, 'Atocha', 'Potosí'),
(242, 'Caiza D', 'Potosí'),
(243, 'Caripuyo', 'Potosí'),
(244, 'Chaqui', 'Potosí'),
(245, 'Chayanta', 'Potosí'),
(246, 'Colcha K', 'Potosí'),
(247, 'Colquechaca', 'Potosí'),
(248, 'Cotagaita', 'Potosí'),
(249, 'Llica', 'Potosí'),
(250, 'Mojinete', 'Potosí'),
(251, 'Ocurí', 'Potosí'),
(252, 'Pocoata', 'Potosí'),
(253, 'Porco', 'Potosí'),
(254, 'Puna', 'Potosí'),
(255, 'Ravelo', 'Potosí'),
(256, 'Sacaca', 'Potosí'),
(257, 'San Agustín', 'Potosí'),
(258, 'San Antonio de Esmoruco', 'Potosí'),
(259, 'San Pablo de Lípez', 'Potosí'),
(260, 'San Pedro de Buena Vista', 'Potosí'),
(261, 'San Pedro de Quemes', 'Potosí'),
(262, 'Tacobamba', 'Potosí'),
(263, 'Tahua', 'Potosí'),
(264, 'Tinguipaya', 'Potosí'),
(265, 'Tomave', 'Potosí'),
(266, 'Toro Toro', 'Potosí'),
(267, 'Villa de Yocalla', 'Potosí'),
(268, 'Vitichi', 'Potosí'),
(269, 'Trinidad', 'Beni'),
(270, 'Riberalta', 'Beni'),
(271, 'Guayaramerín', 'Beni'),
(272, 'San Borja', 'Beni'),
(273, 'Rurrenabaque', 'Beni'),
(274, 'Reyes', 'Beni'),
(275, 'San Ignacio', 'Beni'),
(276, 'Baures', 'Beni'),
(277, 'Exaltación', 'Beni'),
(278, 'Huacaraje', 'Beni'),
(279, 'Loreto', 'Beni'),
(280, 'Magdalena', 'Beni'),
(281, 'Puerto Siles', 'Beni'),
(282, 'San Andrés', 'Beni'),
(283, 'San Javier', 'Beni'),
(284, 'San Joaquín', 'Beni'),
(285, 'San Ramón', 'Beni'),
(286, 'Santa Ana', 'Beni'),
(287, 'Santa Rosa', 'Beni'),
(288, 'Cobija', 'Pando'),
(289, 'Porvenir', 'Pando'),
(290, 'Puerto Gonzalo Moreno', 'Pando'),
(291, 'Bella Flor', 'Pando'),
(292, 'Bolpebra', 'Pando'),
(293, 'Filadelfia', 'Pando'),
(294, 'Puerto Rico', 'Pando'),
(295, 'San Lorenzo', 'Pando'),
(296, 'San Pedro', 'Pando'),
(297, 'Santa Rosa del Abuná', 'Pando'),
(298, 'Santos Mercado', 'Pando'),
(299, 'Sena', 'Pando'),
(300, 'Villa Nueva', 'Pando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` text DEFAULT NULL,
  `tipo` varchar(20) DEFAULT 'string' COMMENT 'string, number, boolean, json',
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `clave`, `valor`, `tipo`, `descripcion`, `fecha_actualizacion`) VALUES
(1, 'site_name', 'Done!', 'string', 'Nombre del sitio', '2025-12-26 18:05:47'),
(2, 'site_email', 'contacto@done.com', 'string', 'Email de contacto', '2025-12-26 18:05:47'),
(3, 'productos_por_pagina', '20', 'number', 'Productos mostrados por página', '2025-12-26 18:05:47'),
(4, 'registro_activado', '1', 'boolean', 'Permitir registro de nuevos usuarios', '2025-12-26 18:05:47'),
(5, 'mantenimiento', '0', 'boolean', 'Modo mantenimiento activado', '2025-12-26 18:05:47'),
(6, 'max_imagenes_producto', '5', 'number', 'Máximo de imágenes por producto', '2025-12-26 18:05:47'),
(7, 'comision_porcentaje', '0', 'number', 'Porcentaje de comisión por venta', '2025-12-26 18:05:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversiones`
--

CREATE TABLE `conversiones` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL COMMENT 'registro, publicacion, contacto, favorito',
  `usuario_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT 0.00 COMMENT 'valor monetario si aplica',
  `ip` varchar(45) DEFAULT NULL,
  `fecha_conversion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

CREATE TABLE `denuncias` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `usuario_reporta_id` int(11) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `fecha_denuncia` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','revisado','resuelto','rechazado') DEFAULT 'pendiente',
  `admin_notas` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `fecha_revision` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias_tiendas`
--

CREATE TABLE `denuncias_tiendas` (
  `id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `usuario_reporta_id` int(11) DEFAULT NULL,
  `motivo` varchar(50) NOT NULL,
  `fecha_denuncia` datetime NOT NULL,
  `estado` enum('pendiente','revisado','sancionado','descartado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `usuario_id`, `producto_id`, `fecha`) VALUES
(1, 37, 271, '2026-03-04 01:38:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feria_bloques`
--

CREATE TABLE `feria_bloques` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `orden` int(11) DEFAULT 1,
  `capacidad` int(11) DEFAULT 12,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `feria_bloques`
--

INSERT INTO `feria_bloques` (`id`, `sector_id`, `nombre`, `orden`, `capacidad`, `activo`) VALUES
(1, 1, 'Bloque Tiwanaku', 1, 12, 1),
(2, 1, 'Bloque Illimani', 2, 12, 1),
(3, 1, 'Bloque Sajama', 3, 12, 1),
(4, 1, 'Bloque Uyuni', 4, 12, 1),
(5, 1, 'Bloque Madidi', 5, 12, 1),
(6, 1, 'Bloque Titicaca', 6, 12, 1),
(7, 2, 'Bloque Tiwanaku', 1, 12, 1),
(8, 2, 'Bloque Illimani', 2, 12, 1),
(9, 2, 'Bloque Sajama', 3, 12, 1),
(10, 2, 'Bloque Uyuni', 4, 12, 1),
(11, 2, 'Bloque Madidi', 5, 12, 1),
(12, 2, 'Bloque Titicaca', 6, 12, 1),
(13, 3, 'Bloque Tiwanaku', 1, 12, 1),
(14, 3, 'Bloque Illimani', 2, 12, 1),
(15, 3, 'Bloque Sajama', 3, 12, 1),
(16, 3, 'Bloque Uyuni', 4, 12, 1),
(17, 3, 'Bloque Madidi', 5, 12, 1),
(18, 3, 'Bloque Titicaca', 6, 12, 1),
(19, 4, 'Bloque Tiwanaku', 1, 12, 1),
(20, 4, 'Bloque Illimani', 2, 12, 1),
(21, 4, 'Bloque Sajama', 3, 12, 1),
(22, 4, 'Bloque Uyuni', 4, 12, 1),
(23, 4, 'Bloque Madidi', 5, 12, 1),
(24, 4, 'Bloque Titicaca', 6, 12, 1),
(25, 5, 'Bloque Tiwanaku', 1, 12, 1),
(26, 5, 'Bloque Illimani', 2, 12, 1),
(27, 5, 'Bloque Sajama', 3, 12, 1),
(28, 5, 'Bloque Uyuni', 4, 12, 1),
(29, 5, 'Bloque Madidi', 5, 12, 1),
(30, 5, 'Bloque Titicaca', 6, 12, 1),
(37, 7, 'Bloque Tiwanaku', 1, 12, 1),
(38, 7, 'Bloque Illimani', 2, 12, 1),
(39, 7, 'Bloque Sajama', 3, 12, 1),
(40, 7, 'Bloque Uyuni', 4, 12, 1),
(41, 7, 'Bloque Madidi', 5, 12, 1),
(42, 7, 'Bloque Titicaca', 6, 12, 1),
(43, 8, 'Bloque Tiwanaku', 1, 12, 1),
(44, 8, 'Bloque Illimani', 2, 12, 1),
(45, 8, 'Bloque Sajama', 3, 12, 1),
(46, 8, 'Bloque Uyuni', 4, 12, 1),
(47, 8, 'Bloque Madidi', 5, 12, 1),
(48, 8, 'Bloque Titicaca', 6, 12, 1),
(49, 9, 'Bloque Tiwanaku', 1, 12, 1),
(50, 9, 'Bloque Illimani', 2, 12, 1),
(51, 9, 'Bloque Sajama', 3, 12, 1),
(52, 9, 'Bloque Uyuni', 4, 12, 1),
(53, 9, 'Bloque Madidi', 5, 12, 1),
(54, 9, 'Bloque Titicaca', 6, 12, 1),
(55, 21, 'Bloque Tiwanaku', 1, 12, 1),
(56, 21, 'Bloque Illimani', 2, 12, 1),
(57, 21, 'Bloque Sajama', 3, 12, 1),
(58, 21, 'Bloque Uyuni', 4, 12, 1),
(59, 21, 'Bloque Madidi', 5, 12, 1),
(60, 21, 'Bloque Titicaca', 6, 12, 1),
(61, 1, 'BLOQUE TADASHI', 7, 12, 1),
(63, 1, 'TEST', 8, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feria_posiciones`
--

CREATE TABLE `feria_posiciones` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `ciudad` varchar(5) DEFAULT 'LPZ',
  `posicion_index` int(11) NOT NULL,
  `estado` enum('libre','ocupado','reservado') DEFAULT 'libre',
  `usuario_id` int(11) DEFAULT NULL,
  `bloque_id` int(11) DEFAULT NULL,
  `slot_numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `feria_posiciones`
--

INSERT INTO `feria_posiciones` (`id`, `sector_id`, `ciudad`, `posicion_index`, `estado`, `usuario_id`, `bloque_id`, `slot_numero`) VALUES
(67, 1, 'scz', 0, 'ocupado', 42, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feria_puestos`
--

CREATE TABLE `feria_puestos` (
  `id` int(11) NOT NULL,
  `sector` varchar(50) NOT NULL,
  `ciudad` varchar(10) NOT NULL,
  `posicion` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `feria_puestos`
--

INSERT INTO `feria_puestos` (`id`, `sector`, `ciudad`, `posicion`, `tienda_id`, `created_at`) VALUES
(1, 'tech', 'LPZ', 0, 22, '2026-02-05 01:38:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feria_sectores`
--

CREATE TABLE `feria_sectores` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria_default_id` int(11) DEFAULT NULL,
  `color_hex` varchar(7) DEFAULT '#007AFF',
  `imagen_banner` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  `capacidad` int(11) DEFAULT 12,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `feria_sectores`
--

INSERT INTO `feria_sectores` (`id`, `slug`, `titulo`, `descripcion`, `categoria_default_id`, `color_hex`, `imagen_banner`, `orden`, `capacidad`, `activo`, `created_at`) VALUES
(1, 'tech', 'Sector Celulares', 'La mejores tiendas para ti.', 5, '#007aff', '/assets/img/feria_banners/69863b8d9a24f_1770404749.webp', 1, 12, 1, '2026-02-06 00:47:27'),
(2, 'fashion', 'Sector Ropa', 'Moda Nacional y Americana', 6, '#007aff', '/assets/img/feria_banners/698648ae93b74_1770408110.webp', 2, 12, 1, '2026-02-06 00:47:27'),
(3, 'footwear', 'Sector Calzados', 'Zapatos', NULL, '#007aff', '/assets/img/feria_banners/698657b3bd12a_1770411955.webp', 4, 12, 1, '2026-02-06 00:47:27'),
(4, 'kids', 'Sector Bebés', 'Juguetes, Ropa y Accesorios', 9, '#007aff', '/assets/img/feria_banners/698654f271292_1770411250.webp', 3, 12, 1, '2026-02-06 00:47:27'),
(5, 'electro', 'Sector Electrodomésticos', 'Línea Blanca y TV', 3, '#007aff', '/assets/img/feria_banners/6986593776d45_1770412343.webp', 5, 12, 1, '2026-02-06 00:47:27'),
(7, 'home', 'Muebles', 'Hogar, Camas y Roperos', 7, '#007aff', '/assets/img/feria_banners/6989c5b564d7c_1770636725.webp', 7, 12, 1, '2026-02-06 00:47:27'),
(8, 'tools', 'Herramientas', 'Ferretería y Construcción', 10, '#007aff', '/assets/img/feria_banners/6989c68f17196_1770636943.webp', 9, 12, 1, '2026-02-06 00:47:27'),
(9, 'auto', 'Vehículos', 'Autopartes y Accesorios', 1, '#007aff', '/assets/img/feria_banners/6989e7675ed91_1770645351.webp', 10, 12, 1, '2026-02-06 00:47:27'),
(21, 'pets', 'Sector Mascotas', 'Todo para tu fiel amigo.', NULL, '#007aff', '/assets/img/feria_banners/6989e08519c3b_1770643589.webp', 8, 12, 1, '2026-02-06 02:16:02'),
(22, 'rptos', 'Sector Repuestos', 'Todos los repuestos', NULL, '#007aff', '/assets/img/feria_banners/6989d7c6701ec_1770641350.webp', 11, 12, 1, '2026-02-07 12:42:12'),
(23, 'watch', 'Sector Relojes', 'Diseño y tecnología para tu muñeca.', NULL, '#007aff', '/assets/img/feria_banners/698b95249d9b6_1770755364.webp', 12, 12, 1, '2026-02-10 20:25:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_acciones`
--

CREATE TABLE `log_acciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` varchar(100) NOT NULL COMMENT 'login, logout, registro, publicar, editar, eliminar, etc',
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `detalles` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `fecha_accion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `log_acciones`
--

INSERT INTO `log_acciones` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `detalles`, `ip`, `fecha_accion`) VALUES
(1, 1, 'eliminar_usuario', 'usuarios', 1, NULL, '2800:cd0:4807:4700:ed46:e362:825f:a4d8', '2026-01-12 04:15:15'),
(2, 1, 'eliminar_usuario', 'usuarios', 2, NULL, '2800:cd0:4807:4700:ed46:e362:825f:a4d8', '2026-01-12 04:15:18'),
(3, 1, 'eliminar_usuario', 'usuarios', 3, NULL, '2800:cd0:4807:4700:ed46:e362:825f:a4d8', '2026-01-12 04:15:22'),
(4, 1, 'eliminar_usuario', 'usuarios', 4, NULL, '2800:cd0:4807:4700:ed46:e362:825f:a4d8', '2026-01-12 04:32:04'),
(5, 1, 'eliminar_usuario', 'usuarios', 5, NULL, '2800:cd0:4807:4700:ed46:e362:825f:a4d8', '2026-01-12 04:34:00'),
(6, 1, 'eliminar_producto', 'productos', 5, NULL, '2800:cd0:4817:7700:1d3d:413e:69ee:5c18', '2026-01-26 11:40:42'),
(7, 1, 'suspender_tienda_por_denuncia', 'tiendas', 1, 'Reporte ID: 2', '2800:cd0:4817:7700:cc63:c669:39f:dbf5', '2026-01-29 13:01:05'),
(8, 1, 'eliminar_tienda', 'tiendas', 7, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:10:44'),
(9, 1, 'eliminar_tienda', 'tiendas', 6, 'Tienda eliminada permanentemente: TRIX', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:10:52'),
(10, 1, 'eliminar_tienda', 'tiendas', 5, 'Tienda eliminada permanentemente: YUGIHO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:10:59'),
(11, 1, 'eliminar_tienda', 'tiendas', 4, 'Tienda eliminada permanentemente: YANGO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:11:08'),
(12, 1, 'eliminar_tienda', 'tiendas', 3, 'Tienda eliminada permanentemente: TECNO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:11:14'),
(13, 1, 'eliminar_tienda', 'tiendas', 2, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:11:25'),
(14, 1, 'eliminar_tienda', 'tiendas', 1, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:11:34'),
(15, 1, 'eliminar_usuario', 'usuarios', 13, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:13:58'),
(16, 1, 'eliminar_usuario', 'usuarios', 12, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:01'),
(17, 1, 'eliminar_usuario', 'usuarios', 11, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:03'),
(18, 1, 'eliminar_usuario', 'usuarios', 10, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:06'),
(19, 1, 'eliminar_usuario', 'usuarios', 9, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:09'),
(20, 1, 'eliminar_usuario', 'usuarios', 8, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:12'),
(21, 1, 'eliminar_usuario', 'usuarios', 8, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:15'),
(22, 1, 'eliminar_usuario', 'usuarios', 7, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:17'),
(23, 1, 'eliminar_usuario', 'usuarios', 6, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 16:14:19'),
(24, 1, 'eliminar_usuario', 'usuarios', 14, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 18:55:07'),
(25, 1, 'eliminar_usuario', 'usuarios', 15, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 19:27:07'),
(26, 1, 'eliminar_usuario', 'usuarios', 16, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-29 19:42:29'),
(27, 1, 'eliminar_tienda', 'tiendas', 8, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 04:00:03'),
(28, 1, 'eliminar_tienda', 'tiendas', 9, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 05:36:13'),
(29, 1, 'eliminar_tienda', 'tiendas', 10, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 06:29:03'),
(30, 1, 'eliminar_usuario', 'usuarios', 18, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 06:29:10'),
(31, 1, 'eliminar_usuario', 'usuarios', 17, NULL, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 06:29:13'),
(32, 1, 'eliminar_tienda', 'tiendas', 12, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 07:11:00'),
(33, 1, 'eliminar_tienda', 'tiendas', 11, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 07:11:09'),
(34, 1, 'eliminar_tienda', 'tiendas', 13, 'Tienda eliminada permanentemente: TECNO', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 07:12:50'),
(35, 1, 'eliminar_tienda', 'tiendas', 14, 'Tienda eliminada permanentemente: CANON', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 07:19:19'),
(36, 1, 'eliminar_tienda', 'tiendas', 15, 'Tienda eliminada permanentemente: MARUCHAN', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 07:21:54'),
(37, 1, 'eliminar_tienda', 'tiendas', 16, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:fde1:6db4:7a70:deda', '2026-01-30 12:37:15'),
(38, 1, 'eliminar_usuario', 'usuarios', 21, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 06:38:04'),
(39, 1, 'eliminar_usuario', 'usuarios', 20, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 06:38:06'),
(40, 1, 'eliminar_usuario', 'usuarios', 19, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 06:38:07'),
(41, 1, 'eliminar_usuario', 'usuarios', 22, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 10:55:03'),
(42, 1, 'eliminar_usuario', 'usuarios', 23, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 15:34:09'),
(43, 1, 'eliminar_usuario', 'usuarios', 25, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 17:08:40'),
(44, 1, 'eliminar_usuario', 'usuarios', 24, NULL, '2800:cd0:4817:7700:c071:ea15:acda:1a64', '2026-02-01 17:08:42'),
(45, 1, 'eliminar_usuario', 'usuarios', 28, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:10:10'),
(46, 1, 'eliminar_usuario', 'usuarios', 27, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:10:12'),
(47, 1, 'eliminar_usuario', 'usuarios', 26, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:10:15'),
(48, 1, 'eliminar_usuario', 'usuarios', 29, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:46:59'),
(49, 1, 'eliminar_usuario', 'usuarios', 30, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:47:02'),
(50, 1, 'eliminar_usuario', 'usuarios', 31, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 06:54:38'),
(51, 1, 'eliminar_usuario', 'usuarios', 32, NULL, '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 07:02:36'),
(52, 1, 'eliminar_tienda', 'tiendas', 18, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 07:27:00'),
(53, 1, 'eliminar_tienda', 'tiendas', 19, 'Tienda eliminada permanentemente: TINGO BOLIVIA', '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 07:27:15'),
(54, 1, 'eliminar_tienda', 'tiendas', 17, 'Tienda eliminada permanentemente: ACADEMIA SMART', '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 07:27:23'),
(55, 1, 'eliminar_tienda', 'tiendas', 20, 'Tienda eliminada permanentemente: SMART', '2800:cd0:4817:7700:514d:447:befe:e2e1', '2026-02-02 07:32:46'),
(56, 1, 'eliminar_tienda', 'tiendas', 21, 'Tienda eliminada permanentemente: MobiStyle Bolivia', '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', '2026-02-04 21:06:47'),
(57, 1, 'eliminar_usuario', 'usuarios', 36, NULL, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', '2026-02-04 21:06:53'),
(58, 1, 'eliminar_usuario', 'usuarios', 35, NULL, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', '2026-02-04 21:06:54'),
(59, 1, 'eliminar_usuario', 'usuarios', 34, NULL, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', '2026-02-04 21:06:56'),
(60, 1, 'eliminar_usuario', 'usuarios', 33, NULL, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', '2026-02-04 21:06:58'),
(61, 1, 'eliminar_tienda', 'tiendas', 22, 'Tienda eliminada permanentemente: tingo', '2800:cd0:4817:7700:35b9:5f2b:9b3b:567a', '2026-02-05 18:56:47'),
(62, 1, 'ordenar_badges', 'badges', NULL, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-02-28 17:11:57'),
(63, 1, 'ordenar_badges', 'badges', NULL, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-02-28 17:13:57'),
(64, 1, 'eliminar_producto', 'productos', 143, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-02-28 20:51:53'),
(65, 1, 'crear_badge', 'badges', 4, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-03-01 08:13:24'),
(66, 1, 'eliminar_badge', 'badges', 4, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-03-01 10:22:01'),
(67, 1, 'crear_badge', 'badges', 5, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-03-01 19:25:06'),
(68, 1, 'eliminar_badge', 'badges', 5, NULL, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', '2026-03-01 19:25:13'),
(69, 1, 'eliminar_badge', 'badges', 3, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 19:24:48'),
(70, 1, 'crear_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 19:25:17'),
(71, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 19:26:52'),
(72, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 19:34:40'),
(73, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 19:59:12'),
(74, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 20:12:04'),
(75, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 20:13:14'),
(76, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 20:14:01'),
(77, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-02 20:15:19'),
(78, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 03:12:09'),
(79, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 03:18:12'),
(80, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 03:46:02'),
(81, 1, 'eliminar_badge', 'badges', 1, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 03:59:35'),
(82, 1, 'eliminar_badge', 'badges', 2, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 03:59:40'),
(83, 1, 'crear_badge', 'badges', 7, NULL, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', '2026-03-03 04:00:27'),
(84, 1, 'crear_badge', 'badges', 8, NULL, '2800:cd0:480d:ab00:ac01:acb:e907:9077', '2026-03-05 20:36:11'),
(85, 1, 'eliminar_usuario', 'usuarios', 40, NULL, '2800:cd0:480d:ab00:ac01:acb:e907:9077', '2026-03-06 03:18:42'),
(86, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:ac01:acb:e907:9077', '2026-03-06 06:13:48'),
(87, 1, 'actualizar_badge', 'badges', 8, NULL, '2800:cd0:480d:ab00:ac01:acb:e907:9077', '2026-03-06 06:13:59'),
(88, 1, 'eliminar_tienda', 'tiendas', 26, 'Tienda eliminada permanentemente: YANDEX', '2800:cd0:480d:ab00:f5dd:5855:14dc:66ed', '2026-03-06 19:23:38'),
(89, 1, 'eliminar_tienda', 'tiendas', 25, 'Tienda eliminada permanentemente: YANDEX', '2800:cd0:480d:ab00:f5dd:5855:14dc:66ed', '2026-03-06 19:43:33'),
(90, 1, 'eliminar_tienda', 'tiendas', 27, 'Tienda eliminada permanentemente: YANDEX200', '2800:cd0:480d:ab00:f5dd:5855:14dc:66ed', '2026-03-06 19:44:00'),
(91, 1, 'eliminar_tienda', 'tiendas', 28, 'Tienda eliminada permanentemente: BATMAN', '2800:cd0:480d:ab00:f5dd:5855:14dc:66ed', '2026-03-06 20:09:59'),
(92, 1, 'eliminar_tienda', 'tiendas', 29, 'Tienda eliminada permanentemente: BATMAN100', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 05:26:19'),
(93, 1, 'eliminar_tienda', 'tiendas', 30, 'Tienda eliminada permanentemente: BATMAN200', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 05:27:28'),
(94, 1, 'eliminar_tienda', 'tiendas', 31, 'Tienda eliminada permanentemente: SMART', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 05:31:48'),
(95, 1, 'eliminar_tienda', 'tiendas', 32, 'Tienda eliminada permanentemente: STAR', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 05:42:01'),
(96, 1, 'eliminar_tienda', 'tiendas', 33, 'Tienda eliminada permanentemente: SENSEI', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 06:08:34'),
(97, 1, 'eliminar_tienda', 'tiendas', 34, 'Tienda eliminada permanentemente: CANCION', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 09:18:26'),
(98, 1, 'actualizar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 15:47:00'),
(99, 1, 'eliminar_badge', 'badges', 6, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 15:52:30'),
(100, 1, 'eliminar_badge', 'badges', 8, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 15:52:33'),
(101, 1, 'eliminar_badge', 'badges', 7, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 15:52:37'),
(102, 1, 'eliminar_tienda', 'tiendas', 35, 'Tienda eliminada permanentemente: SAMSUNG', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:13:37'),
(103, 1, 'eliminar_tienda', 'tiendas', 24, 'Tienda eliminada permanentemente: Yango', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:13:47'),
(104, 1, 'eliminar_tienda', 'tiendas', 23, 'Tienda eliminada permanentemente: TINGO', '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:13:56'),
(105, 1, 'eliminar_usuario', 'usuarios', 41, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:14:42'),
(106, 1, 'eliminar_usuario', 'usuarios', 39, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:14:44'),
(107, 1, 'eliminar_usuario', 'usuarios', 38, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:14:46'),
(108, 1, 'eliminar_usuario', 'usuarios', 37, NULL, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', '2026-03-07 16:14:48'),
(109, 1, 'crear_badge', 'badges', 9, NULL, '2800:cd0:480d:ab00:adca:694f:2845:4343', '2026-03-09 08:51:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `expires_at`) VALUES
('yhefric@gmail.com', '2e1b88f11158db7537cfcc84ad125bc226f3db5e4e9b4de82410df17c275621b', '2026-02-09 11:14:46', '2026-02-09 15:14:46'),
('yhefric@gmail.com', '7b4e29e0b836f9626cc48634d91c527485296a5f02275fa44f392f60b8aca0d4', '2026-02-09 11:12:17', '2026-02-09 15:12:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `subcategoria_id` int(11) NOT NULL,
  `categoria_tienda` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `estado` enum('Nuevo','Como Nuevo','Buen Estado','Aceptable','nuevo','usado','reacondicionado') DEFAULT 'Nuevo',
  `departamento_codigo` varchar(10) DEFAULT NULL,
  `municipio_codigo` varchar(20) DEFAULT NULL,
  `departamento_nombre` varchar(100) DEFAULT NULL,
  `municipio_nombre` varchar(100) DEFAULT NULL,
  `fecha_publicacion` timestamp NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1,
  `vistas` int(11) DEFAULT 0,
  `destacado` tinyint(1) DEFAULT 0,
  `etiqueta` varchar(50) DEFAULT NULL,
  `envio_rapido` tinyint(1) DEFAULT 0,
  `visitas` int(11) DEFAULT 0,
  `likes` int(11) DEFAULT 0,
  `badge` varchar(50) DEFAULT 'none',
  `badges` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Badges seleccionados en formato JSON'
) ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `usuario_id`, `categoria_id`, `subcategoria_id`, `categoria_tienda`, `titulo`, `descripcion`, `precio`, `ciudad_id`, `estado`, `departamento_codigo`, `municipio_codigo`, `departamento_nombre`, `municipio_nombre`, `fecha_publicacion`, `activo`, `vistas`, `destacado`, `etiqueta`, `envio_rapido`, `visitas`, `likes`, `badge`, `badges`, `ribbon`) VALUES
(288, 42, 5, 35, 'PRIMER ANILLO', 'Xiaomi Redmi Note 13 Pro+ 5G', 'asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd asdas asd as dasd', '1233.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-08 04:10:00', 1, 1, 0, NULL, 0, 0, 1, 'none', NULL, 'none'),
(289, 42, 5, 35, 'SEGUNDO ANILLO', 'TECNO CAMON 22', 'ASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD ASASDAWD AS', '1233.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-08 14:36:36', 1, 0, 0, NULL, 0, 0, 0, 'none', NULL, 'none'),
(290, 42, 5, 35, 'TERCER ANILLO', 'HUAWEI Pura 70 (Series)', 'ASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADSASDAS CADS', '1233.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-08 14:38:20', 1, 0, 0, NULL, 0, 0, 0, 'none', NULL, 'none'),
(291, 42, 5, 35, '', 'TECNO CAMON 22', 'asdas asd asasdas asd asasdas asd asasdas asd asasdas asd asasdas asd asasdas asd as', '1233.00', 0, 'Buen Estado', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-08 16:18:49', 1, 0, 0, NULL, 0, 0, 0, 'none', NULL, 'none'),
(292, 42, 5, 35, '', 'Xiaomi Redmi Note 13 Pro+ 5G', 'XZCCSAD D ASD ASDXZCCSAD D ASD ASDXZCCSAD D ASD ASDXZCCSAD D ASD ASD', '1233.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-09 03:28:10', 1, 1, 0, NULL, 0, 0, 0, 'none', NULL, 'none'),
(293, 42, 5, 35, 'TERCER ANILLO', 'CELULAR TECNO CAMON 16', '654654654 OIJOIJOIJXZCCSAD D ASD ASDXZCCSAD D ASD ASDXZCCSAD D ASD ASDXZCCSAD D ASD ASD', '2222.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-09 03:32:50', 1, 0, 0, NULL, 0, 0, 0, 'none', NULL, 'none'),
(294, 42, 5, 35, 'PRIMER ANILLO', 'TECNO CAMON 22', 'ASDASDgit reset --hard d7becbe849f3f2154b1516e967f80d105a87d44d ; git push --force', '123132.00', 0, 'Como Nuevo', 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', '2026-03-09 19:09:38', 1, 1, 0, NULL, 0, 0, 0, 'none', NULL, 'none');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_badges`
--

CREATE TABLE `producto_badges` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `badge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_badges`
--

INSERT INTO `producto_badges` (`id`, `producto_id`, `created_at`, `badge_id`) VALUES
(418, 294, '2026-03-09 19:09:38', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagenes`
--

CREATE TABLE `producto_imagenes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `es_principal` tinyint(1) DEFAULT 0,
  `orden` int(11) DEFAULT 0,
  `hash_archivo` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_imagenes`
--

INSERT INTO `producto_imagenes` (`id`, `producto_id`, `nombre_archivo`, `es_principal`, `orden`, `hash_archivo`) VALUES
(1, 1, 'productos/6964e640641ce_1768220224.jpg', 1, 0, NULL),
(17, 13, 'productos/697c27c9c865e_1769744329.jpg', 1, 0, NULL),
(30, 23, 'productos/697e10aba87f5_1769869483.jpg', 1, 0, NULL),
(31, 23, 'productos/697e10aba97e3_1769869483.jpg', 0, 1, NULL),
(32, 24, 'productos/697e10ca31768_1769869514.jpg', 1, 0, NULL),
(33, 25, 'productos/697e16f58c913_1769871093.jpg', 1, 0, NULL),
(34, 26, 'productos/697e19c88570f_1769871816.jpg', 1, 0, NULL),
(35, 27, 'productos/697e1e136700c_1769872915.jpg', 1, 0, NULL),
(36, 28, 'productos/697e1e729e607_1769873010.jpg', 1, 0, NULL),
(37, 29, 'productos/697e1fdc54746_1769873372.jpg', 1, 0, NULL),
(38, 30, 'productos/697e22ce475f2_1769874126.jpg', 1, 0, NULL),
(39, 31, 'productos/697e2c9fe9b20_1769876639.jpg', 1, 0, NULL),
(40, 32, 'productos/697e2d6f890df_1769876847.jpg', 1, 0, NULL),
(41, 33, 'productos/697e33c3c1bec_1769878467.jpg', 1, 0, NULL),
(42, 34, 'productos/697e3e73e92e2_1769881203.jpg', 1, 0, NULL),
(43, 35, 'productos/697e4fccad41c_1769885644.jpg', 1, 0, NULL),
(46, 37, 'productos/697e53196f021_1769886489.jpg', 1, 0, NULL),
(47, 36, 'productos/697e53e588bf5_1769886693.jpg', 1, 99, NULL),
(48, 38, 'productos/697e551a67f0d_1769887002.jpg', 1, 0, NULL),
(49, 39, 'productos/697e55757181c_1769887093.jpg', 1, 0, NULL),
(50, 40, 'productos/697e559500ec7_1769887125.jpg', 1, 0, NULL),
(51, 41, 'productos/697e55b02304e_1769887152.jpg', 1, 0, NULL),
(52, 42, 'productos/697e567b14e0d_1769887355.jpg', 1, 0, NULL),
(53, 43, 'productos/697e573ba9a1d_1769887547.jpg', 1, 0, NULL),
(54, 44, 'productos/697e575d26607_1769887581.jpg', 1, 0, NULL),
(55, 45, 'productos/697e58156516c_1769887765.jpg', 1, 0, NULL),
(56, 46, 'productos/697e58d4d0837_1769887956.jpg', 1, 0, NULL),
(57, 47, 'productos/697e59749b2cf_1769888116.jpg', 1, 0, NULL),
(58, 48, 'productos/697e5bb10945b_1769888689.jpg', 1, 0, NULL),
(59, 49, 'productos/697e5d673becc_1769889127.jpg', 1, 0, NULL),
(60, 50, 'productos/697e60c93aeee_1769889993.jpg', 1, 0, NULL),
(61, 51, 'productos/697e61d6a9fb8_1769890262.jpg', 1, 0, NULL),
(62, 52, 'productos/697e63429e319_1769890626.jpg', 1, 0, NULL),
(63, 53, 'productos/697e63bd4ddb3_1769890749.jpg', 1, 0, NULL),
(64, 54, 'productos/697e64993c882_1769890969.jpg', 1, 0, NULL),
(65, 55, 'productos/697e66958c88c_1769891477.jpg', 1, 0, NULL),
(66, 56, 'productos/697e82c06f0ff_1769898688.jpg', 1, 0, NULL),
(67, 57, 'productos/697fe7964a744_1769990038.jpg', 1, 0, NULL),
(68, 58, 'productos/697ff794b3c9c_1769994132.jpg', 1, 0, NULL),
(83, 72, 'productos/698a480340ed3_1770670083.webp', 1, 0, NULL),
(84, 73, 'productos/698a497523dc8_1770670453.webp', 1, 0, NULL),
(85, 74, 'productos/698a4bf96333f_1770671097.webp', 1, 0, NULL),
(86, 75, 'productos/698a4c441fa75_1770671172.webp', 1, 0, NULL),
(87, 76, 'productos/698a4d07c7c4c_1770671367.webp', 1, 0, NULL),
(88, 77, 'productos/698a4e0f23825_1770671631.webp', 1, 0, NULL),
(89, 78, 'productos/698cbb5420133_1770830676.webp', 1, 0, NULL),
(90, 79, 'productos/698cbb7d528ab_1770830717.webp', 1, 0, NULL),
(91, 80, 'productos/698cc46d2b219_1770833005.webp', 1, 0, NULL),
(92, 81, 'productos/698f2b7786dbc_1770990455.webp', 1, 0, NULL),
(93, 81, 'productos/698f2b77f0ea3_1770990455.webp', 0, 1, NULL),
(94, 82, 'productos/698f32010d509_1770992129.webp', 1, 0, NULL),
(95, 83, 'productos/698f404726486_1770995783.webp', 1, 0, NULL),
(96, 83, 'productos/698f404733df3_1770995783.webp', 0, 1, NULL),
(97, 84, 'productos/6990e0050b359_1771102213.webp', 1, 0, NULL),
(98, 85, 'productos/6990ebccc0b82_1771105228.webp', 1, 0, NULL),
(99, 0, 'productos/699103857f415_1771111301.webp', 1, 0, NULL),
(100, 0, 'productos/6991039ec096c_1771111326.webp', 1, 0, NULL),
(101, 0, 'productos/699103a0e9c95_1771111328.webp', 1, 0, NULL),
(102, 0, 'productos/699103a2a60d7_1771111330.webp', 1, 0, NULL),
(103, 90, 'productos/6991e345075d8_1771168581.webp', 1, 0, NULL),
(104, 91, 'productos/6995148250563_1771377794.webp', 1, 0, NULL),
(105, 92, 'productos/6996212a0e4b4_1771446570.webp', 1, 0, NULL),
(106, 93, 'productos/6996214f6f605_1771446607.webp', 1, 0, NULL),
(107, 94, 'productos/6996218b70ef5_1771446667.webp', 1, 0, NULL),
(108, 95, 'productos/6996222794122_1771446823.webp', 1, 0, NULL),
(109, 96, 'productos/699627f382d7e_1771448307.webp', 1, 0, NULL),
(110, 97, 'productos/6997d13c6c74a_1771557180.webp', 1, 0, NULL),
(111, 98, 'productos/6998771d7a23e_1771599645.webp', 1, 0, NULL),
(112, 99, 'productos/69988cdd4645e_1771605213.webp', 1, 0, NULL),
(113, 100, 'productos/69989ced2304d_1771609325.webp', 1, 0, NULL),
(114, 101, 'productos/699a1ffe97867_1771708414.webp', 1, 0, NULL),
(115, 102, 'productos/699a2024a4a43_1771708452.webp', 1, 0, NULL),
(116, 103, 'productos/699a591ccba26_1771723036.webp', 1, 0, NULL),
(117, 104, 'productos/699a6d2b87fd9_1771728171.webp', 1, 0, NULL),
(118, 105, 'productos/699ddef577715_1771953909.webp', 1, 0, NULL),
(119, 106, 'productos/699dedeba360a_1771957739.webp', 1, 0, NULL),
(120, 107, 'productos/699df2c2a509e_1771958978.webp', 1, 0, NULL),
(121, 108, 'productos/699df641f293b_1771959873.webp', 1, 0, NULL),
(122, 109, 'productos/699df97456270_1771960692.webp', 1, 0, NULL),
(123, 110, 'productos/699dff6ef388e_1771962222.webp', 1, 0, NULL),
(124, 111, 'productos/699e000f7441b_1771962383.webp', 1, 0, NULL),
(125, 112, 'productos/699e016f029e4_1771962735.webp', 1, 0, NULL),
(126, 113, 'productos/699fc40060d58_1772078080.webp', 1, 0, NULL),
(127, 114, 'productos/69a0697d18b77_1772120445.webp', 1, 0, NULL),
(128, 115, 'productos/69a0cfad46df0_1772146605.webp', 1, 0, NULL),
(129, 116, 'productos/69a0d60284c01_1772148226.webp', 1, 0, NULL),
(130, 117, 'productos/69a0e975704be_1772153205.webp', 1, 0, NULL),
(131, 118, 'productos/69a1a654c918e_1772201556.webp', 1, 0, NULL),
(132, 119, 'productos/69a1a70c53a24_1772201740.webp', 1, 0, NULL),
(133, 120, 'productos/69a1a798438e6_1772201880.webp', 1, 0, NULL),
(134, 121, 'productos/69a1a8aa09de8_1772202154.webp', 1, 0, NULL),
(135, 122, 'productos/69a1a9ec5dbef_1772202476.webp', 1, 0, NULL),
(136, 123, 'productos/69a1ccb37ac27_1772211379.webp', 1, 0, NULL),
(137, 124, 'productos/69a211106bec8_1772228880.webp', 1, 0, NULL),
(138, 125, 'productos/69a23f0fb0320_1772240655.webp', 1, 0, NULL),
(139, 126, 'productos/69a2db9b77ddc_1772280731.webp', 1, 0, NULL),
(140, 136, 'productos/69a2f23fad85a_1772286527.webp', 1, 0, NULL),
(141, 137, 'productos/69a2f2eed5159_1772286702.webp', 1, 0, NULL),
(142, 138, 'productos/69a2f3446ec63_1772286788.webp', 1, 0, NULL),
(143, 139, 'productos/69a2f621a3793_1772287521.webp', 1, 0, NULL),
(144, 140, 'productos/69a2fba768288_1772288935.webp', 1, 0, NULL),
(145, 141, 'productos/69a3002b0a832_1772290091.webp', 1, 0, NULL),
(146, 142, 'productos/69a320654c377_1772298341.webp', 1, 0, NULL),
(147, 144, 'productos/69a34408b266a_1772307464.webp', 1, 0, NULL),
(148, 145, 'productos/69a346bf15d1f_1772308159.webp', 1, 0, NULL),
(149, 146, 'productos/69a35491a51eb_1772311697.webp', 1, 0, NULL),
(150, 147, 'productos/69a357df4c126_1772312543.webp', 1, 0, NULL),
(151, 148, 'productos/69a35d0fbb285_1772313871.webp', 1, 0, NULL),
(152, 149, 'productos/69a3c6c77a873_1772340935.webp', 1, 0, NULL),
(153, 150, 'productos/69a3cc2387897_1772342307.webp', 1, 0, NULL),
(154, 151, 'productos/69a3ccc6b6492_1772342470.webp', 1, 0, NULL),
(155, 152, 'productos/69a3cd8ea236a_1772342670.webp', 1, 0, NULL),
(156, 153, 'productos/69a43b3962634_1772370745.webp', 1, 0, NULL),
(157, 154, 'productos/69a47d705ad5e_1772387696.webp', 1, 0, NULL),
(158, 198, 'productos/69a50a304339a_1772423728.webp', 1, 0, NULL),
(159, 199, 'productos/69a50b11578f3_1772423953.webp', 1, 0, NULL),
(160, 200, 'productos/69a50b38e2f19_1772423992.webp', 1, 0, NULL),
(161, 201, 'productos/69a596f7659f6_1772459767.webp', 1, 0, NULL),
(162, 202, 'productos/69a5a02d5e5b6_1772462125.webp', 1, 0, NULL),
(163, 203, 'productos/69a5a37fd0c15_1772462975.webp', 1, 0, NULL),
(164, 204, 'productos/69a5a88d302f6_1772464269.webp', 1, 0, NULL),
(165, 205, 'productos/69a5ab9a100cf_1772465050.webp', 1, 0, NULL),
(167, 206, 'productos/69a5c6621a977_1772471906.webp', 1, 99, NULL),
(168, 207, 'productos/69a5c69b8fbb6_1772471963.webp', 1, 0, NULL),
(170, 208, 'productos/69a5c6c39614c_1772472003.webp', 1, 99, NULL),
(171, 209, 'productos/69a5c89f1c10d_1772472479.webp', 1, 0, NULL),
(173, 210, 'productos/69a5c9bce1ed8_1772472764.webp', 1, 99, NULL),
(174, 211, 'productos/69a5cabb3aa25_1772473019.webp', 1, 0, NULL),
(177, 212, 'productos/69a5cfc403eda_1772474308.webp', 1, 99, NULL),
(178, 213, 'productos/69a5cfee04282_1772474350.webp', 1, 0, NULL),
(192, 214, 'productos/69a5d6f26fa04_1772476146.webp', 1, 99, NULL),
(196, 216, 'productos/69a5d96690fc7_1772476774.webp', 1, 99, NULL),
(197, 215, 'productos/69a5d97186233_1772476785.webp', 1, 99, NULL),
(201, 218, 'productos/69a5dc352bc87_1772477493.webp', 1, 99, NULL),
(202, 217, 'productos/69a5ddb430749_1772477876.webp', 1, 99, NULL),
(207, 219, 'productos/69a5df96e6933_1772478358.webp', 1, 99, NULL),
(212, 220, 'productos/69a5e6b8b5b97_1772480184.webp', 1, 99, NULL),
(220, 228, 'productos/69a5ee8d72066_1772482189.webp', 1, 0, NULL),
(221, 229, 'productos/69a5eea5c81b8_1772482213.webp', 1, 0, NULL),
(222, 230, 'productos/69a5f6179b27a_1772484119.webp', 1, 0, NULL),
(223, 231, 'productos/69a5f62d063ad_1772484141.webp', 1, 0, NULL),
(224, 232, 'productos/69a6104bac898_1772490827.webp', 1, 0, NULL),
(225, 233, 'productos/69a610977e668_1772490903.webp', 1, 0, NULL),
(226, 234, 'productos/69a619807bd22_1772493184.webp', 1, 0, NULL),
(227, 235, 'productos/69a619959dd36_1772493205.webp', 1, 0, NULL),
(228, 236, 'productos/69a61ff60f28c_1772494838.webp', 1, 0, NULL),
(229, 237, 'productos/69a627b6e1624_1772496822.webp', 1, 0, NULL),
(230, 238, 'productos/69a6293212827_1772497202.webp', 1, 0, NULL),
(231, 239, 'productos/69a6296040ce7_1772497248.webp', 1, 0, NULL),
(232, 240, 'productos/69a6344d2f375_1772500045.webp', 1, 0, NULL),
(233, 241, 'productos/69a6346ec3731_1772500078.webp', 1, 0, NULL),
(234, 241, 'productos/69a636f2c281c_1772500722.webp', 0, 99, NULL),
(235, 241, 'productos/69a637211bb19_1772500769.webp', 0, 99, NULL),
(236, 241, 'productos/69a6384a40aa2_1772501066.webp', 0, 99, NULL),
(237, 241, 'productos/69a63925b65b2_1772501285.webp', 0, 99, NULL),
(238, 241, 'productos/69a63ab029caa_1772501680.webp', 0, 99, '18bc4d89d134fe0083cfae1af06e6336dda0d6991c11ae3d545de9c2b36307cd'),
(245, 242, 'productos/69a6406052d74_1772503136.webp', 1, 0, 'd4e03804d0c648f5de11609bda61f02e8cd0ed5a05c57820ad67d90405b4d4c2'),
(246, 255, '23/69a6425729f61_1772503639.webp', 1, 0, NULL),
(249, 256, 'productos/23/69a647235190d_1772504867.webp', 1, 0, '4545ab515d99ee106b73713aa3dc4224eb5e63e952fb4e009918750c4fb4df66'),
(253, 260, 'productos/23/69a6d38b4357d_1772540811.webp', 1, 0, NULL),
(254, 261, 'productos/23/69a6d53e2189d_1772541246.webp', 1, 0, NULL),
(261, 263, 'productos/23/69a6db27bfc94_1772542759.webp', 1, 0, '3ab21ab56162893d44748b46188745060bf99513f650b37aff6ea3f0fc7cdc35'),
(278, 277, 'productos/23/69a8f4989e7de_1772680344.webp', 1, 0, NULL),
(287, 282, 'productos/26/69aac8770da4a_1772800119.webp', 1, 0, NULL),
(299, 288, 'productos/36/69ad7d11e503c_1772977425.webp', 1, 0, '6df1d9889f39323d369addc0b520880eea194388649b8c2b6f8337cc0497c9da'),
(300, 289, 'productos/36/69ad8974826ed_1772980596.webp', 1, 0, NULL),
(301, 290, 'productos/36/69ad89dce8f51_1772980700.webp', 1, 0, NULL),
(302, 291, 'productos/36/69ada1690432d_1772986729.webp', 1, 0, NULL),
(303, 292, 'productos/36/69ae3e4ae9306_1773026890.webp', 1, 0, NULL),
(304, 293, 'productos/36/69ae3f6306c8d_1773027171.webp', 1, 0, NULL),
(305, 294, 'productos/36/69af1af31e7f6_1773083379.webp', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_likes`
--

CREATE TABLE `producto_likes` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto_likes`
--

INSERT INTO `producto_likes` (`id`, `producto_id`, `ip_address`, `user_agent`, `created_at`) VALUES
(9, 11, '2800:cd0:4817:7700:cc63:c669:39f:dbf5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-29 14:51:44'),
(10, 12, '2800:cd0:4817:7700:cc63:c669:39f:dbf5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-29 16:11:30'),
(11, 3, '2800:cd0:4817:7700:cc63:c669:39f:dbf5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-29 19:01:48'),
(12, 14, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-30 04:59:45'),
(13, 17, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-30 13:42:12'),
(14, 18, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-30 14:49:49'),
(15, 21, '2800:cd0:4817:7700:fde1:6db4:7a70:deda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-01-31 02:54:21'),
(16, 30, '2800:cd0:4817:7700:a626:37d3:c148:987d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '2026-01-31 15:42:52'),
(17, 29, '2800:cd0:4817:7700:a626:37d3:c148:987d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '2026-01-31 15:42:56'),
(18, 55, '2800:cd0:4817:7700:c071:ea15:acda:1a64', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-01 00:02:22'),
(19, 59, '2800:cd0:4817:7700:514d:447:befe:e2e1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-02 15:45:31'),
(20, 62, '2800:cd0:4817:7700:514d:447:befe:e2e1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-02 17:54:32'),
(21, 75, '2800:cd0:4817:7700:8517:acd5:87dc:646c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-09 21:59:46'),
(22, 79, '2800:cd0:4817:7700:2133:9dc:b6ef:2d0b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 18:03:42'),
(23, 81, '2800:cd0:4817:7700:a418:df36:d578:54f5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-13 14:59:35'),
(24, 83, '2800:cd0:4817:7700:a418:df36:d578:54f5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-17 03:00:29'),
(25, 84, '2800:cd0:4817:7700:f039:3f0e:aeb3:a358', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-17 22:42:56'),
(26, 82, '2800:cd0:4817:7700:b4e4:3254:b7cd:14dd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-18 18:11:12'),
(27, 102, '2800:cd0:4817:7700:24a9:c088:3301:f7e0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 14:25:23'),
(28, 117, '2800:cd0:4817:7700:28b2:3c58:938b:dd66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 00:49:30'),
(29, 141, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-28 22:40:50'),
(30, 153, '2800:cd0:480d:ab00:2c72:6671:ba7e:7618', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-01 13:12:34'),
(31, 258, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 12:12:33'),
(32, 257, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 12:12:47'),
(33, 262, '2800:cd0:480d:ab00:d070:a5c7:d9fc:a13c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 14:01:30'),
(34, 288, '2800:cd0:480d:ab00:14e4:51a4:146a:4c69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-08 13:42:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `reportador_id` int(11) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL COMMENT 'usuario, producto, comentario',
  `item_id` int(11) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'pendiente' COMMENT 'pendiente, revisado, resuelto, rechazado',
  `admin_id` int(11) DEFAULT NULL COMMENT 'admin que lo reviso',
  `fecha_reporte` datetime DEFAULT current_timestamp(),
  `fecha_revision` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `categoria_id`, `nombre`) VALUES
(1, 1, 'Autos'),
(2, 1, 'Motos'),
(3, 1, 'Camiones'),
(4, 1, 'Repuestos'),
(5, 1, 'Accesorios'),
(6, 2, 'Smartphones'),
(7, 2, 'Accesorios'),
(8, 2, 'Fundas'),
(9, 2, 'Cargadores'),
(10, 3, 'Cocina'),
(11, 3, 'Refrigeración'),
(12, 3, 'Lavado'),
(13, 3, 'Audio y Video'),
(14, 4, 'Laptops'),
(15, 4, 'PCs de Escritorio'),
(16, 4, 'Componentes'),
(17, 4, 'Accesorios'),
(18, 1, 'Automóvil'),
(19, 1, 'Vagoneta'),
(20, 1, 'Camioneta'),
(21, 1, 'Motocicleta'),
(22, 1, 'Camión'),
(23, 1, 'Bus/Micro'),
(24, 1, 'Maquinaria/Agro'),
(25, 1, 'Náutica'),
(26, 1, 'Bicicleta'),
(27, 1, 'Otros vehículos'),
(28, 1, 'Automóviles'),
(29, 1, 'Vagonetas'),
(30, 1, 'Camionetas'),
(31, 1, 'Motocicletas'),
(32, 1, 'Buses/Micros'),
(33, 1, 'Bicicletas'),
(34, 1, 'Otros'),
(35, 5, 'Celulares'),
(36, 5, 'Tablets'),
(37, 5, 'Relojes'),
(38, 5, 'Consolas'),
(39, 5, 'Laptops'),
(40, 5, 'PCs de escritorio'),
(41, 5, 'Otros'),
(42, 3, 'Refrigeradores'),
(43, 3, 'Cocinas'),
(44, 3, 'Lavadoras'),
(45, 3, 'Microondas'),
(46, 3, 'Aspiradoras'),
(47, 3, 'Televisores'),
(48, 3, 'Otros'),
(49, 6, 'Ropa'),
(50, 6, 'Zapatos'),
(51, 6, 'Tenis'),
(52, 6, 'Tacones'),
(53, 6, 'Sandalias'),
(54, 6, 'Crocs'),
(55, 6, 'Joyas'),
(56, 6, 'Accesorios'),
(57, 6, 'Otros'),
(58, 7, 'Sofás y sillones'),
(59, 7, 'Sillas'),
(60, 7, 'Mesas'),
(61, 7, 'Comedor'),
(62, 7, 'Catres'),
(63, 7, 'Colchones'),
(64, 7, 'Somier'),
(65, 7, 'Roperos'),
(66, 7, 'Escritorios'),
(67, 7, 'Estantes y repisas'),
(68, 7, 'Muebles de TV'),
(69, 7, 'Otros'),
(70, 8, 'Casas'),
(71, 8, 'Departamentos'),
(72, 8, 'Terrenos'),
(73, 8, 'Oficinas'),
(74, 8, 'Locales'),
(75, 8, 'Galpones'),
(76, 8, 'Habitaciones'),
(77, 8, 'Otros'),
(78, 9, 'Juegos de mesa'),
(79, 9, 'Rompecabezas'),
(80, 9, 'Legos'),
(81, 9, 'Peluches'),
(82, 9, 'Didácticos'),
(83, 9, 'Otros'),
(84, 10, 'Herramientas manuales'),
(85, 10, 'Herramientas eléctricas'),
(86, 10, 'Herramientas inalámbricas'),
(87, 10, 'Soldadura'),
(88, 10, 'Compresores'),
(89, 10, 'Medición y nivelación'),
(90, 10, 'Jardinería'),
(91, 10, 'Ferretería y fijaciones'),
(92, 10, 'Seguridad industrial'),
(93, 10, 'Otros'),
(94, 9, 'Vehículos'),
(95, 9, 'Muñecas'),
(96, 9, 'Bloques'),
(97, 9, 'Acción'),
(98, 9, 'Bebés'),
(99, 9, 'Pelotas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  `telegram_user` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `color_primario` varchar(20) DEFAULT '#2E7D32',
  `tema` varchar(20) DEFAULT 'claro',
  `color_secundario` varchar(7) DEFAULT '#2c3e50',
  `logo` varchar(255) DEFAULT NULL,
  `logo_principal` varchar(255) DEFAULT NULL,
  `mostrar_logo` tinyint(1) NOT NULL DEFAULT 1,
  `mostrar_nombre` tinyint(1) NOT NULL DEFAULT 1,
  `logo_navbar` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo','suspendido') DEFAULT 'activo',
  `verificada` tinyint(1) DEFAULT 0,
  `visitas` int(11) DEFAULT 0,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `plantilla` varchar(50) DEFAULT 'minimal',
  `rubro` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `google_maps` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `horario_atencion` text DEFAULT NULL,
  `politicas_envio` text DEFAULT NULL,
  `politicas_devolucion` text DEFAULT NULL,
  `sobre_nosotros` text DEFAULT NULL,
  `config_bloques` longtext DEFAULT NULL,
  `menu_items` text DEFAULT NULL,
  `productos_destacados` text DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `menu_inicio` varchar(50) DEFAULT 'Inicio',
  `menu_catalogo` varchar(50) DEFAULT 'Catálogo',
  `menu_contacto` varchar(50) DEFAULT 'Contacto',
  `template_id` varchar(50) DEFAULT 'modern',
  `theme_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `suspension_fin` datetime DEFAULT NULL,
  `opacidad_botones` int(11) DEFAULT 12,
  `imagen_acerca_1` varchar(255) DEFAULT NULL,
  `imagen_acerca_2` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `email_contacto` varchar(255) DEFAULT NULL,
  `google_maps_url` text DEFAULT NULL,
  `estilo_bordes` varchar(50) DEFAULT 'suave',
  `estilo_fondo` varchar(50) DEFAULT 'blanco',
  `tipografia` varchar(50) DEFAULT 'system',
  `estilo_tarjetas` varchar(50) DEFAULT 'elevada',
  `tamano_texto` varchar(20) DEFAULT 'normal',
  `estilo_fotos` varchar(50) DEFAULT 'cuadrado',
  `mostrar_banner` int(11) DEFAULT 0,
  `banner_imagen` varchar(255) DEFAULT NULL,
  `banner_titulo` varchar(100) DEFAULT NULL,
  `banner_subtitulo` varchar(200) DEFAULT NULL,
  `banner_texto_boton` varchar(50) DEFAULT 'Ver Productos',
  `banner_imagen_2` varchar(255) DEFAULT NULL,
  `banner_imagen_3` varchar(255) DEFAULT NULL,
  `mostrar_novedades` tinyint(1) NOT NULL DEFAULT 0,
  `mostrar_categorias_destacadas` tinyint(1) NOT NULL DEFAULT 0,
  `homepage_orden` text DEFAULT NULL,
  `mostrar_categorias_dest` int(11) DEFAULT 0,
  `categorias_dest_ids` text DEFAULT NULL,
  `novedades_titulo` varchar(100) DEFAULT 'Últimos productos',
  `categorias_destacadas_titulo` varchar(100) DEFAULT 'Categorías destacadas',
  `categorias_destacadas_ids` text DEFAULT NULL,
  `secciones_destacadas_activo` int(11) DEFAULT 0,
  `secciones_destacadas_estilo` varchar(50) DEFAULT 'grid',
  `novedades_activo` int(11) DEFAULT 0,
  `novedades_estilo` varchar(50) DEFAULT 'grid',
  `navbar_style` varchar(50) DEFAULT 'claro',
  `grid_density` int(11) DEFAULT 3,
  `banners_json` text DEFAULT NULL,
  `banner_imagen_4` varchar(255) DEFAULT NULL,
  `acerca_de_nosotros_activo` int(11) DEFAULT 1,
  `acerca_de_nosotros_texto` text DEFAULT NULL,
  `acerca_de_nosotros_tarjeta1_activa` int(11) DEFAULT 1,
  `acerca_de_nosotros_tarjeta2_activa` int(11) DEFAULT 1,
  `acerca_de_nosotros_tarjeta3_activa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id`, `usuario_id`, `nombre`, `slug`, `descripcion`, `whatsapp`, `facebook_url`, `instagram_url`, `tiktok_url`, `telegram_user`, `telefono`, `email`, `direccion`, `color_primario`, `tema`, `color_secundario`, `logo`, `logo_principal`, `mostrar_logo`, `mostrar_nombre`, `logo_navbar`, `banner`, `estado`, `verificada`, `visitas`, `fecha_creacion`, `fecha_actualizacion`, `created_at`, `updated_at`, `plantilla`, `rubro`, `ciudad`, `horario`, `google_maps`, `facebook`, `twitter`, `website`, `horario_atencion`, `politicas_envio`, `politicas_devolucion`, `sobre_nosotros`, `config_bloques`, `menu_items`, `productos_destacados`, `instagram`, `tiktok`, `menu_inicio`, `menu_catalogo`, `menu_contacto`, `template_id`, `theme_config`, `suspension_fin`, `opacidad_botones`, `imagen_acerca_1`, `imagen_acerca_2`, `youtube_url`, `categoria`, `email_contacto`, `google_maps_url`, `estilo_bordes`, `estilo_fondo`, `tipografia`, `estilo_tarjetas`, `tamano_texto`, `estilo_fotos`, `mostrar_banner`, `banner_imagen`, `banner_titulo`, `banner_subtitulo`, `banner_texto_boton`, `banner_imagen_2`, `banner_imagen_3`, `mostrar_novedades`, `mostrar_categorias_destacadas`, `homepage_orden`, `mostrar_categorias_dest`, `categorias_dest_ids`, `novedades_titulo`, `categorias_destacadas_titulo`, `categorias_destacadas_ids`, `secciones_destacadas_activo`, `secciones_destacadas_estilo`, `novedades_activo`, `novedades_estilo`, `navbar_style`, `grid_density`, `banners_json`, `banner_imagen_4`, `acerca_de_nosotros_activo`, `acerca_de_nosotros_texto`, `acerca_de_nosotros_tarjeta1_activa`, `acerca_de_nosotros_tarjeta2_activa`, `acerca_de_nosotros_tarjeta3_activa`) VALUES
(36, 42, 'TINGO', 'tingo', '', '75872712', '', '', '', '', NULL, NULL, '', '#008080', 'claro', '#2c3e50', 'logo_tienda_36_69acda0fc8ed3.webp', 'logo_principal_36_69ad7c83c0af0.webp?v=1772977283', 0, 1, NULL, NULL, 'activo', 0, 0, '2026-03-08 00:52:12', '2026-03-09 13:17:18', '2026-03-08 00:52:12', '2026-03-09 13:17:18', 'minimal', NULL, 'scz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"label\":\"PRIMER ANILLO\",\"url\":\"#\"},{\"label\":\"SEGUNDO ANILLO\",\"url\":\"#\"},{\"label\":\"TERCER ANILLO\",\"url\":\"#\"}]', NULL, NULL, NULL, 'Inicio', 'Catálogo', 'Contacto', 'modern', NULL, NULL, 12, NULL, NULL, '', 'tech', '', '', 'pill', 'gris', 'system', 'borde', 'normal', 'vertical', 0, NULL, NULL, NULL, 'Ver Productos', NULL, NULL, 0, 0, NULL, 0, NULL, 'Últimos productos', 'Categorías destacadas', NULL, 0, 'grid', 0, 'grid', 'marca', 0, NULL, NULL, 0, 'Bienvenido a nuestra tienda. Somos un equipo apasionado por ofrecer productos de calidad que superen las expectativas de nuestros clientes. Trabajamos cada día con el compromiso de brindar soluciones confiables y accesibles; nuestra prioridad es que cada persona que confía en nosotros reciba excelencia en cada detalle.', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_configuracion_inicio`
--

CREATE TABLE `tienda_configuracion_inicio` (
  `id` int(11) NOT NULL,
  `tiend-id` int(11) NOT NULL,
  `seccion` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `orden` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traffic_logs`
--

CREATE TABLE `traffic_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `request_uri` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `country_code` varchar(5) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(20) DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `traffic_logs`
--

INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referer`, `method`, `timestamp`, `country_code`, `city`, `device_type`, `usuario_id`) VALUES
(1, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 11:23:51', NULL, NULL, 'Desktop', NULL),
(2, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 11:23:54', NULL, NULL, 'Desktop', NULL),
(3, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 11:25:16', NULL, NULL, 'Desktop', NULL),
(4, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 11:29:24', NULL, NULL, 'Desktop', NULL),
(5, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/view_product.php?id=64', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 11:29:28', NULL, NULL, 'Desktop', NULL),
(6, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php', 'https://donebolivia.com/products/view_product.php?id=64', 'GET', '2026-02-03 11:51:47', NULL, NULL, 'Desktop', NULL),
(7, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/index.php', 'https://donebolivia.com/auth/login.php', 'GET', '2026-02-03 11:52:00', NULL, NULL, 'Desktop', NULL),
(8, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:01:08', NULL, NULL, 'Desktop', NULL),
(9, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:01:09', NULL, NULL, 'Desktop', NULL),
(10, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 12:01:20', NULL, NULL, 'Desktop', NULL),
(11, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:01:22', NULL, NULL, 'Desktop', NULL),
(12, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:01:32', NULL, NULL, 'Desktop', NULL),
(13, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:01:42', NULL, NULL, 'Desktop', NULL),
(14, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:02:01', NULL, NULL, 'Desktop', NULL),
(15, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?mensaje=logout', 'https://donebolivia.com/', 'GET', '2026-02-03 12:02:10', NULL, NULL, 'Desktop', NULL),
(16, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?mensaje=logout', 'https://donebolivia.com/', 'GET', '2026-02-03 12:02:14', NULL, NULL, 'Desktop', NULL),
(17, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:02:15', NULL, NULL, 'Desktop', NULL),
(18, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:04:49', NULL, NULL, 'Desktop', NULL),
(19, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:04:56', NULL, NULL, 'Desktop', NULL),
(20, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:05:11', NULL, NULL, 'Desktop', NULL),
(21, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:05:13', NULL, NULL, 'Desktop', NULL),
(22, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:05:14', NULL, NULL, 'Desktop', NULL),
(23, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 12:05:22', NULL, NULL, 'Desktop', NULL),
(24, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:05:24', NULL, NULL, 'Desktop', NULL),
(25, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:05:48', NULL, NULL, 'Desktop', NULL),
(26, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:05:48', NULL, NULL, 'Desktop', NULL),
(27, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:06:01', NULL, NULL, 'Desktop', NULL),
(28, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:07:29', NULL, NULL, 'Desktop', NULL),
(29, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:07:33', NULL, NULL, 'Desktop', NULL),
(30, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:07:48', NULL, NULL, 'Desktop', NULL),
(31, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:10:36', NULL, NULL, 'Desktop', NULL),
(32, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:10:52', NULL, NULL, 'Desktop', NULL),
(33, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 12:11:30', NULL, NULL, 'Desktop', NULL),
(34, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:11:41', NULL, NULL, 'Desktop', NULL),
(35, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:11:53', NULL, NULL, 'Mobile', NULL),
(36, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:12:06', NULL, NULL, 'Mobile', NULL),
(37, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:15:13', NULL, NULL, 'Desktop', NULL),
(38, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:15:25', NULL, NULL, 'Desktop', NULL),
(39, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:20:03', NULL, NULL, 'Desktop', NULL),
(40, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:06', NULL, NULL, 'Mobile', NULL),
(41, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:45', NULL, NULL, 'Desktop', NULL),
(42, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:46', NULL, NULL, 'Desktop', NULL),
(43, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:47', NULL, NULL, 'Desktop', NULL),
(44, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:47', NULL, NULL, 'Desktop', NULL),
(45, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 12:20:56', NULL, NULL, 'Desktop', NULL),
(46, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:21:04', NULL, NULL, 'Desktop', NULL),
(47, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:26:42', NULL, NULL, 'Desktop', NULL),
(48, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:26:42', NULL, NULL, 'Desktop', NULL),
(49, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:26:43', NULL, NULL, 'Desktop', NULL),
(50, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:27:06', NULL, NULL, 'Desktop', NULL),
(51, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:27:09', NULL, NULL, 'Desktop', NULL),
(52, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:31:25', NULL, NULL, 'Desktop', NULL),
(53, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 12:31:33', NULL, NULL, 'Desktop', NULL),
(54, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:31:35', NULL, NULL, 'Desktop', NULL),
(55, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:31:42', NULL, NULL, 'Desktop', NULL),
(56, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:33:16', NULL, NULL, 'Desktop', NULL),
(57, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:33:18', NULL, NULL, 'Desktop', NULL),
(58, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 12:33:28', NULL, NULL, 'Desktop', NULL),
(59, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 12:33:31', NULL, NULL, 'Desktop', NULL),
(60, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/search.php?q=', 'https://donebolivia.com/', 'GET', '2026-02-03 12:33:43', NULL, NULL, 'Desktop', NULL),
(61, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/products/search.php?q=', 'GET', '2026-02-03 12:33:45', NULL, NULL, 'Desktop', NULL),
(62, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/', 'GET', '2026-02-03 12:33:47', NULL, NULL, 'Desktop', NULL),
(63, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 12:33:49', NULL, NULL, 'Desktop', NULL),
(64, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/?i=1', 'GET', '2026-02-03 12:38:40', NULL, NULL, 'Mobile', NULL),
(65, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:49:41', NULL, NULL, 'Desktop', NULL),
(66, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/', 'GET', '2026-02-03 12:49:45', NULL, NULL, 'Desktop', NULL),
(67, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 12:49:57', NULL, NULL, 'Desktop', NULL),
(68, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:56:03', NULL, NULL, 'Desktop', NULL),
(69, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:56:04', NULL, NULL, 'Desktop', NULL),
(70, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:56:04', NULL, NULL, 'Desktop', NULL),
(71, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/?i=1', 'GET', '2026-02-03 12:56:50', NULL, NULL, 'Mobile', NULL),
(72, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 12:56:58', NULL, NULL, 'Mobile', NULL),
(73, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 12:57:01', NULL, NULL, 'Mobile', NULL),
(74, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 12:57:09', NULL, NULL, 'Mobile', NULL),
(75, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:57:16', NULL, NULL, 'Mobile', NULL),
(76, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:57:22', NULL, NULL, 'Mobile', NULL),
(77, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:57:28', NULL, NULL, 'Desktop', NULL),
(78, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:57:34', NULL, NULL, 'Desktop', NULL),
(79, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 12:57:35', NULL, NULL, 'Desktop', NULL),
(80, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/?i=1', 'GET', '2026-02-03 12:57:47', NULL, NULL, 'Mobile', NULL),
(81, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/?i=1', 'GET', '2026-02-03 12:57:49', NULL, NULL, 'Mobile', NULL),
(82, '189.28.91.123', 'Mozilla/5.0 (Linux; Android 12; TECNO BF6 Build/SP1A.210812.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6Cin4nZl_i6TTxQqV33Z609qZ39PaUSkomOriV4bFvo9bMVByAsynMcI4grw_aem_Dm2DmbGR1iX49GvWUHfZjw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6Cin4nZl_i6TTxQqV33Z609qZ39PaUSkomOriV4bFvo9bMVByAsynMcI4grw_aem_Dm2DmbGR1iX49GvWUHfZjw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 12:57:54', NULL, NULL, 'Mobile', NULL),
(83, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:57:59', NULL, NULL, 'Mobile', NULL),
(84, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:58:04', NULL, NULL, 'Mobile', NULL),
(85, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 12:58:20', NULL, NULL, 'Mobile', NULL),
(86, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 12:58:21', NULL, NULL, 'Mobile', NULL),
(87, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 12:58:26', NULL, NULL, 'Mobile', NULL),
(88, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 12:58:27', NULL, NULL, 'Mobile', NULL),
(89, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 12:58:59', NULL, NULL, 'Mobile', NULL),
(90, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 13:01:02', NULL, NULL, 'Mobile', NULL),
(91, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 13:01:05', NULL, NULL, 'Mobile', NULL),
(92, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:01:14', NULL, NULL, 'Mobile', NULL),
(93, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:01:15', NULL, NULL, 'Mobile', NULL),
(94, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/login.php', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:01:23', NULL, NULL, 'Mobile', NULL),
(95, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:02:23', NULL, NULL, 'Mobile', NULL),
(96, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=3', 'GET', '2026-02-03 13:02:25', NULL, NULL, 'Mobile', NULL),
(97, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:03:50', NULL, NULL, 'Mobile', NULL),
(98, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=3', 'GET', '2026-02-03 13:03:51', NULL, NULL, 'Mobile', NULL),
(99, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:04:19', NULL, NULL, 'Mobile', NULL),
(100, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=3', 'https://donebolivia.com/?i=3', 'GET', '2026-02-03 13:04:20', NULL, NULL, 'Mobile', NULL),
(101, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 13:09:45', NULL, NULL, 'Desktop', NULL),
(102, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 13:10:06', NULL, NULL, 'Desktop', NULL),
(103, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:10:13', NULL, NULL, 'Desktop', NULL),
(104, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:13:57', NULL, NULL, 'Mobile', NULL),
(105, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:14:00', NULL, NULL, 'Mobile', NULL),
(106, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 13:14:50', NULL, NULL, 'Desktop', NULL),
(107, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', '', 'GET', '2026-02-03 13:17:15', NULL, NULL, 'Mobile', NULL),
(108, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/', 'GET', '2026-02-03 13:17:17', NULL, NULL, 'Mobile', NULL),
(109, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:17:21', NULL, NULL, 'Desktop', NULL),
(110, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:17:25', NULL, NULL, 'Mobile', NULL),
(111, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:19:45', NULL, NULL, 'Desktop', NULL),
(112, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:19:55', NULL, NULL, 'Desktop', NULL),
(113, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:19:57', NULL, NULL, 'Desktop', NULL),
(114, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:20:00', NULL, NULL, 'Mobile', NULL),
(115, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/', 'GET', '2026-02-03 13:20:11', NULL, NULL, 'Mobile', NULL),
(116, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:20:12', NULL, NULL, 'Mobile', NULL),
(117, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:21:58', NULL, NULL, 'Desktop', NULL),
(118, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:21:59', NULL, NULL, 'Desktop', NULL),
(119, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:22:00', NULL, NULL, 'Desktop', NULL),
(120, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:22:03', NULL, NULL, 'Mobile', NULL),
(121, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/', 'GET', '2026-02-03 13:24:32', NULL, NULL, 'Mobile', NULL),
(122, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:24:33', NULL, NULL, 'Mobile', NULL),
(123, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:14', NULL, NULL, 'Desktop', NULL),
(124, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:15', NULL, NULL, 'Desktop', NULL),
(125, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:15', NULL, NULL, 'Desktop', NULL),
(126, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:15', NULL, NULL, 'Desktop', NULL),
(127, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:15', NULL, NULL, 'Desktop', NULL),
(128, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:16', NULL, NULL, 'Desktop', NULL),
(129, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:16', NULL, NULL, 'Desktop', NULL),
(130, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:16', NULL, NULL, 'Desktop', NULL),
(131, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:28:16', NULL, NULL, 'Desktop', NULL),
(132, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:28:21', NULL, NULL, 'Mobile', NULL),
(133, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:28:25', NULL, NULL, 'Mobile', NULL),
(134, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:29:25', NULL, NULL, 'Desktop', NULL),
(135, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:29:30', NULL, NULL, 'Desktop', NULL),
(136, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:29:31', NULL, NULL, 'Desktop', NULL),
(137, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:29:33', NULL, NULL, 'Mobile', NULL),
(138, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:30:34', NULL, NULL, 'Desktop', NULL),
(139, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:30:36', NULL, NULL, 'Desktop', NULL),
(140, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:30:40', NULL, NULL, 'Mobile', NULL),
(141, '2a03:2880:7ff:40::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 13:33:16', NULL, NULL, 'Desktop', NULL),
(142, '2a03:2880:25ff:59::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 13:33:16', NULL, NULL, 'Desktop', NULL),
(143, '2a03:2880:31ff:4f::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 13:33:17', NULL, NULL, 'Desktop', NULL),
(144, '2a03:2880:16ff:71::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 13:33:19', NULL, NULL, 'Desktop', NULL),
(145, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:35:18', NULL, NULL, 'Desktop', NULL),
(146, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:35:19', NULL, NULL, 'Desktop', NULL),
(147, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:35:20', NULL, NULL, 'Desktop', NULL),
(148, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:35:20', NULL, NULL, 'Desktop', NULL),
(149, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:35:25', NULL, NULL, 'Mobile', NULL),
(150, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/', 'GET', '2026-02-03 13:35:26', NULL, NULL, 'Mobile', NULL),
(151, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:35:27', NULL, NULL, 'Mobile', NULL),
(152, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:36:06', NULL, NULL, 'Desktop', NULL),
(153, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:36:09', NULL, NULL, 'Desktop', NULL),
(154, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/index.php', 'https://donebolivia.com/auth/login.php', 'GET', '2026-02-03 13:36:14', NULL, NULL, 'Desktop', NULL),
(155, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:07', NULL, NULL, 'Desktop', NULL),
(156, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:10', NULL, NULL, 'Desktop', NULL),
(157, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:10', NULL, NULL, 'Desktop', NULL),
(158, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:10', NULL, NULL, 'Desktop', NULL),
(159, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:10', NULL, NULL, 'Desktop', NULL),
(160, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:10', NULL, NULL, 'Desktop', NULL),
(161, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:11', NULL, NULL, 'Desktop', NULL),
(162, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:11', NULL, NULL, 'Desktop', NULL),
(163, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 13:42:12', NULL, NULL, 'Desktop', NULL),
(164, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?mensaje=logout', 'https://donebolivia.com/', 'GET', '2026-02-03 13:42:15', NULL, NULL, 'Desktop', NULL),
(165, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-03 13:42:25', NULL, NULL, 'Desktop', NULL),
(166, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:42:28', NULL, NULL, 'Mobile', NULL),
(167, '2a03:2880:10ff:71::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 13:43:16', NULL, NULL, 'Desktop', NULL),
(168, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:48:28', NULL, NULL, 'Desktop', NULL),
(169, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:48:29', NULL, NULL, 'Desktop', NULL),
(170, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:48:30', NULL, NULL, 'Desktop', NULL),
(171, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:48:30', NULL, NULL, 'Desktop', NULL),
(172, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:48:43', NULL, NULL, 'Mobile', NULL),
(173, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 13:49:05', NULL, NULL, 'Mobile', NULL),
(174, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/login.php', 'https://www.donebolivia.com/', 'GET', '2026-02-03 13:49:08', NULL, NULL, 'Mobile', NULL),
(175, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/index.php', 'https://www.donebolivia.com/auth/login.php', 'GET', '2026-02-03 13:49:19', NULL, NULL, 'Mobile', NULL),
(176, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:17', NULL, NULL, 'Desktop', NULL),
(177, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:18', NULL, NULL, 'Desktop', NULL),
(178, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:18', NULL, NULL, 'Desktop', NULL),
(179, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:18', NULL, NULL, 'Desktop', NULL),
(180, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:19', NULL, NULL, 'Desktop', NULL),
(181, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:51:31', NULL, NULL, 'Mobile', NULL),
(182, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/auth/register.php', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 13:51:37', NULL, NULL, 'Mobile', NULL),
(183, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:51:57', NULL, NULL, 'Mobile', NULL),
(184, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=1', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:52:05', NULL, NULL, 'Mobile', NULL),
(185, '66.249.85.45', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/products/category.php?id=1', '', 'GET', '2026-02-03 13:52:08', NULL, NULL, 'Mobile', NULL),
(186, '66.249.88.68', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/products/category.php?id=1', '', 'GET', '2026-02-03 13:52:09', NULL, NULL, 'Mobile', NULL),
(187, '74.125.210.194', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/products/category.php?id=1', '', 'GET', '2026-02-03 13:52:09', NULL, NULL, 'Mobile', NULL),
(188, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://donebolivia.com/products/category.php?id=1', 'GET', '2026-02-03 13:52:11', NULL, NULL, 'Mobile', NULL),
(189, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/', 'GET', '2026-02-03 13:52:13', NULL, NULL, 'Mobile', NULL),
(190, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 13:52:41', NULL, NULL, 'Mobile', NULL),
(191, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/view_product.php?id=66', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 13:53:55', NULL, NULL, 'Mobile', NULL);
INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referer`, `method`, `timestamp`, `country_code`, `city`, `device_type`, `usuario_id`) VALUES
(192, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/view_product.php?id=66', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 13:53:56', NULL, NULL, 'Mobile', NULL),
(193, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://donebolivia.com/products/category.php?id=1', 'GET', '2026-02-03 13:54:20', NULL, NULL, 'Mobile', NULL),
(194, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=1', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:54:25', NULL, NULL, 'Mobile', NULL),
(195, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/register.php', 'https://donebolivia.com/products/category.php?id=1', 'GET', '2026-02-03 13:54:30', NULL, NULL, 'Mobile', NULL),
(196, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/pages/terms.php', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 13:54:42', NULL, NULL, 'Mobile', NULL),
(197, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:59:28', NULL, NULL, 'Desktop', NULL),
(198, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 13:59:31', NULL, NULL, 'Desktop', NULL),
(199, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 13:59:39', NULL, NULL, 'Mobile', NULL),
(200, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:00:44', NULL, NULL, 'Mobile', NULL),
(201, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:00:48', NULL, NULL, 'Mobile', NULL),
(202, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/', 'GET', '2026-02-03 14:00:54', NULL, NULL, 'Mobile', NULL),
(203, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:03:46', NULL, NULL, 'Desktop', NULL),
(204, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:03:47', NULL, NULL, 'Desktop', NULL),
(205, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:03:48', NULL, NULL, 'Desktop', NULL),
(206, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:03:48', NULL, NULL, 'Desktop', NULL),
(207, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:03:57', NULL, NULL, 'Mobile', NULL),
(208, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 14:04:15', NULL, NULL, 'Mobile', NULL),
(209, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/login.php?mensaje=logout', 'https://www.donebolivia.com/', 'GET', '2026-02-03 14:04:24', NULL, NULL, 'Mobile', NULL),
(210, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 14:04:31', NULL, NULL, 'Mobile', NULL),
(211, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:07:16', NULL, NULL, 'Desktop', NULL),
(212, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:07:17', NULL, NULL, 'Desktop', NULL),
(213, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:07:17', NULL, NULL, 'Desktop', NULL),
(214, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:07:17', NULL, NULL, 'Desktop', NULL),
(215, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:07:23', NULL, NULL, 'Mobile', NULL),
(216, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 14:07:28', NULL, NULL, 'Mobile', NULL),
(217, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:09:42', NULL, NULL, 'Desktop', NULL),
(218, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:09:43', NULL, NULL, 'Desktop', NULL),
(219, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:09:43', NULL, NULL, 'Desktop', NULL),
(220, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:09:43', NULL, NULL, 'Desktop', NULL),
(221, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:09:48', NULL, NULL, 'Mobile', NULL),
(222, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:13', NULL, NULL, 'Desktop', NULL),
(223, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:14', NULL, NULL, 'Desktop', NULL),
(224, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:14', NULL, NULL, 'Desktop', NULL),
(225, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:12:19', NULL, NULL, 'Mobile', NULL),
(226, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:25', NULL, NULL, 'Desktop', NULL),
(227, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:26', NULL, NULL, 'Desktop', NULL),
(228, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:12:46', NULL, NULL, 'Desktop', NULL),
(229, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:12:49', NULL, NULL, 'Mobile', NULL),
(230, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:14:59', NULL, NULL, 'Desktop', NULL),
(231, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:14:59', NULL, NULL, 'Desktop', NULL),
(232, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:00', NULL, NULL, 'Desktop', NULL),
(233, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:00', NULL, NULL, 'Desktop', NULL),
(234, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:00', NULL, NULL, 'Desktop', NULL),
(235, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:00', NULL, NULL, 'Desktop', NULL),
(236, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:00', NULL, NULL, 'Desktop', NULL),
(237, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/?i=2', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:15:05', NULL, NULL, 'Mobile', NULL),
(238, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/auth/login.php?redirect=/products/add_product.php', 'https://donebolivia.com/?i=2', 'GET', '2026-02-03 14:15:13', NULL, NULL, 'Mobile', NULL),
(239, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 14:15:19', NULL, NULL, 'Desktop', NULL),
(240, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?redirect=/products/add_product.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:15:24', NULL, NULL, 'Desktop', NULL),
(241, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/login.php?redirect=/products/add_product.php', 'GET', '2026-02-03 14:15:30', NULL, NULL, 'Desktop', NULL),
(242, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/auth/login.php?i=1', 'https://donebolivia.com/auth/login.php', 'GET', '2026-02-03 14:15:40', NULL, NULL, 'Mobile', NULL),
(243, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1', '/index.php', 'https://donebolivia.com/auth/login.php?i=1', 'GET', '2026-02-03 14:15:46', NULL, NULL, 'Mobile', NULL),
(244, '2800:cd0:4817:7700:f63a:3782:4d59:7c2f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-03 14:16:17', NULL, NULL, 'Mobile', NULL),
(245, '186.121.249.82', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=1', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 14:18:36', NULL, NULL, 'Mobile', NULL),
(246, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/', 'GET', '2026-02-03 14:20:29', NULL, NULL, 'Desktop', NULL),
(247, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 14:20:31', NULL, NULL, 'Desktop', NULL),
(248, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/', 'GET', '2026-02-03 14:20:31', NULL, NULL, 'Desktop', NULL),
(249, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?mensaje=logout', 'https://donebolivia.com/', 'GET', '2026-02-03 14:20:46', NULL, NULL, 'Desktop', NULL),
(250, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-03 14:20:47', NULL, NULL, 'Desktop', NULL),
(251, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 14:20:49', NULL, NULL, 'Desktop', NULL),
(252, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 14:21:05', NULL, NULL, 'Desktop', NULL),
(253, '181.188.179.42', 'Mozilla/5.0 (Linux; Android 11; SM-A115M Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7UzSFQ15s3vMhqWOYHVDo1B9nufkx4j2ngWhxcagVACHnulZTkgrSKL56UuQ_aem_4hfqMHJaIz7LiZrRlfhdQA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7UzSFQ15s3vMhqWOYHVDo1B9nufkx4j2ngWhxcagVACHnulZTkgrSKL56UuQ_aem_4hfqMHJaIz7LiZrRlfhdQA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 14:52:14', NULL, NULL, 'Mobile', NULL),
(254, '2a03:2880:10ff:56::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 14:52:53', NULL, NULL, 'Desktop', NULL),
(255, '181.188.179.42', 'Mozilla/5.0 (Linux; Android 11; SM-A115M Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7UzSFQ15s3vMhqWOYHVDo1B9nufkx4j2ngWhxcagVACHnulZTkgrSKL56UuQ_aem_4hfqMHJaIz7LiZrRlfhdQA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'http://m.facebook.com/', 'GET', '2026-02-03 14:52:54', NULL, NULL, 'Mobile', NULL),
(256, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 15:04:14', NULL, NULL, 'Mobile', NULL),
(257, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.google.com/', 'GET', '2026-02-03 15:05:39', NULL, NULL, 'Mobile', NULL),
(258, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/login.php', 'https://www.donebolivia.com/', 'GET', '2026-02-03 15:05:50', NULL, NULL, 'Mobile', NULL),
(259, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/auth/login.php', 'GET', '2026-02-03 15:05:52', NULL, NULL, 'Mobile', NULL),
(260, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=5', 'https://www.donebolivia.com/', 'GET', '2026-02-03 15:05:54', NULL, NULL, 'Mobile', NULL),
(261, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/view_product.php?id=67', 'https://www.donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 15:06:07', NULL, NULL, 'Mobile', NULL),
(262, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/products/category.php?id=3', 'https://www.donebolivia.com/', 'GET', '2026-02-03 15:06:26', NULL, NULL, 'Mobile', NULL),
(263, '2800:cd0:316a:3ce6:1:0:4b5c:9aa3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/login.php', 'https://www.donebolivia.com/auth/login.php', 'GET', '2026-02-03 15:06:44', NULL, NULL, 'Mobile', NULL),
(264, '161.56.41.3', 'Mozilla/5.0 (Linux; Android 15; SM-A165M Build/AP3A.240905.015.A2; ) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 MetaIAB Facebook', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4HtBR03c1pFWeSrePyIk9X_zd1vcx0i6uinCxWH4zgvwHaeFbHwGQGbEBEKw_aem_MFRpfxXWNroLUewkpna46g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4HtBR03c1pFWeSrePyIk9X_zd1vcx0i6uinCxWH4zgvwHaeFbHwGQGbEBEKw_aem_MFRpfxXWNroLUewkpna46g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 15:47:49', NULL, NULL, 'Mobile', NULL),
(265, '2a03:2880:15ff:70::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 15:47:50', NULL, NULL, 'Desktop', NULL),
(266, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-03 15:52:44', NULL, NULL, 'Desktop', NULL),
(267, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-03 15:52:56', NULL, NULL, 'Desktop', NULL),
(268, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/index.php?mensaje=registro_exitoso', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 15:55:09', NULL, NULL, 'Desktop', NULL),
(269, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/mi/business.php', 'https://donebolivia.com/index.php', 'GET', '2026-02-03 15:55:23', NULL, NULL, 'Desktop', 34),
(270, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/mi/business.php', 'GET', '2026-02-03 16:08:09', NULL, NULL, 'Desktop', NULL),
(271, '181.115.210.209', 'Mozilla/5.0 (Linux; Android 9; SM-J730G Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/138.0.7204.179 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5ubKzfgOfE5FjNLlciaA_4ZMg2UKdMJ7VXJ1XqsgPaaG-jueLJxw0oLOSJgg_aem_vXd0brTdHO-VFqz-hL05sw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5ubKzfgOfE5FjNLlciaA_4ZMg2UKdMJ7VXJ1XqsgPaaG-jueLJxw0oLOSJgg_aem_vXd0brTdHO-VFqz-hL05sw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 16:44:15', NULL, NULL, 'Mobile', NULL),
(272, '189.28.90.70', 'Mozilla/5.0 (Linux; Android 12; SM-A015M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6AnvDfbxXM5Rvnt-3dS7AxmVTpPUqAk1Xus21CSLvWNi-DyZ0o21GajQCMcA_aem_BlLPaoLVHtbUGN7Jud4THg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6AnvDfbxXM5Rvnt-3dS7AxmVTpPUqAk1Xus21CSLvWNi-DyZ0o21GajQCMcA_aem_BlLPaoLVHtbUGN7Jud4THg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 16:46:35', NULL, NULL, 'Mobile', NULL),
(273, '189.28.90.70', 'Mozilla/5.0 (Linux; Android 12; SM-A015M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6AnvDfbxXM5Rvnt-3dS7AxmVTpPUqAk1Xus21CSLvWNi-DyZ0o21GajQCMcA_aem_BlLPaoLVHtbUGN7Jud4THg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 16:46:52', NULL, NULL, 'Mobile', NULL),
(274, '2a03:2880:10ff:73::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 16:47:22', NULL, NULL, 'Desktop', NULL),
(275, '2800:320:c120:2f00:7357:a2a3:d011:9a4e', 'Mozilla/5.0 (Linux; Android 14; Infinix X6731B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7gq9GAoeETXSxzbHMYaIbTP8zp2C-g6h2gzkurwX9p80-3q2E5RaK9-eVtCA_aem_7QDg8hf4vpTLR9cu0PfmAA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7gq9GAoeETXSxzbHMYaIbTP8zp2C-g6h2gzkurwX9p80-3q2E5RaK9-eVtCA_aem_7QDg8hf4vpTLR9cu0PfmAA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 16:51:33', NULL, NULL, 'Mobile', NULL),
(276, '158.172.227.37', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR59EjgP4RrgwjYwoOYDxuAyfE4aKbFOibIl-BW0l8soMSoukgPcffUkZEvv6A_aem_xnmmHGofCvwJB2mWII5yCA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR59EjgP4RrgwjYwoOYDxuAyfE4aKbFOibIl-BW0l8soMSoukgPcffUkZEvv6A_aem_xnmmHGofCvwJB2mWII5yCA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:00:51', NULL, NULL, 'Mobile', NULL),
(277, '158.172.227.37', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=9', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR59EjgP4RrgwjYwoOYDxuAyfE4aKbFOibIl-BW0l8soMSoukgPcffUkZEvv6A_aem_xnmmHGofCvwJB2mWII5yCA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 17:01:00', NULL, NULL, 'Mobile', NULL),
(278, '158.172.227.37', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=9', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR59EjgP4RrgwjYwoOYDxuAyfE4aKbFOibIl-BW0l8soMSoukgPcffUkZEvv6A_aem_xnmmHGofCvwJB2mWII5yCA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 17:01:00', NULL, NULL, 'Mobile', NULL),
(279, '158.172.227.37', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=3', 'https://www.donebolivia.com/products/category.php?id=9', 'GET', '2026-02-03 17:01:05', NULL, NULL, 'Mobile', NULL),
(280, '2a03:2880:10ff:53::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 17:01:11', NULL, NULL, 'Desktop', NULL),
(281, '181.115.172.156', 'Mozilla/5.0 (Linux; Android 14; SM-A145M Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7Hz89dX3rgSbwt6odWAc8crdu7D-d_DjdEGyWhlA2xoZxFLtXPGrEH27uGQg_aem_XtmxMv1vij_YS1-kSMLQuQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7Hz89dX3rgSbwt6odWAc8crdu7D-d_DjdEGyWhlA2xoZxFLtXPGrEH27uGQg_aem_XtmxMv1vij_YS1-kSMLQuQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:24:00', NULL, NULL, 'Mobile', NULL),
(282, '2a03:2880:24ff:5f::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 17:24:02', NULL, NULL, 'Desktop', NULL),
(283, '2800:320:c8ae:4600:3834:8270:b13b:1371', 'Mozilla/5.0 (Linux; Android 10; SM-G9650 Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7WafVSi65BUgCm9Ox01N8NKooT8eIxRtymjYUmOdB4x8pfudhuHN5jxnEXVA_aem_EsCwhNBJCBMR9Fdy7tokww&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7WafVSi65BUgCm9Ox01N8NKooT8eIxRtymjYUmOdB4x8pfudhuHN5jxnEXVA_aem_EsCwhNBJCBMR9Fdy7tokww&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:30:45', NULL, NULL, 'Mobile', NULL),
(284, '2800:cd0:8701:500:33be:825e:c578:c1ff', 'Mozilla/5.0 (Linux; Android 15; RMX3709 Build/AP3A.240617.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:40:09', NULL, NULL, 'Mobile', NULL),
(285, '2800:cd0:8701:500:33be:825e:c578:c1ff', 'Mozilla/5.0 (Linux; Android 15; RMX3709 Build/AP3A.240617.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 17:40:12', NULL, NULL, 'Mobile', NULL),
(286, '2800:cd0:8701:500:33be:825e:c578:c1ff', 'Mozilla/5.0 (Linux; Android 15; RMX3709 Build/AP3A.240617.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/view_product.php?id=62', 'https://www.donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 17:40:20', NULL, NULL, 'Mobile', NULL),
(287, '2800:cd0:8701:500:33be:825e:c578:c1ff', 'Mozilla/5.0 (Linux; Android 15; RMX3709 Build/AP3A.240617.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 17:40:21', NULL, NULL, 'Mobile', NULL),
(288, '2800:cd0:8701:500:33be:825e:c578:c1ff', 'Mozilla/5.0 (Linux; Android 15; RMX3709 Build/AP3A.240617.008; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5MlY1p2DkRCV-Ek5iDlyTvELD-msAPqyzhCAOSeqy-fxaDeFvNFz1gLb0Ciw_aem_YAkykIIAhTcAkiwQXN78gg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:40:25', NULL, NULL, 'Mobile', NULL),
(289, '181.115.171.8', 'Mozilla/5.0 (Linux; Android 10; Redmi 7A Build/QKQ1.191014.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5N3T5EoaY7DUgK9wUjyRNdh-l3n7EbjKj3zVMEnVhdz7brhZRhjrlmvYLdtQ_aem_gGJqwwCRIqBu7ir8sMAr2g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5N3T5EoaY7DUgK9wUjyRNdh-l3n7EbjKj3zVMEnVhdz7brhZRhjrlmvYLdtQ_aem_gGJqwwCRIqBu7ir8sMAr2g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 17:59:21', NULL, NULL, 'Mobile', NULL),
(290, '2a03:2880:18ff:4f::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 17:59:25', NULL, NULL, 'Desktop', NULL),
(291, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 18:05:46', NULL, NULL, 'Mobile', NULL),
(292, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:05:58', NULL, NULL, 'Mobile', NULL),
(293, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:05:58', NULL, NULL, 'Mobile', NULL),
(294, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:05:59', NULL, NULL, 'Mobile', NULL),
(295, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5&q=&categoria_change=5&departamento=LPZ&orden=reciente', 'https://www.donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 18:06:06', NULL, NULL, 'Mobile', NULL),
(296, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5&q=&categoria_change=5&departamento=SCZ&orden=reciente', 'https://www.donebolivia.com/products/category.php?id=5&q=&categoria_change=5&departamento=LPZ&orden=reciente', 'GET', '2026-02-03 18:06:30', NULL, NULL, 'Mobile', NULL),
(297, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/view_product.php?id=70', 'https://www.donebolivia.com/products/category.php?id=5&q=&categoria_change=5&departamento=SCZ&orden=reciente', 'GET', '2026-02-03 18:07:10', NULL, NULL, 'Mobile', NULL),
(298, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/view_product.php?id=70', 'https://www.donebolivia.com/products/category.php?id=5&q=&categoria_change=5&departamento=SCZ&orden=reciente', 'GET', '2026-02-03 18:09:42', NULL, NULL, 'Mobile', NULL),
(299, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5&q=&categoria_change=5&departamento=SCZ&orden=reciente', 'https://www.donebolivia.com/products/category.php?id=5&q=&categoria_change=5&departamento=LPZ&orden=reciente', 'GET', '2026-02-03 18:09:46', NULL, NULL, 'Mobile', NULL),
(300, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5&q=&categoria_change=5&departamento=LPZ&orden=reciente', 'https://www.donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 18:09:46', NULL, NULL, 'Mobile', NULL),
(301, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=5', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:09:46', NULL, NULL, 'Mobile', NULL),
(302, '177.222.99.82', 'Mozilla/5.0 (Linux; Android 12; SM-A135M Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR48iTqKA4je7-BkRzUHAXRuuWP4ZdqCzJ6WfNebYFl_rIApytXWHyI5gryfPw_aem_thk6wMUtAwnfseV_lQOkeA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 18:09:47', NULL, NULL, 'Mobile', NULL),
(303, '2a03:2880:27ff:70::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 18:10:03', NULL, NULL, 'Desktop', NULL),
(304, '2a03:2880:27ff:72::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 18:11:03', NULL, NULL, 'Desktop', NULL),
(305, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-03 18:23:18', NULL, NULL, 'Desktop', NULL),
(306, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-03 18:23:26', NULL, NULL, 'Desktop', NULL),
(307, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/auth/login.php?redirect=/products/add_product.php', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 18:23:43', NULL, NULL, 'Desktop', NULL),
(308, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?redirect=/products/add_product.php', 'GET', '2026-02-03 18:23:48', NULL, NULL, 'Desktop', NULL),
(309, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-03 18:23:51', NULL, NULL, 'Desktop', NULL),
(310, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/products/category.php?id=5', 'https://donebolivia.com/', 'GET', '2026-02-03 18:23:56', NULL, NULL, 'Desktop', NULL),
(311, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/products/view_product.php?id=65', 'https://donebolivia.com/products/category.php?id=5', 'GET', '2026-02-03 18:24:06', NULL, NULL, 'Desktop', NULL),
(312, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/products/view_product.php?id=65', 'GET', '2026-02-03 18:24:52', NULL, NULL, 'Desktop', NULL),
(313, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/products/category.php?id=3', 'https://donebolivia.com/', 'GET', '2026-02-03 18:24:56', NULL, NULL, 'Desktop', NULL),
(314, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/products/category.php?id=8', 'https://donebolivia.com/', 'GET', '2026-02-03 18:25:00', NULL, NULL, 'Desktop', NULL),
(315, '186.121.249.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/products/category.php?id=9', 'https://donebolivia.com/', 'GET', '2026-02-03 18:25:04', NULL, NULL, 'Desktop', NULL),
(316, '190.129.102.23', 'Mozilla/5.0 (Linux; Android 15; 2303ERA42L Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4GxbLgvRd_20OXaUckhy60HHekmqYpfG0Oyu33JIYQhSPd6bPGRO4SLnUzJQ_aem_qx24lBkwmv6GFZiO35jgzw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4GxbLgvRd_20OXaUckhy60HHekmqYpfG0Oyu33JIYQhSPd6bPGRO4SLnUzJQ_aem_qx24lBkwmv6GFZiO35jgzw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 18:27:47', NULL, NULL, 'Mobile', NULL),
(317, '190.129.102.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:27:52', NULL, NULL, 'Mobile', NULL);
INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referer`, `method`, `timestamp`, `country_code`, `city`, `device_type`, `usuario_id`) VALUES
(318, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 18:28:01', NULL, NULL, 'Mobile', NULL),
(319, '190.129.102.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', 'https://www.donebolivia.com/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'GET', '2026-02-03 18:28:04', NULL, NULL, 'Mobile', NULL),
(320, '2a03:2880:10ff:53::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 18:28:13', NULL, NULL, 'Desktop', NULL),
(321, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=3', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:30:56', NULL, NULL, 'Mobile', NULL),
(322, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 18:31:01', NULL, NULL, 'Mobile', NULL),
(323, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=8', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:31:32', NULL, NULL, 'Mobile', NULL),
(324, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/products/category.php?id=8', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 18:31:33', NULL, NULL, 'Mobile', NULL),
(325, '189.28.95.22', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6m02EdQr9M9tis0GLNjMZh728UVxgmQdNBqFCrw9ErQapomkSq6klOFdRkcw_aem_DXQbQ1m3CSMoe_QlYAfWbg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6m02EdQr9M9tis0GLNjMZh728UVxgmQdNBqFCrw9ErQapomkSq6klOFdRkcw_aem_DXQbQ1m3CSMoe_QlYAfWbg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 19:11:33', NULL, NULL, 'Mobile', NULL),
(326, '2a03:2880:24ff:70::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 19:11:34', NULL, NULL, 'Desktop', NULL),
(327, '2800:cd0:4817:7700:ca6b:6a1f:1ec4:5d44', 'Mozilla/5.0 (Linux; Android 15; TECNO LJ7 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6QFMldJows7oSR2_uKEmv-EuJm_jEIXJoR0dIDM5yV1V9OjC5oae6u1dhWRg_aem_Ul_g5ynTRdp8QzT9WFKZww&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6QFMldJows7oSR2_uKEmv-EuJm_jEIXJoR0dIDM5yV1V9OjC5oae6u1dhWRg_aem_Ul_g5ynTRdp8QzT9WFKZww&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 19:28:12', NULL, NULL, 'Mobile', NULL),
(328, '2800:cd0:4817:7700:ca6b:6a1f:1ec4:5d44', 'Mozilla/5.0 (Linux; Android 15; TECNO LJ7 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6QFMldJows7oSR2_uKEmv-EuJm_jEIXJoR0dIDM5yV1V9OjC5oae6u1dhWRg_aem_Ul_g5ynTRdp8QzT9WFKZww&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'http://m.facebook.com/', 'GET', '2026-02-03 19:28:15', NULL, NULL, 'Mobile', NULL),
(329, '2a03:2880:3ff:50::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 19:28:20', NULL, NULL, 'Desktop', NULL),
(330, '177.222.113.90', 'Mozilla/5.0 (Linux; Android 15; LGN-LX3 Build/HONORLGN-L33; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4isTFjbbfUianbx7SuRWjzs9cob9m5yJItJgwCDs1_ep-44zOdkTjwZfy_hw_aem_6c_yaAVqiQMWHyeLRe84IA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4isTFjbbfUianbx7SuRWjzs9cob9m5yJItJgwCDs1_ep-44zOdkTjwZfy_hw_aem_6c_yaAVqiQMWHyeLRe84IA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 19:31:05', NULL, NULL, 'Mobile', NULL),
(331, '189.28.70.194', 'Mozilla/5.0 (Linux; Android 13; TECNO BG6 Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7OKr8Yelyom7hOTM65GHvv8QWXusaVQngDLZy6R5U9uysvaEVLWoP43GsZDA_aem_uHVtmiXRYoHRXLpZgUD1kQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7OKr8Yelyom7hOTM65GHvv8QWXusaVQngDLZy6R5U9uysvaEVLWoP43GsZDA_aem_uHVtmiXRYoHRXLpZgUD1kQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 20:05:56', NULL, NULL, 'Mobile', NULL),
(332, '189.28.70.194', 'Mozilla/5.0 (Linux; Android 13; TECNO BG6 Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7OKr8Yelyom7hOTM65GHvv8QWXusaVQngDLZy6R5U9uysvaEVLWoP43GsZDA_aem_uHVtmiXRYoHRXLpZgUD1kQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7OKr8Yelyom7hOTM65GHvv8QWXusaVQngDLZy6R5U9uysvaEVLWoP43GsZDA_aem_uHVtmiXRYoHRXLpZgUD1kQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 20:05:59', NULL, NULL, 'Mobile', NULL),
(333, '2a03:2880:21ff:b::', 'meta-externalads/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-03 20:26:11', NULL, NULL, 'Desktop', NULL),
(334, '2a03:2880:24ff:45::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 20:53:40', NULL, NULL, 'Desktop', NULL),
(335, '2800:cd0:c326:0:62f2:b17e:423c:e693', 'Mozilla/5.0 (Linux; Android 16; SM-A065M Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR74zfI_m2KlsI5Aorndp700SFC-YzwZ1nKRh3Vc7NulA95RPozPnPk8HDpJMQ_aem_A9gSeTXqT5yLB5PJuNlc5Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR74zfI_m2KlsI5Aorndp700SFC-YzwZ1nKRh3Vc7NulA95RPozPnPk8HDpJMQ_aem_A9gSeTXqT5yLB5PJuNlc5Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 20:59:01', NULL, NULL, 'Mobile', NULL),
(336, '200.87.153.38', 'Mozilla/5.0 (Linux; Android 15; 2312DRA50G Build/AQ3A.240912.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5XCh2ua-lptJvkyycrbwHf_hp31_yRiMiLYDlsS_64wWfxaoKUHDELG0L_YQ_aem_Le4T0vLB5MDyykFTvF3MYw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5XCh2ua-lptJvkyycrbwHf_hp31_yRiMiLYDlsS_64wWfxaoKUHDELG0L_YQ_aem_Le4T0vLB5MDyykFTvF3MYw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 21:01:09', NULL, NULL, 'Mobile', NULL),
(337, '2800:320:c361:8300:9122:f478:6faf:47d0', 'Mozilla/5.0 (Linux; Android 13; SM-A037M Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR44aVNLDfiEke9PnC_R10z30EKZALcYRrH4O4j5DYNBJJ-yX4zGtcemN-xYYA_aem_CR5f0ajYRKyvyWEQJ7wW9A&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR44aVNLDfiEke9PnC_R10z30EKZALcYRrH4O4j5DYNBJJ-yX4zGtcemN-xYYA_aem_CR5f0ajYRKyvyWEQJ7wW9A&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 21:12:49', NULL, NULL, 'Mobile', NULL),
(338, '181.115.171.66', 'Mozilla/5.0 (Linux; Android 14; TECNO KL5 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51QMPTk4zUCvU54XSGRxtmk2U99Cl2L0wbQZEMqlkP3p83Ofzb5S5MuggKlQ_aem_CYrStsjDVgZ5G40WkaNUSw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51QMPTk4zUCvU54XSGRxtmk2U99Cl2L0wbQZEMqlkP3p83Ofzb5S5MuggKlQ_aem_CYrStsjDVgZ5G40WkaNUSw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 21:31:03', NULL, NULL, 'Mobile', NULL),
(339, '2800:cd0:2df3:d000:a2eb:c663:fbdc:dacb', 'Mozilla/5.0 (Linux; Android 15; ELA-LX3 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5Tn7AP2Tqa4Ogkvre51JS7ASJMIodej8C-0gUwM1G10Av0a93uxiTTJlF3lw_aem_Whem7OVKui7n9hLdI2So0A&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5Tn7AP2Tqa4Ogkvre51JS7ASJMIodej8C-0gUwM1G10Av0a93uxiTTJlF3lw_aem_Whem7OVKui7n9hLdI2So0A&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 21:34:56', NULL, NULL, 'Mobile', NULL),
(340, '2a03:2880:15ff:74::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-03 21:35:04', NULL, NULL, 'Desktop', NULL),
(341, '2a03:2880:2ff:41::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 21:35:16', NULL, NULL, 'Desktop', NULL),
(342, '2800:cd0:8ec3:cf00:180b:515e:b058:d04b', 'Mozilla/5.0 (Linux; Android 11; RMX3231 Build/RP1A.201005.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6EOCKNwTga-xdsB3EQ-QCRdQvsd6PdzRoV_ul9O9yfQuJY1bJUmTwGhDWXSw_aem_xmsNGuUCO9-qG-uQi9_w6g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6EOCKNwTga-xdsB3EQ-QCRdQvsd6PdzRoV_ul9O9yfQuJY1bJUmTwGhDWXSw_aem_xmsNGuUCO9-qG-uQi9_w6g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-03 22:30:19', NULL, NULL, 'Mobile', NULL),
(343, '2800:cd0:8c13:5b00:7881:467f:d035:4756', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Build/RKQ1.201004.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4NCFRgy0_TZek3eA0aHAVhy_x8cE4i82OiTRBmg1jBUySElFWTxCDfEmSA4w_aem_CQwUNY0HAvC-3-QUj072gA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-03 22:33:03', NULL, NULL, 'Mobile', NULL),
(344, '2a03:2880:25ff:8::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-03 23:01:48', NULL, NULL, 'Desktop', NULL),
(345, '181.114.81.170', 'Mozilla/5.0 (Linux; Android 15; 23053RN02L Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6caUApjHPGBr8m-Mp5TsbZatIR9it4T446W6FZxFFGLw4FK9Qujm-gvhFO_g_aem_gId74X4oFn42yp_M-jPqtw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6caUApjHPGBr8m-Mp5TsbZatIR9it4T446W6FZxFFGLw4FK9Qujm-gvhFO_g_aem_gId74X4oFn42yp_M-jPqtw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 00:29:46', NULL, NULL, 'Mobile', NULL),
(346, '2800:320:c352:6500:887d:1337:d12d:5705', 'Mozilla/5.0 (Linux; Android 13; 2312FPCA6G Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.109 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/544.0.0.42.272;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7Pp8FnpzB5gtHfgOrVg1lLkw5WC6zF6airLwlozx5RDdNowZfqoe3CBONj1g_aem_9GrHsbld6WVJjntmOUtr5g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR7Pp8FnpzB5gtHfgOrVg1lLkw5WC6zF6airLwlozx5RDdNowZfqoe3CBONj1g_aem_9GrHsbld6WVJjntmOUtr5g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 01:54:08', NULL, NULL, 'Mobile', NULL),
(347, '190.129.17.90', 'Mozilla/5.0 (Linux; Android 15; SM-A346B Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5U9zioRbd8GI5CrETJp3PLDGgItfcGclQpQC0NQU8LgPDYW_jHV5x-Z8TI2Q_aem_GlHJD-PMcMP0z2r7nXZ76Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5U9zioRbd8GI5CrETJp3PLDGgItfcGclQpQC0NQU8LgPDYW_jHV5x-Z8TI2Q_aem_GlHJD-PMcMP0z2r7nXZ76Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 02:05:05', NULL, NULL, 'Mobile', NULL),
(348, '181.115.215.107', 'Mozilla/5.0 (Linux; Android 14; 24117RN76L Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.59 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4lpIRZF_Ra6SW9razAc5phihrrGveIF6WpmrsOykNAWixtgJ2sLtRacEp4_w_aem_aLIcA-UcyoGV40FfmTmuJQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4lpIRZF_Ra6SW9razAc5phihrrGveIF6WpmrsOykNAWixtgJ2sLtRacEp4_w_aem_aLIcA-UcyoGV40FfmTmuJQ&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 02:31:58', NULL, NULL, 'Mobile', NULL),
(349, '2a03:2880:15ff:70::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 02:32:00', NULL, NULL, 'Desktop', NULL),
(350, '34.74.238.163', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 02:48:22', NULL, NULL, 'Desktop', NULL),
(351, '189.28.64.153', 'Mozilla/5.0 (Linux; Android 10; TECNO KE5k Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR66239bVFB4FB7aPtIFX0eONNRi3kDMa_WiBRZWeVB-4LQowZrPr6hqk1rzJg_aem_PUbqL_kpwf4-ZTyyNKjPWA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR66239bVFB4FB7aPtIFX0eONNRi3kDMa_WiBRZWeVB-4LQowZrPr6hqk1rzJg_aem_PUbqL_kpwf4-ZTyyNKjPWA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 02:49:30', NULL, NULL, 'Mobile', NULL),
(352, '2a03:2880:15ff:4f::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 02:49:31', NULL, NULL, 'Desktop', NULL),
(353, '2a03:2880:7ff:1a::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-04 03:33:56', NULL, NULL, 'Desktop', NULL),
(354, '190.186.124.108', 'Mozilla/5.0 (Linux; Android 11; SM-A505G Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6bkW_D6UVjCS4JglrGLyhCIjMTjHuBi06KgVducrJGP_24_EBuYWOrI57YQQ_aem_Se6PJ2HvthrZA0f2zckj1Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6bkW_D6UVjCS4JglrGLyhCIjMTjHuBi06KgVducrJGP_24_EBuYWOrI57YQQ_aem_Se6PJ2HvthrZA0f2zckj1Q&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 04:25:31', NULL, NULL, 'Mobile', NULL),
(355, '2a03:2880:15ff:47::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 04:25:33', NULL, NULL, 'Desktop', NULL),
(356, '2800:cd0:db24:5100:94fd:2ccd:7acf:6254', 'Mozilla/5.0 (Linux; Android 11; Redmi Note 8 Pro Build/RP1A.200720.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5gkV7f8ioKah0O-gOCs7ObJ3fRDaIFRnuyF8lNwHq-hHALEPtLLkdgQmAzjg_aem_Ne2ZZ9cXpaFnw6Sc_tvYAA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5gkV7f8ioKah0O-gOCs7ObJ3fRDaIFRnuyF8lNwHq-hHALEPtLLkdgQmAzjg_aem_Ne2ZZ9cXpaFnw6Sc_tvYAA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 04:27:42', NULL, NULL, 'Mobile', NULL),
(357, '181.115.215.22', 'Mozilla/5.0 (Linux; Android 14; SM-T225 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/142.0.7444.94 Safari/537.36 [FB_IAB/FB4A;FBAV/538.0.0.53.70;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4gV3DJ0ndXYgIQTtfr3v9T1wqIDbN3xWnIeeZFbJUHHezxdY6-xv6zQYapog_aem_3n3KxrygqZCI-mz0qjBhPg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4gV3DJ0ndXYgIQTtfr3v9T1wqIDbN3xWnIeeZFbJUHHezxdY6-xv6zQYapog_aem_3n3KxrygqZCI-mz0qjBhPg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 06:09:27', NULL, NULL, 'Desktop', NULL),
(358, '181.114.181.30', 'Mozilla/5.0 (Linux; Android 11; M2101K6R Build/RKQ1.200826.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/143.0.7499.105 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/542.0.0.46.151;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4p0toTc9r7-qB_GgsFb6qV5OBOd3xXcIjhaWy5Re-R_6NAvSOGErIbh2zT2w_aem_KtOWTfZe79MGvyVy0sCzWw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR4p0toTc9r7-qB_GgsFb6qV5OBOd3xXcIjhaWy5Re-R_6NAvSOGErIbh2zT2w_aem_KtOWTfZe79MGvyVy0sCzWw&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 06:26:08', NULL, NULL, 'Mobile', NULL),
(359, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:26:52', NULL, NULL, 'Desktop', NULL),
(360, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:26:54', NULL, NULL, 'Desktop', NULL),
(361, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:26:54', NULL, NULL, 'Desktop', NULL),
(362, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:26:54', NULL, NULL, 'Desktop', NULL),
(363, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php?mensaje=logout', 'https://donebolivia.com/', 'GET', '2026-02-04 06:26:59', NULL, NULL, 'Desktop', NULL),
(364, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-04 06:27:00', NULL, NULL, 'Desktop', NULL),
(365, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-04 06:27:13', NULL, NULL, 'Desktop', NULL),
(366, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-04 06:27:13', NULL, NULL, 'Desktop', NULL),
(367, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:27:20', NULL, NULL, 'Desktop', NULL),
(368, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:27:23', NULL, NULL, 'Desktop', NULL),
(369, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:28:10', NULL, NULL, 'Desktop', NULL),
(370, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:28:10', NULL, NULL, 'Desktop', NULL),
(371, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/auth/login.php?mensaje=logout', 'GET', '2026-02-04 06:31:40', NULL, NULL, 'Desktop', NULL),
(372, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:31:45', NULL, NULL, 'Desktop', NULL),
(373, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:31:49', NULL, NULL, 'Desktop', NULL),
(374, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:31:52', NULL, NULL, 'Desktop', NULL),
(375, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:32:04', NULL, NULL, 'Desktop', NULL),
(376, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:32:06', NULL, NULL, 'Desktop', NULL),
(377, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:32:14', NULL, NULL, 'Desktop', NULL),
(378, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:32:39', NULL, NULL, 'Desktop', NULL),
(379, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:32:41', NULL, NULL, 'Desktop', NULL),
(380, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:33:22', NULL, NULL, 'Desktop', NULL),
(381, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:33:23', NULL, NULL, 'Desktop', NULL),
(382, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:34:51', NULL, NULL, 'Desktop', NULL),
(383, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:34:54', NULL, NULL, 'Desktop', NULL),
(384, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:34:59', NULL, NULL, 'Desktop', NULL),
(385, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:35:07', NULL, NULL, 'Desktop', NULL),
(386, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:35:10', NULL, NULL, 'Desktop', NULL),
(387, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:37:56', NULL, NULL, 'Desktop', NULL),
(388, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:37:56', NULL, NULL, 'Desktop', NULL),
(389, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:37:57', NULL, NULL, 'Desktop', NULL),
(390, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 06:38:09', NULL, NULL, 'Desktop', NULL),
(391, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 06:38:10', NULL, NULL, 'Desktop', NULL),
(392, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 06:38:10', NULL, NULL, 'Desktop', NULL),
(393, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 06:38:11', NULL, NULL, 'Desktop', NULL),
(394, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:38:12', NULL, NULL, 'Desktop', NULL),
(395, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:40:22', NULL, NULL, 'Desktop', NULL),
(396, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:40:23', NULL, NULL, 'Desktop', NULL),
(397, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:40:24', NULL, NULL, 'Desktop', NULL),
(398, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:40:24', NULL, NULL, 'Desktop', NULL),
(399, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 06:40:24', NULL, NULL, 'Desktop', NULL),
(400, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:40:27', NULL, NULL, 'Desktop', NULL),
(401, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:07', NULL, NULL, 'Desktop', NULL),
(402, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:10', NULL, NULL, 'Desktop', NULL),
(403, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:11', NULL, NULL, 'Desktop', NULL),
(404, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:11', NULL, NULL, 'Desktop', NULL),
(405, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:11', NULL, NULL, 'Desktop', NULL),
(406, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:13', NULL, NULL, 'Desktop', NULL),
(407, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:13', NULL, NULL, 'Desktop', NULL),
(408, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:13', NULL, NULL, 'Desktop', NULL),
(409, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:43:14', NULL, NULL, 'Desktop', NULL),
(410, '2800:cd0:4817:7700:cc59:f0d9:2af5:9bbb', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/?i=1', 'https://www.donebolivia.com/', 'GET', '2026-02-04 06:43:26', NULL, NULL, 'Mobile', NULL),
(411, '2800:cd0:4817:7700:cc59:f0d9:2af5:9bbb', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/auth/register.php', 'https://www.donebolivia.com/?i=1', 'GET', '2026-02-04 06:43:29', NULL, NULL, 'Mobile', NULL),
(412, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:45:11', NULL, NULL, 'Desktop', NULL),
(413, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:49:34', NULL, NULL, 'Desktop', NULL),
(414, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:21', NULL, NULL, 'Desktop', NULL),
(415, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:22', NULL, NULL, 'Desktop', NULL),
(416, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:22', NULL, NULL, 'Desktop', NULL),
(417, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:22', NULL, NULL, 'Desktop', NULL),
(418, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:23', NULL, NULL, 'Desktop', NULL),
(419, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:24', NULL, NULL, 'Desktop', NULL),
(420, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:26', NULL, NULL, 'Desktop', NULL),
(421, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:28', NULL, NULL, 'Desktop', NULL),
(422, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:28', NULL, NULL, 'Desktop', NULL),
(423, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:28', NULL, NULL, 'Desktop', NULL),
(424, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 06:57:29', NULL, NULL, 'Desktop', NULL),
(425, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:31', NULL, NULL, 'Desktop', NULL),
(426, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:44', NULL, NULL, 'Desktop', NULL),
(427, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:46', NULL, NULL, 'Desktop', NULL),
(428, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:46', NULL, NULL, 'Desktop', NULL),
(429, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:46', NULL, NULL, 'Desktop', NULL),
(430, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:46', NULL, NULL, 'Desktop', NULL),
(431, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:47', NULL, NULL, 'Desktop', NULL),
(432, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:47', NULL, NULL, 'Desktop', NULL),
(433, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:47', NULL, NULL, 'Desktop', NULL),
(434, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 06:57:47', NULL, NULL, 'Desktop', NULL),
(435, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:57:49', NULL, NULL, 'Desktop', NULL),
(436, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:58:06', NULL, NULL, 'Desktop', NULL),
(437, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:58:06', NULL, NULL, 'Desktop', NULL);
INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referer`, `method`, `timestamp`, `country_code`, `city`, `device_type`, `usuario_id`) VALUES
(438, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/?i=1', 'GET', '2026-02-04 06:58:07', NULL, NULL, 'Desktop', NULL),
(439, '2a03:2880:18ff:4d::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 07:01:01', NULL, NULL, 'Desktop', NULL),
(440, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/login.php', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 07:01:33', NULL, NULL, 'Desktop', NULL),
(441, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/index.php', 'https://donebolivia.com/auth/login.php', 'GET', '2026-02-04 07:01:39', NULL, NULL, 'Desktop', NULL),
(442, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 07:02:46', NULL, NULL, 'Desktop', NULL),
(443, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 07:04:27', NULL, NULL, 'Desktop', NULL),
(444, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 07:04:31', NULL, NULL, 'Desktop', NULL),
(445, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', 'https://donebolivia.com/auth/register.php', 'GET', '2026-02-04 07:04:33', NULL, NULL, 'Desktop', NULL),
(446, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:36', NULL, NULL, 'Desktop', NULL),
(447, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:37', NULL, NULL, 'Desktop', NULL),
(448, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:40', NULL, NULL, 'Desktop', NULL),
(449, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:40', NULL, NULL, 'Desktop', NULL),
(450, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:40', NULL, NULL, 'Desktop', NULL),
(451, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:41', NULL, NULL, 'Desktop', NULL),
(452, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:41', NULL, NULL, 'Desktop', NULL),
(453, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:41', NULL, NULL, 'Desktop', NULL),
(454, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:41', NULL, NULL, 'Desktop', NULL),
(455, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:41', NULL, NULL, 'Desktop', NULL),
(456, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:42', NULL, NULL, 'Desktop', NULL),
(457, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:42', NULL, NULL, 'Desktop', NULL),
(458, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:43', NULL, NULL, 'Desktop', NULL),
(459, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:43', NULL, NULL, 'Desktop', NULL),
(460, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:04:44', NULL, NULL, 'Desktop', NULL),
(461, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 07:05:24', NULL, NULL, 'Desktop', NULL),
(462, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:25', NULL, NULL, 'Desktop', NULL),
(463, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:27', NULL, NULL, 'Desktop', NULL),
(464, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:27', NULL, NULL, 'Desktop', NULL),
(465, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:27', NULL, NULL, 'Desktop', NULL),
(466, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:27', NULL, NULL, 'Desktop', NULL),
(467, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:29', NULL, NULL, 'Desktop', NULL),
(468, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:31', NULL, NULL, 'Desktop', NULL),
(469, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:05:31', NULL, NULL, 'Desktop', NULL),
(470, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:32', NULL, NULL, 'Desktop', NULL),
(471, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:32', NULL, NULL, 'Desktop', NULL),
(472, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:33', NULL, NULL, 'Desktop', NULL),
(473, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:33', NULL, NULL, 'Desktop', NULL),
(474, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:33', NULL, NULL, 'Desktop', NULL),
(475, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:06:33', NULL, NULL, 'Desktop', NULL),
(476, '2803:9400:3:cdc3:69b3:17f2:7b59:66ec', 'Mozilla/5.0 (Linux; Android 10; SNE-LX3 Build/HUAWEISNE-L23; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5i8K-XrNvCv55LuOMFseC7b0uCnsexnHWSURGoSGJ79OshiluFVKpsV8Q_7Q_aem_KSTApyjNslQx7P3BgMguTg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR5i8K-XrNvCv55LuOMFseC7b0uCnsexnHWSURGoSGJ79OshiluFVKpsV8Q_7Q_aem_KSTApyjNslQx7P3BgMguTg&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-04 07:13:40', NULL, NULL, 'Mobile', NULL),
(477, '2a03:2880:11ff:46::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 07:13:42', NULL, NULL, 'Desktop', NULL),
(478, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:17:52', NULL, NULL, 'Desktop', NULL),
(479, '2800:320:42b1:3800:ae3f:26ee:baab:5160', 'Mozilla/5.0 (Linux; Android 14; TECNO KL4 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6s7kWSGWoQtAiiPUAbUP5j-uFCBvaFxlxTrA20cXtZIpcDZ1rgJ1EphfNaAQ_aem_gsPdaTgAEsq_6aIhpjmWxA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR6s7kWSGWoQtAiiPUAbUP5j-uFCBvaFxlxTrA20cXtZIpcDZ1rgJ1EphfNaAQ_aem_gsPdaTgAEsq_6aIhpjmWxA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-04 07:18:44', NULL, NULL, 'Mobile', NULL),
(480, '2a03:2880:27ff:73::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-04 07:21:50', NULL, NULL, 'Desktop', NULL),
(481, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:23:12', NULL, NULL, 'Desktop', NULL),
(482, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:23:22', NULL, NULL, 'Desktop', NULL),
(483, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:40', NULL, NULL, 'Desktop', NULL),
(484, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:47', NULL, NULL, 'Desktop', NULL),
(485, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:48', NULL, NULL, 'Desktop', NULL),
(486, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:49', NULL, NULL, 'Desktop', NULL),
(487, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:49', NULL, NULL, 'Desktop', NULL),
(488, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:49', NULL, NULL, 'Desktop', NULL),
(489, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:49', NULL, NULL, 'Desktop', NULL),
(490, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:49', NULL, NULL, 'Desktop', NULL),
(491, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:50', NULL, NULL, 'Desktop', NULL),
(492, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:50', NULL, NULL, 'Desktop', NULL),
(493, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:25:50', NULL, NULL, 'Desktop', NULL),
(494, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:28:00', NULL, NULL, 'Desktop', NULL),
(495, '190.181.46.107', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 07:30:43', NULL, NULL, 'Mobile', NULL),
(496, '2a03:2880:11ff:4b::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 07:30:44', NULL, NULL, 'Desktop', NULL),
(497, '190.181.46.107', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'http://m.facebook.com/', 'GET', '2026-02-04 07:30:50', NULL, NULL, 'Mobile', NULL),
(498, '190.181.46.107', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;] FBNV/500', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=2', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'GET', '2026-02-04 07:30:50', NULL, NULL, 'Mobile', NULL),
(499, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:30:51', NULL, NULL, 'Desktop', NULL),
(500, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:30:51', NULL, NULL, 'Desktop', NULL),
(501, '190.181.46.107', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;] FBNV/500', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'http://m.facebook.com/', 'GET', '2026-02-04 07:30:53', NULL, NULL, 'Mobile', NULL),
(502, '190.181.46.107', 'Mozilla/5.0 (Linux; Android 10; MAR-LX3Bm Build/HUAWEIMAR-L23B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.94 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/545.0.0.43.63;IABMV/1;] FBNV/500', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR51SQU87mTMRDaPjCf7Zk2RDkoMWdip9U9jywGz5Hh5Ky8fsIeG_Bv3LBiJTg_aem_wXW9tOnsizm5wz_-3nIt_g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'http://m.facebook.com/', 'GET', '2026-02-04 07:31:15', NULL, NULL, 'Mobile', NULL),
(503, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:34:24', NULL, NULL, 'Desktop', NULL),
(504, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:34', NULL, NULL, 'Desktop', NULL),
(505, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:35', NULL, NULL, 'Desktop', NULL),
(506, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:35', NULL, NULL, 'Desktop', NULL),
(507, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:35', NULL, NULL, 'Desktop', NULL),
(508, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:36', NULL, NULL, 'Desktop', NULL),
(509, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:36', NULL, NULL, 'Desktop', NULL),
(510, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:36', NULL, NULL, 'Desktop', NULL),
(511, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:36', NULL, NULL, 'Desktop', NULL),
(512, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:37', NULL, NULL, 'Desktop', NULL),
(513, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:37', NULL, NULL, 'Desktop', NULL),
(514, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:34:37', NULL, NULL, 'Desktop', NULL),
(515, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:34:38', NULL, NULL, 'Desktop', NULL),
(516, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/?i=1', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:05', NULL, NULL, 'Desktop', NULL),
(517, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:05', NULL, NULL, 'Desktop', NULL),
(518, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:06', NULL, NULL, 'Desktop', NULL),
(519, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:06', NULL, NULL, 'Desktop', NULL),
(520, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:06', NULL, NULL, 'Desktop', NULL),
(521, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:07', NULL, NULL, 'Desktop', NULL),
(522, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:07', NULL, NULL, 'Desktop', NULL),
(523, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:07', NULL, NULL, 'Desktop', NULL),
(524, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:09', NULL, NULL, 'Desktop', NULL),
(525, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:09', NULL, NULL, 'Desktop', NULL),
(526, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/', '', 'GET', '2026-02-04 07:36:10', NULL, NULL, 'Desktop', NULL),
(527, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:10', NULL, NULL, 'Desktop', NULL),
(528, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:44', NULL, NULL, 'Desktop', NULL),
(529, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:44', NULL, NULL, 'Desktop', NULL),
(530, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:44', NULL, NULL, 'Desktop', NULL),
(531, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:45', NULL, NULL, 'Desktop', NULL),
(532, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:45', NULL, NULL, 'Desktop', NULL),
(533, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:45', NULL, NULL, 'Desktop', NULL),
(534, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:36:45', NULL, NULL, 'Desktop', NULL),
(535, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:37:17', NULL, NULL, 'Desktop', NULL),
(536, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:37:17', NULL, NULL, 'Desktop', NULL),
(537, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:44:38', NULL, NULL, 'Desktop', NULL),
(538, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 07:44:54', NULL, NULL, 'Desktop', NULL),
(539, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 07:45:27', NULL, NULL, 'Desktop', NULL),
(540, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 07:45:28', NULL, NULL, 'Desktop', NULL),
(541, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/', '', 'GET', '2026-02-04 07:45:28', NULL, NULL, 'Desktop', NULL),
(542, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:45:30', NULL, NULL, 'Desktop', NULL),
(543, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:48:37', NULL, NULL, 'Desktop', NULL),
(544, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:51:39', NULL, NULL, 'Desktop', NULL),
(545, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:51:39', NULL, NULL, 'Desktop', NULL),
(546, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:51:39', NULL, NULL, 'Desktop', NULL),
(547, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:52:03', NULL, NULL, 'Desktop', NULL),
(548, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:52:04', NULL, NULL, 'Desktop', NULL),
(549, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:01', NULL, NULL, 'Desktop', NULL),
(550, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:01', NULL, NULL, 'Desktop', NULL),
(551, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:02', NULL, NULL, 'Desktop', NULL),
(552, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:37', NULL, NULL, 'Desktop', NULL),
(553, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:37', NULL, NULL, 'Desktop', NULL),
(554, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:57:38', NULL, NULL, 'Desktop', NULL),
(555, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:08', NULL, NULL, 'Desktop', NULL),
(556, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:08', NULL, NULL, 'Desktop', NULL),
(557, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:09', NULL, NULL, 'Desktop', NULL),
(558, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:09', NULL, NULL, 'Desktop', NULL),
(559, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:09', NULL, NULL, 'Desktop', NULL),
(560, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:09', NULL, NULL, 'Desktop', NULL),
(561, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:09', NULL, NULL, 'Desktop', NULL),
(562, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:11', NULL, NULL, 'Desktop', NULL),
(563, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:11', NULL, NULL, 'Desktop', NULL),
(564, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:11', NULL, NULL, 'Desktop', NULL),
(565, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:12', NULL, NULL, 'Desktop', NULL),
(566, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:12', NULL, NULL, 'Desktop', NULL),
(567, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:12', NULL, NULL, 'Desktop', NULL),
(568, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:13', NULL, NULL, 'Desktop', NULL),
(569, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:13', NULL, NULL, 'Desktop', NULL),
(570, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:14', NULL, NULL, 'Desktop', NULL),
(571, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 07:59:14', NULL, NULL, 'Desktop', NULL),
(572, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:03:34', NULL, NULL, 'Desktop', NULL),
(573, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:03:34', NULL, NULL, 'Desktop', NULL),
(574, '2800:cd0:4817:7700:cc59:f0d9:2af5:9bbb', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', '/', '', 'GET', '2026-02-04 08:05:07', NULL, NULL, 'Mobile', NULL),
(575, '2800:320:c35b:eb00:c19e:b47c:af00:cce2', 'Mozilla/5.0 (Linux; Android 8.1.0; SM-P585M Build/M1AJQ; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/138.0.7204.179 Safari/537.36 [FB_IAB/FB4A;FBAV/539.0.0.54.69;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR56uJX6ZacPRjQpY7PgrK9dHkWnc2ZwUCiO9xOZ_Blw09x--GjH6q7tNeg7KA_aem_URB_QcQaGwiQDBdKxf6gNA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR56uJX6ZacPRjQpY7PgrK9dHkWnc2ZwUCiO9xOZ_Blw09x--GjH6q7tNeg7KA_aem_URB_QcQaGwiQDBdKxf6gNA&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 08:20:47', NULL, NULL, 'Desktop', NULL),
(576, '2a03:2880:10ff:44::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/', '', 'GET', '2026-02-04 08:20:49', NULL, NULL, 'Desktop', NULL),
(577, '2a03:2880:13ff:6::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', '', 'GET', '2026-02-04 08:21:19', NULL, NULL, 'Desktop', NULL),
(578, '2a03:2880:13ff:73::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', '', 'GET', '2026-02-04 08:21:19', NULL, NULL, 'Desktop', NULL),
(579, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:21:49', NULL, NULL, 'Desktop', NULL),
(580, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:21:55', NULL, NULL, 'Desktop', NULL),
(581, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:21:56', NULL, NULL, 'Desktop', NULL),
(582, '2800:cd0:4817:7700:ccb0:1761:c2f0:c4e6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/auth/register.php', 'https://donebolivia.com/', 'GET', '2026-02-04 08:21:56', NULL, NULL, 'Desktop', NULL),
(583, '2a03:2880:15ff:1::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 08:26:29', NULL, NULL, 'Desktop', NULL),
(584, '200.87.155.14', 'Mozilla/5.0 (Linux; Android 15; BRP-NX3 Build/HONORBRP-N23; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/144.0.7559.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/546.0.0.42.66;IABMV/1;]', '/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR49yc343UD9kpYomxKAaeg8RJZpdkG9aN5MEFTv-cEfIf27FJMrGeSoIKqXrQ_aem_68kvYHBCSFkaLey7ufOJ0g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661&i=1', 'https://www.donebolivia.com/?fbclid=IwZXh0bgNhZW0BMABhZGlkAasube_cE7VzcnRjBmFwcF9pZAwzNTA2ODU1MzE3MjgAAR49yc343UD9kpYomxKAaeg8RJZpdkG9aN5MEFTv-cEfIf27FJMrGeSoIKqXrQ_aem_68kvYHBCSFkaLey7ufOJ0g&utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', 'GET', '2026-02-04 08:33:56', NULL, NULL, 'Mobile', NULL),
(585, '2a03:2880:15ff:71::', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '/?utm_medium=paid&utm_source=fb&utm_id=120240825900140661&utm_content=120240825900120661&utm_term=120240825900130661&utm_campaign=120240825900140661', '', 'GET', '2026-02-04 08:48:51', NULL, NULL, 'Desktop', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1,
  `calificacion_promedio` decimal(2,1) DEFAULT 0.0,
  `total_ventas` int(11) DEFAULT 0,
  `departamento_codigo` varchar(3) DEFAULT NULL,
  `municipio_codigo` varchar(10) DEFAULT NULL,
  `departamento_nombre` varchar(100) DEFAULT NULL,
  `municipio_nombre` varchar(100) DEFAULT NULL,
  `telefono_verificado` tinyint(1) NOT NULL DEFAULT 0,
  `otp_code` varchar(255) DEFAULT NULL,
  `otp_expira` datetime DEFAULT NULL,
  `otp_intentos` int(11) DEFAULT 0,
  `foto_perfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `fecha_nacimiento`, `email`, `telefono`, `ciudad_id`, `password`, `fecha_registro`, `activo`, `calificacion_promedio`, `total_ventas`, `departamento_codigo`, `municipio_codigo`, `departamento_nombre`, `municipio_nombre`, `telefono_verificado`, `otp_code`, `otp_expira`, `otp_intentos`, `foto_perfil`) VALUES
(42, 'YHEFI ANTONIO', '2008-03-07', 'yhefric@gmail.com', '75872712', 0, '$2y$10$kS1KyCbuMnBOHUqG.55pQuMeUC7LwmI0Q.suT5N6H/el1L1nxjtvK', '2026-03-08 00:51:54', 1, '0.0', 0, 'SCZ', 'SCZ-001', 'Santa Cruz', 'Santa Cruz de la Sierra', 1, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `pagina` varchar(255) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `dispositivo` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet',
  `navegador` varchar(50) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `fecha_visita` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_activo` (`activo`);

--
-- Indices de la tabla `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_orden` (`orden`),
  ADD KEY `idx_activo` (`activo`),
  ADD KEY `idx_nombre` (`nombre`);

--
-- Indices de la tabla `busquedas`
--
ALTER TABLE `busquedas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_termino` (`termino`),
  ADD KEY `idx_fecha` (`fecha_busqueda`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`),
  ADD KEY `idx_clave` (`clave`);

--
-- Indices de la tabla `conversiones`
--
ALTER TABLE `conversiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tipo` (`tipo`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_producto` (`producto_id`),
  ADD KEY `idx_fecha` (`fecha_conversion`);

--
-- Indices de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_producto` (`producto_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha` (`fecha_denuncia`);

--
-- Indices de la tabla `denuncias_tiendas`
--
ALTER TABLE `denuncias_tiendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_favorito` (`usuario_id`,`producto_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `idx_fav_usuario` (`usuario_id`),
  ADD KEY `idx_fav_producto` (`producto_id`);

--
-- Indices de la tabla `feria_bloques`
--
ALTER TABLE `feria_bloques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sector_id` (`sector_id`);

--
-- Indices de la tabla `feria_posiciones`
--
ALTER TABLE `feria_posiciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slot_in_block` (`bloque_id`,`slot_numero`,`ciudad`),
  ADD KEY `idx_feria_pos_sector` (`sector_id`);

--
-- Indices de la tabla `feria_puestos`
--
ALTER TABLE `feria_puestos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_puesto` (`sector`,`ciudad`,`posicion`);

--
-- Indices de la tabla `feria_sectores`
--
ALTER TABLE `feria_sectores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indices de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_accion` (`accion`),
  ADD KEY `idx_fecha` (`fecha_accion`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`token`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `producto_badges`
--
ALTER TABLE `producto_badges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_producto` (`producto_id`);

--
-- Indices de la tabla `producto_imagenes`
--
ALTER TABLE `producto_imagenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_imagenes_producto` (`producto_id`,`es_principal`,`orden`);

--
-- Indices de la tabla `producto_likes`
--
ALTER TABLE `producto_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_like` (`producto_id`,`ip_address`),
  ADD KEY `idx_producto` (`producto_id`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tipo` (`tipo`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha` (`fecha_reporte`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienda_configuracion_inicio`
--
ALTER TABLE `tienda_configuracion_inicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiend-id` (`tiend-id`);

--
-- Indices de la tabla `traffic_logs`
--
ALTER TABLE `traffic_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `idx_ip` (`ip_address`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `ciudad_id` (`ciudad_id`),
  ADD KEY `idx_telefono_verificado` (`telefono_verificado`),
  ADD KEY `idx_usuarios_email` (`email`),
  ADD KEY `idx_usuarios_telefono` (`telefono`),
  ADD KEY `idx_fecha_nacimiento` (`fecha_nacimiento`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_fecha` (`fecha_visita`),
  ADD KEY `idx_pagina` (`pagina`),
  ADD KEY `idx_ip` (`ip`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `busquedas`
--
ALTER TABLE `busquedas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `conversiones`
--
ALTER TABLE `conversiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `denuncias_tiendas`
--
ALTER TABLE `denuncias_tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `feria_bloques`
--
ALTER TABLE `feria_bloques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `feria_posiciones`
--
ALTER TABLE `feria_posiciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `feria_puestos`
--
ALTER TABLE `feria_puestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `feria_sectores`
--
ALTER TABLE `feria_sectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `log_acciones`
--
ALTER TABLE `log_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_badges`
--
ALTER TABLE `producto_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT de la tabla `producto_imagenes`
--
ALTER TABLE `producto_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT de la tabla `producto_likes`
--
ALTER TABLE `producto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `tienda_configuracion_inicio`
--
ALTER TABLE `tienda_configuracion_inicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traffic_logs`
--
ALTER TABLE `traffic_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=586;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `denuncias_tiendas`
--
ALTER TABLE `denuncias_tiendas`
  ADD CONSTRAINT `denuncias_tiendas_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `feria_bloques`
--
ALTER TABLE `feria_bloques`
  ADD CONSTRAINT `feria_bloques_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `feria_sectores` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `feria_posiciones`
--
ALTER TABLE `feria_posiciones`
  ADD CONSTRAINT `fk_sector_posicion` FOREIGN KEY (`sector_id`) REFERENCES `feria_sectores` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_badges`
--
ALTER TABLE `producto_badges`
  ADD CONSTRAINT `fk_producto_badges_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tienda_configuracion_inicio`
--
ALTER TABLE `tienda_configuracion_inicio`
  ADD CONSTRAINT `tienda_configuracion_inicio_ibfk_1` FOREIGN KEY (`tiend-id`) REFERENCES `tiendas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
