
-------------------------------------COMNTROL QUERY--------------------------------------------------------

select * from LIBRO_BKS;
SELECT * FROM AUTORE_BKS;
select * from GENERE_BKS;
SELECT * FROM EDITORE_BKS;
SELECT p.id,u.email,u.password,p.nome FROM USERS_BKS as u,USER_PROFILE_BKS AS p where p.id=u.profile;
SELECT * FROM USER_PROFILE_BKS;



-------------------------DELETE BEFORE INSERT-----------------------------------
delete from LIBRO_BKS where id =1000;
delete from LIBRO_BKS where id =1010;
delete from LIBRO_BKS where id =1020;
delete from LIBRO_BKS where id =1030;
delete from LIBRO_BKS where id =1040;
delete from LIBRO_BKS where id =1050;
------------------------------INSERT---LIBRO_BKS-------------------------------
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1000,'Il Ciclope','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1010,'Il Ciclope II','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25.6);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1020,'La piramide dei Ghiacci','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,7.12);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1030,'Isola dei pirati','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1040,'Il giro del mondo in 80 giorni','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1050,'Il loto bianco','Una spy story ambientata in antartide.','10/10/1970',5010,3010,4010,7);

-------------------------DELETE BEFORE INSERT-----------------------------------
delete from LIBRO_BKS where id =1060;
delete from LIBRO_BKS where id =1070;
delete from LIBRO_BKS where id =1080;
delete from LIBRO_BKS where id =1090;
delete from LIBRO_BKS where id =1100;
delete from LIBRO_BKS where id =1110;
------------------------------INSERT---LIBRO_BKS-------------------------------
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1060,'La guerra dei mondi','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1070,'Minority report','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25.6);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1080,'Ocean eleven','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,7.12);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1090,'Nome della rosa','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1100,'Tre uomini a zonzo','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1110,'L ultimo dei moicani','Una spy story ambientata in antartide.','10/10/1970',5010,3010,4010,7);

-------------------------DELETE BEFORE INSERT-----------------------------------
delete from LIBRO_BKS where id =1120;
delete from LIBRO_BKS where id =1130;
delete from LIBRO_BKS where id =1140;
delete from LIBRO_BKS where id =1150;
delete from LIBRO_BKS where id =1160;
delete from LIBRO_BKS where id =1170;
------------------------------INSERT---LIBRO_BKS-------------------------------
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1120,'Dune','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1130,'Blad runner','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25.6);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1140,'I pilastri della terra','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,7.12);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1150,'Ulisse','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,25);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1160,'I  promessi sposi','Una spy story ambientata in antartide.','10/10/2005',5010,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1170,'Divina commedia','Una spy story ambientata in antartide.','10/10/1970',5010,3010,4010,7);

----------------------------------DELETE  GENERE BKS------------------------------------------

delete from genere_bks where id=5000;
delete from genere_bks where id=5010;
delete from genere_bks where id=5020;
delete from genere_bks where id=5030;
-------------------------------INSERT GENERE_BKS ------------------------------------------------
insert into genere_bks values(5000,'Gialli');
insert into genere_bks values(5010,'Avventura');
insert into genere_bks values(5020,'Rosa');
insert into genere_bks values(5030,'Storici');

------------------------------------DELETE EDITORE_BKS-------------------------------------------------------------------------
delete from editore_bks where id=3000;
delete from editore_bks where id=3010;
--------------------------------------INSERT EDITORE_BKS---------------------------------------------------------------
insert into editore_bks values(3000,'Feltrinelli');
insert into editore_bks values(3010,'Mondadori');
--------------------------------------DELETE AUTORE_BKS------------------------------------------------------------
delete from autore_bks where id=4000;
delete from autore_bks where id=4010;


-------------------------------------------DELETE AUTORE_BKS-------------------------------------------
delete from autore_bks where id=4000;
delete from autore_bks where id=4010;

----------------------------------INSERT AUTORE_BKS-------------------------------------------------------------
insert into autore_bks values(4000,'Smith','Wilbur','Scrittore libri avventura'); 
insert into autore_bks values(4010,'Banana','Yoshimoto','Scrittore libri romantici'); 


---------------------------------------------DELETE USER_BKS-------------------------------------------------------
DELETE FROM USERS_BKS WHERE ID=10;
DELETE FROM USERS_BKS WHERE ID=20;
DELETE FROM USERS_BKS WHERE ID=30;

-----------------------------------------------INSERT USERS_BKS----------------------------------------------------
INSERT INTO USERS_BKS(id,nome,cognome,email,password,profile) VALUES(10,'superadmin','Tazio','superadmin@spqr.it','superadmin',400);
insert into USERS_BKS(ID,nome,cognome,email,password,profile) values(20,'admin','Semproni','admin@spqr.it','admin',300);
insert into USERS_BKS(ID,nome,cognome,email,password,profile) values(30,'cartuser','Caio','user@spqr.it','cartuser',200);


---------------------------------------DELETE USER_PROFILE_BKS---------------------------------------
DELETE FROM USER_PROFILE_BKS WHERE ID=100;
DELETE FROM USER_PROFILE_BKS WHERE  ID=200;
DELETE FROM USER_PROFILE_BKS WHERE ID=300;
DELETE FROM USER_PROFILE_BKS WHERE  ID=400;
-----------------------------INSERT USER_PROFILE_BKS-----------------------------------------------

INSERT INTO USER_PROFILE_BKS(ID,NOME) VALUES(400,'SUPERADMIN');
INSERT INTO USER_PROFILE_BKS(ID,NOME) VALUES(300,'ADMIN');
INSERT INTO USER_PROFILE_BKS(ID,NOME) VALUES(200,'CARTUSER');
INSERT INTO USER_PROFILE_BKS(ID,NOME) VALUES(100,'USER');

---------------------------------------DELETE FUNCTION_BKS-------------------------------------------------------------
DELETE FROM FUNCTION_BKS WHERE ID=10000;
---------------------------------------INSERT INTO FUNCTION_BKS-------------------------------------------------------------
INSERT INTO FUNCTION_BKS(id,nome,url_function) values(10000,'ricerca libri','ricercalibrijson');
---------------------------------------DELETE PROFILE_FUNCTION_MENU_BKS----------------------------------------------------------

DELETE FROM PROFILE_FUNCTION_MENU_BKS WHERE id_function=10000 and id_profile=100;
--------------------------------INSERT PROFILE_FUNCTION_MENU_BKS-------------------------------------
INSERT INTO PROFILE_FUNCTION_MENU_BKS(id_function,id_profile) values(10000,100);

SELECT pf.id_profile,p.nome FROM FUNCTKION_BKS as f,
PROFILE_FUNCTION_MENU_BKS as 
pf , USER_PROFILE_BKS as p  WHERE p.id=pf.id_profile and f.id=pf.id_function and f.url_function = 'ricercalibrijson' ;

SELECT * FROM FUNCTKION_BKS;
SELECT * FROM PROFILE_FUNCTION_MENU_BKS ;




