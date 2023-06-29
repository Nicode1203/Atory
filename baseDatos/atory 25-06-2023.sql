-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 02:00:57
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
-- Base de datos: `atory`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `tipoDocumento` varchar(10) NOT NULL DEFAULT 'CC',
  `documentoCliente` varchar(20) NOT NULL,
  `nombreCliente` varchar(100) NOT NULL,
  `telefonoCliente` varchar(20) NOT NULL,
  `correoCliente` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estadoCliente` varchar(10) NOT NULL DEFAULT 'Activo',
  `creado` date DEFAULT NULL,
  `ultimaActualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `tipoDocumento`, `documentoCliente`, `nombreCliente`, `telefonoCliente`, `correoCliente`, `direccion`, `estadoCliente`, `creado`, `ultimaActualizacion`) VALUES
(1, 'C.C', '1055325484', 'Arnulfo Rodriguez', '3005554878', 'arnulfo@gmail.com', 'cll 148 # 98-41', 'Archivado', '2023-05-12', '2023-05-17'),
(2, 'C.C', '1030525484', 'Blanca Cordero', '3008562013', 'blanca@gmail.com', 'cr 5 #148 -9', 'Activo', '2023-05-18', '2023-05-18'),
(3, 'C.C', '1035585487', 'Carolina Crosby', '3122254858', 'caro@gmail.com', 'cll 89 sur # 45-48', 'Activo', '2023-05-17', '2023-05-17'),
(4, 'C.C', '9587458', 'Diana Borges', '3103404090', 'diana@gmail.com', 'cr 2 # 98-74', 'Activo', '2023-05-17', '2023-05-17'),
(5, 'C.C', '1025859658', 'Ernesto Gutierrez', '3203103525', 'ernie@gmail.com', 'cll 45 # 10-47', 'Archivado', '2023-06-01', '2023-06-04'),
(6, 'C.C', '156387', 'Maria Sanchez', '3657854625', 'agusto@gmail.com', 'cll 56#98-45', 'Activo', '2023-06-08', '2023-06-14'),
(7, 'C.C', '2222222222', 'Carlos Schick', '7896541254', 'lkaro@gmail.com', 'cll 5#98-45', 'Activo', '2023-01-03', '2023-05-17'),
(13, 'C.C', '123', 'Mariana Borda', '3236587979', 'Mariana@hotmail.com', 'cr 23 # 125#98', 'Activo', '2023-03-02', '2023-03-03'),
(14, 'C.C', '2365', 'Ayane Hayabusa', '878965412', 'ayane@hotmail.com', 'cll 123# 78-41', 'Activo', '2023-01-10', '2023-06-07'),
(15, 'C.E', '9863', 'Isabella Montana', '9547893652', 'isabella@gmail.com', 'cll 127 # 98-85', 'Activo', '2022-01-04', '2023-01-10'),
(16, 'C.C', '151236', 'Daniela Flor', '3196523632', 'dannylaguadoflor@gmail.com', 'cll 148 # 98-40', 'Activo', '2022-12-02', '2023-04-07'),
(17, 'C.C', '589', 'Maria Reyes', '3231039856', 'maria.r@gmail.com', 'cll 145 # 108-63', 'Activo', '2022-07-09', '2023-03-18'),
(18, 'C.C', '698', 'Yolanda Tellez', '3216549898', 'y.165@aol.com', 'cll159#10-29', 'Activo', '2023-06-10', '2023-06-18'),
(19, 'C.E', '56', 'Tina Lovecraft', '9548961245', 'tina@gmail.com', 'cll 36#69-89', 'Activo', '2023-04-05', '2023-06-06'),
(20, 'C.C', '1012151563', 'Gabriela Castiblanco', '3103656989', 'gaby@hotmail.com', 'km 5 via cota chia', 'Activo', '2023-04-11', '2023-05-28'),
(23, 'C.C', '789', 'Ana Maria Rosales', '7893652123', 'maria@gmail.com', 'cll 13#140-75', 'Activo', '2023-06-23', '2023-06-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nitEmpresa` varchar(20) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `telefonoEmpresa` varchar(20) NOT NULL,
  `correoEmpresa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nitEmpresa`, `nombreEmpresa`, `telefonoEmpresa`, `correoEmpresa`) VALUES
