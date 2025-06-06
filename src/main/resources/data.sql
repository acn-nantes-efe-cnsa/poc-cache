
-- Insertion de 50 utilisateurs de test
INSERT INTO utilisateur (nom, prenom, email, date_naissance) VALUES
('Dupont', 'Jean', 'jean.dupont@email.com', '1990-01-15'),
('Martin', 'Sophie', 'sophie.martin@email.com', '1985-05-22'),
('Bernard', 'Pierre', 'pierre.bernard@email.com', '1992-08-10'),
('Petit', 'Marie', 'marie.petit@email.com', '1988-11-30'),
('Durand', 'Thomas', 'thomas.durand@email.com', '1995-03-25'),
('Leroy', 'Julie', 'julie.leroy@email.com', '1991-07-18'),
('Moreau', 'Nicolas', 'nicolas.moreau@email.com', '1987-09-05'),
('Simon', 'Laura', 'laura.simon@email.com', '1993-12-12'),
('Laurent', 'Kevin', 'kevin.laurent@email.com', '1989-04-20'),
('Michel', 'Amandine', 'amandine.michel@email.com', '1994-06-08'),
('Garcia', 'Alexandre', 'alexandre.garcia@email.com', '1986-02-14'),
('David', 'Céline', 'celine.david@email.com', '1996-10-03'),
('Bertrand', 'Julien', 'julien.bertrand@email.com', '1984-07-27'),
('Roux', 'Elodie', 'elodie.roux@email.com', '1997-09-15'),
('Vincent', 'Antoine', 'antoine.vincent@email.com', '1983-01-30'),
('Fournier', 'Caroline', 'caroline.fournier@email.com', '1998-05-22'),
('Morel', 'Guillaume', 'guillaume.morel@email.com', '1982-11-11'),
('Girard', 'Aurélie', 'aurelie.girard@email.com', '1999-08-07'),
('Andre', 'Romain', 'romain.andre@email.com', '1981-04-19'),
('Lefebvre', 'Marine', 'marine.lefebvre@email.com', '2000-12-25'),
('Mercier', 'Hugo', 'hugo.mercier@email.com', '1980-06-30'),
('Dupuis', 'Chloé', 'chloe.dupuis@email.com', '2001-02-14'),
('Lambert', 'Quentin', 'quentin.lambert@email.com', '1979-09-08'),
('Bonnet', 'Manon', 'manon.bonnet@email.com', '2002-07-03'),
('Francois', 'Maxime', 'maxime.francois@email.com', '1978-10-22'),
('Martinez', 'Océane', 'oceane.martinez@email.com', '2003-03-17'),
('Legrand', 'Baptiste', 'baptiste.legrand@email.com', '1977-12-05'),
('Garnier', 'Léa', 'lea.garnier@email.com', '2004-08-19'),
('Faure', 'Théo', 'theo.faure@email.com', '1976-05-11'),
('Rousseau', 'Camille', 'camille.rousseau@email.com', '2005-01-07'),
('Blanc', 'Enzo', 'enzo.blanc@email.com', '1975-11-23'),
('Guerin', 'Léa', 'lea.guerin@email.com', '2006-06-14'),
('Muller', 'Lucas', 'lucas.muller@email.com', '1974-04-02'),
('Henry', 'Clara', 'clara.henry@email.com', '2007-09-28'),
('Roussel', 'Nathan', 'nathan.roussel@email.com', '1973-02-16'),
('Nicolas', 'Lola', 'lola.nicolas@email.com', '2008-07-12'),
('Perrot', 'Tom', 'tom.perrot@email.com', '1972-10-09'),
('Morin', 'Ines', 'ines.morin@email.com', '2009-12-03'),
('Mathieu', 'Hugo', 'hugo.mathieu@email.com', '1971-08-26'),
('Clement', 'Louise', 'louise.clement@email.com', '2010-04-18'),
('Gauthier', 'Ethan', 'ethan.gauthier@email.com', '1970-01-11'),
('Dumont', 'Jade', 'jade.dumont@email.com', '2011-11-22'),
('Lopez', 'Raphaël', 'raphael.lopez@email.com', '1969-07-07'),
('Fontaine', 'Zoé', 'zoe.fontaine@email.com', '2012-05-30'),
('Chevalier', 'Gabriel', 'gabriel.chevalier@email.com', '1968-09-14'),
('Robin', 'Léna', 'lena.robin@email.com', '2013-03-08'),
('Masson', 'Arthur', 'arthur.masson@email.com', '1967-06-21'),
('Sanchez', 'Romane', 'romane.sanchez@email.com', '2014-10-15'),
('Gerard', 'Louis', 'louis.gerard@email.com', '1966-12-28'),
('Perez', 'Emma', 'emma.perez@email.com', '2015-08-04');

-- Vérification du nombre d'utilisateurs insérés
SELECT COUNT(*) AS nombre_utilisateurs FROM utilisateur;
