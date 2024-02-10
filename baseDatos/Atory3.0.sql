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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`atory` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

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
  `plan_idPlan` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `documentoCliente` (`documentoCliente`),
  KEY `fk_plan_cliente` (`plan_idPlan`),
  CONSTRAINT `fk_cliente_factura` FOREIGN KEY (`idCliente`) REFERENCES `factura` (`cliente_idCliente`),
  CONSTRAINT `fk_plan_cliente` FOREIGN KEY (`plan_idPlan`) REFERENCES `plan` (`idPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idCliente`,`tipoDocumento`,`documentoCliente`,`nombreCliente`,`telefonoCliente`,`correoCliente`,`direccion`,`estadoCliente`,`creado`,`ultimaActualizacion`,`plan_idPlan`) values (1,'C.C','1055325484','Arnulfo Rodriguez','3005554878','arnulfo@gmail.com','cll 148 # 98-41','Archivado','2023-05-12','2023-05-17',1),(2,'C.C','1030525484','Blanca Cordero','3008562013','blanca@gmail.com','cr 5 #148 -13','Activo','2023-05-18','2023-05-18',2),(3,'C.C','1035585487','Carolina Crosby','3122254858','caro@gmail.com','cll 89 sur # 45-48','Activo','2023-05-17','2023-05-17',2),(4,'C.C','9587458','Diana Borges','3103404090','diana@gmail.com','cr 2 # 98-74','Activo','2023-05-17','2023-05-17',2),(5,'C.C','1025859658','Ernesto Gutierrez','3203103525','ernie@gmail.com','cll 45 # 10-47','Archivado','2023-06-01','2023-06-04',2),(6,'C.C','2121','Carlos Schick','300300300','lkaro@gmail.com','cll 5#98-45','Activo','2023-01-02','2023-05-16',1),(7,'C.C','123','Mariana Borda','3236587979','Mariana@hotmail.com','cr 23 # 125-66','Archivado','2023-03-01','2023-03-02',1),(8,'C.C','2365','Ayane Hayabusa','878965412','ayane@hotmail.com','cll 123# 78-41','Activo','2023-01-10','2023-06-07',1),(9,'C.E','9863','Isabella Montana','9547893652','isabella@gmail.com','cll 127 # 98-85','Activo','2022-01-04','2023-01-10',1),(10,'C.E','58944444','Maria Reyes','3231039856','maria.r@gmail.com','cll 145 # 108-63','Activo','2022-07-08','2023-03-17',3),(11,'C.C','698','Yolanda Tellez','3216549898','y.165@aol.com','cll159#10-29','Activo','2023-06-10','2023-06-18',4),(12,'C.E','56','Tina Lovecraft','9548961245','tina@gmail.com','cll 36#69-89','Activo','2023-04-05','2023-06-06',3),(13,'C.C','1012151563','Gabriela Castiblanco','3103656989','gaby@hotmail.com','km 5 via cota chia','Activo','2023-04-11','2023-05-28',3),(14,'C.C','789','Ana Maria Rosales','7893652123','maria@gmail.com','cll 13#140-75','Activo','2023-06-23','2023-06-23',2),(15,'C.C','2024','juanito alimaña','300886644','alimana@gmail.com','cll 34 # 20 20','Activo','2024-01-24','2024-01-24',7);

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fechaFactura` date NOT NULL,
  `impuestoTotal` decimal(10,0) NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `valorTotalFactura` decimal(10,0) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `estadoFactura` varchar(20) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`idFactura`),
  KEY `cliente_idCliente` (`cliente_idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AVG_ROW_LENGTH=45;

/*Data for the table `factura` */

insert  into `factura`(`idFactura`,`fechaFactura`,`impuestoTotal`,`subTotal`,`valorTotalFactura`,`cliente_idCliente`,`estadoFactura`) values (1,'2023-05-17',10000,50000,60000,1,'Pago'),(2,'2023-05-17',15000,60000,75000,2,'pago'),(3,'2023-05-17',50000,500000,550000,3,'Pago'),(4,'2023-05-16',30000,200000,130000,4,'Pago'),(6,'2023-03-12',7000,15000,22000,5,'Pendiente'),(7,'2023-04-12',6000,21000,27000,6,'Pendiente'),(8,'2023-05-12',6000,15000,21000,7,'Pendiente'),(9,'2023-02-12',5000,15000,20000,8,'Pendiente'),(10,'2023-05-22',70000,350000,420000,9,'Pago'),(11,'2023-02-13',7000,25000,32000,10,'Pendiente'),(12,'2023-06-29',20000,20000,40000,11,'Pago'),(15,'2023-01-09',6000,45000,51000,12,'Pendiente'),(17,'2023-03-30',90000,450000,54000,13,'Pendiente'),(18,'2023-02-10',100000,500000,600000,14,'Pendiente'),(19,'2022-12-17',50000,250000,30000,15,'Pendiente'),(21,'2022-11-25',85000,225000,310000,1,'Pendiente'),(22,'2023-01-18',6000,30000,36000,2,'Pendiente'),(25,'2023-03-09',20000,75000,95000,3,'Pendiente'),(26,'2023-06-18',15000,75000,90000,4,'Pendiente'),(27,'2023-06-30',7000,30000,37000,5,'Pendiente'),(28,'2024-02-05',50000,150000,200000,6,'Pendiente');

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

