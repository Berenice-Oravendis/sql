-- Création de la BDD
CREATE DATABASE IF NOT EXISTS `extranet_oravendis`;
USE `extranet_oravendis`;

-- Table des utilisateurs (collaborateurs)
CREATE TABLE IF NOT EXISTS `users` (
    `user_id` INT(11) NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(64) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `department` VARCHAR(100) NOT NULL,
    `role` VARCHAR(50) NOT NULL, -- Exemple : 'RH', 'Formateur', 'Support'
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des ressources partagées (ex : tutos, idées, etc)
CREATE TABLE IF NOT EXISTS `resources` (
    `resource_id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(128) NOT NULL,
    `content` TEXT NOT NULL,
    `category` VARCHAR(64) NOT NULL, -- ex: Bien-être, Tuto RH, Bonnes pratiques
    `author_email` VARCHAR(255) NOT NULL,
    `is_enabled` BOOLEAN NOT NULL DEFAULT 1,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`resource_id`),
    FOREIGN KEY (`author_email`) REFERENCES users(`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Quelques collaborateurs (exemples fictifs)
INSERT INTO `users` (`full_name`, `email`, `password`, `department`, `role`) VALUES 
('Berenice', 'berenice@oravendis.fr', 'motdepasse', 'Direction', 'Gerante'),
('Angus', 'angus@oravendis.fr', 'formation2025', 'Service e-learning', 'Chargé de parcours'),
('Adeline', 'adeline@oravendis.fr', 'RH2025*', 'Service e-learning', 'Responsable de parcours');

-- Quelques ressources partagées (exemples)
INSERT INTO `resources` (`title`, `content`, `category`, `author_email`, `is_enabled`) VALUES
-- Fermeture annuelle
('Fermeture estivale : semaine du 15 août', 
'📆 La société sera fermée du lundi 11 août au dimanche 17 août inclus. Aucune permanence ne sera assurée cette semaine-là. Merci de planifier vos demandes RH en conséquence.',
'Info RH', 
'berenice@oravendis.fr', 
1),

-- Nouvelle recrue en communication
('Bienvenue à notre future stagiaire en communication !',
'🎉 Nous avons le plaisir d’accueillir Elodie, dans l’équipe Communication à compter du 2 août. Elle interviendra notamment sur les campagnes LinkedIn et les contenus vidéo. N’hésitez pas à lui souhaiter la bienvenue 👋',
'Communication interne', 
'adeline@oravendis.fr', 
1),

-- Procédure RH : validation des congés
('Rappel : procédure de validation des congés',
'📌 Tous les congés doivent être validés par le manager via le portail RH avant le 25 du mois précédent. En cas de souci technique, contactez la direction à technique@oravendis.fr.',
'Procédures RH', 
'berenice@oravendis.fr', 
1);

