DROP DATABASE IF EXISTS ANIMALES;
CREATE DATABASE ANIMALES;
USE ANIMALES;
create table familia(
	idfamilia int primary key,
	familia varchar(20)
);
create table animal(
	idanimal int primary key,
    idfamilia int,
    animal varchar(50),
    cuantos int,
    foreign key(idfamilia) references familia(idfamilia)
    );
insert into familia values (1, 'Aves');
insert into familia values (2, 'Mamíferos');
insert into familia values (3, 'Peces');
 
insert into animal values (1, 1, 'Garza Real', 3);
insert into animal values (2, 1, 'Cigüeña Blanca', 4);
insert into animal values (3, 1, 'Gorrión', 7);
 
insert into animal values (4, 2, 'Zorro', 3);
insert into animal values (5, 2, 'Lobo', 2);
insert into animal values (6, 2, 'Ciervo', 4);
 
insert into animal values (7, 3, 'Pez globo', 10);
insert into animal values (8, 3, 'Pez payaso', 12);
insert into animal values (9, 3, 'Angel llama', 15);

