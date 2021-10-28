-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: MOVIEDATABASE
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.21.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ALIASES`
--

DROP TABLE IF EXISTS `ALIASES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALIASES` (
  `CREW_UID` int NOT NULL,
  `ALIAS` varchar(255) NOT NULL,
  PRIMARY KEY (`CREW_UID`,`ALIAS`),
  CONSTRAINT `ALIASES_ibfk_1` FOREIGN KEY (`CREW_UID`) REFERENCES `CREW` (`CREW_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALIASES`
--

LOCK TABLES `ALIASES` WRITE;
/*!40000 ALTER TABLE `ALIASES` DISABLE KEYS */;
INSERT INTO `ALIASES` VALUES (1,'JACK NICHOLSON'),(3,'TOM HANKS');
/*!40000 ALTER TABLE `ALIASES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AVAILABLE_ON`
--

DROP TABLE IF EXISTS `AVAILABLE_ON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AVAILABLE_ON` (
  `OTT_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`OTT_UID`,`MEDIA_UID`,`COUNTRY`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  CONSTRAINT `AVAILABLE_ON_ibfk_1` FOREIGN KEY (`OTT_UID`) REFERENCES `OTT` (`OTT_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AVAILABLE_ON_ibfk_2` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVAILABLE_ON`
--

LOCK TABLES `AVAILABLE_ON` WRITE;
/*!40000 ALTER TABLE `AVAILABLE_ON` DISABLE KEYS */;
INSERT INTO `AVAILABLE_ON` VALUES (1,1,'INDIA'),(1,1,'JAPAN'),(1,1,'U.K.'),(1,1,'U.S.A'),(2,1,'INDIA'),(2,1,'JAPAN'),(2,1,'U.K.'),(2,1,'U.S.A'),(1,2,'INDIA'),(1,2,'JAPAN'),(1,2,'U.K.'),(1,2,'U.S.A'),(2,2,'INDIA'),(2,2,'JAPAN'),(2,2,'U.K.'),(2,2,'U.S.A'),(1,3,'INDIA'),(1,3,'JAPAN'),(1,3,'U.K.'),(1,3,'U.S.A'),(3,4,'INDIA'),(3,4,'JAPAN'),(3,4,'U.K.'),(3,4,'U.S.A'),(1,5,'INDIA'),(1,5,'JAPAN'),(1,5,'U.K.'),(1,5,'U.S.A'),(1,6,'INDIA'),(1,6,'JAPAN'),(1,6,'U.K.'),(1,6,'U.S.A');
/*!40000 ALTER TABLE `AVAILABLE_ON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWARDED_TO_CREW`
--

DROP TABLE IF EXISTS `AWARDED_TO_CREW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARDED_TO_CREW` (
  `AWARD_GIVING_ORGANIZATION_UID` int NOT NULL,
  `AWARD_CATEGORY_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  `CREW_UID` int NOT NULL,
  PRIMARY KEY (`AWARD_GIVING_ORGANIZATION_UID`,`AWARD_CATEGORY_UID`,`MEDIA_UID`,`CREW_UID`),
  KEY `AWARD_CATEGORY_UID` (`AWARD_CATEGORY_UID`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  KEY `CREW_UID` (`CREW_UID`),
  CONSTRAINT `AWARDED_TO_CREW_ibfk_1` FOREIGN KEY (`AWARD_GIVING_ORGANIZATION_UID`) REFERENCES `AWARD_GIVING_ORGANIZATION` (`AWARD_GIVING_ORGANIZATION_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDED_TO_CREW_ibfk_2` FOREIGN KEY (`AWARD_CATEGORY_UID`) REFERENCES `AWARD_CATEGORY` (`AWARD_CATEGORY_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDED_TO_CREW_ibfk_3` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDED_TO_CREW_ibfk_4` FOREIGN KEY (`CREW_UID`) REFERENCES `CREW` (`CREW_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARDED_TO_CREW`
--

LOCK TABLES `AWARDED_TO_CREW` WRITE;
/*!40000 ALTER TABLE `AWARDED_TO_CREW` DISABLE KEYS */;
INSERT INTO `AWARDED_TO_CREW` VALUES (1,3,2,3),(1,4,2,5),(1,5,2,6),(2,7,2,5),(2,8,2,3),(3,9,3,8),(4,10,3,7),(4,11,3,8);
/*!40000 ALTER TABLE `AWARDED_TO_CREW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWARDED_TO_MEDIA`
--

DROP TABLE IF EXISTS `AWARDED_TO_MEDIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARDED_TO_MEDIA` (
  `AWARD_GIVING_ORGANIZATION_UID` int NOT NULL,
  `AWARD_CATEGORY_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  PRIMARY KEY (`AWARD_GIVING_ORGANIZATION_UID`,`AWARD_CATEGORY_UID`,`MEDIA_UID`),
  KEY `AWARD_CATEGORY_UID` (`AWARD_CATEGORY_UID`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  CONSTRAINT `AWARDED_TO_MEDIA_ibfk_1` FOREIGN KEY (`AWARD_GIVING_ORGANIZATION_UID`) REFERENCES `AWARD_GIVING_ORGANIZATION` (`AWARD_GIVING_ORGANIZATION_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDED_TO_MEDIA_ibfk_2` FOREIGN KEY (`AWARD_CATEGORY_UID`) REFERENCES `AWARD_CATEGORY` (`AWARD_CATEGORY_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AWARDED_TO_MEDIA_ibfk_3` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARDED_TO_MEDIA`
--

LOCK TABLES `AWARDED_TO_MEDIA` WRITE;
/*!40000 ALTER TABLE `AWARDED_TO_MEDIA` DISABLE KEYS */;
INSERT INTO `AWARDED_TO_MEDIA` VALUES (1,1,2),(3,2,3),(2,6,2);
/*!40000 ALTER TABLE `AWARDED_TO_MEDIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWARD_CATEGORY`
--

DROP TABLE IF EXISTS `AWARD_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARD_CATEGORY` (
  `AWARD_CATEGORY_UID` int NOT NULL AUTO_INCREMENT,
  `AWARD_GIVING_ORGANIZATION_UID` int NOT NULL,
  `AWARD_CATEGORY_NAME` varchar(255) NOT NULL,
  `YEAR_AWARDED` year NOT NULL,
  PRIMARY KEY (`AWARD_CATEGORY_UID`,`AWARD_GIVING_ORGANIZATION_UID`),
  KEY `AWARD_GIVING_ORGANIZATION_UID` (`AWARD_GIVING_ORGANIZATION_UID`),
  CONSTRAINT `AWARD_CATEGORY_ibfk_1` FOREIGN KEY (`AWARD_GIVING_ORGANIZATION_UID`) REFERENCES `AWARD_GIVING_ORGANIZATION` (`AWARD_GIVING_ORGANIZATION_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARD_CATEGORY`
--

LOCK TABLES `AWARD_CATEGORY` WRITE;
/*!40000 ALTER TABLE `AWARD_CATEGORY` DISABLE KEYS */;
INSERT INTO `AWARD_CATEGORY` VALUES (1,1,'BEST PICTURE',1995),(2,3,'BEST DRAMA SERIES',2011),(3,1,'BEST ACTOR',1995),(4,1,'BEST DIRECTOR',1995),(5,1,'BEST ADAPTED SCREENPLAY',1995),(6,2,'BEST MOTION PICTURE - DRAMA',1995),(7,2,'BEST DIRECTOR',1995),(8,2,'BEST ACTOR - MOTION PICTURE DRAMA',1995),(9,3,'BEST SUPPORTING ACTOR',2011),(10,4,'OUTSTANDING LEAD ACTOR IN A MINISERIES OR MOVIE',2014),(11,4,'OUTSTANDING SUPPORTING ACTOR IN A MINISERIES OR MOVIE',2014);
/*!40000 ALTER TABLE `AWARD_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AWARD_GIVING_ORGANIZATION`
--

DROP TABLE IF EXISTS `AWARD_GIVING_ORGANIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AWARD_GIVING_ORGANIZATION` (
  `AWARD_GIVING_ORGANIZATION_UID` int NOT NULL AUTO_INCREMENT,
  `AWARD_GIVING_ORGANIZATION_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AWARD_GIVING_ORGANIZATION_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AWARD_GIVING_ORGANIZATION`
--

LOCK TABLES `AWARD_GIVING_ORGANIZATION` WRITE;
/*!40000 ALTER TABLE `AWARD_GIVING_ORGANIZATION` DISABLE KEYS */;
INSERT INTO `AWARD_GIVING_ORGANIZATION` VALUES (1,'ACADEMY AWARDS'),(2,'GOLDEN GLOBE AWARDS'),(3,'BAFTA'),(4,'EMMY AWARDS');
/*!40000 ALTER TABLE `AWARD_GIVING_ORGANIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BELONGS_TO_GENRE`
--

DROP TABLE IF EXISTS `BELONGS_TO_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BELONGS_TO_GENRE` (
  `MEDIA_UID` int NOT NULL,
  `GENRE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_UID`,`GENRE_NAME`),
  KEY `GENRE_NAME` (`GENRE_NAME`),
  CONSTRAINT `BELONGS_TO_GENRE_ibfk_1` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BELONGS_TO_GENRE_ibfk_2` FOREIGN KEY (`GENRE_NAME`) REFERENCES `GENRE` (`GENRE_NAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BELONGS_TO_GENRE`
--

LOCK TABLES `BELONGS_TO_GENRE` WRITE;
/*!40000 ALTER TABLE `BELONGS_TO_GENRE` DISABLE KEYS */;
INSERT INTO `BELONGS_TO_GENRE` VALUES (4,'ACTION'),(5,'ACTION'),(6,'ACTION'),(5,'ADVENTURE'),(6,'ADVENTURE'),(4,'COMEDY'),(3,'CRIME'),(1,'DRAMA'),(2,'DRAMA'),(3,'DRAMA'),(4,'DRAMA'),(4,'FANTASY'),(5,'FANTASY'),(6,'FANTASY'),(1,'HORROR'),(3,'MYSTERY'),(2,'ROMANCE'),(4,'SCI-FI'),(5,'SCI-FI'),(6,'SCI-FI'),(3,'THRILLER');
/*!40000 ALTER TABLE `BELONGS_TO_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COUNTRIES_RELEASED_IN`
--

DROP TABLE IF EXISTS `COUNTRIES_RELEASED_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COUNTRIES_RELEASED_IN` (
  `MEDIA_UID` int NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_UID`,`COUNTRY`),
  CONSTRAINT `COUNTRIES_RELEASED_IN_ibfk_1` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRIES_RELEASED_IN`
--

LOCK TABLES `COUNTRIES_RELEASED_IN` WRITE;
/*!40000 ALTER TABLE `COUNTRIES_RELEASED_IN` DISABLE KEYS */;
INSERT INTO `COUNTRIES_RELEASED_IN` VALUES (1,'FRANCE'),(1,'U.K.'),(1,'U.S.A'),(2,'U.S.A'),(3,'U.K'),(5,'CHINA'),(5,'JAPAN'),(5,'U.K'),(5,'U.S.A'),(6,'CHINA'),(6,'JAPAN'),(6,'U.K'),(6,'U.S.A');
/*!40000 ALTER TABLE `COUNTRIES_RELEASED_IN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREW`
--

DROP TABLE IF EXISTS `CREW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREW` (
  `CREW_UID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) NOT NULL,
  `MIDDLE_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `BIO` mediumtext,
  `BIRTH_DATE` date DEFAULT NULL,
  `DEATH_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CREW_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREW`
--

LOCK TABLES `CREW` WRITE;
/*!40000 ALTER TABLE `CREW` DISABLE KEYS */;
INSERT INTO `CREW` VALUES (1,'JOHN','JOSEPH','NICHOLSON','Jack Nicholson, an American actor, producer, director and screenwriter, is a three-time Academy Award winner and twelve-time nominee. Nicholson is also notable for being one of two actors - the other being Michael Caine - who have received an Oscar nomination in every decade from the \'60s through the \'00s.','1937-04-22',NULL),(2,'SHELLEY','ALEXIS','DUVALL','Shelley Alexis Duvall is an American retired actress, producer and television personality. Born in Texas, she began acting after being discovered by director Robert Altman, who was impressed with her upbeat presence, and cast her in the black comedy film Brewster McCloud (1970). Despite her hesitance towards becoming an actress, she continued to work with Altman, appearing in McCabe & Mrs. Miller (1971) and Thieves Like Us (1974). Her breakthrough came with Altman\'s cult film Nashville (1975), and she earned widespread acclaim with the thriller 3 Women (1977), also directed by Altman, for which she won the Cannes Film Festival Award for Best Actress and earned a nomination for the BAFTA Award for Best Actress in a Leading Role.','1949-07-07',NULL),(3,'THOMAS','JEFFREY','HANKS','Thomas Jeffrey Hanks is an American actor and filmmaker. Known for both his comedic and dramatic roles, he is one of the most popular and recognizable film stars worldwide, and is regarded as an American cultural icon. Hanks\'s films have grossed more than $4.9 billion in North America and more than $9.96 billion worldwide, making him the fourth-highest-grossing actor in North America.','1956-07-09',NULL),(4,'ROBIN','GAYLE','WRIGHT','Robin Gayle Wright is an American actress and director. She has won a Golden Globe Award and a Satellite Award, and has received eleven Emmy Award nominations for her work in television.','1966-04-08',NULL),(5,'ROBERT','LEE','ZEMECKIS','A whiz-kid with special effects, Robert is from the Spielberg camp of film-making (Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Robert\'s earlier films show he has a talent for zany comedy (Romancing the Stone (1984), 1941 (1979)) and special effect vehicles (Who Framed Roger Rabbit (1988) and Back to the Future (1985)). His later films have become more serious, with the hugely successful Tom Hanks vehicle Forrest Gump (1994) and the Jodie Foster film Contact (1997), both critically acclaimed movies. Again, these films incorporate stunning effects. Robert has proved he can work a serious story around great effects.','1951-05-14',NULL),(6,'ERIC',NULL,'ROTH','Eric R. Roth is an American screenwriter. He has been nominated five times for the Academy Award for Best Adapted Screenplay  for Forrest Gump (1994), The Insider (1999), Munich (2005), The Curious Case of Benjamin Button (2008), and A Star Is Born (2018)  winning for Forrest Gump. He also wrote the screenplay for the Oscar-nominated film Extremely Loud & Incredibly Close (2011) and Denis Villeneuve\'s Dune (2021). Roth also contributed to Martin Scorsese\'s upcoming film Killers of the Flower Moon.','1945-03-22',NULL),(7,'BENEDICT','TIMONTHY','CUMBERBATCH','BEST ACTOR EVER','1976-07-19',NULL),(8,'MARTIN','JOHN','FREEMAN','Martin John Christopher Freeman (born 8 September 1971) is an English actor. Among other accolades, he has won an Emmy Award, a BAFTA Award and a Screen Actors Guild Award, and has been nominated for a Golden Globe Award.','1971-09-08',NULL),(9,'MARK',NULL,'GATISS','Mark Gatiss is an English actor, comedian, screenwriter, director, producer and novelist. His work includes writing for and acting in the television series Doctor Who, Sherlock, and Dracula. Together with Reece Shearsmith, Steve Pemberton and Jeremy Dyson, he is a member of the comedy team The League of Gentlemen. He played Tycho Nestoris in the HBO series Game of Thrones.','1966-10-17',NULL),(10,'ELIZABETH','CHASE','OLSON','Elizabeth Chase Olsen is an American actress. Born in Sherman Oaks, California, Olsen began acting at age four. She starred in her debut film role in the thriller Martha Marcy May Marlene in 2011, for which she was acclaimed and nominated for a Critics\' Choice Movie Award among other accolades, followed by a role in the horror film Silent House. Olsen received a BAFTA Rising Star Award nomination and graduated from New York University two years later.','1989-02-16',NULL),(11,'PAUL',NULL,'BETTANY','Paul Bettany is an English actor. He is best known for portraying J.A.R.V.I.S. / Vision in the Marvel Cinematic Universe films Iron Man (2008), Iron Man 2 (2010), The Avengers (2012), Iron Man 3 (2013), Avengers: Age of Ultron (2015), Captain America: Civil War (2016) and Avengers: Infinity War (2018). He also played the character in two Disney+ shows: the miniseries WandaVision (2021), where he was nominated for a Primetime Emmy Award for Outstanding Lead Actor in a Limited or Anthology Series or Movie, and the animated series What If...? (2021).','1971-05-27',NULL),(12,'MATT',NULL,'SHAKMAN','Matt Shakman is an American film, television, and theatre director, and former child actor. He produced and directed WandaVision and has helmed episodes of The Great, It\'s Always Sunny in Philadelphia, Fargo and Game of Thrones. He is the artistic director of the Geffen Playhouse in Los Angeles, California.','1975-08-08',NULL),(13,'GEORGE','WALTON','LUCAS','George Walton Lucas Jr. is an American film director, producer, screenwriter, and entrepreneur. Lucas is best known for creating the Star Wars and Indiana Jones franchises and founding Lucasfilm, Lucasfilm Games, and Industrial Light & Magic. He served as chairman of Lucasfilm before selling it to The Walt Disney Company in 2012. Lucas is one of history\'s most financially successful filmmakers and has been nominated for four Academy Awards. His films are among the 100 highest-grossing movies at the North American box office, adjusted for ticket-price inflation. Lucas is considered one of the most significant figures of the 20th-century New Hollywood movement, and a pioneer of the modern blockbuster.','1944-05-14',NULL);
/*!40000 ALTER TABLE `CREW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EPISODE`
--

DROP TABLE IF EXISTS `EPISODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EPISODE` (
  `TV_SERIES_UID` int NOT NULL,
  `SEASON_NUMBER` int NOT NULL,
  `EPISODE_NUMBER` int NOT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `DURATION` int DEFAULT NULL,
  PRIMARY KEY (`TV_SERIES_UID`,`SEASON_NUMBER`,`EPISODE_NUMBER`),
  CONSTRAINT `EPISODE_ibfk_1` FOREIGN KEY (`TV_SERIES_UID`, `SEASON_NUMBER`) REFERENCES `SEASON` (`TV_SERIES_UID`, `SEASON_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EPISODE`
--

LOCK TABLES `EPISODE` WRITE;
/*!40000 ALTER TABLE `EPISODE` DISABLE KEYS */;
INSERT INTO `EPISODE` VALUES (3,1,1,'2021-01-15',30),(3,1,2,'2021-01-15',37),(3,1,3,'2021-01-22',33),(3,1,4,'2021-01-29',35),(3,1,5,'2021-02-05',41),(3,1,6,'2021-02-12',38),(3,1,7,'2021-02-19',38),(3,1,8,'2021-02-26',46),(3,1,9,'2021-03-05',50),(4,1,1,'2010-07-25',88),(4,1,2,'2010-08-01',88),(4,1,3,'2010-08-08',89),(4,2,1,'2012-01-01',89),(4,2,2,'2012-01-08',88),(4,2,3,'2012-01-15',88),(4,3,1,'2014-01-01',86),(4,3,2,'2014-01-05',86),(4,3,3,'2014-01-12',89),(4,4,1,'2014-01-01',88),(4,4,2,'2014-01-08',89),(4,4,3,'2014-01-15',89);
/*!40000 ALTER TABLE `EPISODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILM`
--

DROP TABLE IF EXISTS `FILM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FILM` (
  `MEDIA_UID` int NOT NULL,
  `DURATION` int DEFAULT NULL,
  `BOX_OFFICE_EARNINGS` int DEFAULT NULL,
  `LINK_TO_TRAILER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MEDIA_UID`),
  CONSTRAINT `FILM_ibfk_1` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILM`
--

LOCK TABLES `FILM` WRITE;
/*!40000 ALTER TABLE `FILM` DISABLE KEYS */;
INSERT INTO `FILM` VALUES (1,146,47,'https://youtu.be/S014oGZiSdI'),(2,142,683,'https://youtu.be/bLvqoHBptjg'),(5,121,776,'https://youtu.be/gBKx63Y6rG4'),(6,140,868,'https://youtu.be/qIYyXcCwvKc');
/*!40000 ALTER TABLE `FILM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENRE`
--

DROP TABLE IF EXISTS `GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GENRE` (
  `GENRE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`GENRE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENRE`
--

LOCK TABLES `GENRE` WRITE;
/*!40000 ALTER TABLE `GENRE` DISABLE KEYS */;
INSERT INTO `GENRE` VALUES ('ACTION'),('ADVENTURE'),('COMEDY'),('CRIME'),('DRAMA'),('FANTASY'),('HORROR'),('MYSTERY'),('ROMANCE'),('SCI-FI'),('THRILLER');
/*!40000 ALTER TABLE `GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANGUAGES`
--

DROP TABLE IF EXISTS `LANGUAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LANGUAGES` (
  `MEDIA_UID` int NOT NULL,
  `MEDIA_LANGUAGE` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_UID`,`MEDIA_LANGUAGE`),
  CONSTRAINT `LANGUAGES_ibfk_1` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANGUAGES`
--

LOCK TABLES `LANGUAGES` WRITE;
/*!40000 ALTER TABLE `LANGUAGES` DISABLE KEYS */;
INSERT INTO `LANGUAGES` VALUES (1,'ENGLISH'),(1,'FRENCH'),(2,'ENGLISH'),(3,'ENGLISH'),(4,'ENGLISH'),(4,'FRENCH'),(4,'HINDI'),(5,'CHINESE'),(5,'ENGLISH'),(5,'JAPANESE'),(6,'CHINESE'),(6,'ENGLISH'),(6,'JAPANESE');
/*!40000 ALTER TABLE `LANGUAGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIKES`
--

DROP TABLE IF EXISTS `LIKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIKES` (
  `USER_UID` int NOT NULL,
  `GENRE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_UID`,`GENRE_NAME`),
  KEY `GENRE_NAME` (`GENRE_NAME`),
  CONSTRAINT `LIKES_ibfk_1` FOREIGN KEY (`USER_UID`) REFERENCES `USER` (`USER_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `LIKES_ibfk_2` FOREIGN KEY (`GENRE_NAME`) REFERENCES `GENRE` (`GENRE_NAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIKES`
--

LOCK TABLES `LIKES` WRITE;
/*!40000 ALTER TABLE `LIKES` DISABLE KEYS */;
INSERT INTO `LIKES` VALUES (3,'ADVENTURE'),(2,'DRAMA'),(2,'HORROR'),(1,'MYSTERY'),(3,'ROMANCE'),(1,'SCI-FI');
/*!40000 ALTER TABLE `LIKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDIA`
--

DROP TABLE IF EXISTS `MEDIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDIA` (
  `MEDIA_UID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `IS_ADULT` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  PRIMARY KEY (`MEDIA_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDIA`
--

LOCK TABLES `MEDIA` WRITE;
/*!40000 ALTER TABLE `MEDIA` DISABLE KEYS */;
INSERT INTO `MEDIA` VALUES (1,'THE SHINING',1,'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.'),(2,'FORREST GUMP',0,'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.'),(3,'SHERLOCK',0,'A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.'),(4,'WANDAVISION',0,'Blends the style of classic sitcoms with the MCU, in which Wanda Maximoff and Vision - two super-powered beings living their ideal suburban lives - begin to suspect that everything is not as it seems.'),(5,'Star Wars: Episode IV - A New Hope',0,'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.'),(6,'Star Wars: Episode III - Revenge of the Sith',0,'Three years into the Clone Wars, the Jedi rescue Palpatine from Count Dooku. As Obi-Wan pursues a new threat, Anakin acts as a double agent between the Jedi Council and Palpatine and is lured into a sinister plan to rule the galaxy.');
/*!40000 ALTER TABLE `MEDIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OTT`
--

DROP TABLE IF EXISTS `OTT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OTT` (
  `OTT_UID` int NOT NULL AUTO_INCREMENT,
  `OTT_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`OTT_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTT`
--

LOCK TABLES `OTT` WRITE;
/*!40000 ALTER TABLE `OTT` DISABLE KEYS */;
INSERT INTO `OTT` VALUES (1,'NETFLIX'),(2,'AMAZON PRIME VIDEO'),(3,'DISNEY+ HOTSTAR');
/*!40000 ALTER TABLE `OTT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREQUEL_SEQUEL`
--

DROP TABLE IF EXISTS `PREQUEL_SEQUEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PREQUEL_SEQUEL` (
  `PREQUEL_UID` int NOT NULL,
  `SEQUEL_UID` int NOT NULL,
  PRIMARY KEY (`PREQUEL_UID`,`SEQUEL_UID`),
  KEY `SEQUEL_UID` (`SEQUEL_UID`),
  CONSTRAINT `PREQUEL_SEQUEL_ibfk_1` FOREIGN KEY (`PREQUEL_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PREQUEL_SEQUEL_ibfk_2` FOREIGN KEY (`SEQUEL_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREQUEL_SEQUEL`
--

LOCK TABLES `PREQUEL_SEQUEL` WRITE;
/*!40000 ALTER TABLE `PREQUEL_SEQUEL` DISABLE KEYS */;
INSERT INTO `PREQUEL_SEQUEL` VALUES (6,5);
/*!40000 ALTER TABLE `PREQUEL_SEQUEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW` (
  `USER_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  `RATING` float NOT NULL,
  `REVIEW` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_UID`,`MEDIA_UID`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  CONSTRAINT `REVIEW_ibfk_1` FOREIGN KEY (`USER_UID`) REFERENCES `USER` (`USER_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REVIEW_ibfk_2` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REVIEW_chk_1` CHECK (((`RATING` <= 10) and (`RATING` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` VALUES (1,3,9.2,'Best TV show of all time for me.'),(2,5,8.3,'The best movie in the entire franchise but still OVERRATED!'),(3,2,5,'Dekhi nahi hai bas tp kar raha hoon');
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEASON`
--

DROP TABLE IF EXISTS `SEASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SEASON` (
  `TV_SERIES_UID` int NOT NULL,
  `SEASON_NUMBER` int NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`TV_SERIES_UID`,`SEASON_NUMBER`),
  CONSTRAINT `SEASON_ibfk_1` FOREIGN KEY (`TV_SERIES_UID`) REFERENCES `TV_SERIES` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEASON`
--

LOCK TABLES `SEASON` WRITE;
/*!40000 ALTER TABLE `SEASON` DISABLE KEYS */;
INSERT INTO `SEASON` VALUES (3,1,'2021-01-15','2021-03-05'),(4,1,'2010-07-25','2010-08-08'),(4,2,'2012-01-01','2012-01-15'),(4,3,'2014-01-01','2014-01-12'),(4,4,'2017-01-01','2017-01-15');
/*!40000 ALTER TABLE `SEASON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TO_WATCH`
--

DROP TABLE IF EXISTS `TO_WATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TO_WATCH` (
  `USER_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  PRIMARY KEY (`USER_UID`,`MEDIA_UID`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  CONSTRAINT `TO_WATCH_ibfk_1` FOREIGN KEY (`USER_UID`) REFERENCES `USER` (`USER_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TO_WATCH_ibfk_2` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TO_WATCH`
--

LOCK TABLES `TO_WATCH` WRITE;
/*!40000 ALTER TABLE `TO_WATCH` DISABLE KEYS */;
INSERT INTO `TO_WATCH` VALUES (1,1),(3,1),(2,2),(3,2),(1,3),(2,4),(3,4),(1,5),(3,5),(2,6),(3,6);
/*!40000 ALTER TABLE `TO_WATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TV_SERIES`
--

DROP TABLE IF EXISTS `TV_SERIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TV_SERIES` (
  `MEDIA_UID` int NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  PRIMARY KEY (`MEDIA_UID`),
  CONSTRAINT `TV_SERIES_ibfk_1` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TV_SERIES`
--

LOCK TABLES `TV_SERIES` WRITE;
/*!40000 ALTER TABLE `TV_SERIES` DISABLE KEYS */;
INSERT INTO `TV_SERIES` VALUES (3,'2021-01-15','2021-03-05'),(4,'2010-07-25','2017-01-15');
/*!40000 ALTER TABLE `TV_SERIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `USER_UID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) NOT NULL,
  `MIDDLE_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_UID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'SHREYAS','SANJAY','REVANKAR','shreyas.r@research.iiit.ac.in'),(2,'VEDANT','BHAVESH','PAREKH','vedant.p@research.iiit.ac.in'),(3,'TANMAY',NULL,'GOYAL','tanmay.g@research.iiit.ac.in');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_IN`
--

DROP TABLE IF EXISTS `WORKS_IN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKS_IN` (
  `CREW_UID` int NOT NULL,
  `MEDIA_UID` int NOT NULL,
  `PROFESSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CREW_UID`,`MEDIA_UID`),
  KEY `MEDIA_UID` (`MEDIA_UID`),
  CONSTRAINT `WORKS_IN_ibfk_1` FOREIGN KEY (`CREW_UID`) REFERENCES `CREW` (`CREW_UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WORKS_IN_ibfk_2` FOREIGN KEY (`MEDIA_UID`) REFERENCES `MEDIA` (`MEDIA_UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_IN`
--

LOCK TABLES `WORKS_IN` WRITE;
/*!40000 ALTER TABLE `WORKS_IN` DISABLE KEYS */;
INSERT INTO `WORKS_IN` VALUES (1,1,'ACTOR'),(2,1,'ACTOR'),(3,2,'ACTOR'),(4,2,'ACOTR'),(5,2,'DIRECTOR'),(6,2,'WRITER'),(7,3,'ACTOR'),(8,3,'ACTOR'),(9,3,'PRODUCER'),(10,4,'ACTOR'),(11,4,'ACTOR'),(12,4,'DIRECTOR'),(13,5,'DIRECTOR'),(13,6,'DIRECTOR');
/*!40000 ALTER TABLE `WORKS_IN` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26 15:40:04
