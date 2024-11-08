DROP DATABASE IF EXISTS personal;
CREATE DATABASE PERSONAL;
USE PERSONAL;
create table DEPARTAMENTO(
	iddepartamento int primary key,
    departamento varchar(50)
);
create table EMPLEADO(
	idempleado int primary key,
    iddepartamento int,
    edad int,
	empleado varchar(50),
    foreign key(iddepartamento) references DEPARTAMENTO(iddepartamento)
);

alter table empleado
add fecha_ingreso varchar(30);

insert into empleado values (1,1,30,"jose",1);
insert into empleado values (2,1,34,"paloma",2);

insert into empleado values (3,2,29,"eric",0);
insert into empleado values (4,2,49,"luis",3);

insert into empleado values (5,3,57,"trinidad",3);
insert into empleado values (6,3,61,"emilio",4);