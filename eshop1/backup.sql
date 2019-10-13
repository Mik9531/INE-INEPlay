-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: eshop1_development
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-05-06 13:54:40','2019-05-06 13:54:40');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (11,4,2,29.95,1,'2019-05-06 17:40:28','2019-05-06 17:40:28'),(12,6,2,9.95,1,'2019-05-06 17:40:32','2019-05-06 17:40:32');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2019-05-06 15:30:09','2019-05-06 15:30:09'),(2,'2019-05-06 17:01:04','2019-05-06 17:01:04');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` VALUES (1,'Ubisoft','2019-05-06 14:46:41','2019-05-06 14:46:41'),(2,'Activision','2019-05-06 14:46:47','2019-05-06 14:46:47'),(3,'Electronic Arts','2019-05-06 14:46:57','2019-05-06 14:46:57'),(4,'Bethesda','2019-05-06 14:47:04','2019-05-06 14:47:04'),(5,'Rockstar Games','2019-05-06 14:47:21','2019-05-06 14:47:21'),(6,'Valve','2019-05-06 14:47:26','2019-05-06 14:47:26'),(7,'Nintendo','2019-05-06 14:47:34','2019-05-06 14:47:34'),(8,'Capcom','2019-05-06 14:47:41','2019-05-06 14:47:41'),(9,'Sega','2019-05-06 14:47:46','2019-05-06 14:47:46'),(10,'Bandai Namco','2019-05-06 14:47:53','2019-05-06 14:47:53'),(11,'From Software','2019-05-06 14:56:46','2019-05-06 14:56:46'),(12,'Suda 51','2019-05-06 14:56:53','2019-05-06 14:56:53');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `developer_id` bigint(20) NOT NULL,
  `developed_at` datetime DEFAULT NULL,
  `blurb` text,
  `pegi` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cover_image_file_name` varchar(255) DEFAULT NULL,
  `cover_image_content_type` varchar(255) DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_games_developers` (`developer_id`),
  CONSTRAINT `fk_games_developers` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'The Division 2',1,'2019-02-08 14:57:00','h1. The Division 2\r\n# La esperada secuela del mejor tps de la historia\r\n** Disfruta descubriendo Washington.',18,59.95,'2019-05-06 14:59:50','2019-05-06 17:20:48','índice.jpeg','image/jpeg',10607,'2019-05-06 17:06:58'),(2,'Super Mario Oddisey',7,'2017-10-06 15:07:00','h1. El juego más esperado del fontanero.\r\n# Rescata a la princesa Peach.\r\n** Consigue derrotar a Bowser.',7,45,'2019-05-06 15:08:40','2019-05-06 17:21:16','índice.jpeg','image/jpeg',22791,'2019-05-06 17:10:47'),(3,'Sekiro: Shadows Die Twice',11,'2019-03-22 15:08:00','h1. El nuevo juego de From Software.\r\n# Sé el mejor shinobi\r\n** Consigue acabar con la maldición.',18,69.95,'2019-05-06 15:09:45','2019-05-06 17:21:40','images.jpeg','image/jpeg',8453,'2019-05-06 17:13:08'),(4,'Dark Souls 3',11,'2016-12-16 15:09:00','h1. El final de una épica trilogía.\r\n# Sé el mejor caballero de todos.\r\n** Prepárate a morir muchas veces.',16,29.95,'2019-05-06 15:10:25','2019-05-06 17:22:03','índice.jpeg','image/jpeg',9243,'2019-05-06 17:15:02'),(5,'Call of Duty: Black ops 4',2,'2018-09-02 04:10:00','h1. Otro año, lo mismo de siempre.\r\n# Sé el mejor en el multijugador.\r\n** Disfruta con su nuevo modo battleroyal.',18,49.95,'2019-05-06 15:12:49','2019-05-06 17:22:27','índice.jpeg','image/jpeg',9525,'2019-05-06 17:17:17'),(6,'Portal 2',6,'2014-10-29 21:11:00','h1. El mejor juego de puzles vuelve.\r\n# Haz muchos portales.\r\n** Nunca verás la tercera entrega.',12,9.95,'2019-05-06 15:14:17','2019-05-06 17:19:38','índice.jpeg','image/jpeg',10865,'2019-05-06 17:19:38'),(7,'GTA V',5,'2015-01-13 10:28:00','h1. El mejor juego de caminar.\r\n# Sé un buen vecino.\r\n** Consigue entablar amistad con todos.',18,29.95,'2019-05-06 15:15:13','2019-05-06 17:24:19','índice.jpeg','image/jpeg',14313,'2019-05-06 17:24:19'),(8,'FIFA 19',3,'2018-10-29 03:53:00','h1. El mejor juego de fútbol vuelve.\r\n# Haz el mejor equipo posible.\r\n** Dentro de unos meses saldrá el nuevo juego.',3,39.95,'2019-05-06 15:16:14','2019-05-06 17:25:43','índice.jpeg','image/jpeg',13774,'2019-05-06 17:25:43'),(9,'Nintendogs',7,'2014-09-01 13:06:00','h1. El mejor juego de cuidar perros.\r\n# Haz una gran familia canina.\r\n** Siempre estarán ahí aunque pasen 20 años.',3,4.95,'2019-05-06 15:17:17','2019-05-06 17:27:18','índice.jpeg','image/jpeg',9898,'2019-05-06 17:27:18'),(10,'Fallout 4',4,'2016-10-03 09:17:00','h1. El mejor juego de supervivencia vuelve.\r\n# Saquea toda una ciudad postapocaliptica.\r\n** No es tan bueno como Fallout 3.',16,24.95,'2019-05-06 15:18:24','2019-05-06 17:28:43','índice.jpeg','image/jpeg',11091,'2019-05-06 17:28:43'),(11,'Rayman Legends',1,'2015-08-27 08:19:00','h1. Disfruta de la nueva desventura de Rayman.\r\n# Una gran variedad de niveles.\r\n** Un modo cooperativo muy divertido.',7,14.95,'2019-05-06 15:20:12','2019-05-06 17:30:10','índice.jpeg','image/jpeg',12672,'2019-05-06 17:30:10'),(12,'Battlefield V',3,'2018-02-02 04:21:00','h1. El mejor juego de fps vuelve.\r\n# Una historia épica sobra la Segunda Guerra Mundial.\r\n** Un multijugador muy divertido y destructivo.',18,49.95,'2019-05-06 15:22:04','2019-05-06 17:31:52','índice.jpeg','image/jpeg',7552,'2019-05-06 17:31:52');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_suppliers`
