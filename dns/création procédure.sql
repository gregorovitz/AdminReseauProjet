CREATE DEFINER=`Admin`@`%` PROCEDURE `add_Local`(name char(255),id int(10),etage int(10),aile int(10),nbr int(10))
BEGIN
insert into classe (nomClasse,IdEcole,Etage,Aile,NbrFenetre) values (name,id,etage,aile,nbr);

END


CREATE DEFINER=`Admin`@`%` PROCEDURE `login`(In user char(255) )
BEGIN
select * 
From Ecole 
where (Nom = user COLLATE utf8_unicode_ci
or mail = user COLLATE utf8_unicode_ci) ;
END


CREATE DEFINER=`Admin`@`%` PROCEDURE `signUp`(ecole char(250),rue char(250),num int(11),id int(10),phone char(60),pwd varchar(255),email char(255),closingHours time)
BEGIN
INSERT INTO Ecole(Nom,rue,numadresse,id,Tel,mdp,mail,HFermeture) 
VALUES(ecole,rue, num, id, phone,pwd,email,closingHours);
END


CREATE DEFINER=`Admin`@`%` PROCEDURE `update_Fenetre`(idfenetre int(10),etat int(1))
BEGIN
update fenetre set FenetreOuverte=etat
where IdFenetre=idfenetre;

END


CREATE DEFINER=`Admin`@`%` PROCEDURE `update_Local`(nameclase char(255),id int(10),etage int(10),aile int(10),nbr int(10))
BEGIN
update classe set nomClasse=nameclasse,IdEcole=id,Etage=etage,Aile=aile,NbrFenetre=nbr;

END

CREATE DEFINER=`Admin`@`%` PROCEDURE `show_classe`(idecole char(255))
BEGIN
select c.IdClasse,c.nomClasse,c.IdEcole,c.Etage,c.Aile,count(idfenetre) as Fenetreouverte 
from classe c inner join fenetre f ON c.IdClasse = f.IdClasse 
where IdEcole=idecole and (FenetreOuverte=1 and disable=0) 
group by c.IdClasse;

END

CREATE DEFINER=`Admin`@`%` PROCEDURE `delete_Local`(Id int(10))
BEGIN
update classe set Classedisable=1
where id=Id;

END

CREATE PROCEDURE `add_fenetre` (id int(10))
BEGIN
insert into fenetre (IdClasse) values(id);

END
