-- ============================================================
-- ANALYSE SQL — VENTES D'UNE SUPERETTE
-- 6 questions métier traitées avec JOIN, GROUP BY, ORDER BY,
-- WHERE et fonctions d'agrégat (SUM, AVG, COUNT).
-- ============================================================

-- ------------------------------------------------------------
-- Question 1 : Quel est le total des ventes (en quantité) par ville ?
-- ------------------------------------------------------------
SELECT ville, SUM(quantite) AS total_ventes
FROM ventes
GROUP BY ville
ORDER BY total_ventes DESC;


-- ------------------------------------------------------------
-- Question 2 : Quelle quantité a été vendue pour chaque produit ?
-- (avec JOIN pour afficher le nom du produit plutôt que son id)
-- ------------------------------------------------------------
SELECT p.nom AS produit, SUM(v.quantite) AS total_vendu
FROM ventes v
INNER JOIN produits p ON v.produit_id = p.id
GROUP BY p.nom
ORDER BY total_vendu DESC;


-- ------------------------------------------------------------
-- Question 3 : Quels produits se vendent le mieux à Lyon ?
-- (avec JOIN pour afficher le nom du produit)
-- ------------------------------------------------------------
SELECT p.nom AS produit, SUM(v.quantite) AS total
FROM ventes v
INNER JOIN produits p ON v.produit_id = p.id
WHERE v.ville = 'Lyon'
GROUP BY p.nom
ORDER BY total DESC;


-- ------------------------------------------------------------
-- Question 4 : Quelle est la quantité moyenne vendue par transaction,
-- selon la ville ?
-- ------------------------------------------------------------
SELECT ville, AVG(quantite) AS moyenne_ventes
FROM ventes
GROUP BY ville;


-- ------------------------------------------------------------
-- Question 5 : Quel est le profil complet des ventes par ville
-- (nombre de transactions, quantité totale, moyenne) ?
-- ------------------------------------------------------------
SELECT ville,
       COUNT(*) AS nombre_transactions,
       SUM(quantite) AS total,
       AVG(quantite) AS moyenne
FROM ventes
GROUP BY ville
ORDER BY total DESC;


-- ------------------------------------------------------------
-- Question 6 : Quel chiffre d'affaires chaque catégorie de produit
-- génère-t-elle ? (JOIN + calcul prix x quantité)
-- ------------------------------------------------------------
SELECT p.categorie, SUM(p.prix * v.quantite) AS chiffre_affaires
FROM ventes v
INNER JOIN produits p ON v.produit_id = p.id
GROUP BY p.categorie
ORDER BY chiffre_affaires DESC;



-- ------------------------------------------------------------
-- Question 7 — Produit le plus vendu par ville
-- ------------------------------------------------------------
SELECT v.ville, p.nom AS produit, SUM(v.quantite) AS total
FROM ventes v
INNER JOIN produits p ON v.produit_id = p.id
GROUP BY v.ville, p.nom
ORDER BY v.ville, total DESC;