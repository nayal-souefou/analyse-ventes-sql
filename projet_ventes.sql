-- PROJET SQL : Analyse des ventes d'une superette
-- Auteur : NAYAL Souefou
-- Date : Juin 2026

-- =====================
-- CREATION DES TABLES
-- =====================

CREATE TABLE produits (
  id INTEGER,
  nom TEXT,
  categorie TEXT,
  prix REAL
);

CREATE TABLE ventes (
  id INTEGER,
  produit_id INTEGER,
  ville TEXT,
  quantite INTEGER,
  date TEXT
);

-- =====================
-- INSERTION DES DONNEES
-- =====================

INSERT INTO produits VALUES (1, 'Pain', 'Boulangerie', 1.50);
INSERT INTO produits VALUES (2, 'Lait', 'Boissons', 0.99);
INSERT INTO produits VALUES (3, 'Pomme', 'Fruits', 2.50);
INSERT INTO produits VALUES (4, 'Eau', 'Boissons', 0.50);
INSERT INTO produits VALUES (5, 'Croissant', 'Boulangerie', 1.20);

INSERT INTO ventes VALUES (1, 1, 'Lyon', 10, '2024-01-01');
INSERT INTO ventes VALUES (2, 2, 'Paris', 5, '2024-01-01');
INSERT INTO ventes VALUES (3, 3, 'Lyon', 8, '2024-01-02');
INSERT INTO ventes VALUES (4, 1, 'Paris', 15, '2024-01-02');
INSERT INTO ventes VALUES (5, 4, 'Lyon', 20, '2024-01-03');
INSERT INTO ventes VALUES (6, 2, 'Lyon', 12, '2024-01-03');
INSERT INTO ventes VALUES (7, 5, 'Paris', 6, '2024-01-04');
INSERT INTO ventes VALUES (8, 3, 'Paris', 9, '2024-01-04');

-- =====================
-- REQUETES D'ANALYSE
-- =====================

-- 1. Total des ventes par ville
SELECT ville, SUM(quantite) AS total_ventes
FROM ventes
GROUP BY ville
ORDER BY total_ventes DESC;

-- 2. Quantite vendue par produit
SELECT produit_id, SUM(quantite) AS total_vendu
FROM ventes
GROUP BY produit_id
ORDER BY total_vendu DESC;

-- 3. Ventes a Lyon uniquement
SELECT ville, produit_id, SUM(quantite) AS total
FROM ventes
WHERE ville = 'Lyon'
GROUP BY produit_id
ORDER BY total DESC;

-- 4. Moyenne des ventes par ville
SELECT ville, AVG(quantite) AS moyenne_ventes
FROM ventes
GROUP BY ville;

-- 5. Analyse complete
SELECT ville, COUNT(*) AS nombre_transactions,
SUM(quantite) AS total, AVG(quantite) AS moyenne
FROM ventes
GROUP BY ville
ORDER BY total DESC;
