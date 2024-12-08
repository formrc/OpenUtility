/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.32 : Database - openutility
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` VARCHAR(100),
  `avatar` VARCHAR(1024),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `water_electricity_bill` */

CREATE TABLE `water_electricity_bill` (
  `id` varchar(30) NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `days` int NOT NULL,
  `building` int NOT NULL,
  `dormitory` int NOT NULL,
  `electricity_usage` decimal(10,2) NOT NULL,
  `electricity_cost` decimal(10,2) NOT NULL,
  `water_usage` decimal(10,2) NOT NULL,
  `water_cost` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*Table structure for post */

CREATE TABLE `article` (
                        `articleId` varchar(30) NOT NULL,
                        `title` varchar(255) NOT NULL,
                        `content` text NOT NULL,
                        `authorId` varchar(30) NOT NULL,
                        `authorName` varchar(30) NOT NULL,
                        `desc` varchar(30) NOT NULL,
                        `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `likes` int DEFAULT 0,
                        `clicks` int DEFAULT 0,
                        PRIMARY KEY (`articleId`),
                        FOREIGN KEY (`authorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `comment` (
                        `commentId` varchar(30) NOT NULL,
                        `fatherId` varchar(30) NOT NULL,
                        `userId` varchar(30) NOT NULL,
                        `userName` varchar(50) NOT NULL,
                        `content` varchar(100) NOT NULL,
                        `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `likes` int DEFAULT 0,
                        `level` int NOT NULL,
                        PRIMARY KEY (`commentId`),
                        FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `favorite_article` (
                        `id` varchar(30) NOT NULL,
                        `articleId` varchar(30) NOT NULL,
                        `userId` varchar(30) NOT NULL,
                        FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
                        FOREIGN KEY (`articleId`) REFERENCES `article` (`articleId`),
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `favorite_comment` (
                        `id` varchar(30) NOT NULL,
                        `commentId` varchar(30) NOT NULL,
                        `userId` varchar(30) NOT NULL,
                        FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
                        FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`),
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
