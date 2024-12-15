-- Requêtes de Base

-- Lister les informations de tous les membres (pseudo, e-mail, date d'inscription).
SELECT pseudo, email, date_inscription FROM members



-- Afficher la liste des jeux disponibles, avec leur titre, genre, et studio de développement.
SELECT titre,genre,studio_dev FROM games


-- Afficher les détails d'un tournoi spécifique à partir de son nom.
SELECT * FROM tournaments WHERE name="Battle Royale"

-- Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu.

SELECT name, pseudo,titre 
FROM borrows,games,members
WHERE borrows.date_retour_reelle>=CURRENT_DATE




