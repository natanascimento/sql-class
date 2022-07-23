/*
CREATE STRUCTURE
*/

create schema if not exists escola_idiomas;

create table if not exists escola_idiomas.aluno(
  matricula serial primary key,
  nome varchar(200) not null,
  rua varchar(30) not null,
  numero int not null,
  bairro varchar(30) not null,
  cidade varchar(30) not null,
  estado varchar(30) not null,
  cep varchar(30) not null
);

create table if not exists escola_idiomas.matricula(
  qtd_faltas int not null,
  nota1 float not null,
  nota2 float not null,
  nota3 float not null
);

create table if not exists escola_idiomas.turma(
  cod_turma serial primary key,
  horario varchar(5) not null
);

create table if not exists escola_idiomas.professor(
  matricula serial primary key,
  nome varchar(200) not null,
  data_nascimento date not null,
  salario float not null
);

create table if not exists escola_idiomas.disciplina(
  cod_disciplina serial primary key,
  nome_disciplina varchar(30) not null
);

create table if not exists escola_idiomas.titulacao(
  cod_titulacao serial primary key,
  descricao_titulacao varchar(200) not null
);

/*
ALTER STRUCTURE
*/

select * from escola_idiomas.matricula;

-- REMOCAO DE COLUNA
alter table escola_idiomas.matricula drop column nota3;

-- ADIÇÃO DE COLUNA
alter table escola_idiomas.matricula 
add column media float 
generated always as ((nota1+nota2)/2) stored;

alter table escola_idiomas.matricula
add column media2 float;

-- ALTERAR O TIPO DE DADOS
alter table escola_idiomas.matricula alter column media2 type varchar(40);

-- RENOMEAR COLUNA 
alter table escola_idiomas.matricula rename column media2 to nota_final;

-- INSERINDO DADOS
insert into escola_idiomas.matricula(qtd_faltas, nota1, nota2)
values (1, 4, 8);
insert into escola_idiomas.matricula(qtd_faltas, nota1, nota2)
values (2, 5, 9);
insert into escola_idiomas.matricula(qtd_faltas, nota1, nota2)
values (4, 2, 3);
insert into escola_idiomas.matricula(qtd_faltas, nota1, nota2)
values (6, 4, 7);
insert into escola_idiomas.matricula(qtd_faltas, nota1, nota2)
values (12, 2, 10);

-- VISUALIZAÇÃO DAS COLUNAS
select table_name, column_name, data_type, is_nullable
from information_schema.columns
where table_schema = 'escola_idiomas';

-- VISUALIZAÇÃO DAS TABELAS
select table_schema, table_name from information_schema.tables
where table_schema = 'escola_idiomas';

-- VISUALIZAÇÃO DAS CONSTRAINTS

select * from information_schema.constraint_table_usage
where table_schema = 'escola_idiomas';

drop table escola_idiomas.teste1;
drop table escola_idiomas.teste2;