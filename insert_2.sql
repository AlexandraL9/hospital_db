use hospital_db_alexandra_lima;

alter table medicos
add emAtividade bit; 

update medicos set emAtividade = 0 where id = 2 or id = 9;
update medicos set emAtividade = 1 where id = 1 or id = 3 or id = 4 or id = 5 or id = 6 or id = 7 or id = 8 or id = 10 or id = 11 or id = 12;

select * from medicos;

select * from internacao;

update internacao set data_alta = '2019-03-04' where id = 2;
update internacao set data_alta = '2020-04-23' where id = 4;
update internacao set data_alta = '2020-05-19' where id = 5;
update internacao set data_alta = '2020-08-18' where id = 7;

select * from convenio;

delete from convenio where id = 4;

select * from convenio;