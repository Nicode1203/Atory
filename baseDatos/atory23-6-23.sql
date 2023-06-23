/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.27-MariaDB : Database - atory
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`atory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `atory`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(10) NOT NULL DEFAULT 'CC',
  `documentoCliente` varchar(20) NOT NULL,
  `nombreCliente` varchar(100) NOT NULL,
  `telefonoCliente` varchar(20) NOT NULL,
  `correoCliente` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estadoCliente` varchar(10) NOT NULL DEFAULT 'Activo',
  `creado` date DEFAULT NULL,
  `ultimaActualizacion` date DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `documentoCliente` (`documentoCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idCliente`,`tipoDocumento`,`documentoCliente`,`nombreCliente`,`telefonoCliente`,`correoCliente`,`direccion`,`estadoCliente`,`creado`,`ultimaActualizacion`) values (1,'C.C','1055325484','Arnulfo Rodriguez','3005554878','arnulfo@gmail.com','cll 148 # 98-41','Archivado','2023-05-12','2023-05-17'),(2,'C.C','1030525484','Blanca Cordero','3008562013','blanca@gmail.com','cr 5 #148 -9','Activo','2023-05-18','2023-05-18'),(3,'C.C','1035585487','Carolina Crosby','3122254858','caro@gmail.com','cll 89 sur # 45-48','Activo','2023-05-17','2023-05-17'),(4,'C.C','9587458','Diana Borges','3103404090','diana@gmail.com','cr 2 # 98-74','Activo','2023-05-17','2023-05-17'),(5,'C.C','1025859658','Ernesto Gutierrez','3203103525','ernie@gmail.com','cll 45 # 10-47','Archivado','2023-06-01','2023-06-04'),(6,'C.C','156387','Maria Sanchez','3657854625','agusto@gmail.com','cll 56#98-45','Activo','2023-06-08','2023-06-14'),(7,'C.C','2222222222','Carlos Schick','7896541254','lkaro@gmail.com','cll 5#98-45','Activo','2023-01-03','2023-05-17'),(13,'C.C','123','Mariana Borda','3236587979','Mariana@hotmail.com','cr 23 # 125#98','Activo','2023-03-02','2023-03-03'),(14,'C.C','2365','Ayane Hayabusa','878965412','ayane@hotmail.com','cll 123# 78-41','Activo','2023-01-10','2023-06-07'),(15,'C.E','9863','Isabella Montana','9547893652','isabella@gmail.com','cll 127 # 98-85','Activo','2022-01-04','2023-01-10'),(16,'C.C','151236','Daniela Flor','3196523632','dannylaguadoflor@gmail.com','cll 148 # 98-40','Activo','2022-12-02','2023-04-07'),(17,'C.C','589','Maria Reyes','3231039856','maria.r@gmail.com','cll 145 # 108-63','Activo','2022-07-09','2023-03-18'),(18,'C.C','698','Yolanda Tellez','3216549898','y.165@aol.com','cll159#10-29','Activo','2023-06-10','2023-06-18'),(19,'C.E','56','Tina Lovecraft','9548961245','tina@gmail.com','cll 36#69-89','Activo','2023-04-05','2023-06-06'),(20,'','','','','','','','0000-00-00','0000-00-00');

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nitEmpresa` varchar(20) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `telefonoEmpresa` varchar(20) NOT NULL,
  `correoEmpresa` varchar(100) NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  UNIQUE KEY `nitEmpresa` (`nitEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `empresa` */

