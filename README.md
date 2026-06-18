# Analyse SQL — Ventes d'une Supérette

Analyse SQL des ventes d'une supérette répartie sur deux villes (Lyon et Paris), avec des requêtes répondant à des questions métier concrètes sur les volumes, les produits et le chiffre d'affaires.

## Contexte

Données fictives représentant une supérette avec 5 produits répartis en 3 catégories (Boulangerie, Boissons, Fruits), et 8 transactions de vente sur deux villes.

## Outils

SQL standard (testé avec SQLite et compatible MySQL).

## Structure du projet

- `schema.sql` : création des tables et insertion des données
- `questions_metier.sql` : les 6 requêtes avec leurs questions métier associées
- `README.md` : ce fichier

## Questions métier traitées

1. Quel est le total des ventes (en quantité) par ville ?
2. Quelle quantité a été vendue pour chaque produit ?
3. Quels produits se vendent le mieux à Lyon ?
4. Quelle est la quantité moyenne vendue par transaction, selon la ville ?
5. Quel est le profil complet des ventes par ville (nombre de transactions, quantité totale, moyenne) ?
6. Quel chiffre d'affaires chaque catégorie de produit génère-t-elle ?

## Principaux résultats

Lyon génère un volume de ventes supérieur à Paris, avec 50 unités vendues contre 35, et une quantité moyenne par transaction plus élevée (12,5 contre 8,75). Le Pain est le produit le plus vendu en quantité sur l'ensemble des deux villes, tandis qu'à Lyon spécifiquement, l'Eau prend la première place. En termes de chiffre d'affaires, la catégorie Boulangerie arrive en tête, suivie de près par les Fruits, malgré un nombre de produits vendus inférieur — ce qui s'explique par un prix unitaire plus élevé pour les fruits.

## Auteur

Souefou — Étudiant en Master Intelligence Artificielle (NEXA Digital School, Lyon)
