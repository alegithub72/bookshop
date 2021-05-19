create table users_bks (
name varchar(20),
cognome varchar(20),
email varchar(100),
password varchar(20),
id int primary key,
profile int );
-----------------------------------------------------
create table user_profile_bks(
id int primary key,
nome varchar(30)
);
create table profile_function_menu_bks(
id_profile int,
id_function int
);

-----------------------------------------------------
create table functkion_bks(
id int primary key,
nome varchar(40),
url_function varchar(200)
);
-----------------------------------------------------
create table libro_bks(
id int primary key,
titolo varchar(1000),
descrizione varchar(200),
data_publicazione date,
copertina blob,
prezzo float, 
genere_id int,
editore_id int,
autore_id int

);
-----------------------------------------------------
create table genere_bks(
id int,
tipologia varchar(50)
);
-----------------------------------------------------
create table autore_bks(
id int primary key,
nome varchar(40),
cognome varchar(40),
descrizione varchar(200)

);
-----------------------------------------------------
create table editore_bks(
id int primary key,
nome  varchar(100)
) ;





select LIBRO_BKS.* from LIBRO_BKS ;

delete table USERS_BOOKSHOP;