(1, '52142526', 'Bitsplay', '3102209911', 'bitsplay@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `fechaFactura` date NOT NULL,
  `impuestoTotal` decimal(10,0) NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `valorTotalFactura` decimal(10,0) NOT NULL,
  `empresa_idEmpresa` int(11) NOT NULL DEFAULT 1,
  `cliente_idCliente` int(11) NOT NULL,
  `estadoFactura` varchar(20) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB AVG_ROW_LENGTH=45 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `fechaFactura`, `impuestoTotal`, `subTotal`, `valorTotalFactura`, `empresa_idEmpresa`, `cliente_idCliente`, `estadoFactura`) VALUES
(1, '2023-05-17', 10000, 50000, 60000, 1, 1, 'Pendiente'),
(2, '2023-05-17', 15000, 60000, 75000, 1, 2, 'pago'),
(3, '2023-05-17', 50000, 500000, 550000, 1, 3, 'Pendiente'),
(4, '2023-05-17', 30000, 100000, 130000, 1, 4, 'Pendiente'),
(6, '2023-03-12', 7000, 15000, 22000, 1, 13, 'Pendiente'),
(7, '2023-04-12', 6000, 21000, 27000, 1, 13, 'Pendiente'),
(8, '2023-05-12', 6000, 15000, 21000, 1, 13, 'Pendiente'),
(9, '2023-02-12', 5000, 15000, 20000, 1, 13, 'Pendiente'),
(10, '2023-05-22', 70000, 350000, 420000, 1, 4, 'Pendiente'),
(11, '2023-02-13', 7000, 25000, 32000, 1, 13, 'Pendiente'),
(12, '2023-06-29', 20000, 20000, 40000, 1, 1, 'Pendiente'),
(14, '2023-05-02', 3000, 30000, 33000, 1, 6, 'Pendiente'),
(15, '2023-01-09', 6000, 45000, 51000, 1, 5, 'Pendiente'),
(17, '2023-03-30', 90000, 450000, 54000, 1, 7, 'Pendiente'),
(18, '2023-02-10', 100000, 500000, 600000, 1, 14, 'Pendiente'),
(19, '2022-12-17', 50000, 250000, 30000, 1, 15, 'Pendiente'),
(20, '2022-11-12', 9000, 45000, 54000, 1, 16, 'Pendiente'),
(21, '2022-11-25', 85000, 225000, 310000, 1, 18, 'Pendiente'),
(22, '2023-01-18', 6000, 30000, 36000, 1, 17, 'Pendiente'),
(25, '2023-03-09', 20000, 75000, 95000, 1, 19, 'Pendiente'),
(26, '2023-06-18', 15000, 75000, 90000, 1, 19, 'Pendiente'),
(27, '2023-06-30', 7000, 30000, 37000, 1, 19, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_has_plan`
--

CREATE TABLE `factura_has_plan` (
  `idFactura_por_plan` int(11) NOT NULL,
  `factura_idFactura` int(11) NOT NULL,
  `plan_idPlan` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `factura_has_plan`
--

INSERT INTO `factura_has_plan` (`idFactura_por_plan`, `factura_idFactura`, `plan_idPlan`, `cantidad`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 4, 2),
(4, 4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `idPlan` int(11) NOT NULL,
  `codigoPlan` varchar(20) NOT NULL,
  `tipoPlan` varchar(20) DEFAULT NULL,
  `velocidad` varchar(20) NOT NULL,
  `nombrePlan` varchar(250) NOT NULL,
  `precioPlan` decimal(10,0) NOT NULL,
  `desPlan` varchar(2000) DEFAULT NULL,
  `estadoPlan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`idPlan`, `codigoPlan`, `tipoPlan`, `velocidad`, `nombrePlan`, `precioPlan`, `desPlan`, `estadoPlan`) VALUES
