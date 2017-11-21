drop schema if exists Principal;
create schema Principal;
use Principal;
create table ranking(
    nick varchar(100) not null,
    pontuacao float not null,
    tempo float not null,
    fase varchar(100) not null
);

create table usuario(
    login varchar(100) not null,
    senha varchar(100) not null,
    nick varchar(100) not null,
    primary key(login)
);

insert into usuario (nick, senha, login) values 
("admin","admin","admin");