--

DROP TABLE IF EXISTS `games_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games_suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_games_suppliers_suppliers` (`supplier_id`),
  KEY `fk_games_suppliers_games` (`game_id`),
  CONSTRAINT `fk_games_suppliers_games` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_games_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_suppliers`
--

LOCK TABLES `games_suppliers` WRITE;
/*!40000 ALTER TABLE `games_suppliers` DISABLE KEYS */;
INSERT INTO `games_suppliers` VALUES (1,1,1,'2019-05-06 14:59:50','2019-05-06 14:59:50'),(2,1,5,'2019-05-06 14:59:50','2019-05-06 14:59:50'),(3,2,2,'2019-05-06 15:08:40','2019-05-06 15:08:40'),(4,2,3,'2019-05-06 15:08:40','2019-05-06 15:08:40'),(5,2,10,'2019-05-06 15:08:40','2019-05-06 15:08:40'),(6,3,5,'2019-05-06 15:09:45','2019-05-06 15:09:45'),(7,3,11,'2019-05-06 15:09:45','2019-05-06 15:09:45'),(8,4,3,'2019-05-06 15:10:25','2019-05-06 15:10:25'),(9,4,4,'2019-05-06 15:10:25','2019-05-06 15:10:25'),(10,5,2,'2019-05-06 15:12:49','2019-05-06 15:12:49'),(11,6,7,'2019-05-06 15:14:17','2019-05-06 15:14:17'),(12,6,9,'2019-05-06 15:14:17','2019-05-06 15:14:17'),(13,6,11,'2019-05-06 15:14:17','2019-05-06 15:14:17'),(14,7,8,'2019-05-06 15:15:13','2019-05-06 15:15:13'),(15,7,9,'2019-05-06 15:15:13','2019-05-06 15:15:13'),(16,8,5,'2019-05-06 15:16:14','2019-05-06 15:16:14'),(17,8,6,'2019-05-06 15:16:15','2019-05-06 15:16:15'),(18,8,7,'2019-05-06 15:16:15','2019-05-06 15:16:15'),(19,9,1,'2019-05-06 15:17:17','2019-05-06 15:17:17'),(20,9,3,'2019-05-06 15:17:17','2019-05-06 15:17:17'),(21,10,3,'2019-05-06 15:18:24','2019-05-06 15:18:24'),(22,10,8,'2019-05-06 15:18:24','2019-05-06 15:18:24'),(23,10,9,'2019-05-06 15:18:24','2019-05-06 15:18:24'),(24,11,4,'2019-05-06 15:20:12','2019-05-06 15:20:12'),(25,12,4,'2019-05-06 15:22:04','2019-05-06 15:22:04'),(26,12,7,'2019-05-06 15:22:04','2019-05-06 15:22:04'),(27,12,10,'2019-05-06 15:22:04','2019-05-06 15:22:04');
/*!40000 ALTER TABLE `games_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_orders` (`order_id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,12,1,49.95,1,'2019-05-06 17:32:56','2019-05-06 17:32:56'),(2,9,1,4.95,1,'2019-05-06 17:32:56','2019-05-06 17:32:56'),(3,10,2,24.95,1,'2019-05-06 17:33:42','2019-05-06 17:33:42'),(4,10,3,24.95,1,'2019-05-06 17:33:52','2019-05-06 17:33:52'),(5,8,4,39.95,1,'2019-05-06 17:34:57','2019-05-06 17:34:57'),(6,4,5,29.95,1,'2019-05-06 17:36:44','2019-05-06 17:36:44'),(7,10,5,24.95,1,'2019-05-06 17:36:44','2019-05-06 17:36:44'),(8,2,6,45,1,'2019-05-06 17:37:44','2019-05-06 17:37:44'),(9,6,7,9.95,1,'2019-05-06 17:38:49','2019-05-06 17:38:49'),(10,6,8,9.95,1,'2019-05-06 17:39:02','2019-05-06 17:39:02'),(11,6,9,9.95,1,'2019-05-06 17:39:08','2019-05-06 17:39:08'),(12,9,10,4.95,1,'2019-05-06 17:40:16','2019-05-06 17:40:16'),(13,11,10,14.95,1,'2019-05-06 17:40:16','2019-05-06 17:40:16'),(14,4,11,29.95,1,'2019-05-06 17:41:14','2019-05-06 17:41:14'),(15,6,11,9.95,1,'2019-05-06 17:41:14','2019-05-06 17:41:14');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `ship_to_first_name` varchar(255) DEFAULT NULL,
  `ship_to_last_name` varchar(255) DEFAULT NULL,
  `ship_to_address` varchar(255) DEFAULT NULL,
  `ship_to_city` varchar(255) DEFAULT NULL,
  `ship_to_postal_code` varchar(255) DEFAULT NULL,
  `ship_to_country_code` varchar(255) DEFAULT NULL,
  `customer_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ineplay@outlook.es','666112233','George','Jackson','Green Sight','Seville','41000','ES','127.0.0.1','closed',NULL,'2019-05-06 17:32:56','2019-05-06 17:35:20'),(2,'ineplay@outlook.es','609876567','Miguel','Afán','Calle sin numero','Jerez','11032','ES','127.0.0.1','failed','This transaction has been declined','2019-05-06 17:33:42','2019-05-06 17:33:44'),(3,'ineplay@outlook.es','609876567','Miguel','Afán','Calle sin numero','Jerez','11032','ES','127.0.0.1','failed','An error occurred during processing. Call Merchant Service Provider','2019-05-06 17:33:52','2019-05-06 17:33:53'),(4,'ineplay@outlook.es','666112234','Chema','Lozanito','Calle Zaragoza','Chiclana','23634','ES','127.0.0.1','processed',NULL,'2019-05-06 17:34:57','2019-05-06 17:34:58'),(5,'ineplay@outlook.es','666112233','Miguel','Afán','La Puleva','Jerez','14235','ES','127.0.0.1','processed',NULL,'2019-05-06 17:36:44','2019-05-06 17:36:46'),(6,'ineplay@outlook.es','666112233','Claudio','León','Avenida Luperiz','Madrid','23634','ES','127.0.0.1','closed',NULL,'2019-05-06 17:37:44','2019-05-06 17:41:49'),(7,'ineplay@outlook.es','666112234','Mari','Conchi','Plaza del Rey','San Fernando','11100','ES','127.0.0.1','failed','Tarjeta de crédito no válida','2019-05-06 17:38:49','2019-05-06 17:38:49'),(8,'ineplay@outlook.es','666112234','Mari','Conchi','Plaza del Rey','San Fernando','11100','ES','127.0.0.1','failed','Tarjeta de crédito no válida','2019-05-06 17:39:02','2019-05-06 17:39:02'),(9,'ineplay@outlook.es','666112234','Mari','Conchi','Plaza del Rey','San Fernando','11100','ES','127.0.0.1','processed',NULL,'2019-05-06 17:39:08','2019-05-06 17:39:09'),(10,'ineplay@outlook.es','666112233','Manuel','Facio','El Luarte','Lugo','11045','ES','127.0.0.1','closed',NULL,'2019-05-06 17:40:16','2019-05-06 17:41:55'),(11,'ineplay@outlook.es','609876567','Paco','León','Calle Zaragoza','Puerto Real','11032','ES','127.0.0.1','failed','This transaction has been declined','2019-05-06 17:41:14','2019-05-06 17:41:15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190506120000'),('20190506120001'),('20190506120002'),('20190506120003'),('20190506120004'),('20190506120005'),('20190506120006'),('20190506120007'),('20190506120008');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Aitor','Tilla','2019-05-06 14:48:54','2019-05-06 14:48:54'),(2,'Elena','Nito del Bosque','2019-05-06 14:51:29','2019-05-06 14:51:29'),(3,'Aquiles','Bailo','2019-05-06 14:51:57','2019-05-06 14:51:57'),(4,'Aitor','Menta','2019-05-06 14:52:10','2019-05-06 14:52:10'),(5,'Pere','Gil','2019-05-06 14:52:38','2019-05-06 14:52:38'),(6,'Armando','Bronca','2019-05-06 14:52:53','2019-05-06 14:52:53'),(7,'Paca','Garte','2019-05-06 14:54:00','2019-05-06 14:54:00'),(8,'Helen','Chufe','2019-05-06 14:54:24','2019-05-06 14:54:24'),(9,'Susana','Torio','2019-05-06 14:54:44','2019-05-06 14:54:44'),(10,'Igor','Dito','2019-05-06 14:55:07','2019-05-06 14:55:07'),(11,'Estela','Gartija','2019-05-06 14:56:12','2019-05-06 14:56:12');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Miguel Afán','admin','ineplay@outlook.es','400$8$35$4c3223df0b6dd516$93beed3564a4ed89e0bd59681548c5bbe9354829429f22513ed07d910db6456f','PeI6u76VeCCQQzAsqHYK','793c0e832130e2c9fe9f844dd4fae89afaa20c0bfb1d1cc4a3e31045af6e1c4f945ba7b00ac5661d23291c8c0a0cc0855764a4ff252c15f75fecf082702f7adb','jN1Jbi7i4Hytg17LRBcl',2,0,'2019-05-06 17:42:11','2019-05-06 17:01:23','2019-05-06 14:46:23','127.0.0.1','127.0.0.1','2019-05-06 14:46:23','2019-05-06 17:42:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 19:57:41
