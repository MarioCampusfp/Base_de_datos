create database alquileres_vacaciones;
use alquileres_vacaciones;

create table clientes(
	idcliente varchar(20) primary key,
    nombre varchar(20) not null,
    telefono varchar(12),
    cuenta_bancaria varchar(30),
    edad varchar(3),
    email varchar(30)
);
create table alojamientos(
	idalojamiento int primary key,
    precio int,
    habitaciones int,
    capacidad int
);
create table alquiler(

);