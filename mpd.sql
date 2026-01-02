create database bibliotheque;
use bibliotheque;
create table rayon(
id_rayon int not null auto_increment primary key,
nom varchar(120) not null 
);
create table ouvrage(
id_ouvrage int not null auto_increment primary key,
titre varchar(300) not null ,
date_publication date,
id_rayon int ,
foreign key (id_rayon) references rayon(id_rayon)
);
create table auteur(
id_auteur int auto_increment not null primary key,
nom varchar(200) not null,
prenom varchar(200) not null
);
create table lecteur(
id_lecteur int auto_increment not null primary key,
nom varchar(200) not null ,
prenom varchar(200) not null,
email varchar(500) not null unique,
cin varchar(100) not null unique ,
tel varchar(15) not null unique 
);
create table auteur_ouvrage (
    id_ouvrage INT,
    id_auteur INT,
    PRIMARY KEY (id_ouvrage, id_auteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage),
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur)
);
create table emprunt(
id_emprunt int not null auto_increment primary key,
date_emprunt date not null,
date_retour_prevue date not null,
date_retour_reel date not null,
id_ouvrage int,
id_lecteur int,
foreign key(id_lecteur) references lecteur(id_lecteur),
foreign key(id_ouvrage) references ouvrage(id_ouvrage)
);
create table personnel(
id_personnel int not null auto_increment primary key,
nom varchar(300) not null,
prenom varchar(300) not null,
email varchar(500) not null unique,
mot_de_passe varchar(600) not null,
id_chef int,
foreign key(id_chef) references personnel(id_personnel) 
);
insert into rayon (nom) values
('Informatique'),
('Littérature'),
('Science'),
('Histoire');
insert into ouvrage (titre, date_publication, id_rayon) values
('Python pour débutants', '2021-03-10', 1),
('Les Misérables', '1862-01-01', 2),
('Physique moderne', '2015-07-15', 3),
('Histoire du Maroc', '2018-05-20', 4);
insert into auteur (nom, prenom) values
('Dupont', 'Jean'),
('Hugo', 'Victor'),
('Einstein', 'Albert'),
('El Mansouri', 'Ahmed');
insert into lecteur (nom, prenom, email, cin, tel) values
('Ali', 'Karim', 'ali.karim@mail.com', 'AB123456', '0612345678'),
('Sara', 'Mouad', 'sara.mouad@mail.com', 'CD789012', '0698765432');
insert into auteur_ouvrage value (1,1), (2,2),(3,3) ,(4,4);
insert into emprunt (date_emprunt, date_retour_prevue, date_retour_reel, id_ouvrage, id_lecteur) values
('2025-12-01', '2025-12-15','2025-12-17', 1, 1),
('2025-12-05', '2025-12-20', '2025-12-30', 2, 2);
insert into personnel (nom, prenom, email, mot_de_passe, id_chef) values
('Benzouina', 'Rachid', 'rachid.benzouina@mail.com', 'pass123', NULL),
('Haddad', 'Laila', 'laila.haddad@mail.com', 'pass456', 1);
