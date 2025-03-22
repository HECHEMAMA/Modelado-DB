-- phpMyAdmin SQL Dump
-- version 5.2.1
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
-- Base de datos: `transporte__II`
--
CREATE DATABASE transporte__II;
-- --------------------------------------------------------
USE transporte__II;
--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(20) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `vip` enum('si','no') NOT NULL,
  `documento` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `codigo_conductor` varchar(10) NOT NULL,
  `codigo_empleado` varchar(10) NOT NULL,
  `experiencia_conductor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pago`
--

CREATE TABLE `detalle_pago` (
  `codigo_detalle` int(11) NOT NULL,
  `forma_pago` int(11) NOT NULL,
  `dinero` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE `detalle_servicio` (
  `codigo_detalle` int(11) NOT NULL,
  `conductor` varchar(10) DEFAULT NULL,
  `vehiculo` varchar(10) DEFAULT NULL,
  `fecha_despacho` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_empleado`
--

CREATE TABLE `documento_empleado` (
  `codigo_documento` varchar(30) NOT NULL,
  `documento` int(11) NOT NULL,
  `codigo_empleado` varchar(10) NOT NULL,
  `fecha_expedicion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `observacion_documento` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codigo_empleado` varchar(10) NOT NULL,
  `nombre_empleado` varchar(45) NOT NULL,
  `apellido_empleado` varchar(45) NOT NULL,
  `telefono_empleado` varchar(20) NOT NULL,
  `direccion_empleado` text NOT NULL,
  `sexo_empleado` enum('M','F') DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `observacion_empleado` text DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` varchar(10) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
('E01', 'activo'),
('E02', 'inactivo'),
('E03', 'de vacaciones'),
('E04', 'Baja por enfermedad'),
('E05', 'En formación'),
('E06', 'En periodo de prueba'),
('E07', 'Jubilado'),
('S01', 'Disponible'),
('S02', 'No disponible'),
('S03', 'En espera'),
('S04', 'En curso'),
('S05', 'Finalizado'),
('S06', 'Cancelado'),
('S07', 'activo'),
('V01', 'En reparación'),
('V02', 'Fuera de Vervicio'),
('V03', 'TránVito'),
('V04', 'De baja'),
('V05', 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_pago` int(11) NOT NULL,
  `nombre_pago` varchar(45) NOT NULL,
  `descripcion_pago` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `rif_mantenimiento` varchar(20) NOT NULL,
  `nombre_mantenimiento` varchar(45) NOT NULL,
  `telefono_mantenimiento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`rif_mantenimiento`, `nombre_mantenimiento`, `telefono_mantenimiento`) VALUES
('J-303900496', 'Akasaka Motors', '0241 8573825');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion_servicio`
--

CREATE TABLE `peticion_servicio` (
  `folio` varchar(20) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `codigo_servicio` varchar(10) NOT NULL,
  `cantidad_servicio` float(10,2) DEFAULT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `codigo_servicio` varchar(10) NOT NULL,
  `nombre_servicio` varchar(45) NOT NULL,
  `siglas_servicio` varchar(10) DEFAULT NULL,
  `observacion_servicio` text DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`codigo_servicio`, `nombre_servicio`, `siglas_servicio`, `observacion_servicio`, `estado`) VALUES
('AA01', 'Leche Pasteurizada', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_carga`
--

CREATE TABLE `tipo_carga` (
  `id_carga` int(11) NOT NULL,
  `nombre_carga` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_carga`
--

INSERT INTO `tipo_carga` (`id_carga`, `nombre_carga`) VALUES
(1, 'Carga General'),
(2, 'Carga a Granel'),
(3, 'Carga Perecedera'),
(4, 'Carga Fragil'),
(5, 'Carga Peligrosa'),
(6, 'Carga general'),
(7, 'Carga a granel'),
(8, 'Carga líquida'),
(9, 'Carga refrigerada'),
(10, 'Carga pesada'),
(11, 'Carga peligrosa'),
(12, 'Carga paletizada'),
(13, 'Carga de contenedores'),
(14, 'Carga de vehículos'),
(15, 'Carga de materiales de construcción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_documento` int(11) NOT NULL,
  `nombre_documento` varchar(45) NOT NULL,
  `descripcion_documento` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_documento`, `nombre_documento`, `descripcion_documento`) VALUES
(1, 'Cédula o DNI', NULL),
(2, 'RIF', NULL),
(3, 'Certificado Médico', NULL),
(4, 'Licencia 1er Grado', NULL),
(5, 'Licencia 2do Grado', NULL),
(6, 'Licencia 3er Grado', NULL),
(7, 'Licencia 4to Grado', NULL),
(8, 'Licencia 5to Grado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `id_tipo_vehiculo` int(11) NOT NULL,
  `nombre_tipo_vehiculo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id_tipo_vehiculo`, `nombre_tipo_vehiculo`) VALUES
(1, 'Furgon de carga'),
(2, 'Fugon de refrigerado'),
(3, 'Camiones rígidos'),
(4, 'Camiones articulados'),
(5, 'Camiones de plataforma abierta'),
(6, 'Camiones cerrados'),
(7, 'Camiones  frigoríficos'),
(8, 'Camiones cisterna'),
(9, 'Camiones de lona o tauliner'),
(10, 'Volquetes'),
(11, 'Furgonetas'),
(12, 'Trenes de carga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `matricula` varchar(10) NOT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `observacion_vehiculo` text DEFAULT NULL,
  `capacidad_kg` float(10,2) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `tipo_vehiculo` int(11) DEFAULT NULL,
  `tipo_carga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_mantenimiento`
--

CREATE TABLE `vehiculo_mantenimiento` (
  `matricula_vehiculo` varchar(10) NOT NULL,
  `rif_mantenimiento` varchar(20) NOT NULL,
  `descripcion_mantenimiento` text DEFAULT NULL,
  `fecha_realiza` date DEFAULT NULL,
  `pago` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_servicio`
--

CREATE TABLE `vehiculo_servicio` (
  `matricula_vehiculo` varchar(10) NOT NULL,
  `codigo_servicio` varchar(10) NOT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `documento` (`documento`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`codigo_conductor`),
  ADD UNIQUE KEY `codigo_empleado` (`codigo_empleado`);

--
-- Indices de la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD KEY `codigo_detalle` (`codigo_detalle`),
  ADD KEY `forma_pago` (`forma_pago`);

--
-- Indices de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD PRIMARY KEY (`codigo_detalle`),
  ADD KEY `vehiculo` (`vehiculo`),
  ADD KEY `conductor` (`conductor`);

--
-- Indices de la tabla `documento_empleado`
--
ALTER TABLE `documento_empleado`
  ADD PRIMARY KEY (`codigo_documento`),
  ADD KEY `documento` (`documento`),
  ADD KEY `codigo_empleado` (`codigo_empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codigo_empleado`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`rif_mantenimiento`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peticion_servicio`
--
ALTER TABLE `peticion_servicio`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `estado` (`estado`),
  ADD KEY `codigo_servicio` (`codigo_servicio`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigo_servicio`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `tipo_carga`
--
ALTER TABLE `tipo_carga`
  ADD PRIMARY KEY (`id_carga`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`id_tipo_vehiculo`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `tipo_vehiculo` (`tipo_vehiculo`),
  ADD KEY `tipo_carga` (`tipo_carga`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `vehiculo_mantenimiento`
--
ALTER TABLE `vehiculo_mantenimiento`
  ADD KEY `matricula_vehiculo` (`matricula_vehiculo`),
  ADD KEY `rif_mantenimiento` (`rif_mantenimiento`);

--
-- Indices de la tabla `vehiculo_servicio`
--
ALTER TABLE `vehiculo_servicio`
  ADD UNIQUE KEY `matricula_vehiculo` (`matricula_vehiculo`),
  ADD KEY `codigo_servicio` (`codigo_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_carga`
--
ALTER TABLE `tipo_carga`
  MODIFY `id_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `id_tipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `tipo_documento` (`id_documento`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`codigo_empleado`) REFERENCES `empleado` (`codigo_empleado`);

--
-- Filtros para la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD CONSTRAINT `detalle_pago_ibfk_1` FOREIGN KEY (`codigo_detalle`) REFERENCES `detalle_servicio` (`codigo_detalle`),
  ADD CONSTRAINT `detalle_pago_ibfk_2` FOREIGN KEY (`forma_pago`) REFERENCES `forma_pago` (`id_pago`);

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `detalle_servicio_ibfk_2` FOREIGN KEY (`conductor`) REFERENCES `conductor` (`codigo_conductor`);

--
-- Filtros para la tabla `documento_empleado`
--
ALTER TABLE `documento_empleado`
  ADD CONSTRAINT `documento_empleado_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `tipo_documento` (`id_documento`),
  ADD CONSTRAINT `documento_empleado_ibfk_2` FOREIGN KEY (`codigo_empleado`) REFERENCES `empleado` (`codigo_empleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `peticion_servicio`
--
ALTER TABLE `peticion_servicio`
  ADD CONSTRAINT `peticion_servicio_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `peticion_servicio_ibfk_2` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicio` (`codigo_servicio`),
  ADD CONSTRAINT `peticion_servicio_ibfk_3` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`tipo_vehiculo`) REFERENCES `tipo_vehiculo` (`id_tipo_vehiculo`),
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`tipo_carga`) REFERENCES `tipo_carga` (`id_carga`),
  ADD CONSTRAINT `vehiculo_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `vehiculo_mantenimiento`
--
ALTER TABLE `vehiculo_mantenimiento`
  ADD CONSTRAINT `vehiculo_mantenimiento_ibfk_1` FOREIGN KEY (`matricula_vehiculo`) REFERENCES `vehiculo` (`matricula`),
  ADD CONSTRAINT `vehiculo_mantenimiento_ibfk_2` FOREIGN KEY (`rif_mantenimiento`) REFERENCES `mantenimiento` (`rif_mantenimiento`);

--
-- Filtros para la tabla `vehiculo_servicio`
--
ALTER TABLE `vehiculo_servicio`
  ADD CONSTRAINT `vehiculo_servicio_ibfk_1` FOREIGN KEY (`matricula_vehiculo`) REFERENCES `vehiculo` (`matricula`),
  ADD CONSTRAINT `vehiculo_servicio_ibfk_2` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicio` (`codigo_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
