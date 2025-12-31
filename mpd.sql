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