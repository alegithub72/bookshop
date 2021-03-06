
-------------------------------------COMNTROL QUERY--------------------------------------------------------

SELECT * FROM BKS_LIBRO;
SELECT * FROM BKS_AUTORE;
SELECT * FROM BKS_GENERE;
SELECT * FROM BKS_EDITORE;
SELECT P.ID,U.EMAIL,U.PASSWORD,P.NOME FROM BKS_USERS AS U,BKS_USER_PROFILE AS P WHERE P.ID=U.PROFILE;
SELECT * FROM BKS_USER_PROFILE;



-------------------------DELETE BEFORE INSERT-----------------------------------
DELETE FROM BKS_LIBRO WHERE ID =1000;
DELETE FROM BKS_LIBRO WHERE ID =1010;
DELETE FROM BKS_LIBRO WHERE ID =1020;
DELETE FROM BKS_LIBRO WHERE ID =1030;
DELETE FROM BKS_LIBRO WHERE ID =1040;
DELETE FROM BKS_LIBRO WHERE ID =1050;
------------------------------INSERT---BKS_LIBRO-------------------------------
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1000,'IL CICLOPE','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);

INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1010,'IL CICLOPE II','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25.6);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1020,'LA PIRAMIDE DEI GHIACCI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,7.12);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1030,'ISOLA DEI PIRATI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1040,'IL GIRO DEL MONDO IN 80 GIORNI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);

INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1050,'IL LOTO BIANCO','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/1970',5010,3010,4010,7);

-------------------------DELETE BEFORE INSERT-----------------------------------
DELETE FROM BKS_LIBRO WHERE ID =1060;
DELETE FROM BKS_LIBRO WHERE ID =1070;
DELETE FROM BKS_LIBRO WHERE ID =1080;
DELETE FROM BKS_LIBRO WHERE ID =1090;
DELETE FROM BKS_LIBRO WHERE ID =1100;
DELETE FROM BKS_LIBRO WHERE ID =1110;
------------------------------INSERT---BKS_LIBRO-------------------------------
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1060,'LA GUERRA DEI MONDI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);

INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1070,'MINORITY REPORT','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25.6);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1080,'OCEAN ELEVEN','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,7.12);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1090,'NOME DELLA ROSA','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1100,'TRE UOMINI A ZONZO','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);

INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1110,'L ULTIMO DEI MOICANI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/1970',5010,3010,4010,7);

-------------------------DELETE BEFORE INSERT-----------------------------------
DELETE FROM BKS_LIBRO WHERE ID =1120;
DELETE FROM BKS_LIBRO WHERE ID =1130;
DELETE FROM BKS_LIBRO WHERE ID =1140;
DELETE FROM BKS_LIBRO WHERE ID =1150;
DELETE FROM BKS_LIBRO WHERE ID =1160;
DELETE FROM BKS_LIBRO WHERE ID =1170;
------------------------------INSERT---BKS_LIBRO-------------------------------
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1120,'DUNE','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1130,'BLAD RUNNER','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25.6);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1140,'I PILASTRI DELLA TERRA','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,7.12);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1150,'ULISSE','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,25);
INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1160,'I  PROMESSI SPOSI','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/2005',5010,3000,4000,9.99);

INSERT INTO BKS_LIBRO (ID,TITOLO,DESCRIZIONE,DATA_PUBLICAZIONE,GENERE_ID,EDITORE_ID,AUTORE_ID,PREZZO)
VALUES (1170,'DIVINA COMMEDIA','UNA SPY STORY AMBIENTATA IN ANTARTIDE.','10/10/1970',5010,3010,4010,7);

----------------------------------DELETE  GENERE BKS------------------------------------------

DELETE FROM BKS_GENERE WHERE ID=5000;
DELETE FROM BKS_GENERE WHERE ID=5010;
DELETE FROM BKS_GENERE WHERE ID=5020;
DELETE FROM BKS_GENERE WHERE ID=5030;
-------------------------------INSERT BKS_GENERE ------------------------------------------------
INSERT INTO BKS_GENERE VALUES(5000,'GIALLI');
INSERT INTO BKS_GENERE VALUES(5010,'AVVENTURA');
INSERT INTO BKS_GENERE VALUES(5020,'ROSA');
INSERT INTO BKS_GENERE VALUES(5030,'STORICI');

