select id_edificio, avg(area_apt) as AVG_AREA_APT 
from gestora_condominios.apartamento
group by id_edificio
having avg(area_apt) > 100
order by AVG_AREA_APT desc;

select * from gestora_condominios.apartamento;

delete from gestora_condominios.apartamento
where id_edificio=3;

select B.nome,
	case
		when B.sexo = 'F' then 'Feminino'
		when B.sexo = 'M' then 'Masculino'
		else 'Não Definido'
	end as "sexo_pessoa",
	B.data_nascimento,
	B.cpf,
	A.apt_numero
from gestora_condominios.proprietario A
inner join gestora_condominios.pessoa B on A.cpf = B.cpf;

select *
from gestora_condominios.proprietario A
full outer join gestora_condominios.pessoa B on A.cpf = B.cpf;

select * from gestora_condominios.pessoa;
select * from gestora_condominios.proprietario;

select *
from university.matriculas
limit 10;

select avg(nota) 
from university.matriculas
where status='R';

select mat_alu, round(avg(nota)) as MEDIA_FINAL
from university.matriculas
group by mat_alu
order by MEDIA_FINAL desc
limit 3;

select * from university.cursos;

select * from university.cursos
where nom_curso like 'Direito%';

update university.cursos
set cod_dpto=3
where nom_curso like 'Direito%';

select * from university.departamentos;

select *
from university.matriculas m
inner join university.alunos a on m.mat_alu = a.mat_alu;


/*
Ex. 4 - 
Com base nos dados inseridos no exercício 2, siga as instruções abaixo:

1) Realizar a visualização dos dados em cada uma das tabelas;

2) Adicionar uma condição para visualizar os dados presentes na tabela;

3) Utilizar um método de agrupamento para visualizar os dados em cada uma das tabelas;
*/

-- 1) Realizar a visualização dos dados em cada uma das tabelas;

select * from university.alunos;
select * from university.cursos;
select * from university.departamentos;
select * from university.disciplinas;
select * from university.matriculas;
select * from university.matrizes_cursos;

-- 2) Adicionar uma condição para visualizar os dados presentes na tabela;
select *
from university.alunos a
inner join university.matriculas m on a.mat_alu = m.mat_alu
where a.cotista='S' 
	and m.faltas < 5 
	and EXTRACT(YEAR FROM a.dat_entrada) = 2005
order by m.faltas desc;
												 							 
-- 3) Utilizar um método de agrupamento para visualizar os dados em cada uma das tabelas;
select c.nom_curso "Nome Curso", 
	m.periodo "Periodo", 
	count(1) "Contagem de Disciplinas"
from university.matrizes_cursos m
inner join university.cursos c on m.cod_curso = c.cod_curso
group by c.nom_curso, m.periodo
order by c.nom_curso asc;

/*
Ex. 8 - 

1) Listar o número total de alunos em cada curso e ordenar os cursos por ordem decrescente;
*/

select c.nom_curso, count(1) as "CONTAGEM"
from university.alunos a 
inner join university.cursos c on a.cod_curso = c.cod_curso
group by c.nom_curso
order by "CONTAGEM" desc;

-- 2) Listar a soma de faltas em cada disciplina e ordenar as disciplinas por ordem decrescente;

select d.nome_disc as "DISCIPLINA", sum(m.faltas) as "TOTAL_FALTAS"
from university.matriculas m
inner join university.disciplinas d on m.cod_disc = d.cod_disc
group by d.nome_disc
order by "TOTAL_FALTAS" desc;

/*
Ex. 9 - 

1) Listar o número total de reprovações dos alunos cotistas em disciplinas;

2) Listar o número total de matrículas de alunos cotistas em disciplinas;
*/

-- 1) Listar o número total de reprovações dos alunos cotistas em disciplinas;
select d.nome_disc, count(1) as "Contagem"
from university.matriculas m 
inner join university.alunos a on m.mat_alu = a.mat_alu
inner join university.disciplinas d on m.cod_disc = d.cod_disc 
where m.status='R' and a.cotista='S'
group by d.nome_disc
order by "Contagem" desc;

-- 2) Listar o número total de matrículas de alunos cotistas em disciplinas;
select d.nome_disc, count(1) as "Contagem"
from university.matriculas m 
inner join university.alunos a on m.mat_alu = a.mat_alu
inner join university.disciplinas d on m.cod_disc = d.cod_disc 
where a.cotista='S'
group by d.nome_disc
order by "Contagem" desc;