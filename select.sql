use hospital_db_alexandra_lima;

select * from consulta;

/*Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio*/
select * from consulta where idConvenio is null; 
select avg(valor) from consulta where idConvenio is null;

/*Todos os dados e o valor médio das consultas do ano de 2020 realizadas com convênio*/
select * from consulta where idConvenio is not null;
select avg(valor) from consulta where idConvenio is not null;

/*Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta*/
select * from internacao;
select * from internacao where data_alta > data_prev_alta;

/*Receituário completo da primeira consulta registrada com receituário associado*/
select * from receita;
select * from receita where consulta_id_rec in (select min(consulta_id_rec) from receita);

/*Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)*/
select * from consulta;
select * from consulta where valor = (select max(valor) from consulta) and idConvenio is null;
select * from consulta where valor = (select min(valor) from consulta) and idConvenio is null;


update internacao set data_alta = '2020-03-10' where id = 2;
select datediff(data_alta,data_entrada) as datediff from internacao;

/*inserindo tabela de valores dentro de internação para fracilitar as buscas*/
alter table internacao add valor_quarto double;
update internacao set valor_quarto = 350 where tipo_quarto_id = 1;
update internacao set valor_quarto = 580 where tipo_quarto_id = 2;

/*inserindo datediff dentro de internação para facilitar as buscas*/
alter table internacao add date_diff int;
update internacao set date_diff = 9 where id = 1;
update internacao set date_diff = 1 where id = 6;
update internacao set date_diff = 3 where id = 2 or id = 3 or id = 4 or id = 5 or id = 7; 

/*Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto 
e o número de dias entre a entrada e a alta*/
select (valor_quarto * date_diff) as valorTotal from internacao;

select * from internacao;
select * from quarto;

/*Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”*/
select p.data_entrada, p.data_alta, p.procedimento, m.numeracao 
from internacao as p inner join quarto as m 
on p.id=m.id
where m.tipo_quarto_id = 2
order by data_entrada;

select * from pacientes;
select * from consulta;
select * from especialidade;

/*Inserindo consulta de paciente menor de idade com médico cuja especialidade não seja “pediatria”*/
insert into consulta (idPacientes, idMedicos, idEspecialidade, data_, hora, valor)
values (9, 1, 1, '2021-05-02', '15:10:00', 110);

/*Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos 
na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta*/
select nome_paciente, data_, idEspecialidade
from pacientes inner join consulta
on pacientes.id=consulta.idPacientes
where (datediff(data_, data_nascimento)/365) < 18 and consulta.idEspecialidade <> 3 
order by data_;

/*Comando para mostrar a idade:
select floor(datediff(now(), data_nascimento)/365) as idade from pacientes;*/

/*Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade 
“gastroenterologia”, que tenham acontecido em “enfermaria”*/
select nome_paciente, nome_medico, data_entrada, procedimento
from pacientes join internacao on pacientes.id = internacao.pacientes_id
join medicos on medicos.id = internacao.medicos_id
where internacao.medicos_especialidade_id = 2 and internacao.tipo_quarto_id = 1;

/*Inserindo CRM*/
select * from medicos;
alter table medicos add crm varchar(45);
update medicos set crm = "00000000-9" where id = 1;
update medicos set crm = "00000000-1" where id = 2;
update medicos set crm = "00000000-6" where id = 3;
update medicos set crm = "00000000-5" where id = 4;
update medicos set crm = "00000000-4" where id = 5;
update medicos set crm = "00000000-8" where id = 6;
update medicos set crm = "00000000-2" where id = 7;
update medicos set crm = "00000000-8A" where id = 8;
update medicos set crm = "00000000-7" where id = 9;
update medicos set crm = "00000000-3" where id = 10;
update medicos set crm = "00000000-9B" where id = 11;
update medicos set crm = "00000000-66" where id = 12;

/*Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou*/
select m.nome_medico, m.crm, count(c.id) as qtdConsultas
from medicos as m left join consulta as c
on m.id=c.idMedicos
group by m.id;

/*Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação e 
os números de internações referentes a esses profissionais*/
select e.nome, e.cre, count(c.internacao_id) as qtdinternacoes
from enfermeiro as e left join enfermaria as c
on e.id=c.enfermeiro_id
group by e.id;

/* ----------------- CONSULTA EXTRA ----------------- */

/*Nome do paciente, tefone e email, nome do convenio, tempo de carencia e número da carteira apenas dos pacientes com convênio*/
select p.nome_paciente, p.telefone, p.email, c.nome_convenio, c.tempo_carencia, ca.num_carteira
from pacientes as p join carteira as ca on p.id=ca.id_paciente
join convenio as c on c.id=ca.id_convenio;

