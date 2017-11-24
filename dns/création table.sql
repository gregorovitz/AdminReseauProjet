CREATE TABLE `villes` (
`id` int(10) unsigned NOT NULL auto_increment,
`cp` char (10) collate utf8_unicode_ci not null,
`ville` char (200) collate utf8_unicode_ci NOT NULL,
PRIMARY KEY  (`id`)) 
DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2851 ;

create table `Ecole`(
`IdEcole` int(10) not null auto_increment,
`Nom` char(250) not null,
`rue` char (250) not null,
`numadresse` int not null,
`id` int(10) unsigned NOT NULL,
`Tel` char (60) not null,
`mdp` varchar(256) not null,
`mail` char(256)not null unique,
`HFermeture` TIME not null,
`Classedisable` int(1) unsigned default 0 ,	
primary key(`IdEcole`),foreign key(id)references `villes`(id))
DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

    
create table `classe`(
`IdClasse` int(10) not null auto_increment,
`nomClasse` char(250) not null,
`IdEcole` int(10) not null,
`Etage` int(10)not null,
`Aile` int(10),
`disable` int(1) unsigned default 0 ,
primary key(`IdClasse`),foreign key(`IdEcole`)references `Ecole`(`IdEcole`))
DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

create table `fenetre`(
`IdFenetre` int(10) not null auto_increment,
`IdClasse` int(10) not null,
`FenetreOuverte` int(1) not null default 0,
`disable` int(1) unsigned default 0,
primary key(`IdFenetre`),foreign key(`IdClasse`)references `Classe`(`IdClasse`))
DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

create table `temperature`(
`Idtemperature` int(10) not null auto_increment,
`temperature` float not null,
`IdClasse` int(10) not null,
`datetemp` date not null,
primary key(`Idtemperature`),foreign key(`IdClasse`)references `classe`(`IdClasse`))
DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;



