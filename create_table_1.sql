use hospital_db_alexandra_lima;

create table especialidade(
id int not null auto_increment primary key,
nome_especialidade varchar(45));

create table medicos(
id int not null auto_increment primary key,
nome_medico varchar(45),
med_especialidade int,
foreign key (med_especialidade) references especialidade(id));

create table pacientes(
id int not null auto_increment primary key,
nome_paciente varchar(45),
data_nascimento date,
endereco varchar(45),
telefone varchar(9),
email varchar(25),
cpf varchar(11),
rg varchar(7));

create table convenio(
id int not null auto_increment primary key,
nome_convenio varchar(20),
cnpj varchar(14),
tempo_carencia int);


