-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: simu
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

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
-- Table structure for table `affectations_prof`
--

DROP TABLE IF EXISTS `affectations_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affectations_prof` (
  `id_affectation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_partie` int(10) unsigned NOT NULL,
  `id_professeur` int(10) unsigned NOT NULL,
  `nbre_groupe_prof` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_affectation`),
  KEY `affectations_id_partie_foreign` (`id_partie`),
  KEY `affectations_id_professeur_foreign` (`id_professeur`),
  CONSTRAINT `affectations_id_partie_foreign` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id_partie`),
  CONSTRAINT `affectations_id_professeur_foreign` FOREIGN KEY (`id_professeur`) REFERENCES `professeurs` (`id_professeur`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affectations_prof`
--

LOCK TABLES `affectations_prof` WRITE;
/*!40000 ALTER TABLE `affectations_prof` DISABLE KEYS */;
INSERT INTO `affectations_prof` VALUES (1,9962,2793,'1'),(2,9960,2793,'1'),(3,9966,2793,'1'),(4,9967,2793,'2'),(5,9968,2786,'3'),(6,9972,2786,'1'),(7,9974,2786,'2'),(8,9978,2809,'1'),(9,9980,2809,'2'),(10,9963,2809,'1'),(11,9979,2809,'1'),(12,9973,2809,'2'),(13,9961,2812,'2'),(14,9975,2812,'1'),(15,9976,2812,'2'),(16,9981,2812,'1'),(17,9980,2796,'1'),(18,9969,2796,'1'),(19,9970,2796,'2'),(20,9971,2796,'2'),(21,9964,2796,'1'),(22,9982,2785,'1'),(23,9982,2785,'1'),(24,9983,2785,'1'),(25,9979,2785,'1'),(26,9971,2785,'1'),(27,9974,2785,'1'),(28,9963,2791,'1'),(29,9977,2791,'1'),(30,9977,2791,'2'),(31,9983,2791,'2'),(32,9965,2791,'1'),(33,9965,2789,'1');
/*!40000 ALTER TABLE `affectations_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartenance_matiere`
--

DROP TABLE IF EXISTS `appartenance_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenance_matiere` (
  `id_matiere` int(11) NOT NULL,
  `id_sous_matiere` int(11) NOT NULL,
  KEY `id_sous_matiere` (`id_sous_matiere`),
  KEY `id_matiere` (`id_matiere`,`id_sous_matiere`) USING BTREE,
  CONSTRAINT `appartenance_matiere_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`),
  CONSTRAINT `appartenance_matiere_ibfk_2` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenance_matiere`
--

LOCK TABLES `appartenance_matiere` WRITE;
/*!40000 ALTER TABLE `appartenance_matiere` DISABLE KEYS */;
INSERT INTO `appartenance_matiere` VALUES (3700,3700),(3701,3701),(3702,3702),(3703,3703),(3704,3704),(3705,3705),(3706,3706),(3707,3707),(3708,3708);
/*!40000 ALTER TABLE `appartenance_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choix_etudiant`
--

DROP TABLE IF EXISTS `choix_etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix_etudiant` (
  `id_matiere` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  KEY `id_etu` (`id_etu`),
  KEY `id_matiere` (`id_matiere`,`id_etu`) USING BTREE,
  CONSTRAINT `choix_etudiants_ibfk_2` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  CONSTRAINT `choix_etudiants_ibfk_3` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix_etudiant`
--

LOCK TABLES `choix_etudiant` WRITE;
/*!40000 ALTER TABLE `choix_etudiant` DISABLE KEYS */;
INSERT INTO `choix_etudiant` VALUES (3700,26211),(3700,26212),(3700,26213),(3700,26214),(3700,26215),(3700,26216),(3700,26217),(3700,26218),(3700,26219),(3700,26220),(3700,26221),(3700,26222),(3700,26223),(3700,26224),(3700,26225),(3700,26226),(3700,26227),(3700,26228),(3700,26229),(3700,26230),(3700,26231),(3700,26232),(3700,26233),(3700,26234),(3700,26235),(3700,26236),(3700,26237),(3700,26238),(3700,26239),(3700,26240),(3700,26241),(3700,26242),(3700,26243),(3700,26244),(3700,26245),(3700,26246),(3700,26247),(3700,26248),(3700,26249),(3700,26250),(3700,26251),(3700,26252),(3700,26253),(3700,26254),(3700,26255),(3700,26256),(3700,26257),(3700,26258),(3700,26259),(3700,26260),(3701,26211),(3701,26212),(3701,26213),(3701,26214),(3701,26215),(3701,26216),(3701,26217),(3701,26218),(3701,26219),(3701,26220),(3701,26221),(3701,26222),(3701,26223),(3701,26224),(3701,26225),(3701,26226),(3701,26227),(3701,26228),(3701,26229),(3701,26230),(3701,26231),(3701,26232),(3701,26233),(3701,26234),(3701,26235),(3701,26236),(3701,26237),(3701,26238),(3701,26239),(3701,26240),(3701,26241),(3701,26242),(3701,26243),(3701,26244),(3701,26245),(3701,26246),(3701,26247),(3701,26248),(3701,26249),(3701,26250),(3701,26251),(3701,26252),(3701,26253),(3701,26254),(3701,26255),(3701,26256),(3701,26257),(3701,26258),(3701,26259),(3701,26260),(3702,26211),(3702,26212),(3702,26213),(3702,26214),(3702,26215),(3702,26216),(3702,26217),(3702,26218),(3702,26219),(3702,26220),(3702,26221),(3702,26222),(3702,26223),(3702,26224),(3702,26225),(3702,26226),(3702,26227),(3702,26228),(3702,26229),(3702,26230),(3702,26231),(3702,26232),(3702,26233),(3702,26234),(3702,26235),(3702,26236),(3702,26237),(3702,26238),(3702,26239),(3702,26240),(3702,26241),(3702,26242),(3702,26243),(3702,26244),(3702,26245),(3702,26246),(3702,26247),(3702,26248),(3702,26249),(3702,26250),(3702,26251),(3702,26252),(3702,26253),(3702,26254),(3702,26255),(3702,26256),(3702,26257),(3702,26258),(3702,26259),(3702,26260),(3703,26211),(3703,26212),(3703,26213),(3703,26214),(3703,26215),(3703,26216),(3703,26217),(3703,26218),(3703,26219),(3703,26220),(3703,26221),(3703,26222),(3703,26223),(3703,26224),(3703,26225),(3703,26226),(3703,26227),(3703,26228),(3703,26229),(3703,26230),(3703,26231),(3703,26232),(3703,26233),(3703,26234),(3703,26235),(3703,26236),(3703,26237),(3703,26238),(3703,26239),(3703,26240),(3703,26241),(3703,26242),(3703,26243),(3703,26244),(3703,26245),(3703,26246),(3703,26247),(3703,26248),(3703,26249),(3703,26250),(3703,26251),(3703,26252),(3703,26253),(3703,26254),(3703,26255),(3703,26256),(3703,26257),(3703,26258),(3703,26259),(3703,26260),(3704,26211),(3704,26212),(3704,26213),(3704,26214),(3704,26215),(3704,26216),(3704,26217),(3704,26218),(3704,26219),(3704,26220),(3704,26221),(3704,26222),(3704,26223),(3704,26224),(3704,26225),(3704,26226),(3704,26227),(3704,26228),(3704,26229),(3704,26230),(3704,26231),(3704,26232),(3704,26233),(3704,26234),(3704,26235),(3704,26236),(3704,26237),(3704,26238),(3704,26239),(3704,26240),(3704,26241),(3704,26242),(3704,26243),(3704,26244),(3704,26245),(3704,26246),(3704,26247),(3704,26248),(3704,26249),(3704,26250),(3704,26251),(3704,26252),(3704,26253),(3704,26254),(3704,26255),(3704,26256),(3704,26257),(3704,26258),(3704,26259),(3704,26260),(3705,26211),(3705,26212),(3705,26213),(3705,26214),(3705,26215),(3705,26216),(3705,26217),(3705,26218),(3705,26219),(3705,26220),(3705,26221),(3705,26222),(3705,26223),(3705,26224),(3705,26225),(3705,26226),(3705,26227),(3705,26228),(3705,26229),(3705,26230),(3705,26231),(3705,26232),(3705,26233),(3705,26234),(3705,26235),(3705,26236),(3705,26237),(3705,26238),(3705,26239),(3705,26240),(3705,26241),(3705,26242),(3705,26243),(3705,26244),(3705,26245),(3705,26246),(3705,26247),(3705,26248),(3705,26249),(3705,26250),(3705,26251),(3705,26252),(3705,26253),(3705,26254),(3705,26255),(3705,26256),(3705,26257),(3705,26258),(3705,26259),(3705,26260),(3706,26211),(3706,26212),(3706,26213),(3706,26214),(3706,26215),(3706,26216),(3706,26217),(3706,26218),(3706,26219),(3706,26220),(3706,26221),(3706,26222),(3706,26223),(3706,26224),(3706,26225),(3706,26226),(3706,26227),(3706,26228),(3706,26229),(3706,26230),(3706,26231),(3706,26232),(3706,26233),(3706,26234),(3706,26235),(3706,26236),(3706,26237),(3706,26238),(3706,26239),(3706,26240),(3706,26241),(3706,26242),(3706,26243),(3706,26244),(3706,26245),(3706,26246),(3706,26247),(3706,26248),(3706,26249),(3706,26250),(3706,26251),(3706,26252),(3706,26253),(3706,26254),(3706,26255),(3706,26256),(3706,26257),(3706,26258),(3706,26259),(3706,26260),(3707,26211),(3707,26212),(3707,26213),(3707,26214),(3707,26215),(3707,26216),(3707,26217),(3707,26218),(3707,26219),(3707,26220),(3707,26221),(3707,26222),(3707,26223),(3707,26224),(3707,26225),(3707,26226),(3707,26227),(3707,26228),(3707,26229),(3707,26230),(3707,26231),(3707,26232),(3707,26233),(3707,26234),(3707,26235),(3707,26236),(3707,26237),(3707,26238),(3707,26239),(3707,26240),(3707,26241),(3707,26242),(3707,26243),(3707,26244),(3707,26245),(3707,26246),(3707,26247),(3707,26248),(3707,26249),(3707,26250),(3707,26251),(3707,26252),(3707,26253),(3707,26254),(3707,26255),(3707,26256),(3707,26257),(3707,26258),(3707,26259),(3707,26260),(3708,26211),(3708,26212),(3708,26213),(3708,26214),(3708,26215),(3708,26216),(3708,26217),(3708,26218),(3708,26219),(3708,26220),(3708,26221),(3708,26222),(3708,26223),(3708,26224),(3708,26225),(3708,26226),(3708,26227),(3708,26228),(3708,26229),(3708,26230),(3708,26231),(3708,26232),(3708,26233),(3708,26234),(3708,26235),(3708,26236),(3708,26237),(3708,26238),(3708,26239),(3708,26240),(3708,26241),(3708,26242),(3708,26243),(3708,26244),(3708,26245),(3708,26246),(3708,26247),(3708,26248),(3708,26249),(3708,26250),(3708,26251),(3708,26252),(3708,26253),(3708,26254),(3708,26255),(3708,26256),(3708,26257),(3708,26258),(3708,26259),(3708,26260);
/*!40000 ALTER TABLE `choix_etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choix_groupe`
--

DROP TABLE IF EXISTS `choix_groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix_groupe` (
  `id_etu` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  KEY `id_etu` (`id_etu`,`id_groupe`),
  KEY `choix_groupe_ibfk_2` (`id_groupe`),
  CONSTRAINT `choix_groupe_ibfk_1` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  CONSTRAINT `choix_groupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix_groupe`
--

LOCK TABLES `choix_groupe` WRITE;
/*!40000 ALTER TABLE `choix_groupe` DISABLE KEYS */;
INSERT INTO `choix_groupe` VALUES (26211,1799),(26212,1799),(26213,1799),(26214,1799),(26215,1799),(26216,1799),(26217,1799),(26218,1799),(26219,1799),(26220,1799),(26221,1799),(26222,1799),(26223,1799),(26224,1799),(26225,1799),(26226,1799),(26227,1799),(26228,1799),(26229,1799),(26230,1799),(26231,1800),(26232,1800),(26233,1800),(26234,1800),(26235,1800),(26236,1800),(26237,1800),(26238,1800),(26239,1800),(26240,1800),(26241,1800),(26242,1800),(26243,1800),(26244,1800),(26245,1800),(26246,1800),(26247,1800),(26248,1800),(26249,1800),(26250,1800),(26251,1801),(26252,1801),(26253,1801),(26254,1801),(26255,1801),(26256,1801),(26257,1801),(26258,1801),(26259,1801),(26260,1801);
/*!40000 ALTER TABLE `choix_groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8_bin NOT NULL,
  `id_partie` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partie` (`id_partie`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id_partie`)
) ENGINE=InnoDB AUTO_INCREMENT=3775 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (3739,'TP-ferqypdlxgsubznctjmkaiowh-1',9968),(3740,'TP-wrlumiaeypzosftkxhqdcbgjn-1',9971),(3741,'TP-frpxisdtzubkjmqgocwaehlny-1',9974),(3742,'TP-borplnmsdwqajzfchtixygeuk-1',9983),(3743,'TP-ptfqkozslnruxcjihygwdbmea-1',9977),(3744,'TP-tsokbhgzqrpdxwaufnjyliecm-1',9980),(3745,'TP-ferqypdlxgsubznctjmkaiowh-2',9968),(3746,'TP-wrlumiaeypzosftkxhqdcbgjn-2',9971),(3747,'TP-frpxisdtzubkjmqgocwaehlny-2',9974),(3748,'TP-borplnmsdwqajzfchtixygeuk-2',9983),(3749,'TP-ptfqkozslnruxcjihygwdbmea-2',9977),(3750,'TP-tsokbhgzqrpdxwaufnjyliecm-2',9980),(3751,'TD-sjcblkygathufwmrizpnqoxed-1',9961),(3752,'TD-nurtazbmqgpfowdelicyhxskj-1',9963),(3753,'TD-oqywznkxhligmptcjfurdsaeb-1',9965),(3754,'TD-ferqypdlxgsubznctjmkaiowh-1',9967),(3755,'TD-wrlumiaeypzosftkxhqdcbgjn-1',9970),(3756,'TD-frpxisdtzubkjmqgocwaehlny-1',9973),(3757,'TD-borplnmsdwqajzfchtixygeuk-1',9982),(3758,'TD-ptfqkozslnruxcjihygwdbmea-1',9976),(3759,'TD-tsokbhgzqrpdxwaufnjyliecm-1',9979),(3760,'TP-ferqypdlxgsubznctjmkaiowh-3',9968),(3761,'TP-wrlumiaeypzosftkxhqdcbgjn-3',9971),(3762,'TP-frpxisdtzubkjmqgocwaehlny-3',9974),(3763,'TP-borplnmsdwqajzfchtixygeuk-3',9983),(3764,'TP-ptfqkozslnruxcjihygwdbmea-3',9977),(3765,'TP-tsokbhgzqrpdxwaufnjyliecm-3',9980),(3766,'TD-sjcblkygathufwmrizpnqoxed-2',9961),(3767,'TD-nurtazbmqgpfowdelicyhxskj-2',9963),(3768,'TD-oqywznkxhligmptcjfurdsaeb-2',9965),(3769,'TD-ferqypdlxgsubznctjmkaiowh-2',9967),(3770,'TD-wrlumiaeypzosftkxhqdcbgjn-2',9970),(3771,'TD-frpxisdtzubkjmqgocwaehlny-2',9973),(3772,'TD-borplnmsdwqajzfchtixygeuk-2',9982),(3773,'TD-ptfqkozslnruxcjihygwdbmea-2',9976),(3774,'TD-tsokbhgzqrpdxwaufnjyliecm-2',9979);
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departements`
--

DROP TABLE IF EXISTS `departements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departements` (
  `id_departement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_departement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_departement` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_departement`),
  KEY `departements_responsable_departement_foreign` (`responsable_departement`),
  CONSTRAINT `departements_responsable_departement_foreign` FOREIGN KEY (`responsable_departement`) REFERENCES `professeurs` (`id_professeur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departements`
--

LOCK TABLES `departements` WRITE;
/*!40000 ALTER TABLE `departements` DISABLE KEYS */;
INSERT INTO `departements` VALUES (1,'DEPARTEMENT-INFORMATIQUE',NULL);
/*!40000 ALTER TABLE `departements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` enum('NORMAL','DA') COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL',
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26261 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (26211,'NORMAL','rlzfmsokwajgndqyxehcutbip','nicldugxjbopkaremtyhszqfw'),(26212,'NORMAL','aqdlmoiegzufckhysnpjbxrwt','mnshwbfepytzkdxjuqilgcrao'),(26213,'NORMAL','ipcjlongaktehmfqywzsbuxdr','erbiqlpghmkutxawjysfozdcn'),(26214,'NORMAL','sdfqtkbclozmpjyenrwuigahx','tcgdmyfkzuoepxjblqainwrhs'),(26215,'NORMAL','uojwqdkxbifhlmetrszgypacn','epnsmwglkazojryhuixbftcqd'),(26216,'NORMAL','pflkmicwnhorbaeztsgqxdjyu','nxcwspbroqmzkjyuitdfhelag'),(26217,'NORMAL','wxqudzkamjnolhtrcpbisfeyg','ktqwpfdajzxgiuhscyrlbomen'),(26218,'NORMAL','tljsbqhixudnoekwzfragcypm','cdpuxgboyhsqnkilmfrtjzaew'),(26219,'NORMAL','pzltuqrkhexjfnyigscawmdob','hjktbpamwsuldreigzxcnofqy'),(26220,'NORMAL','zmjbxrenclwqkuyfoaitgdpsh','bptjzyhqrlfexkiundogswacm'),(26221,'NORMAL','ujdcqxwilsrynfohaegbztkpm','goirwqzsaxeumbpftkjlhcnyd'),(26222,'NORMAL','umgezhfnqjacrdlwxopsbikyt','jsuptwyrdlqbekfhcaxnzgmio'),(26223,'NORMAL','yntekxobucqhzridmfpwlgjsa','uwjepszxfhagolbymqrtkcidn'),(26224,'NORMAL','umastqlengkwpcboyfxdhzrij','bwlxeucyspjngtfozqmhiarkd'),(26225,'NORMAL','sftcrkzuaewpmgjdlxyihqbon','twjuofsnqzmagixcpkderblhy'),(26226,'NORMAL','bdtmlyfzuicrwsgjhekaonqxp','cwaskifduotxmzyhnberqjplg'),(26227,'NORMAL','oaqgyfmedthklrzbwjnsipucx','ouxrezcdpgynwtfkhablsmjiq'),(26228,'NORMAL','egmfaqxwuptjiyhdsklcrznob','ucnqdlkaztpxoshmbfweyjirg'),(26229,'NORMAL','lodjkensthpqiyfmxbgzcuarw','aictsmohgnkebdyjpfwuxzqrl'),(26230,'NORMAL','hpdbnlyzckuxomsaitwqfrjeg','dfbpsnrhkizcwlotexyjmugaq'),(26231,'NORMAL','kbwimftqhlpxcznjsroyeadgu','cgiskryhztpbemfoujdlxqawn'),(26232,'NORMAL','mwktjrcqdufongzlapbesxiyh','ugbhlkqrjtcyedpozixamfwsn'),(26233,'NORMAL','tjlawiygcdouebzfxrhsnkmqp','bijywfgnochrkzqtaxpseludm'),(26234,'NORMAL','qasyrxuikgzwoepblcdftnhmj','cbkxznsyrawmjiuhtlqfpodge'),(26235,'NORMAL','yropnitfmlagjbzqucwskxehd','nsxqrmjbwldofpgkctiheazyu'),(26236,'NORMAL','nhsacotxewipfdrygkjqzmbul','lzncmbwdsjyfrapxkhutqgoei'),(26237,'NORMAL','duhjaqkpwzesnbxylgfcmitro','jdpeonchfbxmysuzrqkwaitlg'),(26238,'NORMAL','gnkzyfouwsjrpabtqdlicmhex','qmcathfkoszjwgnelidubpyxr'),(26239,'NORMAL','isfmuxalbypegckjwnhqozdrt','ekxqslicbhgytudzjmawrnofp'),(26240,'NORMAL','audonxhtizplwyrfkcgeqbmsj','ernqcoakxfhbwztdmiyjlpsgu'),(26241,'NORMAL','nekohazutwmicyjdqrgxlfbsp','racfukjsdgytwlezphnmqixbo'),(26242,'NORMAL','lpdyfbnwacujhgmqtkxzeoirs','mfbkutwcgrsazonxdpyjhilqe'),(26243,'NORMAL','xjhgsilotambrzekupyqwdfcn','epshmfbqgrwtlkcjndaozyixu'),(26244,'NORMAL','uzhdygfmkoxljriawsbpcteqn','wzbyxeqrlfpmtjndgohcsiaku'),(26245,'NORMAL','jrmlsgaktoibchwfqyeundzpx','jqpihxusfnmtdzyowlercabkg'),(26246,'NORMAL','ylgeuwphozarjsqkmtfxbnicd','aweyozuhnftikdmgsjqbrxlpc'),(26247,'NORMAL','xsircatbnyldhuekfwzjqopmg','aiqcxwgfkpurzmtldbenoshyj'),(26248,'NORMAL','qjyduetxfrzcihgpskbwmlano','kxmpothwfzybsrguadncljeiq'),(26249,'NORMAL','uzpgkfyjbxntqaodrwmceishl','dnujfshxbkitcolgwyerqzamp'),(26250,'NORMAL','hgifsyjzeuodalxqbpnktwmrc','dszinlwxqkrebtmpyhoacujgf'),(26251,'NORMAL','dtkiegxpjfclhwmbnyaqrsozu','jpxqueknmiahrdwgzbflcoyst'),(26252,'NORMAL','nczsbxwmruyhlfqapekjogidt','wjudtqymsnpgflkbcoizaexrh'),(26253,'NORMAL','mjofywkxbuzgnlatsdirpehqc','poxbkfaigsywhdmnutrqjlcez'),(26254,'NORMAL','rqkidxuysnzcbapjohfgemwlt','fiozgxcjqawbylmtnuspdkehr'),(26255,'NORMAL','fjwrpinkxudleyozbgtqashcm','jxlofwgthpqzredynksicubam'),(26256,'NORMAL','swbaygxiuldctnhfejqpomzrk','uglayfcnzjoqdspbikwexhrmt'),(26257,'NORMAL','izawolncftjxbqymkgsphduer','yetqamdsxwoicjrgbhznkpulf'),(26258,'NORMAL','luzmnfkrpodabesxyhtciqgjw','kesjwcbrnoiafpzhdyumxlgtq'),(26259,'NORMAL','mangfqldikrtexcwbojzhypus','wxzucngtjyiderpmoqlhfakbs'),(26260,'NORMAL','qgtpdmlkhzbsiaxwoufencjry','rqgeclwzapmknsjufibdoxhyt');
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_annee` int(10) unsigned DEFAULT NULL,
  `nb_bloc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `niveau_etudes_responsable_annee_foreign` (`responsable_annee`),
  KEY `id_formation` (`id`),
  CONSTRAINT `niveau_etudes_responsable` FOREIGN KEY (`responsable_annee`) REFERENCES `professeurs` (`id_professeur`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` VALUES (461,'L1_MPCIE',NULL,2);
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1802 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
INSERT INTO `groupe` VALUES (1799,'L1_MPCIE ,TD1 ,TP1'),(1800,'L1_MPCIE ,TD1 ,TP2'),(1801,'L1_MPCIE ,TD2 ,TP3');
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe_options`
--

DROP TABLE IF EXISTS `groupe_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupe_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compte` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe_options`
--

LOCK TABLES `groupe_options` WRITE;
/*!40000 ALTER TABLE `groupe_options` DISABLE KEYS */;
INSERT INTO `groupe_options` VALUES (1,2),(2,1),(3,1);
/*!40000 ALTER TABLE `groupe_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incompatibilite`
--

DROP TABLE IF EXISTS `incompatibilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incompatibilite` (
  `id_matiere_a` int(11) NOT NULL,
  `id_matiere_b` int(11) NOT NULL,
  KEY `id_matiere_a` (`id_matiere_a`),
  KEY `id_matiere_b` (`id_matiere_b`),
  CONSTRAINT `incompatibilite_ibfk_1` FOREIGN KEY (`id_matiere_a`) REFERENCES `matiere` (`id`),
  CONSTRAINT `incompatibilite_ibfk_2` FOREIGN KEY (`id_matiere_b`) REFERENCES `matiere` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incompatibilite`
--

LOCK TABLES `incompatibilite` WRITE;
/*!40000 ALTER TABLE `incompatibilite` DISABLE KEYS */;
INSERT INTO `incompatibilite` VALUES (11,12),(14,15),(13,14),(13,15);
/*!40000 ALTER TABLE `incompatibilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscrit_formation`
--

DROP TABLE IF EXISTS `inscrit_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscrit_formation` (
  `id_etudiant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  KEY `id_formation` (`id_formation`),
  KEY `id_etudiant` (`id_etudiant`,`id_formation`) USING BTREE,
  CONSTRAINT `inscrit_formation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id`),
  CONSTRAINT `inscrit_formation_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscrit_formation`
--

LOCK TABLES `inscrit_formation` WRITE;
/*!40000 ALTER TABLE `inscrit_formation` DISABLE KEYS */;
INSERT INTO `inscrit_formation` VALUES (26211,461),(26212,461),(26213,461),(26214,461),(26215,461),(26216,461),(26217,461),(26218,461),(26219,461),(26220,461),(26221,461),(26222,461),(26223,461),(26224,461),(26225,461),(26226,461),(26227,461),(26228,461),(26229,461),(26230,461),(26231,461),(26232,461),(26233,461),(26234,461),(26235,461),(26236,461),(26237,461),(26238,461),(26239,461),(26240,461),(26241,461),(26242,461),(26243,461),(26244,461),(26245,461),(26246,461),(26247,461),(26248,461),(26249,461),(26250,461),(26251,461),(26252,461),(26253,461),(26254,461),(26255,461),(26256,461),(26257,461),(26258,461),(26259,461),(26260,461);
/*!40000 ALTER TABLE `inscrit_formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descriptif` varchar(100) NOT NULL,
  `id_ue` int(11) NOT NULL,
  `id_groupe_opt` int(11) DEFAULT NULL,
  `nom_matiere` varchar(100) NOT NULL,
  `responsable_matiere` int(10) unsigned DEFAULT NULL,
  `mat_verrouille` tinyint(1) DEFAULT NULL,
  `id_departement` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ue` (`id_ue`),
  KEY `responsable_matiere` (`responsable_matiere`),
  KEY `id_departement` (`id_departement`),
  KEY `id_groupe_opt` (`id_groupe_opt`),
  CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_groupe_opt`) REFERENCES `groupe_options` (`id`),
  CONSTRAINT `matiere_ibfk_3` FOREIGN KEY (`id_departement`) REFERENCES `departements` (`id_departement`),
  CONSTRAINT `matiere_ibfk_4` FOREIGN KEY (`responsable_matiere`) REFERENCES `professeurs` (`id_professeur`)
) ENGINE=InnoDB AUTO_INCREMENT=3709 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (3700,'sjcblkygathufwmrizpnqoxed',3173,NULL,'sjcblkygathufwmrizpnqoxed',NULL,0,NULL),(3701,'nurtazbmqgpfowdelicyhxskj',3174,NULL,'nurtazbmqgpfowdelicyhxskj',NULL,0,NULL),(3702,'oqywznkxhligmptcjfurdsaeb',3175,NULL,'oqywznkxhligmptcjfurdsaeb',NULL,0,NULL),(3703,'ferqypdlxgsubznctjmkaiowh',3176,NULL,'ferqypdlxgsubznctjmkaiowh',NULL,0,NULL),(3704,'wrlumiaeypzosftkxhqdcbgjn',3176,NULL,'wrlumiaeypzosftkxhqdcbgjn',NULL,0,NULL),(3705,'frpxisdtzubkjmqgocwaehlny',3177,NULL,'frpxisdtzubkjmqgocwaehlny',NULL,0,NULL),(3706,'ptfqkozslnruxcjihygwdbmea',3178,NULL,'ptfqkozslnruxcjihygwdbmea',NULL,0,NULL),(3707,'tsokbhgzqrpdxwaufnjyliecm',3178,NULL,'tsokbhgzqrpdxwaufnjyliecm',NULL,0,NULL),(3708,'borplnmsdwqajzfchtixygeuk',3178,NULL,'borplnmsdwqajzfchtixygeuk',NULL,0,NULL);
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partie`
--

DROP TABLE IF EXISTS `partie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partie` (
  `id_partie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sous_matiere` int(11) NOT NULL,
  `type` enum('CM','TD','TP') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_enseignement` int(10) unsigned DEFAULT NULL,
  `nbre_heure` int(11) NOT NULL,
  `nbre_groupe` int(11) NOT NULL,
  `nb_etudiants` int(11) NOT NULL,
  PRIMARY KEY (`id_partie`),
  KEY `parties_type_enseignement_foreign` (`type_enseignement`),
  KEY `id_sous_matiere` (`id_sous_matiere`),
  CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`),
  CONSTRAINT `partie_ibfk_2` FOREIGN KEY (`type_enseignement`) REFERENCES `type_enseignements` (`id_type_enseignement`)
) ENGINE=InnoDB AUTO_INCREMENT=9984 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partie`
--

LOCK TABLES `partie` WRITE;
/*!40000 ALTER TABLE `partie` DISABLE KEYS */;
INSERT INTO `partie` VALUES (9960,3700,'CM',NULL,24,3,0),(9961,3700,'TD',NULL,17,3,0),(9962,3701,'CM',NULL,21,3,0),(9963,3701,'TD',NULL,26,3,0),(9964,3702,'CM',NULL,20,3,0),(9965,3702,'TD',NULL,18,3,0),(9966,3703,'CM',NULL,24,3,0),(9967,3703,'TD',NULL,23,3,0),(9968,3703,'TP',NULL,18,3,0),(9969,3704,'CM',NULL,23,3,0),(9970,3704,'TD',NULL,11,3,0),(9971,3704,'TP',NULL,10,3,0),(9972,3705,'CM',NULL,18,3,0),(9973,3705,'TD',NULL,22,3,0),(9974,3705,'TP',NULL,30,3,0),(9975,3706,'CM',NULL,25,3,0),(9976,3706,'TD',NULL,13,3,0),(9977,3706,'TP',NULL,12,3,0),(9978,3707,'CM',NULL,19,3,0),(9979,3707,'TD',NULL,11,3,0),(9980,3707,'TP',NULL,17,3,0),(9981,3708,'CM',NULL,22,3,0),(9982,3708,'TD',NULL,29,3,0),(9983,3708,'TP',NULL,24,3,0);
/*!40000 ALTER TABLE `partie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeurs`
--

DROP TABLE IF EXISTS `professeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeurs` (
  `id_professeur` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_professeur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_professeur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` int(11) NOT NULL,
  `id_statut` int(10) unsigned DEFAULT NULL,
  `id_departement` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_professeur`),
  UNIQUE KEY `professeurs_nom_professeur_prenom_professeur_unique` (`nom_professeur`,`prenom_professeur`),
  KEY `professeurs_id_statut_foreign` (`id_statut`),
  KEY `professeurs_id_departement_foreign` (`id_departement`),
  CONSTRAINT `professeurs_id_departement_foreign` FOREIGN KEY (`id_departement`) REFERENCES `departements` (`id_departement`),
  CONSTRAINT `professeurs_id_statut_foreign` FOREIGN KEY (`id_statut`) REFERENCES `statuts` (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=2814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs`
--

LOCK TABLES `professeurs` WRITE;
/*!40000 ALTER TABLE `professeurs` DISABLE KEYS */;
INSERT INTO `professeurs` VALUES (2784,'xlrtijuabhnzmpcwykdfgsoeq','oebzfxwtjgqyhdsclnrmpuika',192,NULL,1),(2785,'klznihbxwcogsmeyjfpqutrda','suoqwtzfpmenacjgidlyrbhxk',192,NULL,1),(2786,'nmwexuckadlshzbfoygrtpjqi','smeyahkxnlitruwjcozpbfdgq',192,NULL,1),(2787,'cryixmjwsazogtkbphudeqlnf','qotcwnlspgiykfzbrjmxdheua',192,NULL,1),(2788,'otplrwnszmeyxfuhcbkqjiagd','hkgpbtjnofedlauyiszxmwcqr',192,NULL,1),(2789,'jbznrtcxphkmfedoawulgsqiy','jcfbqgplmtioazwskeydrnxuh',192,NULL,1),(2790,'pdcxmotgwzeafnliqhkbuysjr','fatpxqklunhzsrweygiocbjdm',192,NULL,1),(2791,'hymbkgfwntziujlsecdoarxqp','baiqgwhtoexzkmprsucdjnfyl',192,NULL,1),(2792,'wusxrbmoadiyftlqznkepjghc','lkcsfojmgirqnzbuyeaxtwdhp',192,NULL,1),(2793,'maugejfzycwsnqxpodbhtilrk','jmltksyagozfnrpcwdbeuixqh',192,NULL,1),(2794,'pmhrksogztbwdfxjcaqynielu','sajydtnrxpeozbuwqlmkhgcif',192,NULL,1),(2795,'cpehbfyugktdswlriaqmxzjno','zmpqugtcdfirwosehxbyakjln',192,NULL,1),(2796,'mkihxclayjwnopbgsqredtufz','otbsyfuhkpgzwmnjqacixlerd',192,NULL,1),(2797,'uihktsnxqabzpdfljwgyercom','xmtwjskfpiqobgzhneayrculd',192,NULL,1),(2798,'zumextjfsgaqbirkpodnwlych','wkhtsfxequnilcgpojmyzarbd',192,NULL,1),(2799,'jmdhtifzrosnekxgacuylpqbw','bdwlifugrtxskhypmojeacqnz',192,NULL,1),(2800,'kfzribwtaexmscjlpqygudhon','jmsrilfytcqoxnukpgdhaewbz',192,NULL,1),(2801,'ogxhzcjunqsrmpftkbawilyed','oqylurzpfxsibgemdwktjhnac',192,NULL,1),(2802,'xbmfytlgpkzqrshdjcoeiwaun','dfsmkrcpbyiwujzolgtxeqanh',192,NULL,1),(2803,'cpyubjdegrzowhixsnfqatmlk','iyfcjaxngerspudlbzmqowthk',192,NULL,1),(2804,'yzsxjflcbdekpwogmtqnairuh','athjxpmkflercisydqwzogunb',192,NULL,1),(2805,'lxwmqpucoksfrgihbyjanzetd','swgbaouxzmjiqcyrlehktpdfn',192,NULL,1),(2806,'kapnlgbjwuzsfxiomdehqytcr','cytxikbwhnmegdfqrajolpzus',192,NULL,1),(2807,'htuwomizafrgsbcpdxyjklqen','ykdnethxrfizsjcguplbaoqmw',192,NULL,1),(2808,'enpjfzhousrxmlbdwtqagciyk','egahyrfxdqtwczskbjumnipol',192,NULL,1),(2809,'ahczpfweknriymqtsblgodxuj','fwmqsktaxibdrhyzeoncujlpg',192,NULL,1),(2810,'ljnmdxzpguqtwosaifrhkeybc','bplifuweoakhrsjnmyxqztcdg',192,NULL,1),(2811,'sktfqocbgyxnilrujmahzwedp','nphazsrixdluobmjftwekcyqg',192,NULL,1),(2812,'bilxdykthfercznwpajusgomq','efboqtuhyksdzijglapncmxwr',192,NULL,1),(2813,'rxihqonwuyjcmsbtplfeadgkz','lptryzmoiuxdcfbnjswgaeqkh',192,NULL,1);
/*!40000 ALTER TABLE `professeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regroupement`
--

DROP TABLE IF EXISTS `regroupement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regroupement` (
  `id_groupe` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  KEY `id_groupe` (`id_groupe`,`id_classe`),
  KEY `regroupement_ibfk_2` (`id_classe`),
  CONSTRAINT `regroupement_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`),
  CONSTRAINT `regroupement_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regroupement`
--

LOCK TABLES `regroupement` WRITE;
/*!40000 ALTER TABLE `regroupement` DISABLE KEYS */;
INSERT INTO `regroupement` VALUES (1799,3739),(1799,3740),(1799,3741),(1799,3742),(1799,3743),(1799,3744),(1799,3751),(1799,3752),(1799,3753),(1799,3754),(1799,3755),(1799,3756),(1799,3757),(1799,3758),(1799,3759),(1800,3745),(1800,3746),(1800,3747),(1800,3748),(1800,3749),(1800,3750),(1800,3751),(1800,3752),(1800,3753),(1800,3754),(1800,3755),(1800,3756),(1800,3757),(1800,3758),(1800,3759),(1801,3760),(1801,3761),(1801,3762),(1801,3763),(1801,3764),(1801,3765),(1801,3766),(1801,3767),(1801,3768),(1801,3769),(1801,3770),(1801,3771),(1801,3772),(1801,3773),(1801,3774);
/*!40000 ALTER TABLE `regroupement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `id_semestre` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_semestre` varchar(255) NOT NULL,
  `id_formation` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_matiere`
--

DROP TABLE IF EXISTS `sous_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3709 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_matiere`
--

LOCK TABLES `sous_matiere` WRITE;
/*!40000 ALTER TABLE `sous_matiere` DISABLE KEYS */;
INSERT INTO `sous_matiere` VALUES (3700,'sjcblkygathufwmrizpnqoxed'),(3701,'nurtazbmqgpfowdelicyhxskj'),(3702,'oqywznkxhligmptcjfurdsaeb'),(3703,'ferqypdlxgsubznctjmkaiowh'),(3704,'wrlumiaeypzosftkxhqdcbgjn'),(3705,'frpxisdtzubkjmqgocwaehlny'),(3706,'ptfqkozslnruxcjihygwdbmea'),(3707,'tsokbhgzqrpdxwaufnjyliecm'),(3708,'borplnmsdwqajzfchtixygeuk');
/*!40000 ALTER TABLE `sous_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuts`
--

DROP TABLE IF EXISTS `statuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuts` (
  `id_statut` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbre_heure` int(11) NOT NULL,
  `nbre_heure_max` int(11) NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuts`
--

LOCK TABLES `statuts` WRITE;
/*!40000 ALTER TABLE `statuts` DISABLE KEYS */;
INSERT INTO `statuts` VALUES (1,'PR',192,384),(2,'MCF',192,384),(3,'PRAG',384,768),(4,'ATER',192,192),(5,'DCCE',64,64),(6,'ECER',192,220),(7,'VACATAIRE',0,96);
/*!40000 ALTER TABLE `statuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_enseignements`
--

DROP TABLE IF EXISTS `type_enseignements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_enseignements` (
  `id_type_enseignement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_type_enseignement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coefficient` int(11) NOT NULL,
  PRIMARY KEY (`id_type_enseignement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_enseignements`
--

LOCK TABLES `type_enseignements` WRITE;
/*!40000 ALTER TABLE `type_enseignements` DISABLE KEYS */;
INSERT INTO `type_enseignements` VALUES (1,'C',1),(2,'C/TD',1),(3,'TD',2),(4,'TP',2);
/*!40000 ALTER TABLE `type_enseignements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ue`
--

DROP TABLE IF EXISTS `ue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_formation` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bloc` int(11) NOT NULL,
  `responsable_annee` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `responsable_annee` (`responsable_annee`),
  KEY `ue_ibfk_1` (`id_formation`),
  CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3179 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ue`
--

LOCK TABLES `ue` WRITE;
/*!40000 ALTER TABLE `ue` DISABLE KEYS */;
INSERT INTO `ue` VALUES (3173,461,'UE1','lorem pisumo',1,NULL),(3174,461,'UE2','lorem pisumo',1,NULL),(3175,461,'UE3','lorem pisumo',1,NULL),(3176,461,'UE4','lorem pisumo',2,NULL),(3177,461,'UE5','lorem pisumo',1,NULL),(3178,461,'UE6','lorem pisumo',3,NULL);
/*!40000 ALTER TABLE `ue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27  3:25:58
