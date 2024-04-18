-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 29 mars 2024 à 17:54
-- Version du serveur : 10.5.21-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `testCodeDMX`
--

-- --------------------------------------------------------

--
-- Structure de la table `canaux`
--

CREATE TABLE `canaux` (
  `numCanal` int(11) NOT NULL,
  `idScene` int(11) NOT NULL,
  `valeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `canaux`
--

INSERT INTO `canaux` (`numCanal`, `idScene`, `valeur`) VALUES
(7, 7, 45),
(8, 7, 78),
(9, 7, 415),
(10, 7, 12),
(7, 6, 78),
(8, 6, 45),
(9, 6, 12),
(10, 6, 65),
(4, 6, 45),
(5, 6, 78),
(6, 6, 12),
(7, 6, 36),
(8, 9, 78),
(9, 9, 45),
(10, 9, 12),
(11, 9, 36),
(4, 7, 45),
(5, 7, 78),
(6, 7, 12),
(7, 7, 56),
(8, 8, 78),
(9, 8, 12),
(10, 8, 45),
(11, 8, 56),
(34, 9, 1),
(35, 9, 1),
(36, 9, 1),
(37, 9, 1),
(34, 9, 45),
(35, 9, 4),
(36, 9, 1),
(37, 9, 2),
(32, 2, 255),
(4, 9, 12),
(5, 9, 45),
(6, 9, 78),
(7, 9, 56),
(135, 13, 150),
(136, 13, 100),
(65, 11, 97),
(101, 10, 65),
(1, 8, 16),
(1, 11, 78),
(1, 11, 45),
(121, 10, 45),
(125, 8, 78),
(120, 9, 45),
(121, 9, 78),
(32, 8, 45),
(33, 8, 78),
(34, 8, 95),
(35, 8, 26),
(36, 8, 12),
(37, 8, 3),
(110, 9, 45),
(111, 9, 45),
(2, 11, 12),
(3, 11, 12),
(2, 11, 78),
(3, 11, 12),
(5, 11, 78),
(6, 11, 45),
(7, 11, 12),
(8, 11, 0),
(9, 11, 142),
(10, 11, 45),
(105, 8, 45),
(106, 8, 12),
(100, 9, 45),
(101, 9, 78),
(110, 11, 45),
(111, 11, 78);

-- --------------------------------------------------------

--
-- Structure de la table `champ`
--

CREATE TABLE `champ` (
  `id` int(11) NOT NULL,
  `idEquip` int(11) NOT NULL,
  `idNumCanal` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `champ`
--

INSERT INTO `champ` (`id`, `idEquip`, `idNumCanal`, `nom`) VALUES
(1, 1, 1, 'rouge'),
(2, 1, 2, 'vert'),
(3, 1, 3, 'bleu'),
(4, 6, 4, 'rouge'),
(5, 6, 5, 'vert'),
(6, 6, 6, 'bleu'),
(7, 6, 7, 'blanc'),
(8, 7, 8, 'rouge'),
(9, 7, 9, 'vert'),
(10, 7, 10, 'bleu'),
(11, 7, 11, 'blanc'),
(12, 8, 12, 'rouge'),
(13, 8, 13, 'vert'),
(14, 8, 14, 'bleu'),
(15, 8, 15, 'blanc'),
(16, 9, 16, 'intensite'),
(17, 9, 17, 'rouge'),
(18, 9, 18, 'vert'),
(19, 9, 19, 'bleu'),
(20, 9, 20, 'blanc'),
(21, 9, 21, 'strobo'),
(22, 9, 22, 'mode'),
(23, 9, 23, 'effets'),
(33, 11, 32, 'shutter'),
(34, 11, 33, 'gobo'),
(35, 11, 34, 'rota gobo'),
(36, 11, 35, 'couleur'),
(37, 11, 36, 'pan'),
(38, 11, 37, 'tilt'),
(43, 13, 78, 'rouge'),
(44, 13, 79, 'vert'),
(45, 13, 80, 'bleu'),
(46, 13, 81, 'blanc'),
(73, 34, 135, 'rouge'),
(74, 34, 136, 'vert'),
(75, 35, 55, 'rouge'),
(76, 35, 56, 'vert'),
(77, 35, 57, 'bleu'),
(78, 35, 58, 'blanc'),
(79, 36, 65, 'rouge'),
(80, 37, 100, 'rouge'),
(81, 37, 101, 'vert'),
(82, 38, 105, 'rouge'),
(83, 38, 106, 'vert'),
(84, 39, 110, '48'),
(85, 39, 111, '45'),
(86, 40, 115, 'rouge'),
(87, 40, 116, 'vert'),
(88, 41, 120, 'rouge'),
(89, 41, 121, 'vert'),
(90, 42, 125, 'rouge'),
(91, 42, 126, 'vert'),
(92, 43, 800, 'rouge'),
(93, 43, 801, 'vert'),
(94, 43, 802, 'bleu'),
(95, 43, 803, 'blanc');

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adresse` int(11) NOT NULL,
  `nbCanal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id`, `nom`, `adresse`, `nbCanal`) VALUES
