-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 04 mai 2021 à 18:22
-- Version du serveur :  10.3.27-MariaDB-0+deb10u1
-- Version de PHP : 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sectionnement`
--
CREATE DATABASE IF NOT EXISTS `sectionnement` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `sectionnement`;

-- --------------------------------------------------------

--
-- Structure de la table `appartenance_matiere`
--

CREATE TABLE `appartenance_matiere` (
  `id_matiere` int(11) NOT NULL,
  `id_sous_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `appartenance_matiere`
--

INSERT INTO `appartenance_matiere` (`id_matiere`, `id_sous_matiere`) VALUES
(17, 2),
(18, 12),
(19, 13),
(20, 14),
(21, 15),
(22, 16),
(22, 17),
(22, 18),
(22, 19),
(22, 20),
(22, 21),
(24, 22),
(24, 23),
(24, 24),
(24, 25),
(26, 1),
(28, 3),
(29, 4),
(30, 5),
(31, 6),
(32, 7),
(33, 8),
(34, 9),
(34, 10),
(35, 11);

-- --------------------------------------------------------

--
-- Structure de la table `choix_etudiants`
--

CREATE TABLE `choix_etudiants` (
  `id_matiere` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `choix_etudiants`
--

INSERT INTO `choix_etudiants` (`id_matiere`, `id_etu`) VALUES
(11, 5),
(11, 8),
(12, 7),
(13, 5),
(15, 7),
(15, 8),
(25, 9),
(35, 9);

-- --------------------------------------------------------

--
-- Structure de la table `choix_groupe`
--

CREATE TABLE `choix_groupe` (
  `id_etu` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `id_partie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `categorie` enum('NORMAL','DA') COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL',
  `nom` varchar(25) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `categorie`, `nom`, `prenom`) VALUES
(5, 'NORMAL', 'NTest', 'PTest'),
(7, 'NORMAL', 'NTest', 'PTest'),
(8, 'NORMAL', 'NTest', 'PTest'),
(9, 'NORMAL', 'NTest', 'PTest');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `nb_bloc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `nom`, `description`, `nb_bloc`) VALUES
(10, 'L1 MPCIE', 'Lorem ipsum, dolor sit amet', 2),
(11, 'L2 MPCIE', 'Lorem ipsum, dolor sit amet', 2),
(12, 'L3 Info', 'Lorem ipsum, dolor sit amet', 2),
(13, 'LP Logiciel Libre', 'Lorem ipsum, dolor sit amet', 2),
(14, 'MASTER 1 Info', 'Lorem ipsum, dolor sit amet', 2),
(15, 'MASTER 2 ACDI', 'Lorem ipsum, dolor sit amet', 2),
(16, 'MASTER 2 ID', 'Lorem ipsum, dolor sit amet', 2);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_options`
--

CREATE TABLE `groupe_options` (
  `id` int(11) NOT NULL,
  `compte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `groupe_options`
--

INSERT INTO `groupe_options` (`id`, `compte`) VALUES
(1, 2),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `incompatibilite`
--

CREATE TABLE `incompatibilite` (
  `id_matiere_a` int(11) NOT NULL,
  `id_matiere_b` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `incompatibilite`
--

INSERT INTO `incompatibilite` (`id_matiere_a`, `id_matiere_b`) VALUES
(11, 12),
(14, 15),
(13, 14),
(13, 15);

-- --------------------------------------------------------

--
-- Structure de la table `inscrit_formation`
--

CREATE TABLE `inscrit_formation` (
  `id_etudiant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `inscrit_formation`
--

INSERT INTO `inscrit_formation` (`id_etudiant`, `id_formation`) VALUES
(5, 12),
(7, 12),
(8, 12),
(9, 10);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `descriptif` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_ue` int(11) NOT NULL,
  `id_groupe_opt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `descriptif`, `id_ue`, `id_groupe_opt`) VALUES
(1, 'Anglais', 1, NULL),
(2, 'Fondements de l\'informatique', 2, NULL),
(3, 'Théorie des langages et compilation', 3, NULL),
(4, 'DCRA', 4, NULL),
(5, 'Théorie de l\'information et assembleur', 5, NULL),
(6, 'Programmation orientée objet en C++', 6, NULL),
(7, 'Algorithmique des graphes', 7, NULL),
(8, 'Base de donnée', 8, NULL),
(9, 'Développement web', 9, NULL),
(10, 'Programmation logique et fonctionnel', 10, NULL),
(11, 'Synthèse d\'images', 11, 1),
(12, 'Traitement de données en Python', 11, 1),
(13, 'Développement d\'interface graphiques avancées', 11, 1),
(14, 'Production automatisée de documents', 11, 1),
(15, 'Initiation à la programmation de système intélligent', 11, 1),
(16, '3PE', 13, NULL),
(17, 'Anglais S1', 14, NULL),
(18, 'Anglais S2', 24, NULL),
(19, '3PE', 24, NULL),
(20, 'Culture numérique', 24, NULL),
(21, 'Géométrie analytique', 25, NULL),
(22, 'Physique Chimie', 26, 2),
(23, 'Mathématique', 26, 2),
(24, 'Informatique', 26, 2),
(25, 'Math-Économie', 26, 2),
(26, 'EEO', 18, NULL),
(27, 'Anglais', 18, NULL),
(28, 'Analyse élémentaire', 19, NULL),
(29, 'Calcul algébrique élémentaire', 19, NULL),
(30, 'Algorithmique 1', 20, NULL),
(31, 'Mécanique du point 1', 21, NULL),
(32, 'Fondement de la chimie atomistique', 21, NULL),
(33, 'Introduction à l\'Économie', 22, NULL),
(34, 'Physique et Chimie 2', 23, 3),
(35, 'Économie 2', 23, 3);

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE `partie` (
  `id` int(11) NOT NULL,
  `id_sous_matiere` int(11) NOT NULL,
  `type` enum('CM','TD','TP') COLLATE utf8_bin NOT NULL,
  `nb_etudiants` int(11) NOT NULL,
  `nb_heures` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `regroupement`
--

CREATE TABLE `regroupement` (
  `id_groupe` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `sous_matiere`
--

CREATE TABLE `sous_matiere` (
  `id` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `sous_matiere`
--

INSERT INTO `sous_matiere` (`id`, `description`) VALUES
(1, 'Expresion Écrite et Oral'),
(2, 'Anglais S1'),
(3, 'Analyse élémentaire'),
(4, 'Calcul algébrique élémentaire'),
(5, 'Algorithmique 1'),
(6, 'Mécanique du point 1'),
(7, 'Fondement de la chimie atomistique'),
(8, 'Introduction à l\'économie'),
(9, 'Mécanique du point 2'),
(10, 'Évolution d\'un système chimique'),
(11, 'Macroéconomie'),
(12, 'Anglais S2'),
(13, '3PE'),
(14, 'Culture numérique'),
(15, 'Géométrie analytique'),
(16, 'Electrostatique'),
(17, 'Electrocinétique'),
(18, 'Optique géométrique'),
(19, 'TP Physique'),
(20, 'Chimie Organique 1'),
(21, 'Chimie en solution aqueueuse 1'),
(22, 'Algorithmique 2'),
(23, 'Fondement de l\'informatique 1'),
(24, 'Dévelopemment web 1'),
(25, 'Théorie des langages'),
(26, 'Fondement de l\'analyse'),
(27, 'Arithmétique'),
(28, 'Micro économie 1'),
(29, 'Statistique descriptives');

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

CREATE TABLE `ue` (
  `id` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `bloc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `ue`
--

INSERT INTO `ue` (`id`, `id_formation`, `nom`, `description`, `bloc`) VALUES
(1, 12, 'UE1 - Anglais', 'Anglais (2 ECTS)', 1),
(2, 12, 'UE2 - Fondements', 'Fondements de l\'informatique (5 ECTS)', 1),
(3, 12, 'UE3 - THLC', 'Théorie des langages et compilation (5 ECTS)', 1),
(4, 12, 'UE4 - DCRA', 'Décomposition, Conception et réalisation d\'applications (5 ECTS)', 1),
(5, 12, 'UE5 - Assembleur', 'Théorie de l\'information et architecture (5 ECTS)', 1),
(6, 12, 'UE6 - POO C++', 'Programmation Orientée Objet en C++ (6 ECTS)', 1),
(7, 12, 'UE7 - Graphes', 'Algorthmique des graphes (2 ECTS)', 1),
(8, 12, 'UE1 - BDD', 'Base de données (5 ECTS)', 2),
(9, 12, 'UE2 - Dév. web', 'Développement web (5 ECTS)', 2),
(10, 12, 'UE3 - Paradigme', 'Programmation logique et fonctionnel (5 ECTS)', 2),
(11, 12, 'UE4 - Options', 'Options de spécialisation (3 ECTS)', 2),
(12, 12, 'UE5 - Stage', 'Projet ou Stage (5 ECTS)', 2),
(13, 12, 'UE6 - 3PE', 'Projet Personnel et Professionel de l\'Etudiant (2 ECTS)', 2),
(14, 12, 'UE7 - Anglais', 'Anglais (2 ECTS)', 2),
(18, 10, 'UE1 - MPCIE', 'Lorem pisumo', 1),
(19, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 1),
(20, 10, 'UE3 - MPCIE Informatique', 'Lorem pisumo', 1),
(21, 10, 'UE4 - MPCIE Phys. Chimie', 'Lorem pisumo', 1),
(22, 10, 'UE5 - MPCIE Économie', 'Lorem pisumo', 1),
(23, 10, 'UE6 - MPCIE Choix', 'Lorem pisumo', 1),
(24, 10, 'UE1 - MPCIE', 'Lorem pisumo', 2),
(25, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 2),
(26, 10, 'UE - Parcour', 'Lorem pisumo', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartenance_matiere`
--
ALTER TABLE `appartenance_matiere`
  ADD KEY `id_matiere` (`id_matiere`,`id_sous_matiere`),
  ADD KEY `id_sous_matiere` (`id_sous_matiere`);

--
-- Index pour la table `choix_etudiants`
--
ALTER TABLE `choix_etudiants`
  ADD KEY `id_matiere` (`id_matiere`,`id_etu`);

--
-- Index pour la table `choix_groupe`
--
ALTER TABLE `choix_groupe`
  ADD KEY `id_etu` (`id_etu`,`id_groupe`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_partie` (`id_partie`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe_options`
--
ALTER TABLE `groupe_options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `incompatibilite`
--
ALTER TABLE `incompatibilite`
  ADD KEY `id_matiere_a` (`id_matiere_a`),
  ADD KEY `id_matiere_b` (`id_matiere_b`);

--
-- Index pour la table `inscrit_formation`
--
ALTER TABLE `inscrit_formation`
  ADD KEY `id_etudiant` (`id_etudiant`,`id_formation`),
  ADD KEY `inscrit_formation_ibfk_2` (`id_formation`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ue` (`id_ue`),
  ADD KEY `id_groupe_opt` (`id_groupe_opt`);

--
-- Index pour la table `partie`
--
ALTER TABLE `partie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ue` (`id_sous_matiere`);

--
-- Index pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD KEY `id_groupe` (`id_groupe`,`id_classe`);

--
-- Index pour la table `sous_matiere`
--
ALTER TABLE `sous_matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `ue`
--
ALTER TABLE `ue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formation` (`id_formation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_options`
--
ALTER TABLE `groupe_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sous_matiere`
--
ALTER TABLE `sous_matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `ue`
--
ALTER TABLE `ue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenance_matiere`
--
ALTER TABLE `appartenance_matiere`
  ADD CONSTRAINT `appartenance_matiere_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `appartenance_matiere_ibfk_2` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`);

--
-- Contraintes pour la table `choix_etudiants`
--
ALTER TABLE `choix_etudiants`
  ADD CONSTRAINT `choix_etudiants_ibfk_2` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `choix_etudiants_ibfk_3` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `choix_groupe`
--
ALTER TABLE `choix_groupe`
  ADD CONSTRAINT `choix_groupe_ibfk_1` FOREIGN KEY (`id_etu`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `choix_groupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_partie`) REFERENCES `partie` (`id`);

--
-- Contraintes pour la table `incompatibilite`
--
ALTER TABLE `incompatibilite`
  ADD CONSTRAINT `incompatibilite_ibfk_1` FOREIGN KEY (`id_matiere_a`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `incompatibilite_ibfk_2` FOREIGN KEY (`id_matiere_b`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `inscrit_formation`
--
ALTER TABLE `inscrit_formation`
  ADD CONSTRAINT `inscrit_formation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `inscrit_formation_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`id_ue`) REFERENCES `ue` (`id`),
  ADD CONSTRAINT `matiere_ibfk_2` FOREIGN KEY (`id_groupe_opt`) REFERENCES `groupe_options` (`id`);

--
-- Contraintes pour la table `partie`
--
ALTER TABLE `partie`
  ADD CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_sous_matiere`) REFERENCES `sous_matiere` (`id`);

--
-- Contraintes pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD CONSTRAINT `regroupement_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `regroupement_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