insert  into `plan`(`idPlan`,`codigoPlan`,`tipoPlan`,`velocidad`,`nombrePlan`,`precioPlan`,`desPlan`,`estadoPlan`) values (1,'1','rural','20mb','Plan economico',50000,'Plan económico de 20mb para la cuidad adecuada para casa pequeñas','Archivado'),(2,'2','urbano','50mb','Plan dorado',70000,'EL plan dorado urbano es mucho mas rapido ideal para una familia completa, con fibra óptica, ofrece excelente velicidad de internet','Activo'),(3,'3','urbano','70mb','Plan diamante',100000,'Plan de alta velocidad para hogares','Activo'),(4,'4','empresarial','120mb','Plan empresa',120000,'Plan Ideal Para empresas pequeñas, por 120000 y de fibra optica puede alcanzar buenas velocidades','Activo'),(5,'5','urbano','5 mb','Plan Basico',50000,'EL plan rural Basico consta de 5 megas de navegación, se hace por medio de radiofrecuencia y es el plan que tiene mayor covertura, recomendado para personas que vivan muy alejadas o en sitios de dificil alcance.','Activo'),(6,'6','empresarial','150 mb','Plan elite empresa',150000,'Plan para empresas grande que requieran excelente velocidades de wifi, viene con fibra óptica','Archivado'),(7,'7','urbano','10 mb','Plan dorado',65000,'Plan fibra optica rural, un plan con velocidades de internet más rapidas, para sitio rurales cerca a las cuidades más cercanas, toca validar disponibilidad','Activo');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pqr2` */

insert  into `pqr2`(`idPqr`,`tipoDocumento`,`nDocumento`,`nombresCliente`,`telefonoCliente`,`emailCliente`,`tPqr`,`desPqr`,`estadoPqr`,`comentario`) values (1,'C.C','36','Pastelito de fresa','5263695825','pastelito@gmail.com','Sugerencia','Tener mejores dispositivos y fibra óptica','Inactivo',NULL),(2,'C.E','25','Isabella Perez','6254782323','isaa@aol.com','Peticion','Quiero fibra optica en mi casa','Inactivo','No se pudo instalar fibra optica en su hogar porque no hay cobertura'),(3,'C.E','47','fabian schick','3195899457','ff@gmail.com','Peticion','Mejor velocidad en mi servicio','Activo','Modem en camino'),(4,'C.C','12363235','Carlos Rubiano','7859635874','cr56@aol.com','Sugerencia','Que los técnicos sean mas puntuales','Inactivo',NULL),(5,'C.C','1223456','Nicolas Borda','3443456','nico@correo.na','Reclamo','El internet me esta fallando constantemente y necesito un reembolso','Activo',NULL),(6,'C.C','75','Estefania','987563254','cristian.audir8@hotmail.com','Reclamo','Me llego mal el modem de internet','Activo',NULL),(7,'C.C','789','Ana Maria Rosales','7895632525','maria@gmail.com','Reclamo','EL modem de internet no esta trabajando correctamente','Activo','Servicio completado satisfactoriamente'),(8,'cc','1625898','Daniela FLor','3198965656','dd@gmail.com','Peticion','Solicito cables de modem','',''),(9,'C.C','965874','Gabriella Allende','3251456857','ga@hotmail.com','Reclamo','Internet intermitente constante',NULL,NULL),(10,'C.C','965874','Gabriella Allende','3251456857','ga@hotmail.com','Sugerencia','Ser mas rapidos en responder',NULL,NULL),(11,'C.C','1625898','Daniela FLor','3198965656','dd@gmail.com','Sugerencia','Buen servicio',NULL,NULL),(14,'','','2','','','','','',''),(15,'C.C','5656','Isabella Quimaby','3215698989','isabella@gmail.com','Peticion','reuqerimos cables de conexión',NULL,NULL),(16,'C.C','123456','Camilo gil','33333','cami@gmail.com','Peticion','El internet esta algo lento necesto un reembolso','','Resuelto'),(17,'C.C','111111111','Edubin','33333333','edubin@gmail.com','Reclamo','prueba sustentacion','','Resuelto'),(18,'C.C','123456','Camilo gil','33333','cami@gmail.com','Peticion','El internet esta algo lento prueba de estadooooooooo necesto un reembolso','','Resuelto'),(19,'C.C','123456','Daniela FLor','3333333','d@gmail.com','Peticion','dsdfsdf',NULL,NULL),(20,'C.C','789','Juan Torres','3105874596','juan@gmail.com','Reclamo','La factura me llego por mayor valor','Inactivo','mas a validar su solicitud');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombreProducto`,`serialProducto`,`descripcionProducto`,`cantidad`,`estadoProducto`) values (1,'Modem Asus','545784545','Modem Arris velocidad media fibra optica',5,'Activo'),(2,'Modem Mi alta velocidad','55448754','Modem Mii velocidad media',10,'Activo'),(3,'Modem MI','52144452','Modem Asus velocidad alta',10,'Activo'),(4,'Cables fibra optica','32525225','Cables fibra optica',5,'Inactivo'),(5,'Modem arris','5689','Modem Arris de fibra optica para alta velocidad',12,'Activo'),(6,'Cables de fibra optica','5289645s','Cables utilizados para instalaciones fibra óptica',60,'Activo'),(7,'modem Arris','3656','modem fobra optica',30,'Activo');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `solicitudes` */

