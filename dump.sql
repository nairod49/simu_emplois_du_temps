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
INSERT INTO `affectations_prof` VALUES (1,15014,4195,'1'),(2,15015,4195,'1'),(3,15016,4195,'3'),(4,14996,4194,'1'),(5,14997,4194,'2'),(6,15011,4194,'1'),(7,15012,4194,'2'),(8,15017,4185,'1'),(9,15019,4185,'1'),(10,15002,4185,'1'),(11,15004,4185,'2'),(12,15003,4185,'2'),(13,15013,4197,'3'),(14,14999,4197,'1'),(15,15000,4197,'1'),(16,15000,4183,'1'),(17,15004,4183,'1'),(18,15008,4183,'1'),(19,15009,4183,'2'),(20,15010,4183,'2'),(21,15018,4191,'1'),(22,15019,4191,'2'),(23,15018,4191,'1'),(24,15005,4191,'1'),(25,15007,4191,'2'),(26,14998,4190,'1'),(27,14998,4190,'1'),(28,14998,4190,'1'),(29,15010,4190,'1'),(30,15006,4190,'2'),(31,15015,4180,'1'),(32,15007,4180,'1'),(33,15001,4180,'3');
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
INSERT INTO `appartenance_matiere` VALUES (4275,4275),(4276,4276),(4277,4277),(4278,4278),(4279,4279),(4280,4280),(4281,4281),(4282,4282);
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
INSERT INTO `choix_etudiant` VALUES (4275,30332),(4275,30333),(4275,30334),(4275,30335),(4275,30336),(4275,30337),(4275,30338),(4275,30339),(4275,30340),(4275,30341),(4275,30342),(4275,30343),(4275,30344),(4275,30345),(4275,30346),(4275,30347),(4275,30348),(4275,30349),(4275,30350),(4275,30351),(4275,30352),(4275,30353),(4275,30354),(4275,30355),(4275,30356),(4275,30357),(4275,30358),(4275,30359),(4275,30360),(4275,30361),(4275,30362),(4275,30363),(4275,30364),(4275,30365),(4275,30366),(4275,30367),(4275,30368),(4275,30369),(4275,30370),(4275,30371),(4275,30372),(4275,30373),(4275,30374),(4275,30375),(4275,30376),(4275,30377),(4275,30378),(4275,30379),(4275,30380),(4275,30381),(4276,30332),(4276,30333),(4276,30334),(4276,30335),(4276,30336),(4276,30337),(4276,30338),(4276,30339),(4276,30340),(4276,30341),(4276,30342),(4276,30343),(4276,30344),(4276,30345),(4276,30346),(4276,30347),(4276,30348),(4276,30349),(4276,30350),(4276,30351),(4276,30352),(4276,30353),(4276,30354),(4276,30355),(4276,30356),(4276,30357),(4276,30358),(4276,30359),(4276,30360),(4276,30361),(4276,30362),(4276,30363),(4276,30364),(4276,30365),(4276,30366),(4276,30367),(4276,30368),(4276,30369),(4276,30370),(4276,30371),(4276,30372),(4276,30373),(4276,30374),(4276,30375),(4276,30376),(4276,30377),(4276,30378),(4276,30379),(4276,30380),(4276,30381),(4277,30332),(4277,30333),(4277,30334),(4277,30335),(4277,30336),(4277,30337),(4277,30338),(4277,30339),(4277,30340),(4277,30341),(4277,30342),(4277,30343),(4277,30344),(4277,30345),(4277,30346),(4277,30347),(4277,30348),(4277,30349),(4277,30350),(4277,30351),(4277,30352),(4277,30353),(4277,30354),(4277,30355),(4277,30356),(4277,30357),(4277,30358),(4277,30359),(4277,30360),(4277,30361),(4277,30362),(4277,30363),(4277,30364),(4277,30365),(4277,30366),(4277,30367),(4277,30368),(4277,30369),(4277,30370),(4277,30371),(4277,30372),(4277,30373),(4277,30374),(4277,30375),(4277,30376),(4277,30377),(4277,30378),(4277,30379),(4277,30380),(4277,30381),(4278,30332),(4278,30333),(4278,30334),(4278,30335),(4278,30336),(4278,30337),(4278,30338),(4278,30339),(4278,30340),(4278,30341),(4278,30342),(4278,30343),(4278,30344),(4278,30345),(4278,30346),(4278,30347),(4278,30348),(4278,30349),(4278,30350),(4278,30351),(4278,30352),(4278,30353),(4278,30354),(4278,30355),(4278,30356),(4278,30357),(4278,30358),(4278,30359),(4278,30360),(4278,30361),(4278,30362),(4278,30363),(4278,30364),(4278,30365),(4278,30366),(4278,30367),(4278,30368),(4278,30369),(4278,30370),(4278,30371),(4278,30372),(4278,30373),(4278,30374),(4278,30375),(4278,30376),(4278,30377),(4278,30378),(4278,30379),(4278,30380),(4278,30381),(4279,30332),(4279,30333),(4279,30334),(4279,30335),(4279,30336),(4279,30337),(4279,30338),(4279,30339),(4279,30340),(4279,30341),(4279,30342),(4279,30343),(4279,30344),(4279,30345),(4279,30346),(4279,30347),(4279,30348),(4279,30349),(4279,30350),(4279,30351),(4279,30352),(4279,30353),(4279,30354),(4279,30355),(4279,30356),(4279,30357),(4279,30358),(4279,30359),(4279,30360),(4279,30361),(4279,30362),(4279,30363),(4279,30364),(4279,30365),(4279,30366),(4279,30367),(4279,30368),(4279,30369),(4279,30370),(4279,30371),(4279,30372),(4279,30373),(4279,30374),(4279,30375),(4279,30376),(4279,30377),(4279,30378),(4279,30379),(4279,30380),(4279,30381),(4280,30332),(4280,30333),(4280,30334),(4280,30335),(4280,30336),(4280,30337),(4280,30338),(4280,30339),(4280,30340),(4280,30341),(4280,30342),(4280,30343),(4280,30344),(4280,30345),(4280,30346),(4280,30347),(4280,30348),(4280,30349),(4280,30350),(4280,30351),(4280,30352),(4280,30353),(4280,30354),(4280,30355),(4280,30356),(4280,30357),(4280,30358),(4280,30359),(4280,30360),(4280,30361),(4280,30362),(4280,30363),(4280,30364),(4280,30365),(4280,30366),(4280,30367),(4280,30368),(4280,30369),(4280,30370),(4280,30371),(4280,30372),(4280,30373),(4280,30374),(4280,30375),(4280,30376),(4280,30377),(4280,30378),(4280,30379),(4280,30380),(4280,30381),(4281,30332),(4281,30333),(4281,30334),(4281,30335),(4281,30336),(4281,30337),(4281,30338),(4281,30339),(4281,30340),(4281,30341),(4281,30342),(4281,30343),(4281,30344),(4281,30345),(4281,30346),(4281,30347),(4281,30348),(4281,30349),(4281,30350),(4281,30351),(4281,30352),(4281,30353),(4281,30354),(4281,30355),(4281,30356),(4281,30357),(4281,30358),(4281,30359),(4281,30360),(4281,30361),(4281,30362),(4281,30363),(4281,30364),(4281,30365),(4281,30366),(4281,30367),(4281,30368),(4281,30369),(4281,30370),(4281,30371),(4281,30372),(4281,30373),(4281,30374),(4281,30375),(4281,30376),(4281,30377),(4281,30378),(4281,30379),(4281,30380),(4281,30381),(4282,30332),(4282,30333),(4282,30334),(4282,30335),(4282,30336),(4282,30337),(4282,30338),(4282,30339),(4282,30340),(4282,30341),(4282,30342),(4282,30343),(4282,30344),(4282,30345),(4282,30346),(4282,30347),(4282,30348),(4282,30349),(4282,30350),(4282,30351),(4282,30352),(4282,30353),(4282,30354),(4282,30355),(4282,30356),(4282,30357),(4282,30358),(4282,30359),(4282,30360),(4282,30361),(4282,30362),(4282,30363),(4282,30364),(4282,30365),(4282,30366),(4282,30367),(4282,30368),(4282,30369),(4282,30370),(4282,30371),(4282,30372),(4282,30373),(4282,30374),(4282,30375),(4282,30376),(4282,30377),(4282,30378),(4282,30379),(4282,30380),(4282,30381);
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
INSERT INTO `choix_groupe` VALUES (30332,1994),(30333,1994),(30334,1994),(30335,1994),(30336,1994),(30337,1994),(30338,1994),(30339,1994),(30340,1994),(30341,1994),(30342,1994),(30343,1994),(30344,1994),(30345,1994),(30346,1994),(30347,1994),(30348,1994),(30349,1994),(30350,1994),(30351,1994),(30352,1995),(30353,1995),(30354,1995),(30355,1995),(30356,1995),(30357,1995),(30358,1995),(30359,1995),(30360,1995),(30361,1995),(30362,1995),(30363,1995),(30364,1995),(30365,1995),(30366,1995),(30367,1995),(30368,1995),(30369,1995),(30370,1995),(30371,1995),(30372,1996),(30373,1996),(30374,1996),(30375,1996),(30376,1996),(30377,1996),(30378,1996),(30379,1996),(30380,1996),(30381,1996);
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
  `nom` varchar(300) COLLATE utf8_bin NOT NULL,
  `id_partie` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partie` (`id_partie`),
  CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id_partie`)
) ENGINE=InnoDB AUTO_INCREMENT=5850 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (5810,'TP-kmutzrigoljcpfqdbnawyxshe-1',14998),(5811,'TP-gdnlousfjyehqkrxpctbamizw-1',15001),(5812,'TP-cixhjzknulqsmatorbpfdegyw-1',15004),(5813,'TP-ixdczjsuytrgqkfnbaolmhewp-1',15007),(5814,'TP-xnhmgfojrspydlbiekqtzuwac-1',15010),(5815,'TP-jyrcnamotblfdzsqpwhxuikge-1',15013),(5816,'TP-yfnxrgcozbuhsiemldtqpkwaj-1',15016),(5817,'TP-sbrpocmgeihkxwqjluyantdzf-1',15019),(5818,'TP-kmutzrigoljcpfqdbnawyxshe-2',14998),(5819,'TP-gdnlousfjyehqkrxpctbamizw-2',15001),(5820,'TP-cixhjzknulqsmatorbpfdegyw-2',15004),(5821,'TP-ixdczjsuytrgqkfnbaolmhewp-2',15007),(5822,'TP-xnhmgfojrspydlbiekqtzuwac-2',15010),(5823,'TP-jyrcnamotblfdzsqpwhxuikge-2',15013),(5824,'TP-yfnxrgcozbuhsiemldtqpkwaj-2',15016),(5825,'TP-sbrpocmgeihkxwqjluyantdzf-2',15019),(5826,'TD-kmutzrigoljcpfqdbnawyxshe-1',14997),(5827,'TD-gdnlousfjyehqkrxpctbamizw-1',15000),(5828,'TD-cixhjzknulqsmatorbpfdegyw-1',15003),(5829,'TD-ixdczjsuytrgqkfnbaolmhewp-1',15006),(5830,'TD-xnhmgfojrspydlbiekqtzuwac-1',15009),(5831,'TD-jyrcnamotblfdzsqpwhxuikge-1',15012),(5832,'TD-yfnxrgcozbuhsiemldtqpkwaj-1',15015),(5833,'TD-sbrpocmgeihkxwqjluyantdzf-1',15018),(5834,'TP-kmutzrigoljcpfqdbnawyxshe-3',14998),(5835,'TP-gdnlousfjyehqkrxpctbamizw-3',15001),(5836,'TP-cixhjzknulqsmatorbpfdegyw-3',15004),(5837,'TP-ixdczjsuytrgqkfnbaolmhewp-3',15007),(5838,'TP-xnhmgfojrspydlbiekqtzuwac-3',15010),(5839,'TP-jyrcnamotblfdzsqpwhxuikge-3',15013),(5840,'TP-yfnxrgcozbuhsiemldtqpkwaj-3',15016),(5841,'TP-sbrpocmgeihkxwqjluyantdzf-3',15019),(5842,'TD-kmutzrigoljcpfqdbnawyxshe-2',14997),(5843,'TD-gdnlousfjyehqkrxpctbamizw-2',15000),(5844,'TD-cixhjzknulqsmatorbpfdegyw-2',15003),(5845,'TD-ixdczjsuytrgqkfnbaolmhewp-2',15006),(5846,'TD-xnhmgfojrspydlbiekqtzuwac-2',15009),(5847,'TD-jyrcnamotblfdzsqpwhxuikge-2',15012),(5848,'TD-yfnxrgcozbuhsiemldtqpkwaj-2',15015),(5849,'TD-sbrpocmgeihkxwqjluyantdzf-2',15018);
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
) ENGINE=InnoDB AUTO_INCREMENT=30382 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (30332,'NORMAL','yzbwteksfdmnuihorapcgqjlx','cltydqsfgauizkhoepbxmnwjr'),(30333,'NORMAL','imesnufodarbzpcwkljtgyhxq','unbomwyjsxifkhzlagtcpedqr'),(30334,'NORMAL','hrkwieoasfybtjuqpdclnzmxg','bepdgimnljusfcyartohqkwzx'),(30335,'NORMAL','jxzyrifgklabpochwutdsemqn','ekjaoqmstucfzgybrpxilhnwd'),(30336,'NORMAL','ogrskcwfxdlmiuaepntzjbyqh','hkwxbeazosgyjqncpildmrtfu'),(30337,'NORMAL','ulqiwdgmfbhxsktorezyjnapc','feyhszwpjkqunodictmgbxral'),(30338,'NORMAL','ltnepbmgsxhyzfkdrjcouqiaw','aojshwkpfczixbunytmrlqdeg'),(30339,'NORMAL','hqzbunjtyirlkgaopsfmdwecx','lzuksgrqyfwchxnbetpdjmoia'),(30340,'NORMAL','tupgrzdcnjseabilkowhyqfmx','ebkwaytgfzprnsqomixldjhcu'),(30341,'NORMAL','fxtgkamcdpohnsuwyrbilezjq','hnrgecwpsojxuqtikzdamlbfy'),(30342,'NORMAL','ugrcyifbzxknphatjosleqwdm','xfagkluimnqecwrbpjytdshzo'),(30343,'NORMAL','wksmzhxaleqfirgbpjucyontd','oehzdacpkjygunxtrlfmiqswb'),(30344,'NORMAL','wpcrjgatkhfbnomizlqeuydxs','qxouyersdbfjntgpihalzkcwm'),(30345,'NORMAL','hmielzuoxjnkgywrbsptqfcda','yzudimtarcnlfhsjexwbqkpgo'),(30346,'NORMAL','oinyzckedqwfxrupghsbatmlj','zbcaujxrtnkhiqgmdwlosyepf'),(30347,'NORMAL','zkxwuemnlbqiyjptcadorsghf','seqjrixmanyctdfkwbulogzph'),(30348,'NORMAL','tusgidynprhwfzaejxblcqmok','palmkzgifrosdtqhyenwbcjxu'),(30349,'NORMAL','ymobxlrchazkdgwejptuqnisf','pralncefsjwbkqxgutodihmyz'),(30350,'NORMAL','gunemfwhprzloqascxijydkbt','gciehyzjrxpotqwambudlfnks'),(30351,'NORMAL','cljsiuykdgatpqzrnxwbohefm','yknctwjmlxofadrqbesgphizu'),(30352,'NORMAL','xwqpuknmsdcgtjofiayzhlerb','prikgjlbdaznsufwehtomqcyx'),(30353,'NORMAL','nmflordqzyhuptjabgekwcisx','tormkbauelwqzfdigjxsnpcyh'),(30354,'NORMAL','idkxyhjcpzgmtwrfebslaunoq','erlfxyboidcgtnhqszwujkamp'),(30355,'NORMAL','uitqynegjlmokdcxzrwsfbaph','mwxehygakzjupndflqbcsitor'),(30356,'NORMAL','rfqznepxlitmkgjohcayuwsbd','ckgdiowmxyptbelhquzsnfrja'),(30357,'NORMAL','zoinjtpaukgxrlhqwcdmfybse','rqkfpntuloxiamswdezbcyhjg'),(30358,'NORMAL','iaorqtxcwmeshufnpkbzjydgl','lhuyoiqjextzmnpgkrcdasfbw'),(30359,'NORMAL','emdgbulqrzcxkwsyhfopntija','tnkfajbczsorwiqpdumghleyx'),(30360,'NORMAL','xfnphktbclgwdsoyjerqmaizu','qtrknxlaydhmogewfpiuscbjz'),(30361,'NORMAL','qmdxkwetfbunaoscrljypzhig','cuojqyafgkiwmtbphesndlrxz'),(30362,'NORMAL','wmcuaqlenjpszrdoxyightbkf','oqnxbeitugmzlrckawhyfspdj'),(30363,'NORMAL','gnzemqyfijbatldcxsrkohuwp','npgulzhsmfdcotkwxyqijreba'),(30364,'NORMAL','orpatyezhqwfgiubmldjxknsc','fiyzgcqhrtbmuxpnlwkajseod'),(30365,'NORMAL','embquypliarxfzhgntojckdws','obzmpikaujeswrhnqtlgxfdcy'),(30366,'NORMAL','ytzfspojukdwnlaiqxhbcgmre','bxinwfaokztrsgmuqlejydphc'),(30367,'NORMAL','alsejmoqwxhyurnicpkfzdbtg','iojbwfypthnerdqlzkgmsaxuc'),(30368,'NORMAL','cqejkrabxnhtydpgsmiowzlfu','sgxchqjauyopinrwdbzkmltef'),(30369,'NORMAL','wzkycxtufjqbgalomspiehrnd','dgicsahyzqplwxenjmtbukrfo'),(30370,'NORMAL','masyjehrpcbuxiqwlgdkftnoz','jqymskgwuofanhdericlzpxtb'),(30371,'NORMAL','pqcntbemsujlfxodwhgkizyar','mnojbcrsluehkizwxyqdfatpg'),(30372,'NORMAL','zukcxnopmfrajgihbtwlqedsy','nuypstwkeqcboijgalzfdrxhm'),(30373,'NORMAL','bdahciktzqmsxygjrounwlfep','jafrzupglctqdsximbowhenky'),(30374,'NORMAL','zqliypungckfmhsdowajebxtr','dqwtcruogsjkzfiyxlapbhmne'),(30375,'NORMAL','njktyelhafudipmxrbwscqgoz','hkiutxgfmcqybwleonrdpsjaz'),(30376,'NORMAL','ynortlgbuxqemkfpsihdjczaw','wodazhfntmjqegpcrxikulsby'),(30377,'NORMAL','iwarejtdfhlymqcgsxobzpnuk','qzomygrnsikdlbwxfpcueatjh'),(30378,'NORMAL','kjxpfzawusbmilntedqrgcohy','habqjlwpdinofyzxteukrcsgm'),(30379,'NORMAL','rxzmsugahtfqwkneoyjlpdcbi','ajqhzcxuyibntdgsmorwklpfe'),(30380,'NORMAL','wbynxzipetaougkjfmshlrdqc','hrgyqjpeouaibxzmfsnktcwdl'),(30381,'NORMAL','traqiwcpuyejbnxmhgdzokfls','gcoszamiwbtdkflehnpjxqyur');
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
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` VALUES (530,'L3 Info',NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=1997 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
INSERT INTO `groupe` VALUES (1994,'L3 Info ,TD1 ,TP1'),(1995,'L3 Info ,TD1 ,TP2'),(1996,'L3 Info ,TD2 ,TP3');
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
INSERT INTO `inscrit_formation` VALUES (30332,530),(30333,530),(30334,530),(30335,530),(30336,530),(30337,530),(30338,530),(30339,530),(30340,530),(30341,530),(30342,530),(30343,530),(30344,530),(30345,530),(30346,530),(30347,530),(30348,530),(30349,530),(30350,530),(30351,530),(30352,530),(30353,530),(30354,530),(30355,530),(30356,530),(30357,530),(30358,530),(30359,530),(30360,530),(30361,530),(30362,530),(30363,530),(30364,530),(30365,530),(30366,530),(30367,530),(30368,530),(30369,530),(30370,530),(30371,530),(30372,530),(30373,530),(30374,530),(30375,530),(30376,530),(30377,530),(30378,530),(30379,530),(30380,530),(30381,530);
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
  `descriptif` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4283 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (4275,'kmutzrigoljcpfqdbnawyxshe',3659,NULL,'kmutzrigoljcpfqdbnawyxshe',NULL,0,NULL),(4276,'gdnlousfjyehqkrxpctbamizw',3660,NULL,'gdnlousfjyehqkrxpctbamizw',NULL,0,NULL),(4277,'cixhjzknulqsmatorbpfdegyw',3661,NULL,'cixhjzknulqsmatorbpfdegyw',NULL,0,NULL),(4278,'ixdczjsuytrgqkfnbaolmhewp',3662,NULL,'ixdczjsuytrgqkfnbaolmhewp',NULL,0,NULL),(4279,'xnhmgfojrspydlbiekqtzuwac',3663,NULL,'xnhmgfojrspydlbiekqtzuwac',NULL,0,NULL),(4280,'jyrcnamotblfdzsqpwhxuikge',3664,NULL,'jyrcnamotblfdzsqpwhxuikge',NULL,0,NULL),(4281,'yfnxrgcozbuhsiemldtqpkwaj',3665,NULL,'yfnxrgcozbuhsiemldtqpkwaj',NULL,0,NULL),(4282,'sbrpocmgeihkxwqjluyantdzf',3666,NULL,'sbrpocmgeihkxwqjluyantdzf',NULL,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partie`