insert  into `empresa`(`idEmpresa`,`nitEmpresa`,`nombreEmpresa`,`telefonoEmpresa`,`correoEmpresa`) values (1,'52142526','Bitsplay','3102209911','bitsplay@gmail.com');

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fechaFactura` date NOT NULL,
  `impuestoTotal` decimal(10,0) NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `valorTotalFactura` decimal(10,0) NOT NULL,
  `empresa_idEmpresa` int(11) NOT NULL DEFAULT 1,
  `cliente_idCliente` int(11) NOT NULL,
  `estadoFactura` varchar(20) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`idFactura`),
  KEY `cliente_idCliente` (`cliente_idCliente`),
  KEY `empresa_idEmpresa` (`empresa_idEmpresa`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AVG_ROW_LENGTH=45;

/*Data for the table `factura` */

insert  into `factura`(`idFactura`,`fechaFactura`,`impuestoTotal`,`subTotal`,`valorTotalFactura`,`empresa_idEmpresa`,`cliente_idCliente`,`estadoFactura`) values (1,'2023-05-17',10000,50000,60000,1,1,'Pendiente'),(2,'2023-05-17',15000,60000,75000,1,2,'pago'),(3,'2023-05-17',50000,500000,550000,1,3,'Pendiente'),(4,'2023-05-17',30000,100000,130000,1,4,'Pendiente'),(6,'2023-03-12',7000,15000,22000,1,13,'Pendiente'),(7,'2023-04-12',6000,21000,27000,1,13,'Pendiente'),(8,'2023-05-12',6000,15000,21000,1,13,'Pendiente'),(9,'2023-02-12',5000,15000,20000,1,13,'Pendiente'),(10,'2023-05-22',70000,350000,420000,1,4,'Pendiente'),(11,'2023-02-13',7000,25000,32000,1,13,'Pendiente'),(12,'2023-06-29',20000,20000,40000,1,1,'Pendiente');

/*Table structure for table `factura_has_plan` */

DROP TABLE IF EXISTS `factura_has_plan`;

CREATE TABLE `factura_has_plan` (
  `idFactura_por_plan` int(11) NOT NULL AUTO_INCREMENT,
  `factura_idFactura` int(11) NOT NULL,
  `plan_idPlan` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idFactura_por_plan`),
  KEY `factura_idFactura` (`factura_idFactura`),
  KEY `plan_idPlan` (`plan_idPlan`),
  CONSTRAINT `factura_has_plan_ibfk_1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`),
  CONSTRAINT `factura_has_plan_ibfk_2` FOREIGN KEY (`plan_idPlan`) REFERENCES `plan` (`idPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `factura_has_plan` */

insert  into `factura_has_plan`(`idFactura_por_plan`,`factura_idFactura`,`plan_idPlan`,`cantidad`) values (1,1,1,1),(2,2,2,1),(3,3,4,2),(4,4,3,1);

/*Table structure for table `plan` */

DROP TABLE IF EXISTS `plan`;

CREATE TABLE `plan` (
  `idPlan` int(11) NOT NULL AUTO_INCREMENT,
  `codigoPlan` varchar(20) NOT NULL,
  `tipoPlan` varchar(20) DEFAULT NULL,
  `velocidad` varchar(20) NOT NULL,
  `nombrePlan` varchar(250) NOT NULL,
  `precioPlan` decimal(10,0) NOT NULL,
  `desPlan` varchar(2000) DEFAULT NULL,
  `estadoPlan` varchar(10) NOT NULL,
  PRIMARY KEY (`idPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `plan` */

insert  into `plan`(`idPlan`,`codigoPlan`,`tipoPlan`,`velocidad`,`nombrePlan`,`precioPlan`,`desPlan`,`estadoPlan`) values (1,'1','urbano','20mb','Plan economico',20000,'Plan económico de 20mb para la cuidad adecuada para casa pequeñas','Activo'),(2,'2','urbano','50mb','Plan dorado',70000,'EL plan dorado urbano es mucho mas rapido ideal para una familia completa, con fibra óptica, ofrece excelente velicidad de internet','Activo'),(3,'3','urbano','70mb','Plan diamante',100000,'Plan de alta velocidad para hogares','Activo'),(4,'4','empresarial','120mb','Plan empresa',120000,'Plan Ideal Para empresas pequeñas, por 120000 y de fibra optica puede alcanzar buenas velocidades','Activo'),(7,'5','urbano','5 mb','Plan Basico',50000,'EL plan rural Basico consta de 5 megas de navegación, se hace por medio de radiofrecuencia y es el plan que tiene mayor covertura, recomendado para personas que vivan muy alejadas o en sitios de dificil alcance.','Activo'),(8,'6','empresarial','150 mb','Plan elite empresa',150000,'Plan para empresas grande que requieran excelente velocidades de wifi, viene con fibra óptica','Archivado'),(9,'7','rural','10 mb','Plan Oro',65000,'Plan fibra optica rural, un plan con velocidades de internet más rapidas, para sitio rurales cerca a las cuidades más cercanas, toca validar disponibilidad','Activo');

/*Table structure for table `plan_cliente` */

DROP TABLE IF EXISTS `plan_cliente`;

CREATE TABLE `plan_cliente` (
  `idplan_cliente` int(10) NOT NULL AUTO_INCREMENT,
  `plan_idplan` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idplan_cliente`),
  KEY `plan_idplan` (`plan_idplan`),
  KEY `cliente_idcliente` (`cliente_idcliente`),
  CONSTRAINT `plan_cliente_ibfk_1` FOREIGN KEY (`plan_idplan`) REFERENCES `plan` (`idPlan`),
  CONSTRAINT `plan_cliente_ibfk_2` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `plan_cliente` */

insert  into `plan_cliente`(`idplan_cliente`,`plan_idplan`,`cliente_idcliente`) values (1,3,5),(2,4,13),(3,9,13),(4,4,5);

/*Table structure for table `pqr` */

DROP TABLE IF EXISTS `pqr`;

CREATE TABLE `pqr` (
  `idPqr` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePqr` enum('Peticion','Queja','Reclamo','Sugerencia','Recurso') NOT NULL DEFAULT 'Peticion',
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idPqr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pqr` */

insert  into `pqr`(`idPqr`,`nombrePqr`,`descripcion`) values (1,'Peticion','Solicitar una peticion por servicio prestado'),(2,'Queja','Realizar una queja por servicio prestado'),(3,'Reclamo','Realizar un reclamo por servicio'),(4,'Recurso','Solicitar recurso'),(5,'Sugerencia','Sugerencia o recomendacion a la empresa');

/*Table structure for table `pqr2` */

DROP TABLE IF EXISTS `pqr2`;

CREATE TABLE `pqr2` (
  `idPqr` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(10) DEFAULT NULL,
  `nDocumento` varchar(100) DEFAULT NULL,
  `nombresCliente` varchar(200) DEFAULT NULL,
  `telefonoCliente` varchar(20) DEFAULT NULL,
  `emailCliente` varchar(200) DEFAULT NULL,
  `tPqr` varchar(20) DEFAULT NULL,
  `desPqr` varchar(2000) DEFAULT NULL,
  `estadoPqr` varchar(100) DEFAULT 'Activo',
  `comentario` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idPqr`),
  KEY `idPqr` (`idPqr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pqr2` */

insert  into `pqr2`(`idPqr`,`tipoDocumento`,`nDocumento`,`nombresCliente`,`telefonoCliente`,`emailCliente`,`tPqr`,`desPqr`,`estadoPqr`,`comentario`) values (1,'C.C','36','Pastelito de fresa','5263695825','pastelito@gmail.com','Sugerencia','Tener mejores dispositivos y fibra óptica','Inactivo',NULL),(2,'C.E','25','Isabella Perez','6254782323','isaa@aol.com','Peticion','Quiero fibra optica en mi casa','Inactivo','No se pudo instalar fibra optica en su hogar porque no hay cobertura'),(3,'C.E','47','fabian schick','3195899457','ff@gmail.com','Peticion','Mejor velocidad en mi servicio','Activo',NULL),(4,'C.C','12363235','Carlos Rubiano','7859635874','cr56@aol.com','Sugerencia','Que los técnicos sean mas puntuales','Inactivo',NULL),(5,'C.C','1223456','Nicolas Borda','3443456','nico@correo.na','Reclamo','El internet me esta fallando constantemente y necesito un reembolso','Inactivo',NULL),(6,'C.C','75','Estefania','987563254','cristian.audir8@hotmail.com','Reclamo','Me llego mal el modem de internet','Activo',NULL);

/*Table structure for table `pqr_has_cliente` */

DROP TABLE IF EXISTS `pqr_has_cliente`;

CREATE TABLE `pqr_has_cliente` (
  `idPqr_por_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `pqr_idPqr` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `fechaPqr` date NOT NULL,
  `descripcionSolicitud` varchar(500) NOT NULL,
  `archivoPqr` blob DEFAULT NULL,
  PRIMARY KEY (`idPqr_por_Cliente`),
  KEY `pqr_idPqr` (`pqr_idPqr`),
  KEY `cliente_idCliente` (`cliente_idCliente`),
  CONSTRAINT `pqr_has_cliente_ibfk_1` FOREIGN KEY (`pqr_idPqr`) REFERENCES `pqr2` (`idPqr`),
  CONSTRAINT `pqr_has_cliente_ibfk_2` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pqr_has_cliente` */

insert  into `pqr_has_cliente`(`idPqr_por_Cliente`,`pqr_idPqr`,`cliente_idCliente`,`fechaPqr`,`descripcionSolicitud`,`archivoPqr`) values (1,1,3,'2023-05-11','Mal servicio de internet',NULL),(2,2,5,'2023-05-12','El tecnico no sabia nada',NULL),(3,5,2,'2023-05-14','Mejorar el sevicio rural',NULL);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(200) NOT NULL,
  `serialProducto` varchar(45) NOT NULL,
  `descripcionProducto` varchar(250) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `estadoProducto` varchar(20) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `serialProducto` (`serialProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombreProducto`,`serialProducto`,`descripcionProducto`,`cantidad`,`estadoProducto`) values (1,'Modem Asus','545784545','Modem Arris velocidad media fibra optica',5,'Activo'),(2,'Modem Mi','55448754','Modem Mii velocidad media',10,'Activo'),(3,'Modem MI','52144452','Modem Asus velocidad alta',10,'Activo'),(4,'Cables fibra optica','32525225','Cables fibra optica',5,'Activo'),(5,'Modem arris','5689','Modem Arris de fibra optica para alta velocidad',12,'Activo');

/*Table structure for table `producto_has_usuario` */

DROP TABLE IF EXISTS `producto_has_usuario`;

CREATE TABLE `producto_has_usuario` (
  `idProducto_por_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `fechaAsignacion` date NOT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idProducto_por_usuario`),
  KEY `usuario_idUsuario` (`usuario_idUsuario`),
  KEY `producto_idProducto` (`producto_idProducto`),
  CONSTRAINT `producto_has_usuario_ibfk_1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `producto_has_usuario_ibfk_2` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `producto_has_usuario` */

insert  into `producto_has_usuario`(`idProducto_por_usuario`,`fechaAsignacion`,`producto_idProducto`,`usuario_idUsuario`) values (1,'2023-05-17',1,2),(2,'2023-05-17',2,3),(3,'2023-05-17',3,2);

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(45) NOT NULL,
  `descrpcionRol` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `rol` */

insert  into `rol`(`idRol`,`nombreRol`,`descrpcionRol`) values (1,'Administrativo','Administrativo - puede modificar todo el sistema'),(2,'Tecnico','Soporte tecnico'),(3,'Auxiliar','Acceso limitado al sistema');

/*Table structure for table `solicitudes` */

DROP TABLE IF EXISTS `solicitudes`;

CREATE TABLE `solicitudes` (
  `idSolicitud` int(50) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(50) DEFAULT NULL,
  `numeroDocumento` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estadoSolicitud` varchar(50) DEFAULT 'Activo',
  PRIMARY KEY (`idSolicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `solicitudes` */

insert  into `solicitudes`(`idSolicitud`,`tipoDocumento`,`numeroDocumento`,`nombres`,`telefono`,`email`,`estadoSolicitud`) values (1,'C.C','202','Estefania Flor','3195852323','este@gmail.com','Atendido'),(2,'C.E','963','Julian Hernandez','3692582365','juli@gmail.com','Atendido'),(3,'C.C','3654','Ayane Hayabusa','5893652121','ayane@hotmail.com','Atendido'),(4,'C.C','15263635','Kasumi Hayabusa','9549638521414','kasumi@gmail.com','Activo'),(5,'C.C','45','Helena Leau','9638525858','helena@yahoo.com','Atendido'),(6,'C.C','89','Fabian Quimbay','3258963254','helena@gmail.com','Activo');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` enum('TI','CC','CE','RC') NOT NULL DEFAULT 'CC',
  `documentoUsuario` varchar(20) NOT NULL,
  `nombresUsuario` varchar(100) NOT NULL,
  `telefonoUsuario` varchar(20) DEFAULT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `claveUsuario` varchar(150) NOT NULL,
  `estadoUsuario` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `creado` date NOT NULL,
  `ultimaActualizacion` date NOT NULL,
  `rol` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `documentoUsuario` (`documentoUsuario`,`telefonoUsuario`,`correoUsuario`),
  KEY `rol_idRol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`tipoDocumento`,`documentoUsuario`,`nombresUsuario`,`telefonoUsuario`,`correoUsuario`,`claveUsuario`,`estadoUsuario`,`creado`,`ultimaActualizacion`,`rol`) values (1,'','806554878','Karl S','3103209913','karl@gmail.com','123456','Activo','2023-05-10','2023-05-10','Administrador'),(2,'','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','123456','Activo','2023-05-11','2023-05-11','Tecnico'),(3,'','1030634046','nico','3006646485','nico@gmail.com','123456','Activo','2023-05-12','2023-05-12','Administrador'),(4,'','1020554483','Fabian Quimbay','3104552020','fabiancho@aol.com','123456','Activo','2023-05-13','2023-05-13','Tecnico');

/*Table structure for table `visitas` */

DROP TABLE IF EXISTS `visitas`;

CREATE TABLE `visitas` (
  `idVisita` int(10) NOT NULL AUTO_INCREMENT,
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
  `estadoVisita` varchar(100) DEFAULT 'Activo',
  PRIMARY KEY (`idVisita`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `visitas` */

insert  into `visitas`(`idVisita`,`documentoCliente`,`nombreCliente`,`telefonoCliente`,`emailCliente`,`direccionCliente`,`documentoTecnico`,`nombreTecnico`,`telefonoTecnico`,`emailTecnico`,`motivoVisita`,`diaVisita`,`estadoVisita`) values (1,'1055325484','Arnulfo Rodriguez','3005554878','arnulfo@gmail.com','cll 148 # 98-41','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','El modem no esta funcionando apropiadamente (internet lento)','2021-06-23','Activo'),(2,'123456789','Pepito Juares','3005556677','pepi@gmail.com','direccion perdida la de siempre23','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','Instalacion de plan','2023-06-27','Activo'),(3,'3334445555','Juanita Kremer','3005556678','juanita@gmail.com','calle 445 bis','1020554483','Fabian Quimbay','3104552020','fabiancho@aol.com','el servicio no esta funcionando','2023-06-29','Activo'),(4,'3334445555','Pepito Juares','3005556677','pepi@gmail.com','calle 4534 ewes','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','Otra vez el internet me esta fallando','2023-06-30','Eliminada');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
