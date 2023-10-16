/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS cinema_halls;
CREATE TABLE `cinema_halls` (
  `HallId` int NOT NULL AUTO_INCREMENT,
  `HallName` varchar(100) DEFAULT NULL,
  `SeatingCapacity` int DEFAULT NULL,
  PRIMARY KEY (`HallId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS movies;
CREATE TABLE `movies` (
  `MovieID` int NOT NULL AUTO_INCREMENT,
  `MovieTitle` varchar(100) DEFAULT NULL,
  `ReleaseYear` int DEFAULT NULL,
  `DurationMinutes` int DEFAULT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS showtime;
CREATE TABLE `showtime` (
  `ShowtimeId` int NOT NULL AUTO_INCREMENT,
  `ShowtimeDateTime` datetime DEFAULT NULL,
  `TicketPrice` int DEFAULT NULL,
  `HallID` int DEFAULT NULL,
  `MovieId` int DEFAULT NULL,
  PRIMARY KEY (`ShowtimeId`),
  KEY `HallID` (`HallID`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`HallID`) REFERENCES `cinema_halls` (`HallId`),
  CONSTRAINT `showtime_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS tickets;
CREATE TABLE `tickets` (
  `TicketId` int NOT NULL AUTO_INCREMENT,
  `SeatNumber` int DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `PurchaseDateTime` datetime DEFAULT NULL,
  `ShowTimeID` int DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `ShowTimeID` (`ShowTimeID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ShowTimeID`) REFERENCES `showtime` (`ShowtimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO cinema_halls(HallId,HallName,SeatingCapacity) VALUES('1','\'ADULTS\'','56'),('2','\'TEENS\'','45'),('3','\'KIDS\'','64'),('4','\'VIP\'','12');

INSERT INTO movies(MovieID,MovieTitle,ReleaseYear,DurationMinutes) VALUES('1','\'ShreK\'','2001','90'),('2','\'Deadpool\'','2016','93'),('4','\'Up\'','2009','101'),('6','\'Frozen\'','2013','110');

INSERT INTO showtime(ShowtimeId,ShowtimeDateTime,TicketPrice,HallID,MovieId) VALUES('1','\'2023-10-20 15:00:00\'','30','2','1'),('2','\'2023-10-21 19:00:00\'','50','1','2'),('3','\'2023-10-20 13:00:00\'','20','3','4');
INSERT INTO tickets(TicketId,SeatNumber,CustomerName,PurchaseDateTime,ShowTimeID) VALUES('1','1','\'Pedro\'','\'2023-10-18 10:32:40\'','1'),('2','2','\'Maria\'','\'2023-10-18 10:33:56\'','1'),('3','4','\'Pepito\'','\'2023-10-19 16:42:12\'','2'),('4','5','\'Jorgen\'','\'2023-10-29 16:44:55\'','2');