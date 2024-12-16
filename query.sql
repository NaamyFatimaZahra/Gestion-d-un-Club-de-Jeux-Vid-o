-- Requêtes de Base--

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


-- Requêtes avec Jointures--

-- Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final.


SELECT  pseudo ,   name as name_tournoi, range_final 
FROM participations
INNER JOIN members
on participations.member_id=members.id

INNER JOIN tournaments
on participations.tournament_id=tournaments.id

-- Trouver les membres qui ont souscrit à un abonnement annuel.

SELECT pseudo,email,date_inscription
FROM subscriptions
INNER JOIN members
on subscriptions.member_id=members.id
WHERE DATEDIFF(subscriptions.date_fin,subscriptions.date_start)=365

-- Trouver les jeux empruntés par un membre spécifique (via son pseudo).
SELECT titre as title_Game, pseudo
FROM borrows
INNER JOIN members
ON borrows.member_id=members.id
INNER JOIN games
ON borrows.games_id=games.id
WHERE members.pseudo="Alice Dupont"


-- Lister tous les emprunts, en incluant le pseudo du membre et les informations sur le jeu (titre et studio de développement).
SELECT borrows.id,borrows.name,borrows.date_start,borrows.date_retour_preuve,borrows.date_retour_reelle,borrows.member_id,borrows.games_id, pseudo as pseudo_member,titre as titre_jeu,studio_dev
FROM borrows 
INNER JOIN members
ON borrows.member_id=members.id
INNER JOIN games
ON borrows.games_id=games.id


-- Afficher la liste des membres et le type d'abonnement auquel ils sont associés.

SELECT pseudo as pseudo_members,subscriptions.name as type_subscription
FROM members 
INNER JOIN subscriptions
ON subscriptions.member_id=members.id


-- Requêtes avec Agrégation--

-- Calculer le nombre total de jeux disponibles par genre.

SELECT genre ,COUNT(*) as jeu_dispo
FROM games
GROUP BY genre

--Trouver le tournoi avec le plus grand nombre de participants.

SELECT tournament_id, COUNT(*) AS participant_count
FROM participations
GROUP BY tournament_id
ORDER BY participant_count DESC
LIMIT 1

-- Afficher le nombre d'emprunts réalisés par chaque membre.

SELECT pseudo,COUNT(*) as borrow_realises
FROM borrows
INNER JOIN members
ON borrows.member_id=members.id
GROUP BY member_id

