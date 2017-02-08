-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crossover_development
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-02-08 17:19:41','2017-02-08 17:19:41');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170203082043'),('20170203142823'),('20170204161308'),('20170204161739'),('20170207072317');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_requests`
--

DROP TABLE IF EXISTS `support_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `description` text,
  `closed_at` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_requests`
--

LOCK TABLES `support_requests` WRITE;
/*!40000 ALTER TABLE `support_requests` DISABLE KEYS */;
INSERT INTO `support_requests` VALUES (1,'Installation Error','I am having trouble installing Skype. How do I do that?',NULL,'open','low','installation_and_setup','2017-02-08 17:19:42','2017-02-08 17:19:42',1,4),(2,'Unclear Voice','The voice quality is not very good. Any way to improve it?','2017-02-08 17:19:42','closed','low','voice_quality','2017-02-08 17:19:42','2017-02-08 17:19:42',1,4),(3,'Blurred Video','The picture is blurred. Please help me out.',NULL,'open','low','video_quality','2017-02-08 17:19:42','2017-02-08 17:19:42',2,5);
/*!40000 ALTER TABLE `support_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) NOT NULL DEFAULT 'email',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tokens` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_uid_and_provider` (`uid`,`provider`) USING BTREE,
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'email','customer1@test.com','$2a$10$mhXy83tp21IXU6seJsZR5OW7l3RbHrZiiAY/tBj5NDnWzCoPCk6pS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:41',NULL,NULL,NULL,NULL,NULL,'customer1@test.com','{}','2017-02-08 17:19:41','2017-02-08 17:19:41','Customer'),(2,'email','customer2@test.com','$2a$10$rFnfsWWkpyOpv4zIdzjP6.vQLxh2r9WnxPWh/P0SgEq74VsT7Gtxm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:41',NULL,NULL,NULL,NULL,NULL,'customer2@test.com','{}','2017-02-08 17:19:41','2017-02-08 17:19:41','Customer'),(3,'email','customer3@test.com','$2a$10$bHtw3BpZ.TNFCuVdBf8b7eDZbC6H4Hmqi9VpxwJj3U8UYDiBZ4bw.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:41',NULL,NULL,NULL,NULL,NULL,'customer3@test.com','{}','2017-02-08 17:19:41','2017-02-08 17:19:41','Customer'),(4,'email','agent1@test.com','$2a$10$RubdzvrSF9ZeEIzu6XZi.uUcqjdhoICG6WQRpGgAHlHrwxWUgV.1i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:42',NULL,NULL,NULL,NULL,NULL,'agent1@test.com','{}','2017-02-08 17:19:42','2017-02-08 17:19:42','Agent'),(5,'email','agent2@test.com','$2a$10$CpS/e11doLYnY68aDGIUEuqxnCexWqi0lyty7m8gj4Ien.Edsn1MC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:42',NULL,NULL,NULL,NULL,NULL,'agent2@test.com','{}','2017-02-08 17:19:42','2017-02-08 17:19:42','Agent'),(6,'email','admin1@test.com','$2a$10$YUVRK1Sw5rln0YeJIRW5WO7ku25K9ZW4Ztj5TvZhJCBhPukBOJURm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:42',NULL,NULL,NULL,NULL,NULL,'admin1@test.com','{}','2017-02-08 17:19:42','2017-02-08 17:19:42','Admin'),(7,'email','admin2@test.com','$2a$10$8sbxRQBeO9iiTm/X20wE9.E/gfAdjEoRIFtK6ph63cTtiZ13Mj8tC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2017-02-08 17:19:42',NULL,NULL,NULL,NULL,NULL,'admin2@test.com','{}','2017-02-08 17:19:42','2017-02-08 17:19:42','Admin');
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

-- Dump completed on 2017-02-08 22:57:30