insert  into `solicitudes`(`idSolicitud`,`tipoDocumento`,`numeroDocumento`,`nombres`,`telefono`,`email`,`estadoSolicitud`) values (1,'C.C','202','Estefania Flor','3195852323','este@gmail.com','Atendido'),(2,'C.E','963','Julian Hernandez','3692582365','juli@gmail.com','Atendido'),(3,'C.C','3654','Ayane Hayabusa','5893652121','ayane@hotmail.com','Atendido'),(4,'C.C','15263635','Kasumi Hayabusa','9549638521414','kasumi@gmail.com','Activo'),(5,'C.C','45','Helena Leau','9638525858','helena@yahoo.com','Atendido'),(6,'C.C','89','Fabian Quimbay','3258963254','helena@gmail.com','Activo'),(7,'C.C','789','Ana Maria Rosales','7893652123','maria@gmail.com','Activo'),(8,'C.C','3636','Juan Rodriguez','123456','juan@aol.com','Atendido'),(9,'C.C','56','Helena','7859635874','helena@gmail.com','Activo'),(10,'C.E','987','stephy gomez','3198988686','ste@gmail.com','Activo'),(11,'C.C','987654','juanito alimaña','300886644','alimana@gmail.com','Atendido');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumento` varchar(20) NOT NULL DEFAULT 'CC',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`tipoDocumento`,`documentoUsuario`,`nombresUsuario`,`telefonoUsuario`,`correoUsuario`,`claveUsuario`,`estadoUsuario`,`creado`,`ultimaActualizacion`,`rol`) values (1,'C.C','806554878','Karl','3103209913','karl@gmail.com','123456','Activo','2023-05-09','2023-05-09','Administrador'),(2,'C.C','1023554584','cris','3017328804','cristian@hotmail.com','123456','Activo','2023-05-10','2023-05-10','Administrador'),(3,'CC','1030634046','nico','3006646485','nico@gmail.com','123456','Activo','2023-05-12','2023-05-12','Administrador'),(4,'C.C','1020554483','Fabian','3104552020','fabiancho@aol.com','123456','Inactivo','2023-05-12','2023-05-12','Administrador'),(5,'C.C','23568985','Isa','3215698787','isabella@hotmail.com','123456','Activo','2023-11-05','0223-11-05','Tecnico'),(6,'C.C','1234','Danny','3198562323','danny@gmail.com','123456','Activo','2023-11-06','0223-11-06','Tecnico');

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

insert  into `visitas`(`idVisita`,`documentoCliente`,`nombreCliente`,`telefonoCliente`,`emailCliente`,`direccionCliente`,`documentoTecnico`,`nombreTecnico`,`telefonoTecnico`,`emailTecnico`,`motivoVisita`,`diaVisita`,`estadoVisita`) values (1,'1055325484','Arnulfo Rodriguez','3005554878','arnulfo@gmail.com','cll 148 # 98-50','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','El modem no esta funcionando apropiadamente (internet lento)','2021-06-22','Activo'),(2,'123456789','Pepito Juares','3005556677','pepi@gmail.com','direccion perdida la de siempre23','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','Instalacion de plan','2023-06-27','Atendida'),(3,'3334445555','Juanita Kremer','3005556678','juanita@gmail.com','calle 445 bis','1020554483','Fabian Quimbay','3104552020','fabiancho@aol.com','el servicio no esta funcionando','2023-06-29','Eliminada'),(4,'3334445555','Pepito Juares','3005556677','pepi@gmail.com','calle 4534 ewes','1023554584','Cristian Muñoz','3117322001','cristian@hotmail.com','Otra vez el internet me esta fallando','2023-06-30','Eliminada');

/* Procedure structure for procedure `x` */

/*!50003 DROP PROCEDURE IF EXISTS  `x` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `x`()
BEGIN
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
