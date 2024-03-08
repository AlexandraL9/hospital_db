use hospital_db_alexandra_lima; 

create table carteira(
id_paciente int not null,
id_convenio int not null,
num_carteira varchar(45),
primary key (id_paciente, id_convenio),
foreign key (id_paciente) references pacientes(id),
foreign key (id_convenio) references convenio(id));

create table consulta(
id int not null auto_increment primary key,
idPacientes int,
idConvenio int,
idCarteira int,
idMedicos int,
idEspecialidade int,
data_ date, 
hora time, 
valor int, 
foreign key (idPacientes) references pacientes(id),
foreign key (idConvenio) references convenio(id),
foreign key (idMedicos) references medicos(id),
foreign key (idEspecialidade) references especialidade(id));

create table receita(
medicos_id_rec int not null,
consulta_id_rec int not null,
medicamentos varchar(45),
quantidade int,
instrucoes varchar(45),
primary key (medicos_id_rec, consulta_id_rec),
foreign key (medicos_id_rec) references medicos(id),
foreign key (consulta_id_rec) references consulta(id));

create table tipo_quarto(
id int not null auto_increment primary key,
descricao varchar(45),
valor_diaria int);

create table quarto(
id int not null auto_increment primary key,
tipo_quarto_id int,
pacientes_id int,
numeracao int,
foreign key (tipo_quarto_id) references tipo_quarto(id),
foreign key (pacientes_id) references pacientes(id));

create table enfermeiro(
id int not null auto_increment primary key,
nome varchar(45),
cpf varchar(11),
cre varchar(45));

create table internacao(
id int not null auto_increment primary key,
quarto_id int,
tipo_quarto_id int,
pacientes_id int,
medicos_id int,
medicos_especialidade_id int,
data_entrada date,
data_prev_alta date,
data_alta date,
procedimento varchar(45),
foreign key (quarto_id) references quarto(id),
foreign key (tipo_quarto_id) references tipo_quarto(id),
foreign key (pacientes_id) references pacientes(id),
foreign key (medicos_id) references medicos(id),
foreign key (medicos_especialidade_id) references especialidade(id)); 

create table enfermaria(
internacao_id int not null,
enfermeiro_id int not null,
primary key (internacao_id, enfermeiro_id),
foreign key (internacao_id) references internacao(id),
foreign key (enfermeiro_id) references enfermeiro(id));
