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
    nombre VARCHAR(255) UNIQUE NOT NULL,
    descripcion TEXT
    presion float
) 


CREATE TABLE ensayo (
    idEnsayo SERIAL primary key,
    idUserCreador int,
    idCultivo int,
    nombre VARCHAR(255) UNIQUE NOT NULL,
    descripcion TEXT,
    estado varchar(255),
    creado timestamp,
    idCompania int not null default 4
) 

CREATE TABLE ensayoTerminado (
    idEnsayoTerminado SERIAL primary key,
    idEnsayo int,
    conclusiones TEXT,
    estrellas int
) 

CREATE TABLE mezclaAgroquimico (
    idMezclaAgroquimico SERIAL primary key,
    idMezcla int,
    idAgroquimico int,
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

CREATE TABLE tagEnsayo (
    idTagEnsayo SERIAL primary key,
    idTag int,
    idEnsayo int
) 


CREATE TABLE tag (
    idTag SERIAL primary key,
    nombre varchar(255) unique not null,
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
alter table tagEnsayo add foreign key (idTag) references tag(idTag)
alter table tagEnsayo add foreign key (idEnsayo) references ensayo(idEnsayo)
alter table ensayoTerminado add foreign key (idEnsayo) references ensayo(idEnsayo)


insert into cultivo (idCultivo, nombre, descripcion) values (default,'prueba','prueba');
insert into mezcla (idMezcla, nombre, descripcion) values (default,'prueba','prueba');
insert into experimento values (default,1,'prueba','prueba');
insert into usuario values(default,1,'prueba','prueba','prueba','prueba',current_timestamp,current_timestamp,true)
insert into prueba values (default,1,1,'prueba','prueba');
insert into tratamiento (idTratamiento, idEnsayo, idagroquimico, idmezcla,nombre,descripcion) values (default, 1, null, null, 'test', 'test')

/*PAra eliminar un ensayo, que no sea el 12*/
delete FROM mezclaAgroquimico

delete from mezcla where idMezcla not in (3)

delete from agroquimico where nombre not in ('Galant')

delete from tagEnsayo where idEnsayo not in (12)

delete from experimento where idExperimento not in (78,79,77,80)

delete from tratamiento where idTratamiento not in (78)

delete from ensayo where idEnsayo not in (12)

update ensayo set estado = 'ACTIVE'

CREATE UNIQUE INDEX tratamiento_idensayo_idx ON public.tratamiento (idensayo,nombre);
ALTER TABLE public.tratamiento DROP CONSTRAINT nombre;
DROP INDEX public.nombre;
