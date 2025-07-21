USE `bdd_extranetrh`;

-- 2. Préparation de la table utilisateurs (corriger si nécessaire)
ALTER TABLE `utilisateurs`
MODIFY `email` VARCHAR(200) NOT NULL,
ADD UNIQUE (`email`);

-- 3. Nettoyage
DROP TABLE IF EXISTS `ressources`;

-- 4. Création de la table des ressources RH
CREATE TABLE `ressources` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `titre` VARCHAR(128) NOT NULL,
    `contenu` TEXT NOT NULL,
    `categorie` VARCHAR(64) NOT NULL,
    `auteur_email` VARCHAR(200) NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT 1,
    `date_creation` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_utilisateur_email` FOREIGN KEY (`auteur_email`) 
        REFERENCES `utilisateurs`(`email`) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertion des ressources RH
INSERT INTO `ressources` (`titre`, `contenu`, `categorie`, `auteur_email`, `active`) VALUES
-- Fermeture annuelle
('Fermeture estivale : semaine du 15 août', 
'📆 La société sera fermée du lundi 11 août au dimanche 17 août inclus. Aucune permanence ne sera assurée cette semaine-là. Merci de planifier vos demandes RH en conséquence.',
'Info RH', 
'berenice@oravendis.fr', 
1),

-- Nouvelle arrivée
('Bienvenue à notre nouvelle recrue !',
'🎉 Nous avons le plaisir d’accueillir une nouvelle personne dans l’équipe à compter du 2 août. Elle interviendra notamment sur tous les aspects administratifs et le démarchage téléphonique. 
    N’hésitez pas à lui souhaiter la bienvenue 👋',
'Communication interne', 
'adeline@oravendis.fr', 
1),

-- Procédure interne
('Rappel : procédure de validation des congés',
'📌 Tous les congés doivent être validés par le manager via le portail RH avant le 25 du mois précédent. En cas de souci technique, contactez l’équipe RH à rh@oravendis.fr.',
'Procédures RH', 
'berenice@oravendis.fr', 
1);
