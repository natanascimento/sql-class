/*
CREATE STRUCTURE
*/

create schema locadora;

create table locadora.categoria(
  id_categoria integer primary key,
  nome varchar(200) not null
);

select * from locadora.categoria;
select * from locadora.filme;

insert into locadora.categoria(id_categoria, nome)
values (2, 'Aventura');

insert into locadora.filme(id_filme, nome, id_categoria)
values (6, '0077', 2);


create table locadora.filme(
  id_filme integer primary key,
  nome varchar(200) not null,
  id_categoria integer not null,
  constraint fk_categoria_id_categoria foreign key (id_categoria) references locadora.categoria (id_categoria)
);

create table locadora.historico(
  id_ator integer not null,
  id_filme integer not null
);

create table locadora.ator(
  id_ator integer primary key,
  nome varchar(200) not null,
  nome_artistico varchar(200)
);

alter table locadora.historico add constraint 
fk_ator_id_ator foreign key (id_ator) 
references locadora.ator (id_ator);

alter table locadora.historico add constraint
fk_filme_id_filme foreign key (id_filme)
references locadora.filme (id_filme);
