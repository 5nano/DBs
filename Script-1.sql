CREATE TABLE mezcla (
    idMezcla SERIAL primary key,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 

CREATE TABLE cultivo (
    idCultivo SERIAL primary key,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 

CREATE TABLE prueba (
    idPrueba SERIAL primary key,
    idEnsayo int,
    idCultivo int,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 


CREATE TABLE ensayo (
    idEnsayo SERIAL primary key,
    idUserCreador int,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 


CREATE TABLE mezclaAgroquimico (
    idMezclaAgroquimico SERIAL primary key,
    idMezcla int,
    idAgroquimico int,
    porcentaje float
) 

CREATE TABLE agroquimico (
    idAgroquimico SERIAL primary key,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 

CREATE TABLE usuario (
    idUsuario SERIAL primary key,
    idCompania int,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    creado timestamp,
    actualizado timestamp,
    enabled bool
)

CREATE TABLE usuarioRoles (
    idUsuarioRol SERIAL primary key,
    idUsuario int,
    idRol int
) 

CREATE TABLE rol (
    idRol SERIAL primary key,
    nombre VARCHAR(255) NOT NULL,
    descripcion text,
    creado timestamp,
    actualizado timestamp,
    enabled bool
) 

create table compania (
	idCompania SERIAL primary key,
	nombre varchar(255) not null,
	descripcion text
)

alter table prueba add foreign key (idEnsayo) references ensayo(idEnsayo)
alter table prueba add foreign key (idCultivo) references cultivo(idCultivo)
alter table ensayo add foreign key (idUserCreador) references usuario(idUsuario)
alter table mezclaAgroquimico add foreign key (idMezcla) references mezcla(idMezcla)
alter table mezclaAgroquimico add foreign key (idAgroquimico) references agroquimico(idAgroquimico)
alter table usuarioRoles add foreign key (idUsuario) references usuario(idUsuario)
alter table usuarioRoles add foreign key (idRol) references rol(idRol)


