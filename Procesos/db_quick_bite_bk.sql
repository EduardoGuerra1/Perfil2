-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_quick_bite
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cliente_id` varchar(25) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('d7bfa4f7-d65d-11ee-9d3b-a','Juan','Pérez','1234567890','Calle 123'),('d7c06f9b-d65d-11ee-9d3b-a','María','Gómez','0987654321','Avenida Principal'),('d7c137f7-d65d-11ee-9d3b-a','Pedro','López','5555555555','Calle 456'),('d7c187b6-d65d-11ee-9d3b-a','Laura','García','6666666666','Avenida Central'),('d7c1d424-d65d-11ee-9d3b-a','Luis','Hernández','7777777777','Calle 789'),('d7c22816-d65d-11ee-9d3b-a','Ana','Martínez','8888888888','Avenida Sur'),('d7c287e9-d65d-11ee-9d3b-a','Sofía','Díaz','9999999999','Calle 1011'),('d7c2dde1-d65d-11ee-9d3b-a','Carlos','Ruiz','1010101010','Avenida Oeste'),('d7c332bb-d65d-11ee-9d3b-a','Elena','Sánchez','1212121212','Calle 1314'),('d7c38f31-d65d-11ee-9d3b-a','Diego','Torres','1414141414','Avenida Este'),('d7c3e131-d65d-11ee-9d3b-a','Lucía','Fernández','1616161616','Calle 1516'),('d7c42e22-d65d-11ee-9d3b-a','Andrés','Ramírez','1818181818','Avenida Norte'),('d7c48671-d65d-11ee-9d3b-a','Marta','Vargas','1919191919','Calle 1718'),('d7c4d2de-d65d-11ee-9d3b-a','Pablo','Moreno','2020202020','Avenida 1920'),('d7c51fc8-d65d-11ee-9d3b-a','Clara','Gutiérrez','2121212121','Calle 2021');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_pedido` (
  `detalle_id` varchar(25) NOT NULL,
  `pedido_id` varchar(25) NOT NULL,
  `producto_id` varchar(25) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `fK_detalle_pedido` (`pedido_id`),
  KEY `fk_detalle_producto` (`producto_id`),
  CONSTRAINT `fK_detalle_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`cantidad` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES ('1f3867aa-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f39e0ce-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3af880-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3b7442-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3bc477-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3c1a3b-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3c6c59-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3cc516-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3d32fc-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3dad67-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3dfef2-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3e551b-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3ea694-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3efa2a-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99),('1f3f52a7-d65e-11ee-9d3b-a','f8638f64-d65d-11ee-9d3b-a','d7cafd9d-d65d-11ee-9d3b-a',1,5.99,5.99);
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER borrar_existencia
AFTER INSERT
ON detalles_pedido
FOR EACH ROW
BEGIN
    DECLARE producto_id INT;
    DECLARE cantidad INT;
    SELECT producto_id, cantidad INTO producto_id, cantidad
    FROM detalles_pedido
    WHERE producto_id = NEW.producto_id; 
    UPDATE productos
    SET existencias = existencias - cantidad
    WHERE productos.producto_id = producto_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `empleado_id` varchar(25) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`empleado_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`salario` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('d7c58714-d65d-11ee-9d3b-a','Pedro','Martínez','Gerente','2024-02-28',3000.00),('d7c60053-d65d-11ee-9d3b-a','Ana','López','Cajero','2024-02-28',2000.00),('d7c65d13-d65d-11ee-9d3b-a','Luis','Gómez','Cocinero','2024-02-28',2500.00),('d7c6b3f7-d65d-11ee-9d3b-a','María','Hernández','Repartidor','2024-02-28',1800.00),('d7c711f7-d65d-11ee-9d3b-a','Juan','Díaz','Cajero','2024-02-28',2000.00),('d7c76788-d65d-11ee-9d3b-a','Laura','Ruiz','Cocinero','2024-02-28',2500.00),('d7c7b390-d65d-11ee-9d3b-a','Carlos','Sánchez','Repartidor','2024-02-28',1800.00),('d7c80a13-d65d-11ee-9d3b-a','Elena','Torres','Cajero','2024-02-28',2000.00),('d7c8938c-d65d-11ee-9d3b-a','Diego','Fernández','Cocinero','2024-02-28',2500.00),('d7c8e3f0-d65d-11ee-9d3b-a','Sofía','Ramírez','Repartidor','2024-02-28',1800.00),('d7c935f5-d65d-11ee-9d3b-a','Andrés','Vargas','Gerente','2024-02-28',3000.00),('d7c98a76-d65d-11ee-9d3b-a','Marta','Moreno','Cajero','2024-02-28',2000.00),('d7c9d911-d65d-11ee-9d3b-a','Pablo','Gutiérrez','Cocinero','2024-02-28',2500.00),('d7ca28cd-d65d-11ee-9d3b-a','Clara','Díaz','Repartidor','2024-02-28',1800.00),('d7ca77e1-d65d-11ee-9d3b-a','Lucía','Sánchez','Cajero','2024-02-28',2000.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `pedido_id` varchar(25) NOT NULL,
  `cliente_id` varchar(25) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'deshabilitado',
  `empleado_id` varchar(25) NOT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedido_cliente` (`cliente_id`),
  KEY `fk_pedido_empleado` (`empleado_id`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `fk_pedido_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`total` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES ('f8638f64-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8665eeb-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f866d708-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8672f9c-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8679374-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8680ff9-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8689460-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f868eb62-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f8694304-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f869a517-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f869ff4b-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f86a5e9b-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f86aad11-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f86b1c39-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a'),('f86b7233-d65d-11ee-9d3b-a','d7bfa4f7-d65d-11ee-9d3b-a','0000-00-00',5.99,'Enviada','d7c58714-d65d-11ee-9d3b-a');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `producto_id` varchar(25) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`precio` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`existencias` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('d7cafd9d-d65d-11ee-9d3b-a','Hamburguesa','Deliciosa hamburguesa con queso y tocino',5.99,100),('d7cb5425-d65d-11ee-9d3b-a','Pizza','Pizza de pepperoni y queso',8.50,50),('d7cbae2e-d65d-11ee-9d3b-a','Hot dog','Hot dog con salsa y aderezos',3.99,75),('d7cc06c6-d65d-11ee-9d3b-a','Sándwich de pollo','Sándwich de pollo a la parrilla con lechuga y tomate',6.50,60),('d7cc597b-d65d-11ee-9d3b-a','Ensalada César','Ensalada César con pollo a la parrilla y aderezo César',7.99,40),('d7ccade4-d65d-11ee-9d3b-a','Papas fritas','Papas fritas crujientes y doradas',2.50,90),('d7ccfed8-d65d-11ee-9d3b-a','Refresco cola','Refresco de cola en lata',1.99,200),('d7cd2df7-d65d-11ee-9d3b-a','Agua embotellada','Agua mineral embotellada',1.00,150),('d7cd98b1-d65d-11ee-9d3b-a','Nachos con queso','Nachos con salsa de queso caliente',4.99,80),('d7cde9aa-d65d-11ee-9d3b-a','Pollo frito','Pollo frito crujiente',9.99,30),('d7ce3bbb-d65d-11ee-9d3b-a','Sopa del día','Sopa casera del día',3.50,100),('d7ce6a5b-d65d-11ee-9d3b-a','Tacos al pastor','Tacos al pastor con piña y cilantro',10.50,25),('d7ceb982-d65d-11ee-9d3b-a','Pescado a la parrilla','Filete de pescado a la parrilla con limón',12.99,20),('d7cf0960-d65d-11ee-9d3b-a','Huevos rancheros','Huevos rancheros con salsa roja y tortillas',8.99,35),('d7cf5ba9-d65d-11ee-9d3b-a','Pastel de chocolate','Pastel de chocolate con crema batida',15.99,15);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 11:25:26