(1, '1', 'urbano', '20mb', 'Plan economico', 20000, 'Plan económico de 20mb para la cuidad adecuada para casa pequeñas', 'Activo'),
(2, '2', 'urbano', '50mb', 'Plan dorado', 70000, 'EL plan dorado urbano es mucho mas rapido ideal para una familia completa, con fibra óptica, ofrece excelente velicidad de internet', 'Activo'),
(3, '3', 'urbano', '70mb', 'Plan diamante', 100000, 'Plan de alta velocidad para hogares', 'Activo'),
(4, '4', 'empresarial', '120mb', 'Plan empresa', 120000, 'Plan Ideal Para empresas pequeñas, por 120000 y de fibra optica puede alcanzar buenas velocidades', 'Activo'),
(7, '5', 'urbano', '5 mb', 'Plan Basico', 50000, 'EL plan rural Basico consta de 5 megas de navegación, se hace por medio de radiofrecuencia y es el plan que tiene mayor covertura, recomendado para personas que vivan muy alejadas o en sitios de dificil alcance.', 'Activo'),
(8, '6', 'empresarial', '150 mb', 'Plan elite empresa', 150000, 'Plan para empresas grande que requieran excelente velocidades de wifi, viene con fibra óptica', 'Archivado'),
(9, '7', 'rural', '10 mb', 'Plan Oro', 65000, 'Plan fibra optica rural, un plan con velocidades de internet más rapidas, para sitio rurales cerca a las cuidades más cercanas, toca validar disponibilidad', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_cliente`
--

CREATE TABLE `plan_cliente` (
  `idplan_cliente` int(10) NOT NULL,
  `plan_idplan` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan_cliente`
--

INSERT INTO `plan_cliente` (`idplan_cliente`, `plan_idplan`, `cliente_idcliente`) VALUES
(1, 3, 5),
(2, 4, 13),
(3, 9, 13),
(4, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqr`
--

CREATE TABLE `pqr` (
  `idPqr` int(11) NOT NULL,
  `nombrePqr` enum('Peticion','Queja','Reclamo','Sugerencia','Recurso') NOT NULL DEFAULT 'Peticion',
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pqr`
--

INSERT INTO `pqr` (`idPqr`, `nombrePqr`, `descripcion`) VALUES
(1, 'Peticion', 'Solicitar una peticion por servicio prestado'),
(2, 'Queja', 'Realizar una queja por servicio prestado'),
(3, 'Reclamo', 'Realizar un reclamo por servicio'),
(4, 'Recurso', 'Solicitar recurso'),
(5, 'Sugerencia', 'Sugerencia o recomendacion a la empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqr2`
--

CREATE TABLE `pqr2` (
  `idPqr` int(11) NOT NULL,
  `tipoDocumento` varchar(10) DEFAULT NULL,
  `nDocumento` varchar(100) DEFAULT NULL,
  `nombresCliente` varchar(200) DEFAULT NULL,
  `telefonoCliente` varchar(20) DEFAULT NULL,
  `emailCliente` varchar(200) DEFAULT NULL,
  `tPqr` varchar(20) DEFAULT NULL,
  `desPqr` varchar(2000) DEFAULT NULL,
  `estadoPqr` varchar(100) DEFAULT 'Activo',
  `comentario` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pqr2`
--

INSERT INTO `pqr2` (`idPqr`, `tipoDocumento`, `nDocumento`, `nombresCliente`, `telefonoCliente`, `emailCliente`, `tPqr`, `desPqr`, `estadoPqr`, `comentario`) VALUES
(1, 'C.C', '36', 'Pastelito de fresa', '5263695825', 'pastelito@gmail.com', 'Sugerencia', 'Tener mejores dispositivos y fibra óptica', 'Inactivo', NULL),
(2, 'C.E', '25', 'Isabella Perez', '6254782323', 'isaa@aol.com', 'Peticion', 'Quiero fibra optica en mi casa', 'Inactivo', 'No se pudo instalar fibra optica en su hogar porque no hay cobertura'),
(3, 'C.E', '47', 'fabian schick', '3195899457', 'ff@gmail.com', 'Peticion', 'Mejor velocidad en mi servicio', 'Activo', 'Modem en camino'),
(4, 'C.C', '12363235', 'Carlos Rubiano', '7859635874', 'cr56@aol.com', 'Sugerencia', 'Que los técnicos sean mas puntuales', 'Inactivo', NULL),
(5, 'C.C', '1223456', 'Nicolas Borda', '3443456', 'nico@correo.na', 'Reclamo', 'El internet me esta fallando constantemente y necesito un reembolso', 'Activo', NULL),
(6, 'C.C', '75', 'Estefania', '987563254', 'cristian.audir8@hotmail.com', 'Reclamo', 'Me llego mal el modem de internet', 'Activo', NULL),
(7, 'C.C', '789', 'Ana Maria Rosales', '7895632525', 'maria@gmail.com', 'Reclamo', 'EL modem de internet no esta trabajando correctamente', 'Activo', 'Servicio completado satisfactoriamente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqr_has_cliente`
--

CREATE TABLE `pqr_has_cliente` (
  `idPqr_por_Cliente` int(11) NOT NULL,
  `pqr_idPqr` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `fechaPqr` date NOT NULL,
  `descripcionSolicitud` varchar(500) NOT NULL,
  `archivoPqr` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pqr_has_cliente`
--

INSERT INTO `pqr_has_cliente` (`idPqr_por_Cliente`, `pqr_idPqr`, `cliente_idCliente`, `fechaPqr`, `descripcionSolicitud`, `archivoPqr`) VALUES
(1, 1, 3, '2023-05-11', 'Mal servicio de internet', NULL),
(2, 2, 5, '2023-05-12', 'El tecnico no sabia nada', NULL),
(3, 5, 2, '2023-05-14', 'Mejorar el sevicio rural', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(200) NOT NULL,
  `serialProducto` varchar(45) NOT NULL,
  `descripcionProducto` varchar(250) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `estadoProducto` varchar(20) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `serialProducto`, `descripcionProducto`, `cantidad`, `estadoProducto`) VALUES
(1, 'Modem Asus', '545784545', 'Modem Arris velocidad media fibra optica', 5, 'Activo'),
(2, 'Modem Mi alta velocidad', '55448754', 'Modem Mii velocidad media', 10, 'Activo'),
(3, 'Modem MI', '52144452', 'Modem Asus velocidad alta', 10, 'Activo'),
(4, 'Cables fibra optica', '32525225', 'Cables fibra optica', 5, 'Inactivo'),
(5, 'Modem arris', '5689', 'Modem Arris de fibra optica para alta velocidad', 12, 'Activo'),
(6, 'Cables de fibra optica', '5289645s', 'Cables utilizados para instalaciones fibra óptica', 60, 'Activo'),
(7, 'modem Arris', '3656', 'modem fobra optica', 30, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_usuario`
--

CREATE TABLE `producto_has_usuario` (
  `idProducto_por_usuario` int(11) NOT NULL,
  `fechaAsignacion` date NOT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto_has_usuario`
--

INSERT INTO `producto_has_usuario` (`idProducto_por_usuario`, `fechaAsignacion`, `producto_idProducto`, `usuario_idUsuario`) VALUES
(1, '2023-05-17', 1, 2),
(2, '2023-05-17', 2, 3),
(3, '2023-05-17', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(45) NOT NULL,
  `descrpcionRol` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idRol`, `nombreRol`, `descrpcionRol`) VALUES
(1, 'Administrativo', 'Administrativo - puede modificar todo el sistema'),
(2, 'Tecnico', 'Soporte tecnico'),
(3, 'Auxiliar', 'Acceso limitado al sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idSolicitud` int(50) NOT NULL,
  `tipoDocumento` varchar(50) DEFAULT NULL,
  `numeroDocumento` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estadoSolicitud` varchar(50) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idSolicitud`, `tipoDocumento`, `numeroDocumento`, `nombres`, `telefono`, `email`, `estadoSolicitud`) VALUES
(1, 'C.C', '202', 'Estefania Flor', '3195852323', 'este@gmail.com', 'Atendido'),
(2, 'C.E', '963', 'Julian Hernandez', '3692582365', 'juli@gmail.com', 'Atendido'),
(3, 'C.C', '3654', 'Ayane Hayabusa', '5893652121', 'ayane@hotmail.com', 'Atendido'),
(4, 'C.C', '15263635', 'Kasumi Hayabusa', '9549638521414', 'kasumi@gmail.com', 'Activo'),
(5, 'C.C', '45', 'Helena Leau', '9638525858', 'helena@yahoo.com', 'Atendido'),
(6, 'C.C', '89', 'Fabian Quimbay', '3258963254', 'helena@gmail.com', 'Activo'),
(7, 'C.C', '789', 'Ana Maria Rosales', '7893652123', 'maria@gmail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipoDocumento` enum('TI','CC','CE','RC') NOT NULL DEFAULT 'CC',
  `documentoUsuario` varchar(20) NOT NULL,
  `nombresUsuario` varchar(100) NOT NULL,
  `telefonoUsuario` varchar(20) DEFAULT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `claveUsuario` varchar(150) NOT NULL,
  `estadoUsuario` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `creado` date NOT NULL,
  `ultimaActualizacion` date NOT NULL,
  `rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `tipoDocumento`, `documentoUsuario`, `nombresUsuario`, `telefonoUsuario`, `correoUsuario`, `claveUsuario`, `estadoUsuario`, `creado`, `ultimaActualizacion`, `rol`) VALUES
(1, '', '806554878', 'Karl S', '3103209913', 'karl@gmail.com', '123456', 'Activo', '2023-05-10', '2023-05-10', 'Administrador'),
(2, '', '1023554584', 'Cristian Muñoz', '3117322001', 'cristian@hotmail.com', '123456', 'Activo', '2023-05-11', '2023-05-11', 'Tecnico'),
(3, '', '1030634046', 'nico', '3006646485', 'nico@gmail.com', '123456', 'Activo', '2023-05-12', '2023-05-12', 'Administrador'),
(4, '', '1020554483', 'Fabian Quimbay', '3104552020', 'fabiancho@aol.com', '123456', 'Activo', '2023-05-13', '2023-05-13', 'Tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `idVisita` int(10) NOT NULL,
  `documentoCliente` varchar(50) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `telefonoCliente` varchar(50) DEFAULT NULL,
  `emailCliente` varchar(50) DEFAULT NULL,
  `direccionCliente` varchar(50) DEFAULT NULL,
  `documentoTecnico` varchar(50) DEFAULT NULL,
  `nombreTecnico` varchar(50) DEFAULT NULL,
  `telefonoTecnico` varchar(50) DEFAULT NULL,
  `emailTecnico` varchar(50) DEFAULT NULL,
  `motivoVisita` varchar(2000) DEFAULT NULL,
  `diaVisita` date DEFAULT NULL,
  `estadoVisita` varchar(100) DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`idVisita`, `documentoCliente`, `nombreCliente`, `telefonoCliente`, `emailCliente`, `direccionCliente`, `documentoTecnico`, `nombreTecnico`, `telefonoTecnico`, `emailTecnico`, `motivoVisita`, `diaVisita`, `estadoVisita`) VALUES
(1, '1055325484', 'Arnulfo Rodriguez', '3005554878', 'arnulfo@gmail.com', 'cll 148 # 98-41', '1023554584', 'Cristian Muñoz', '3117322001', 'cristian@hotmail.com', 'El modem no esta funcionando apropiadamente (internet lento)', '2021-06-23', 'Activo'),
(2, '123456789', 'Pepito Juares', '3005556677', 'pepi@gmail.com', 'direccion perdida la de siempre23', '1023554584', 'Cristian Muñoz', '3117322001', 'cristian@hotmail.com', 'Instalacion de plan', '2023-06-27', 'Activo'),
(3, '3334445555', 'Juanita Kremer', '3005556678', 'juanita@gmail.com', 'calle 445 bis', '1020554483', 'Fabian Quimbay', '3104552020', 'fabiancho@aol.com', 'el servicio no esta funcionando', '2023-06-29', 'Activo'),
(4, '3334445555', 'Pepito Juares', '3005556677', 'pepi@gmail.com', 'calle 4534 ewes', '1023554584', 'Cristian Muñoz', '3117322001', 'cristian@hotmail.com', 'Otra vez el internet me esta fallando', '2023-06-30', 'Eliminada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `documentoCliente` (`documentoCliente`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD UNIQUE KEY `nitEmpresa` (`nitEmpresa`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `cliente_idCliente` (`cliente_idCliente`),
  ADD KEY `empresa_idEmpresa` (`empresa_idEmpresa`);

--
-- Indices de la tabla `factura_has_plan`
--
ALTER TABLE `factura_has_plan`
  ADD PRIMARY KEY (`idFactura_por_plan`),
  ADD KEY `factura_idFactura` (`factura_idFactura`),
  ADD KEY `plan_idPlan` (`plan_idPlan`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`idPlan`);

--
-- Indices de la tabla `plan_cliente`
--
ALTER TABLE `plan_cliente`
  ADD PRIMARY KEY (`idplan_cliente`),
  ADD KEY `plan_idplan` (`plan_idplan`),
  ADD KEY `cliente_idcliente` (`cliente_idcliente`);

--
-- Indices de la tabla `pqr`
--
ALTER TABLE `pqr`
  ADD PRIMARY KEY (`idPqr`);

--
-- Indices de la tabla `pqr2`
--
ALTER TABLE `pqr2`
  ADD PRIMARY KEY (`idPqr`),
  ADD KEY `idPqr` (`idPqr`);

--
-- Indices de la tabla `pqr_has_cliente`
--
ALTER TABLE `pqr_has_cliente`
  ADD PRIMARY KEY (`idPqr_por_Cliente`),
  ADD KEY `pqr_idPqr` (`pqr_idPqr`),
  ADD KEY `cliente_idCliente` (`cliente_idCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `serialProducto` (`serialProducto`);

--
-- Indices de la tabla `producto_has_usuario`
--
ALTER TABLE `producto_has_usuario`
  ADD PRIMARY KEY (`idProducto_por_usuario`),
  ADD KEY `usuario_idUsuario` (`usuario_idUsuario`),
  ADD KEY `producto_idProducto` (`producto_idProducto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`idSolicitud`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `documentoUsuario` (`documentoUsuario`,`telefonoUsuario`,`correoUsuario`),
  ADD KEY `rol_idRol` (`rol`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`idVisita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `factura_has_plan`
--
ALTER TABLE `factura_has_plan`
  MODIFY `idFactura_por_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `idPlan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `plan_cliente`
--
ALTER TABLE `plan_cliente`
  MODIFY `idplan_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pqr`
--
ALTER TABLE `pqr`
  MODIFY `idPqr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pqr2`
--
ALTER TABLE `pqr2`
  MODIFY `idPqr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pqr_has_cliente`
--
ALTER TABLE `pqr_has_cliente`
  MODIFY `idPqr_por_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto_has_usuario`
--
ALTER TABLE `producto_has_usuario`
  MODIFY `idProducto_por_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idSolicitud` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `idVisita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`);

--
-- Filtros para la tabla `factura_has_plan`
--
ALTER TABLE `factura_has_plan`
  ADD CONSTRAINT `factura_has_plan_ibfk_1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`),
  ADD CONSTRAINT `factura_has_plan_ibfk_2` FOREIGN KEY (`plan_idPlan`) REFERENCES `plan` (`idPlan`);

--
-- Filtros para la tabla `plan_cliente`
--
ALTER TABLE `plan_cliente`
  ADD CONSTRAINT `plan_cliente_ibfk_1` FOREIGN KEY (`plan_idplan`) REFERENCES `plan` (`idPlan`),
  ADD CONSTRAINT `plan_cliente_ibfk_2` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `pqr_has_cliente`
--
ALTER TABLE `pqr_has_cliente`
  ADD CONSTRAINT `pqr_has_cliente_ibfk_1` FOREIGN KEY (`pqr_idPqr`) REFERENCES `pqr2` (`idPqr`),
  ADD CONSTRAINT `pqr_has_cliente_ibfk_2` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `producto_has_usuario`
--
ALTER TABLE `producto_has_usuario`
  ADD CONSTRAINT `producto_has_usuario_ibfk_1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `producto_has_usuario_ibfk_2` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
