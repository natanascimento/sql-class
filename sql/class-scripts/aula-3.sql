create schema if not exists gestora_condominios;

create table if not exists gestora_condominios.edificio(
  id_edificio integer primary key,
  endereco varchar(50) not null,
  data_construcao date,
  data_ultima_vistoria date
);

create table if not exists gestora_condominios.apartamento(
  area_apt float not null,
  apt_numero integer primary key,
  id_edificio integer not null
);

create table if not exists gestora_condominios.proprietario(
  	cpf bigint not null,
	apt_numero integer not null
);

create table if not exists gestora_condominios.pessoa(
  cpf bigint primary key,
  data_nascimento date not null,
  sexo varchar(1) not null,
  nome varchar(200) not null
);

alter table gestora_condominios.apartamento
add constraint fk_Edificio_id_edificio foreign key (id_edificio) 
references gestora_condominios.edificio (id_edificio);

alter table gestora_condominios.proprietario
add constraint fk_Apartamento_apt_numero foreign key (apt_numero)
references gestora_condominios.apartamento (apt_numero);

alter table gestora_condominios.proprietario
add constraint fk_Pessoa_cpf foreign key (cpf)
references gestora_condominios.pessoa (cpf);

select * from gestora_condominios.edificio;

select p.cpf, p.nome, p.data_nascimento, p.sexo 
from gestora_condominios.pessoa p;

-- FUNCOES DE AGREGAÇÃO
select count(1) from gestora_condominios.edificio;

select sum(area_apt) as "SOMA_AREA_APT"
from gestora_condominios.apartamento 
where id_edificio = 1;

select avg(area_apt) as "MEDIA_AREA_APT"
from gestora_condominios.apartamento;

select min(area_apt) as "MENOR_AREA_APT"
from gestora_condominios.apartamento;

select max(area_apt) as "MAIOR_AREA_APT"
from gestora_condominios.apartamento;

select * from gestora_condominios.pessoa;

/*

CRUD
---- PADRÃO ---- 
C = Create
R = Read
U = Update
D = Delete

---- SQL ---- 
C = INSERT
R = SELECT
U = UPDATE
D = DELETE

*/

-- INSERT 
insert into gestora_condominios.apartamento(area_apt)
values (1);

insert into gestora_condominios.edificio(id_edificio, endereco)
values (25, 'rua 123');



select * 
from gestora_condominios.edificio
where id_edificio=2;

-- R = SELECT

select * 
from gestora_condominios.edificio
order by id_edificio desc;

select * 
from gestora_condominios.edificio

select * 
from gestora_condominios.tabela_teste

select * 
from gestora_condominios.tabela_teste2

-- UPDATE

update gestora_condominios.edificio
set endereco='rua 123, 12123123131', data_construcao='2022-07-20', data_ultima_vistoria='2022-07-20'
where id_edificio=2;

-- DELETE 
delete from gestora_condominios.tabela_teste2;

delete from gestora_condominios.edificio where id_edificio=25;

insert into gestora_condominios.edificio values (1, 'Rua 123');
insert into gestora_condominios.edificio values (2, 'Rua 11233');
insert into gestora_condominios.edificio values (3, 'Rua 11233');
insert into gestora_condominios.edificio values (4, 'Rua 1123');
insert into gestora_condominios.edificio values (5, 'Rua 12');
insert into gestora_condominios.edificio values (6, 'Rua 123');
insert into gestora_condominios.edificio values (7, 'Rua 13');
insert into gestora_condominios.edificio values (8, 'Rua 12123');


insert into gestora_condominios.apartamento values (12, 102, 1);
insert into gestora_condominios.apartamento values (1, 101, 1); 
insert into gestora_condominios.apartamento values (120, 3102, 2); 
insert into gestora_condominios.apartamento values (182, 202, 3); 
insert into gestora_condominios.apartamento values (152, 201, 2); 
insert into gestora_condominios.apartamento values (122, 2102, 2); 
insert into gestora_condominios.apartamento values (112, 4102, 1); 
insert into gestora_condominios.apartamento values (123, 6102, 2); 
insert into gestora_condominios.apartamento values (12, 7102, 2); 
insert into gestora_condominios.apartamento values (122, 1702, 2); 
insert into gestora_condominios.apartamento values (11, 1032, 1); 
insert into gestora_condominios.apartamento values (12, 1012, 2); 

insert into gestora_condominios.pessoa values (1111111111, '2022-01-01', 'F', 'Rita');
insert into gestora_condominios.pessoa values (2222222222, '2022-01-01', 'F', 'Maria');
insert into gestora_condominios.pessoa values (3333333333, '2022-01-01', 'M', 'Natan');
insert into gestora_condominios.pessoa values (4444444444, '2022-01-01', 'M', 'Marcelo');
insert into gestora_condominios.pessoa values (5555555555, '2022-01-01', 'M', 'Breno');
insert into gestora_condominios.pessoa values (6666666666, '2022-01-01', 'F', 'Maria');


insert into gestora_condominios.proprietario values (1111111111, 6102);
insert into gestora_condominios.proprietario values (2222222222, 1012);
insert into gestora_condominios.proprietario values (3333333333, 1032);