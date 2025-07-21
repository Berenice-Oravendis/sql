-- Création de la base de données
CREATE DATABASE IF NOT EXISTS `extranet_oravendis`;
USE `extranet_oravendis`;

-- Table des utilisateurs (collaborateurs)
CREATE TABLE IF NOT EXISTS `utilisateurs` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `prenom` VARCHAR(150) NOT NULL,
    `email` VARCHAR(200) NOT NULL UNIQUE,
    `age` INT(11) NOT NULL,
    `mdp` VARCHAR(15) NOT NULL,
    `departement` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des ressources partagées (actualités internes, RH, procédures)
CREATE TABLE IF NOT EXISTS `resources` (
    `resource_id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(128) NOT NULL,
    `content` TEXT NOT NULL,
    `category` VARCHAR(64) NOT NULL,
    `author_email` VARCHAR(255) NOT NULL,
    `is_enabled` BOOLEAN NOT NULL DEFAULT 1,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`resource_id`),
    FOREIGN KEY (`author_email`) REFERENCES utilisateurss(`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des utilisateurs (collaborateurs)
INSERT INTO `utilisateurs` (`prenom`, `email`, `age`, `mdp`, `departement`) VALUES 
('Angus', 'angus@oravendis.fr', '24', 'mdp2025', 'Service e-learning'),
('Adeline', 'adeline@oravendis.fr', '36', 'CommunicationOravendis', 'Service e-learning');

-- Insertion de ressources internes RH
INSERT INTO `resources` (`title`, `content`, `category`, `author_email`, `is_enabled`) VALUES
-- Fermeture annuelle
('Fermeture estivale : semaine du 15 août', 
'📆 La société sera fermée du lundi 11 août au dimanche 17 août inclus. Aucune permanence ne sera assurée cette semaine-là. Merci de planifier vos demandes RH en conséquence.',
'Info RH', 
'adeline@oravendis.fr', 
1),

-- Nouvelle recrue en communication
('Bienvenue à notre nouvelle secrétaire administrative !',
'🎉 Nous avons le plaisir d’accueillir Aissetou dans l’équipe à compter du 2 août. Elle interviendra notamment sur les relances apprenants et le démarchage téléphonique. N’hésitez pas à lui souhaiter la bienvenue 👋',
'Communication interne', 
'adeline@oravendis.fr', 
1);
