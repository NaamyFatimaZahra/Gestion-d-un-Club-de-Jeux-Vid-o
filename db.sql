--  La création du DB (DataBase) 

     CREATE DataBase gestion_club_jeux;

--  L'etulisation du DATABASE  

     USE gestion_club_jeux

--  La création  du tableau "games"  
     CREATE TABLE games(
          id int AUTO_INCREMENT PRIMARY KEY,
          titre VARCHAR(100) NOT NULL,
          studio_dev VARCHAR(100)NOT NULL,
          annee_sortie TIMESTAMP NOT NULL,
          genre VARCHAR(100) NOT NULL,
          multijoueur int CHECK (multijoueur IN (0, 1))
     );

--  La création  du tableau "members"  

CREATE TABLE members(
    id int AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR(100)  NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_inscription TIMESTAMP
   
);

--  La création  du tableau "tournaments"  

CREATE TABLE tournaments (
         id int AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(100) NOT NULL,
          date_tournament TIMESTAMP  NOT NULL,
          recomposant VARCHAR(40)  NOT NULL
);

--  La création  du tableau "subscriptions"  

 CREATE TABLE subscriptions(
          id int AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(100) NOT NULL,
          date_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          date_fin TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          member_id int NOT NULL,
          FOREIGN KEY ( member_id) REFERENCES members(id)

     );



--  La création  du tableau "participations"  

     CREATE TABLE participations(
          id int AUTO_INCREMENT PRIMARY KEY,
          score int NOT NULL,
          range_final int NOT NULL,
          member_id int NOT NULL,
          FOREIGN KEY ( member_id) REFERENCES members(id),
          tournament_id int NOT NULL,
          FOREIGN KEY ( tournament_id) REFERENCES tournaments(id)
     );


--  La création  du tableau "borrows"  

     CREATE TABLE borrows (
          id int AUTO_INCREMENT PRIMARY KEY,
          name VARCHAR(100) NOT NULL,
          date_start TIMESTAMP NOT NULL,
          date_retour_preuve TIMESTAMP NOT NULL,
          date_retour_reelle TIMESTAMP NOT NULL,
          member_id int NOT NULL,
          FOREIGN KEY ( member_id) REFERENCES members(id),
          games_id int NOT NULL,
          FOREIGN KEY ( games_id) REFERENCES games(id)
);