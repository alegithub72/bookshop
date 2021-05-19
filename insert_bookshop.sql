---libro----
--id int primary key,
--titolo varchar(1000),
--descrizione varchar(200),
--data_publicazione date,
--copertina blob,
--genere_id int,
--editore_id int,
--autore_id int
------------------------------INSERT-------------------------------------------
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1000,'Il Ciclope','Una spy story ambientata in antartide.','10/10/2005',2000,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1010,'Il Ciclope II','Una spy story ambientata in antartide.','10/10/2005',2000,3000,4000,25.6);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1020,'La piramide dei Ghiacci','Una spy story ambientata in antartide.','10/10/2005',2000,3000,4000,7.12);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1030,'Isola dei pirati','Una spy story ambientata in antartide.','10/10/2005',2000,3000,4000,25);
insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1040,'Il giro del mondo in 80 giorni','Una spy story ambientata in antartide.','10/10/2005',2000,3000,4000,9.99);

insert into libro_bks (id,titolo,descrizione,data_publicazione,genere_id,editore_id,autore_id,prezzo)
values (1050,'Il loto bianco','Una spy story ambientata in antartide.','10/10/1970',2000,3010,4010,7);


insert into genere_bks values(2000,'Thriller');
insert into editore_bks values(3000,'Feltrinelli');
insert into editore_bks values(3010,'Mondadori');
insert into autore_bks values(4000,'Smith','Wilbur','Scrittore libri avventura'); 

insert into autore_bks values(4010,'Banana','Yoshimoto','Scrittore libri romantici'); 

---------------------DELETE-------------------------------------
delete from LIBRO_BKS where id =1000;
delete from LIBRO_BKS where id =1010;
delete from LIBRO_BKS where id =1020;
delete from LIBRO_BKS where id =1030;
delete from LIBRO_BKS where id =1040;
delete from LIBRO_BKS where id =1050;
delete from genere_bks where id=2000;
delete from editore_bks where id=3000;
delete from editore_bks where id=3010;
delete from autore_bks where id=4000;
delete from autore_bks where id=4010;




select * from libro_bks;


