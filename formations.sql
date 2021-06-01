
INSERT INTO `formation` (`id`, `nom`, `responsable_annee`, `nb_bloc`) VALUES
(10, 'L1 MPCIE', NULL, 2),
(11, 'L2 MPCIE', NULL, 2),
(12, 'L3 Info',NULL, 2),
(13, 'LP Logiciel Libre', NULL, 2),
(14, 'MASTER 1 Info', NULL, 2),
(15, 'MASTER 2 ACDI', NULL, 2),
(16, 'MASTER 2 ID', NULL, 2);


INSERT INTO `ue` (`id`, `id_formation`, `nom`, `description`, `bloc`) VALUES
(1, 12, 'UE1 - Anglais', 'Anglais (2 ECTS)', 1),
(2, 12, 'UE2 - Fondements', 'Fondements de l informatique (5 ECTS)', 1),
(3, 12, 'UE3 - THLC', 'Theorie des langages et compilation (5 ECTS)', 1),
(4, 12, 'UE4 - DCRA', 'Decomposition, Conception et realisation d\'applications (5 ECTS)', 1),
(5, 12, 'UE5 - Assembleur', 'Theorie de l\'information et architecture (5 ECTS)', 1),
(6, 12, 'UE6 - POO C++', 'Programmation Orientee Objet en C++ (6 ECTS)', 1),
(7, 12, 'UE7 - Graphes', 'Algorthmique des graphes (2 ECTS)', 1),
(8, 12, 'UE1 - BDD', 'Base de donnees (5 ECTS)', 2),
(9, 12, 'UE2 - Dév. web', 'Developpement web (5 ECTS)', 2),
(10, 12, 'UE3 - Paradigme', 'Programmation logique et fonctionnel (5 ECTS)', 2),
(11, 12, 'UE4 - Options', 'Options de spécialisation (3 ECTS)', 2),
(12, 12, 'UE5 - Stage', 'Projet ou Stage (5 ECTS)', 2),
(13, 12, 'UE6 - 3PE', 'Projet Personnel et Professionel de l\'Etudiant (2 ECTS)', 2),
(14, 12, 'UE7 - Anglais', 'Anglais (2 ECTS)', 2),
(18, 10, 'UE1 - MPCIE', 'Lorem pisumo', 1),
(19, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 1),
(20, 10, 'UE3 - MPCIE Informatique', 'Lorem pisumo', 1),
(21, 10, 'UE4 - MPCIE Phys. Chimie', 'Lorem pisumo', 1),
(22, 10, 'UE5 - MPCIE Economie', 'Lorem pisumo', 1),
(23, 10, 'UE6 - MPCIE Choix', 'Lorem pisumo', 1),
(24, 10, 'UE1 - MPCIE', 'Lorem pisumo', 2),
(25, 10, 'UE2 - MPCIE Math', 'Lorem pisumo', 2),
(26, 10, 'UE - Parcour', 'Lorem pisumo', 2);

INSERT INTO `matiere` (`id`, `nom_matiere`, `id_ue`, `id_groupe_opt`) VALUES
(1, 'Anglais S5', 1, NULL),
(2, 'Fondements de l informatique', 2, NULL),
(3, 'Théorie des langages et compilation', 3, NULL),
(4, 'DCRA', 4, NULL),
(5, 'Théorie de l information et assembleur', 5, NULL),
(6, 'Programmation orientée objet en C++', 6, NULL),
(7, 'Algorithmique des graphes', 7, NULL),
(8, 'Base de donnée', 8, NULL),
(9, 'Développement web', 9, NULL),
(10, 'Programmation logique et fonctionnel', 10, NULL),
(11, 'Synthèse d images', 11, 1),
(12, 'Traitement de données en Python', 11, 1),
(13, 'Développement d interface graphiques avancées', 11, 1),
(14, 'Production automatisée de documents', 11, 1),
(15, 'Initiation à la programmation de système intélligent', 11, 1),
(16, '3PE', 13, NULL),
(17, 'Anglais S1', 18, NULL),
(18, 'Anglais S2', 24, NULL),
(19, '3PE', 24, NULL),
(20, 'Culture numérique', 24, NULL),
(21, 'Géométrie analytique', 25, NULL),
(22, 'Physique Chimie', 26, 2),
(23, 'Mathématique', 26, 2),
(24, 'Informatique', 26, 2),

(26, 'EEO', 18, NULL),

(28, 'Analyse élémentaire', 19, NULL),
(29, 'Calcul algébrique élémentaire', 19, NULL),
(30, 'Algorithmique 1', 20, NULL),
(31, 'Mécanique du point 1', 21, NULL),
(32, 'Fondement de la chimie atomistique', 21, NULL),
(33, 'Introduction a l économie', 22, NULL),
(34, 'Physique et Chimie 2', 23, 3),
(35, 'Économie 2', 23, 3),
(36, 'Anglais S6', 14, NULL);


INSERT INTO `sous_matiere` (`id`, `description`) VALUES
(1, 'Expresion Écrite et Oral'),
(2, 'Anglais S1'),
(3, 'Analyse élémentaire'),
(4, 'Calcul algébrique élémentaire'),
(5, 'Algorithmique 1'),
(6, 'Mécanique du point 1'),
(7, 'Fondement de la chimie atomistique'),
(8, 'Introduction a l économie'),
(9, 'Mécanique du point 2'),
(10, 'Evolution d un système chimique'),
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
(23, 'Fondement de l informatique 1'),
(24, 'Dévelopemment web 1'),
(25, 'Théorie des langages'),
(26, 'Fondement de l analyse'),
(27, 'Arithmétique'),
(28, 'Micro économie 1'),
(29, 'Statistique descriptives'),
(30, 'Anglais S5'),
(31, 'Fondements de l informatique'),
(32, 'Théorie des langages et compilation'),
(33, 'Décomposition, Conception et réalisation d application'),
(34, 'Théorie de l information et architecture'),
(35, 'Programmation Orientée Objet en C++'),
(36, 'Algorthmique des graphes'),
(37, 'Base de données'),
(38, 'Developpement web 3'),
(39, 'Programmation logique et fonctionnel'),
(41, 'Projet ou Stage'),
(42, 'Projet Personnel et Professionel de l Etudiant'),
(43, 'Anglais S6'),
(44, 'SI'),
(45, 'PY'),
(46, 'DIGA'),
(47, 'PAD'),
(48, 'ISI');


INSERT INTO `appartenance_matiere` (`id_matiere`, `id_sous_matiere`) VALUES
(1, 30),
(2, 31),
(3, 32),
(4, 33),
(5, 34),
(6, 35),
(7, 36),
(8, 37),
(9, 38),
(10, 39),
(11, 44),
(12, 45),
(13, 46),
(14, 47),
(15, 48),
(16, 42),
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
(23, 22),
(23,26),
(23,27),
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
(35, 11),
(36, 43);




INSERT INTO `incompatibilite` (`id_matiere_a`, `id_matiere_b`) VALUES
(11, 12),
(14, 15),
(13, 14),
(13, 15);