(1, 'lampe44', 1, 3),
(6, 'saber1', 4, 4),
(7, 'saber2', 8, 4),
(8, 'saber3', 12, 4),
(9, 'ghost1', 16, 8),
(11, 'TWIST 152', 32, 6),
(13, 'coucou', 78, 4),
(34, 'fauqtin', 135, 2),
(35, 'dodo', 55, 4),
(36, 'didi', 65, 1),
(37, 'okok', 100, 2),
(38, 'oki', 105, 2),
(39, 'okii', 110, 2),
(40, 'okiii', 115, 2),
(41, 'tomtom', 120, 2),
(42, 'tommeeee', 126, 3),
(43, 'testtom', 800, 4),
(44, 'faufau', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lightBoard`
--

CREATE TABLE `lightBoard` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `idScene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lightBoard`
--

INSERT INTO `lightBoard` (`id`, `idUser`, `x`, `y`, `idScene`) VALUES
(1, 12, 8, 11, 3),
(2, 4, 41, 82, 4),
(3, 12, 8, 7, 5),
(4, 14, 9, 32, 1),
(5, 5, 4, 1, 2),
(6, 7, 7, 68, 3),
(7, 12, 5, 8, 3),
(8, 3, 6, 9, 4),
(9, 3, 9, 6, 3),
(10, 4, 8, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `scene`
--

CREATE TABLE `scene` (
  `id` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `scene`
--

INSERT INTO `scene` (`id`, `nom`) VALUES
(1, 'studio'),
(2, 'laSceneBleue'),
(3, 'laSceneRouge'),
(4, 'laSceneVerte'),
(5, 'laSceneMusicale'),
(6, 'SceneConcentre'),
(7, 'SceneFolie'),
(8, 'SceneDisco'),
(9, 'SceneFin'),
(10, 'SceneFamille'),
(11, 'toilette'),
(12, 'caca'),
(13, 'testfauqtin'),
(14, 'tomlopette'),
(15, 'tomtom'),
(16, 'testtesttest');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `isAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `isAdmin`) VALUES
(1, 'lopes', 'damien', 'damienlopes@gmail.com', 'dadadu', 1),
(2, 'Leduc', 'Jean', 'jeanleduc@gmail.com', 'varna', 1),
(3, 'lopes', 'damien', 'damienlopes@gmail.com', 'dadadu', 1),
(4, 'lefevre', 'tom', 'tomlefevre@gmail.com', 'toto', 1),
(5, 'Gina', 'Laurent', 'Laurentgina@gmail.com', 'orangina', 0),
(6, 'Mentation', 'Ali', 'alimentation', 'corsair', 0),
(7, 'Lerdorf', 'Rasmus', 'Rasmuslerdorf', 'creatotphp@gmail.com', 0),
(8, 'lepretre', 'alexandre', 'lepretrealexandre@gmail.com', 'lepretre', 0),
(9, 'Senepart', 'mathias', 'blancdeblanc@gmail.com', 'messi', 0),
(10, 'tiennot', 'tibo', 'tibotiennot@gmail.com', 'OMBest', 0),
(11, 'Hautemaniere', 'Edouard', 'edouardhaute@gmail.com', 'doudou', 0),
(12, 'Briaux', 'simon', 'simonbriaux@gmail.com', 'briauxS', 0),
(13, 'admin', 'admin', 'admin@gmail.com', 'admin', 1),
(14, 'bilhaut', 'theo', 'Btheo@gmail.com', 'btheo', 0),
(15, 'tabary', 'hugo', 'hugotabary@gmail.com', 'hugot', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `canaux`
--
ALTER TABLE `canaux`
  ADD KEY `idScene` (`idScene`),
  ADD KEY `numCanal` (`numCanal`);

--
-- Index pour la table `champ`
--
ALTER TABLE `champ`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numCanal` (`idNumCanal`),
  ADD UNIQUE KEY `IdnumCanal` (`idNumCanal`),
  ADD UNIQUE KEY `IdNumCanal_2` (`idNumCanal`),
  ADD UNIQUE KEY `idNumCanal_3` (`idNumCanal`),
  ADD KEY `idcanaux` (`idEquip`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `lightBoard`
--
ALTER TABLE `lightBoard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`,`idScene`),
  ADD KEY `idScene` (`idScene`);

--
-- Index pour la table `scene`
--
ALTER TABLE `scene`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `champ`
--
ALTER TABLE `champ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `lightBoard`
--
ALTER TABLE `lightBoard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `scene`
--
ALTER TABLE `scene`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39477;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `canaux`
--
ALTER TABLE `canaux`
  ADD CONSTRAINT `canaux_ibfk_1` FOREIGN KEY (`idScene`) REFERENCES `scene` (`id`),
  ADD CONSTRAINT `canaux_ibfk_2` FOREIGN KEY (`numCanal`) REFERENCES `champ` (`idNumCanal`);

--
-- Contraintes pour la table `champ`
--
ALTER TABLE `champ`
  ADD CONSTRAINT `Champ_ibfk_1` FOREIGN KEY (`idEquip`) REFERENCES `equipement` (`id`);

--
-- Contraintes pour la table `lightBoard`
--
ALTER TABLE `lightBoard`
  ADD CONSTRAINT `lightBoard_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `lightBoard_ibfk_2` FOREIGN KEY (`idScene`) REFERENCES `scene` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