--

LOCK TABLES `partie` WRITE;
/*!40000 ALTER TABLE `partie` DISABLE KEYS */;
INSERT INTO `partie` VALUES (14996,4275,'CM',NULL,21,3,0),(14997,4275,'TD',NULL,15,3,0),(14998,4275,'TP',NULL,28,3,0),(14999,4276,'CM',NULL,20,3,0),(15000,4276,'TD',NULL,30,3,0),(15001,4276,'TP',NULL,10,3,0),(15002,4277,'CM',NULL,22,3,0),(15003,4277,'TD',NULL,10,3,0),(15004,4277,'TP',NULL,15,3,0),(15005,4278,'CM',NULL,25,3,0),(15006,4278,'TD',NULL,18,3,0),(15007,4278,'TP',NULL,17,3,0),(15008,4279,'CM',NULL,18,3,0),(15009,4279,'TD',NULL,20,3,0),(15010,4279,'TP',NULL,13,3,0),(15011,4280,'CM',NULL,25,3,0),(15012,4280,'TD',NULL,26,3,0),(15013,4280,'TP',NULL,23,3,0),(15014,4281,'CM',NULL,18,3,0),(15015,4281,'TD',NULL,17,3,0),(15016,4281,'TP',NULL,30,3,0),(15017,4282,'CM',NULL,23,3,0),(15018,4282,'TD',NULL,12,3,0),(15019,4282,'TP',NULL,23,3,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeurs`
--

LOCK TABLES `professeurs` WRITE;
/*!40000 ALTER TABLE `professeurs` DISABLE KEYS */;
INSERT INTO `professeurs` VALUES (4171,'pyncmaugjiwtxrlofhkbzqdse','dwfrumztbgeipxohcqynslkaj',192,NULL,1),(4172,'rqmdfwcnlsjbihpxaoekgytzu','qzdkjnmtprxehylcisofwbgau',192,NULL,1),(4173,'njiglhzmyxqsoepudtckrbfwa','clysziuxpghmraqefwtbodknj',192,NULL,1),(4174,'pibqfhaksuotlmejncdyxwzgr','ngkifqbsyjpdorzumalchewtx',192,NULL,1),(4175,'bdgzaklneytiojphcfwxrmqus','ygjhixkcprdsqzmltunebwfoa',192,NULL,1),(4176,'xlfoinskchtzrbagjqpywmude','jzstnqyfudglbxchomrpweaki',192,NULL,1),(4177,'jnkgaemufxzichrltpdqosbwy','hkfysgdwtpcuqeajrlnxbozim',192,NULL,1),(4178,'dcphfilnrxztmjsqkeaugobyw','iyspcunqmzfothkwjlegdbarx',192,NULL,1),(4179,'ndbpajtgwmozislxhufrcqeky','lmeiqnaoyzgtkdcwfsxjrbhup',192,NULL,1),(4180,'zgxfibawnrysukomjldhcteqp','ojwzpkfucaymridebsnghxqtl',192,NULL,1),(4181,'lhpinmrsxqokuywafgzjcdbet','zpjykqwdtcegiahxfurslmbno',192,NULL,1),(4182,'orfdwcqmzbjuptkesygihnlxa','cjkgmbyiqolapxdfrhnwezuts',192,NULL,1),(4183,'zpaeukrwfxnhqglbiocstmdyj','njmsrizulqbywdcfketxhgapo',192,NULL,1),(4184,'ohefktnjswxcplgiyrmadqzbu','phcsfrqgazdybjwtexuoiknml',192,NULL,1),(4185,'gtmnjuiqyobrwzflaxedshcpk','julmbtqgyxhwnezprcadoskfi',192,NULL,1),(4186,'mrskajtpdgwfxqizehbuoncyl','rjiglmoxykzseupdhqcnwabft',192,NULL,1),(4187,'wjmfbzdytcguklnpireaqhsxo','qnypbfxjrgcawlztusodheikm',192,NULL,1),(4188,'nqsyaecwrgihtmdjubfozlkpx','udgcszeipnhwjltmxafyoqrbk',192,NULL,1),(4189,'jmqgxcswytfiudpakobrhlzen','kgcutjdfwmbszpxqolyiehanr',192,NULL,1),(4190,'fezdwayslrmupkijxgqthnobc','epdoxwtqniycujhamzkbrlgsf',192,NULL,1),(4191,'wdxkebqtcgznpsihylrjuofam','etpkbumzfjqcrwisaygxdlohn',192,NULL,1),(4192,'wbifuejckzmqprgnlhatxydso','bfyptrhxudienowlkczqjsmga',192,NULL,1),(4193,'tihwfgjpsmlozkcqedbrxnuay','hzrgytoqmukajlepwbfsixndc',192,NULL,1),(4194,'drqapbljutocemxswykignhzf','ziqfudyawrphoxgjelkmcntbs',192,NULL,1),(4195,'oxqcjlksperhydbwafnztmgiu','uncbjqmldhzytfaoigskewxpr',192,NULL,1),(4196,'xbwljkdarspihequzoyftgmnc','oklpwcsribmqhfzjdaengtyxu',192,NULL,1),(4197,'iexyoajwfrsgnluhpztkdqmcb','hcbxjduzoilgarqweksmypfnt',192,NULL,1),(4198,'utjeiswpaqknchglbzxfoydmr','qtxcjmhgrepoinzfbwkldyaus',192,NULL,1),(4199,'owlzhkfxjrsydbpigumaetqcn','ebndqxgijswlmrypkuaztofch',192,NULL,1),(4200,'rlpamztwebxgcshqnjifduoky','cjxksfwehdpbyiogmaunzltrq',192,NULL,1);
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
INSERT INTO `regroupement` VALUES (1994,5810),(1994,5811),(1994,5812),(1994,5813),(1994,5814),(1994,5815),(1994,5816),(1994,5817),(1994,5826),(1994,5827),(1994,5828),(1994,5829),(1994,5830),(1994,5831),(1994,5832),(1994,5833),(1995,5818),(1995,5819),(1995,5820),(1995,5821),(1995,5822),(1995,5823),(1995,5824),(1995,5825),(1995,5826),(1995,5827),(1995,5828),(1995,5829),(1995,5830),(1995,5831),(1995,5832),(1995,5833),(1996,5834),(1996,5835),(1996,5836),(1996,5837),(1996,5838),(1996,5839),(1996,5840),(1996,5841),(1996,5842),(1996,5843),(1996,5844),(1996,5845),(1996,5846),(1996,5847),(1996,5848),(1996,5849);
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
) ENGINE=InnoDB AUTO_INCREMENT=4283 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_matiere`
--

LOCK TABLES `sous_matiere` WRITE;
/*!40000 ALTER TABLE `sous_matiere` DISABLE KEYS */;
INSERT INTO `sous_matiere` VALUES (4275,'kmutzrigoljcpfqdbnawyxshe'),(4276,'gdnlousfjyehqkrxpctbamizw'),(4277,'cixhjzknulqsmatorbpfdegyw'),(4278,'ixdczjsuytrgqkfnbaolmhewp'),(4279,'xnhmgfojrspydlbiekqtzuwac'),(4280,'jyrcnamotblfdzsqpwhxuikge'),(4281,'yfnxrgcozbuhsiemldtqpkwaj'),(4282,'sbrpocmgeihkxwqjluyantdzf');
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
) ENGINE=InnoDB AUTO_INCREMENT=3667 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ue`
--

LOCK TABLES `ue` WRITE;
/*!40000 ALTER TABLE `ue` DISABLE KEYS */;
INSERT INTO `ue` VALUES (3659,530,'UE1','lorem pisumo',1,NULL),(3660,530,'UE2','lorem pisumo',1,NULL),(3661,530,'UE3','lorem pisumo',1,NULL),(3662,530,'UE4','lorem pisumo',1,NULL),(3663,530,'UE5','lorem pisumo',1,NULL),(3664,530,'UE6','lorem pisumo',1,NULL),(3665,530,'UE7','lorem pisumo',1,NULL),(3666,530,'UE8','lorem pisumo',1,NULL);
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

-- Dump completed on 2021-06-01 13:43:24
