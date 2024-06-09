-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sbank
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(6) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `accno` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `LDATE` date DEFAULT NULL,
  `loanamount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jacob@gmail.com','123',NULL,NULL,NULL,NULL,0),('jacob@gmail.com','123',NULL,NULL,NULL,NULL,0),('nithya@gmail.com','$2a$08$YffVNJ4sivuGuUBolso6FORvEV4aYW93yrvMbPIe42rMIU3I5clrS','nithya',NULL,NULL,NULL,0),('karadi@gmail.com','$2a$08$f65ZJ9jLpgkidp6Id19/HuFK3W/pS5w5q/PvZn0JirTAhtl5WzLuS','karadi',NULL,NULL,NULL,0),('loki@gmail.com','$2a$08$CgE3bMhZn3RoT.TjNa240e6ngseL0SyePohTt0YUl2wUuQm36HCgi','loki','100',830,'2023-11-15',1500),('nanda@gmail.com','$2a$08$JmFjCWiYZnNWaScdJbfYlek64.F1ID8kknO.IIUcGwQfNXuSgsUfW','nanda','101',710,'2023-11-24',500),('mahesh@gmail.com','$2a$08$O0XvsLiLgRV5CVyR3iBQveM2XVDD79hzL5yUBU9r0NUb4nES31TJO','mahesh','102',500,'2023-12-29',20500),('manu@gmail.com','$2a$08$VI30N73hlCYuHajJCnL2Eepd2/LQPYHDwlhRL/./CdfeEKuLrggVC','manu','103',1560,'2025-01-15',2000),('admin@gmail.com','$2a$08$ucrMmvgRs0rtZPxgItpGPOcBGLZ6LySSQ4H/dNv9f0uu.2Lw0Wp4i','admin','0',0,NULL,0),('sid@gmail.com','$2a$08$UIWJAntSDn2rn8bzjCHCnOmojj6GGRQW2m5VkZYwZ1EtQYxRZo4RK','sid','105',590,NULL,0),('samuel@gmail.com','$2a$08$6xo/OXUz8DRU1NYaMmchuOS41kIOm/Pjfj0F98RmT3EOt.e6gI9Vu','samuel','107',20000,'2024-12-20',10000),('litty','$2a$08$V/rz8ynEDgMXmnzn3zgpDe54F4jLGyPaEH0w8LbcDd8v8MD6LJuV2','litty','108',4500,'2023-12-20',10000),('hel','$2a$08$Q/3tb6eD5wJ0YLIovft4M.6.OWXJikVB49ZosDqCZFxT46sqN6TRy','hel','110',44,NULL,0),('i@gm','$2a$08$OCu.LtMA/M0QkqxLaIBLZONosoFParsG5tBOw.THyIulkN6oQ291O','3r','123',123,NULL,0),('anil@gmail.com','$2a$08$ZfDRV.ttvZFih5mnIwrEaOxuUMj.hMUL5anari0jkANHUuTGwdSAm','anil','200',2000,NULL,0),('ajith@gmail.com','$2a$08$USZ6x5Jd9.F1ZRnycmNXquf9UI6iJ9pTnenC6wyMfnx/lNVR016m2','ajith','201',3000,NULL,0),('dev@gmail.com','$2a$08$KKzaAM6C89lmjqags8vujeU/zbirD/jkicXewZHKqbdoQf/AtXzri','dev','202',2300,NULL,0),('sachi@gmail.com','$2a$08$o54fWN.O4XhPvmsOztqQZOQ3bJupdHF5nOBm8pbrpFf59k/x63j8m','sachi','203',2280,NULL,0),('kannan@gmail.com','$2a$08$LzO4/otNB8LHQUu42qsLWuUyfhXV9x8DssFvSzPQM1X6bcta/nxby','kannan','204',3500,NULL,0),('geo@gmail.com','$2a$08$3RTKklhHsDYArpbntRKGgOxE5tNzwJR0TAz7cT.VzWkExOLJMbTry','geo','205',4000,NULL,0),('miya@gmail.com','$2a$08$L2T.G/aLpR3yXsjSRP1BH.gw7QFzi1jGTf9FgekTqa5kU.ZHRSMr6','miya','207',6000,'2024-01-27',700),('anu@gmail.com','$2a$08$ONQYxJYmg23bf6jh6J4Do.1qfx5FVfgU1t7YpxLikWeyuVtk9.X5y','anu','206',4589,NULL,0),('reno@gmail.com','$2a$08$bQAaJy9F88GAojxnP4eWV.o02VJms9pGdw7/aZZj83lS0usNM5HNC','reno','208',9876,NULL,0),('leo@gmail.com','$2a$08$zsYl0xrT9Ra8iyqTlAVB0uD1x10YDM6SpPp3D5atjDo.tr7jtxfl.','leo','209',1011,NULL,0);
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

-- Dump completed on 2024-06-09 12:32:00
