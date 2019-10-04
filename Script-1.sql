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

CREATE TABLE experimento (
    idExperimento SERIAL primary key,
    idEnsayo int,
    idTratamiento int,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 


CREATE TABLE tratamiento (
    idTratamiento SERIAL primary key,
    idEnsayo int,
    idAgroquimico int,
    idMezcla int,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
) 


CREATE TABLE ensayo (
    idEnsayo SERIAL primary key,
    idUserCreador int,
    idCultivo int,
    nombre VARCHAR(255) UNIQUE NOT NULL,
    descripcion TEXT
) 


CREATE TABLE mezclaAgroquimico (
    idMezclaAgroquimico SERIAL primary key,
    idMezcla int,
    idAgroquimico int,
    precion float
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
    email VARCHAR(255) NOT NULL,
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

alter table experimento add foreign key (idEnsayo) references ensayo(idEnsayo)
alter table experimento add foreign key (idTratamiento) references tratamiento(idTratamiento)
alter table prueba add foreign key (idCultivo) references cultivo(idCultivo)
alter table ensayo add foreign key (idUserCreador) references usuario(idUsuario)
alter table ensayo add foreign key (idCultivo) references cultivo(idCultivo)
alter table mezclaAgroquimico add foreign key (idMezcla) references mezcla(idMezcla)
alter table mezclaAgroquimico add foreign key (idAgroquimico) references agroquimico(idAgroquimico)
alter table usuarioRoles add foreign key (idUsuario) references usuario(idUsuario)
alter table usuarioRoles add foreign key (idRol) references rol(idRol)
alter table tratamiento add foreign key (idEnsayo) references ensayo(idEnsayo)
alter table tratamiento add foreign key (idMezcla) references mezcla(idMezcla)
alter table tratamiento add foreign key (idAgroquimico) references agroquimico(idAgroquimico)



insert into cultivo (idCultivo, nombre, descripcion) values (default,'prueba','prueba');
insert into mezcla (idMezcla, nombre, descripcion) values (default,'prueba','prueba');
insert into experimento values (default,1,'prueba','prueba');
insert into usuario values(default,1,'prueba','prueba','prueba','prueba',current_timestamp,current_timestamp,true)
insert into prueba values (default,1,1,'prueba','prueba');