------------------------------------DELETE BKS_EDITORE-------------------------------------------------------------------------
DELETE FROM BKS_EDITORE WHERE ID=3000;
DELETE FROM BKS_EDITORE WHERE ID=3010;
--------------------------------------INSERT BKS_EDITORE---------------------------------------------------------------
INSERT INTO BKS_EDITORE VALUES(3000,'FELTRINELLI');
INSERT INTO BKS_EDITORE VALUES(3010,'MONDADORI');
--------------------------------------DELETE BKS_AUTORE------------------------------------------------------------
DELETE FROM BKS_AUTORE WHERE ID=4000;
DELETE FROM BKS_AUTORE WHERE ID=4010;


-------------------------------------------DELETE BKS_AUTORE-------------------------------------------
DELETE FROM BKS_AUTORE WHERE ID=4000;
DELETE FROM BKS_AUTORE WHERE ID=4010;

----------------------------------INSERT BKS_AUTORE-------------------------------------------------------------
INSERT INTO BKS_AUTORE VALUES(4000,'SMITH','WILBUR','SCRITTORE LIBRI AVVENTURA'); 
INSERT INTO BKS_AUTORE VALUES(4010,'BANANA','YOSHIMOTO','SCRITTORE LIBRI ROMANTICI'); 


---------------------------------------------DELETE USER_BKS-------------------------------------------------------
DELETE FROM BKS_USERS WHERE ID=10;
DELETE FROM BKS_USERS WHERE ID=20;
DELETE FROM BKS_USERS WHERE ID=30;

-----------------------------------------------INSERT BKS_USERS----------------------------------------------------
INSERT INTO BKS_USERS(ID,NOME,COGNOME,EMAIL,PASSWORD,PROFILE) VALUES(10,'SUPERADMIN','TAZIO','SUPERADMIN@SPQR.IT','SUPERADMIN',400);
INSERT INTO BKS_USERS(ID,NOME,COGNOME,EMAIL,PASSWORD,PROFILE) VALUES(20,'ADMIN','SEMPRONI','ADMIN@SPQR.IT','ADMIN',300);
INSERT INTO BKS_USERS(ID,NOME,COGNOME,EMAIL,PASSWORD,PROFILE) VALUES(30,'CARTUSER','CAIO','USER@SPQR.IT','CARTUSER',200);


---------------------------------------DELETE BKS_USER_PROFILE---------------------------------------
DELETE FROM BKS_USER_PROFILE WHERE ID=100;
DELETE FROM BKS_USER_PROFILE WHERE  ID=200;
DELETE FROM BKS_USER_PROFILE WHERE ID=300;
DELETE FROM BKS_USER_PROFILE WHERE  ID=400;
-----------------------------INSERT BKS_USER_PROFILE-----------------------------------------------

INSERT INTO BKS_USER_PROFILE(ID,NOME) VALUES(400,'SUPERADMIN');
INSERT INTO BKS_USER_PROFILE(ID,NOME) VALUES(300,'ADMIN');
INSERT INTO BKS_USER_PROFILE(ID,NOME) VALUES(200,'CARTUSER');
INSERT INTO BKS_USER_PROFILE(ID,NOME) VALUES(100,'USER');

---------------------------------------DELETE BKS_FUNCTION-------------------------------------------------------------
DELETE FROM BKS_FUNCTION WHERE ID=10000;
---------------------------------------INSERT INTO BKS_FUNCTION-------------------------------------------------------------
INSERT INTO BKS_FUNCTION(ID,NOME,URL_FUNCTION) VALUES(10000,'RICERCA LIBRI','ricercalistejson');
---------------------------------------DELETE BKS_PROFILE_FUNCTION_MENU----------------------------------------------------------

DELETE FROM BKS_PROFILE_FUNCTION_MENU WHERE ID_FUNCTION=10000 AND ID_PROFILE=100;
--------------------------------INSERT BKS_PROFILE_FUNCTION_MENU-------------------------------------
INSERT INTO BKS_PROFILE_FUNCTION_MENU(ID_FUNCTION,ID_PROFILE) VALUES(10000,100);

SELECT PF.ID_PROFILE,P.NOME FROM BKS_FUNCTION AS F,
BKS_PROFILE_FUNCTION_MENU AS 
PF , BKS_USER_PROFILE AS P  
WHERE P.ID=PF.ID_PROFILE 
AND F.ID=PF.ID_FUNCTION 
AND F.URL_FUNCTION = 'ricercalistejson' ;

SELECT * FROM BKS_FUNCTION;
SELECT * FROM BKS_PROFILE_FUNCTION_MENU ;




