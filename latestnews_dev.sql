-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: latestnews_development
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.10.1

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `resource_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$11$dkl9Q66m2bg.plP3TARCHuck66p/Zd.hQKmtGjIGiDOq7fdHe3QY2',NULL,NULL,NULL,2,'2016-05-08 09:18:00','2016-04-26 19:51:16','127.0.0.1','127.0.0.1','2016-04-26 16:28:54','2016-05-08 09:18:00');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_images`
--

DROP TABLE IF EXISTS `article_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_imgs` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_images`
--

LOCK TABLES `article_images` WRITE;
/*!40000 ALTER TABLE `article_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(9) NOT NULL,
  `subcategory_id` mediumint(9) NOT NULL,
  `tittle` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `article_link` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(15000) CHARACTER SET utf8 NOT NULL,
  `main_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_comments` tinyint(1) DEFAULT '1',
  `main_article` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count_comments` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_articles_on_article_link` (`article_link`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,1,1,'Category1 subcategory1 article1','category1subcategory1article1','<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Уже менш як за 10 років на дорогах з\'являться \"розумні\" електричні авто, які самі підбиратимуть і висаджуватимуть людей у потрібному місці та навіть зможуть доглядати самі за собою, вважає канадський програміст та розробник автомобілів-безпілотників Бред Темплтон. До Берліна він приїхав, щоб взяти участь у форумі американського Університету Унікальності (Singularity University). Це - бізнес-інкубатор з Кремнієвої долини, який пропонує освітні програми в галузі новітніх технологій, а також надає допомогу при створенні стартапів.</p>\r\n<p>Отже, на берлінському форумі, організованому Університетом Унікальності, йшлося про мобільність. У 2014 році лише в США загальний пробіг автомобілів склав 4 мільярди 740 мільйонів кілометрів. І далеко не всі поїздки були безпечними: позаторік 32 тисячі 675 людей загинули внаслідок ДТП. Ще більше - зазнали поранень.</p>\r\n<p>За даними Американської національної адміністрації з безпеки дорожнього руху, у 2014 році через таку кількість аварій 200 мільярдів доларів були сплачені у вигляді страхового відшкодування, ще 670 мільярдів доларів -назавжди втрачені внаслідок заподіяння шкоди здоров&rsquo;ю, втрати робочого часу, технічних пошкоджень, витрат на аварійно-рятувальні служби тощо. Таким чином \"традиційне\" авто є вкрай дорогим задоволенням.</p>\r\n<p>\"Автомобілі становлять серйозну загрозу для здоров&rsquo;я людей та довкілля, а аварії спричиняють величезні збитки\", - констатує Темплтон. На його думку, таку ситуацію можна змінити, якщо активніше розробляти безпілотні машини: \"Адже роботи не сідають за кермо напідпитку, їхні рефлекси з віком не стають повільнішими, як у людей, і вони не наламають дров на дорозі через власну недосвідченість. Вони кермуватимуть значно безпечніше, ніж люди\".</p>\r\n</body>\r\n</html>','e1bc5980f2357be891cd766206282aaf.jpg',1,1,'2016-04-20 00:00:00','2016-05-09 15:46:08',0),(2,1,1,'Category1 subcategory1 article2','c1s1a2','c1s1a2c1s1a2 c1s1a2','29e398ce4d0985b63c1ddb16e83cd6f5.jpg',1,0,'2016-04-20 00:00:00','2016-05-09 15:38:26',4),(3,1,1,'Category1 subcategory1 article3','c1s1a3','<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>c1s1a3c1s1a3 c1s1a3</p>\r\n</body>\r\n</html>','1.jpg',1,1,'2016-04-20 00:00:00','2016-05-09 15:37:25',2),(4,2,1,'Category2 subcategory1 article1','c2s1a1','c2s1a1c2s1a1 c2s1a1',NULL,1,0,'2016-04-20 00:00:00','2016-05-09 15:37:58',1),(5,2,1,'Category2 subcategory1 article2','c2s1a2','c2s1a2c2s1a2 c2s1a2',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(6,2,2,'Category2 subcategory2 article1','c2s2a1','c2s2a1c2s2a1 c2s2a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(7,2,2,'Category2 subcategory2 article2','c2s2a2','c2s2a2 c2s2a2 c2s2a2',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(8,2,3,'Category2 subcategory3 article1','c2s3a1','c2s3a1 c2s3a1 c2s3a1',NULL,1,0,'2016-04-20 00:00:00','2016-05-09 13:54:15',0),(9,2,3,'Category2 subcategory3 article2','c2s3a2','c2s3a2 c2s3a2 c2s3a2',NULL,1,0,'2016-04-20 00:00:00','0000-00-00 00:00:00',0),(10,2,4,'Category2 subcategory4 article1','c2s4a1','c2s4a1 c2s4a1 c2s4a1',NULL,1,0,'2016-04-20 00:00:00','0000-00-00 00:00:00',0),(11,2,4,'Category2 subcategory4 article2','c2s4a2','c2s4a2 c2s4a2 c2s4a2',NULL,1,0,'2016-04-20 00:00:00','0000-00-00 00:00:00',0),(12,2,5,'Category2 subcategory5 article1','c2s5a1','c2s5a1 c2s5a1 c2s5a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(13,2,5,'Category2 subcategory5 article2','c2s5a2','c2s5a2 c2s5a2 c2s5a2','6.jpg',1,0,'2016-04-20 00:00:00','2016-05-08 09:36:25',0),(14,3,1,'Category3 subcategory1 article1','c3s1a1','c3s1a1 c3s1a1 c3s1a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(15,3,1,'Category3 subcategory1 article2','c3s1a2','c3s1a2 c3s1a2 c3s1a2',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(16,3,2,'Category3 subcategory2 article1','c3s2a1','c3s2a1 c3s2a1 c3s2a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(17,3,2,'Category3 subcategory2 article2','c3s2a2','c3s2a2 c3s2a2 c3s2a2','2.jpg',1,0,'2016-04-20 00:00:00','2016-05-08 09:37:41',0),(18,4,13,'Category4 subcategory13 article1','c4s13a1','c4s13a1 c4s13a1 c4s13a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(19,4,13,'Category4 subcategory13 article2','c4s13a2','c4s13a2 c4s13a2 c4s13a2',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(20,4,14,'Category4 subcategory14 article1','c4s14a1','c4s14a1 c4s14a1 c4s14a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(21,4,15,'Category4 subcategory15 article1','c4s15a1','c4s15a1 c4s15a1 c4s15a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(22,4,15,'Category4 subcategory15 article2','c4s15a2','c4s15a2 c4s15a2 c4s15a2','3.jpg',1,0,'2016-04-20 00:00:00','2016-05-09 15:38:52',1),(23,5,8,'Category5 subcategory8 article1','c5s8a1','c5s8a1 c5s8a1 c5s8a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(24,5,8,'Category5 subcategory8 article2','c5s8a2','c5s8a2 c5s8a2 c5s8a2',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(25,5,9,'Category5 subcategory9 article1','c5s9a1','c5s9a1 c5s9a1 c5s9a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(26,5,10,'Category5 subcategory10 article1','c5s10a1','c5s10a1 c5s10a1 c5s10a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0),(27,5,11,'Category5 subcategory11 article1','c5s11a1','c5s11a1 c5s11a1 c5s11a1',NULL,1,0,'2016-04-20 00:00:00','2016-04-20 00:00:00',0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_link` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  `menu_show` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Політика','politics',1,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(2,'Економіка','economics',2,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(3,'Події','events',3,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(4,'Технології','tech',4,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(5,'Спорт','sport',5,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(6,'Культура','culture',6,1,'2016-04-20 00:00:00','2016-04-20 00:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catsubcategories`
--

DROP TABLE IF EXISTS `catsubcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catsubcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(9) NOT NULL,
  `subcategory_id` mediumint(9) NOT NULL,
  `menu_show` tinyint(1) DEFAULT '1',
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catsubcategories`
--

LOCK TABLES `catsubcategories` WRITE;
/*!40000 ALTER TABLE `catsubcategories` DISABLE KEYS */;
INSERT INTO `catsubcategories` VALUES (1,1,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(2,1,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(3,2,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(4,2,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(5,3,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(6,3,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(7,4,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(8,4,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(9,5,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(10,5,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(11,6,1,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(12,6,2,0,0,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(13,2,3,1,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(14,2,4,1,2,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(15,2,5,1,3,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(16,2,6,1,4,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(17,4,13,1,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(18,4,14,1,2,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(19,4,15,1,3,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(20,5,8,1,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(21,5,9,1,2,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(22,5,10,1,3,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(23,5,11,1,4,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(24,6,16,1,1,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(25,6,17,1,2,'2016-04-20 00:00:00','2016-04-20 00:00:00'),(26,6,18,1,3,'2016-04-20 00:00:00','2016-04-20 00:00:00');
/*!40000 ALTER TABLE `catsubcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (34,1,3,'1','2016-05-09 15:37:22','2016-05-09 15:37:22'),(35,1,3,'2','2016-05-09 15:37:25','2016-05-09 15:37:25'),(36,1,2,'3','2016-05-09 15:37:31','2016-05-09 15:37:31'),(37,1,2,'4','2016-05-09 15:37:34','2016-05-09 15:37:34'),(38,1,2,'5','2016-05-09 15:37:36','2016-05-09 15:37:36'),(39,1,4,'6','2016-05-09 15:37:58','2016-05-09 15:37:58'),(40,1,2,'7','2016-05-09 15:38:26','2016-05-09 15:38:26'),(41,1,22,'8','2016-05-09 15:38:52','2016-05-09 15:38:52');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160420100804'),('20160420100810'),('20160420100816'),('20160421171512'),('20160421180906'),('20160424210756'),('20160424210800'),('20160424215141'),('20160425195722'),('20160426161921');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subcategory_link` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Загальне','overall','2016-04-20 00:00:00','2016-04-20 00:00:00'),(2,'Інше','others','2016-04-20 00:00:00','2016-04-20 00:00:00'),(3,'Бізнес','business','2016-04-20 00:00:00','2016-04-20 00:00:00'),(4,'Податки','pdf','2016-04-20 00:00:00','2016-04-20 00:00:00'),(5,'Фінанси','finance','2016-04-20 00:00:00','2016-04-20 00:00:00'),(6,'Нерухомість','bld','2016-04-20 00:00:00','2016-04-20 00:00:00'),(7,'Авто','auto','2016-04-20 00:00:00','2016-04-20 00:00:00'),(8,'Футбол','football','2016-04-20 00:00:00','2016-04-20 00:00:00'),(9,'Баскетбол','basketball','2016-04-20 00:00:00','2016-04-20 00:00:00'),(10,'Бокс','box','2016-04-20 00:00:00','2016-04-20 00:00:00'),(11,'Футзал','futsal','2016-04-20 00:00:00','2016-04-20 00:00:00'),(12,'Автоспорт','autosport','2016-04-20 00:00:00','2016-04-20 00:00:00'),(13,'Гаджети','gadj','2016-04-20 00:00:00','2016-04-20 00:00:00'),(14,'Кібербезпека','cybersecurity','2016-04-20 00:00:00','2016-04-20 00:00:00'),(15,'Інновації','inno','2016-04-20 00:00:00','2016-04-20 00:00:00'),(16,'Кіно','cinema','2016-04-20 00:00:00','2016-04-20 00:00:00'),(17,'Музика','music','2016-04-20 00:00:00','2016-04-20 00:00:00'),(18,'Архітектура','arch','2016-04-20 00:00:00','2016-04-26 21:18:51');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_admin` tinyint(1) DEFAULT '0',
  `is_ban` tinyint(1) DEFAULT '0',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'denys92@mail.ua','$2a$11$v0niiCNvLD7B/yoK.XCzfeH7oC0V5HxqDELDpsiYOg2yMHMMRxCey',0,0,NULL,NULL,'2016-05-08 09:24:13',2,'2016-05-08 09:24:13','2016-04-26 19:50:39','127.0.0.1','127.0.0.1','2016-04-26 19:50:39','2016-05-08 09:24:13');
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

-- Dump completed on 2016-05-10 18:02:48
