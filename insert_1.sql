use hospital_db_alexandra_lima;

insert into medicos(nome_medico)
values ("Júlia Camarinho"), ("Alisson Sacramento"), ("Alberto Veríssimo"), ("Suéli Simão Pegado"), ("Gael Milheiro Lemes"),
 ("Tito Carqueijeiro"), ("Ezequiel Pestana Henriques"), ("Anny Quintanilha"), ("Lívia Veloso"), ("Fabiano Gomide"), 
 ("Cristovão Xavier"), ("Nelson Anjos Palmeira");

insert into especialidade(nome_especialidade)
values ("geral"), ("gastroenterologia"), ("pediatria");

insert into especialidade(nome_especialidade)
values ("dermatologia"), ("psiquiatria"), ("cardiologia"), ("ortopedia");

insert into pacientes(nome_paciente, data_nascimento, endereco, telefone, email, cpf, rg)
values ("Karine Macena Porciúncula", '1999-12-09', "Av. São João de Deus, n40", "991644542", "KMP@gmail.com", "78910630876", "4179503"),
("Zilda Gomide Osório", '1974-08-27', "Rua Ferreiros, n70", "999379424", "ZGO@gmail.com", "56884678275", "6964079"),
("Fabrício Norões Xavier", '1962-05-19', "Rua Catúlo Paixão, n180", "996558774", "FNX@gmail.com", "26922935845", "3058453"),
("César Sítima Faria", '1985-04-08', "Rua Dom Bosco, n51", "927750783", "CSF@outlook.com", "42712633547", "6482675"),
("Silvana Fartaria Nazário", '1994-09-20', "Rua Quatro Cantos, n30", "935022808", "SFN@outlook.com", "48858414535", "3440502"),
("Evandro Trindade Bouça", '2000-05-23', "Rua Cinco, n99", "932334374", "ETB@icloud.com", "58137492410", "1082464"),
("Ivo Brandão Palos", '1970-05-03', "Av. Chico Science, n13", "933262853", "IBP@gmail.com", "55323566027", "3112113"),
("Armindo Moreira Azeredo", '1958-09-11', "Rua Alceu Valença, n31", "937358648", "AMA@gmail.com", "13180772573", "4693951"),
("Mark Festas Santana", '2010-12-03', "Av. Agamenon Magalhães, n666", "922884409", "MFS@icloud.com", "42668278147", "2304101"),
("Helton Espinosa", '1990-07-04', "Rua da Aurora, n77", "928340416", "HE@outlook.com", "34496853337", "4481933");

insert into convenio(nome_convenio, cnpj, tempo_carencia)
values ("MedMais", "36512153000165", 10),
("UniSaúde", "95512801000142", 5),
("Pro Health", "73155046000153", 8),
("BraMed", "42142128000130", 7);

insert into carteira(id_paciente, id_convenio, num_carteira)
values (2, 1, "55643215"),
(3, 1, "21484234"), 
(1, 2, "12341234"),
(7, 3, "12342342"),
(9, 2, "4351315"),
(8, 1, "11234214124"),
(10, 2, "2446354");

insert into consulta(idPacientes, idMedicos, idEspecialidade, data_, hora, valor)
values (1, 1, 1, '2019-02-06', '09:20:00', 111),
(1, 3, 3, '2019-03-01', '09:20:00', 111),
(3, 2, 2, '2019-05-24', '11:10:00', 150),
(4, 4, 1, '2019-07-02', '16:10:00', 111),
(5, 5, 4, '2019-07-20', '12:10:00', 180),
(6, 6, 1, '2019-08-03', '15:20:00', 150),
(8, 8, 1, '2019-11-01', '08:10:00', 150), 
(2, 2, 2, '2019-11-05', '15:10:00', 100),
(8, 7, 3, '2020-02-17', '10:10:00', 75),
(9, 7, 3, '2020-03-01', '08:10:00', 75);

insert into receita(medicos_id_rec, consulta_id_rec, medicamentos, quantidade, instrucoes)
values (1, 1, "Paracetamol e Buscopan", 2, "Tomar 1 compr. de 12 em 12 horas por 4 dias"),
(3, 2, "Amoxilina e Dipirona", 3, "Tomar 1/2 compr. de 8 em 8 horas por 6 dias"),
(2, 3, "Omeprazol, Ranitidina e Buscopan", 2, "Tomar 1 compr. de 6 em 6 horas por 15 dias"),
(4, 4, "Nimesulida, Benalet, Dipirona", 3, "Tomar 1 compr. de 8 em 8 horas durante 7 dias"),
(5, 5, "Effaclair, Flutivate, Ureadin podos", 5, "Lavar as regiões afetadas duas vezes ao dia");

insert into consulta(idPacientes, idConvenio, idCarteira, idMedicos, idEspecialidade, data_, hora, valor)
values (8, 1, 6, 6, 1, '2020-03-07', '08:20:00', 150),
(10, 2, 7, 4, 1, '2020-05-16', '11:20:00', 150),
(3, 1, 2, 10, 1, '2020-05-18', '09:10:00', 100),
(1, 2, 3, 1, 2, '2020-08-06', '08:20:00', 180),
(2, 1, 1, 6, 1, '2020-10-18', '10:10:00', 180);

insert into tipo_quarto(descricao, valor_diaria)
values ("Enfermaria", 350), ("Apartamento", 580);

insert into quarto(tipo_quarto_id, numeracao)
values (1, 1), (2, 100), (2, 101); 

insert into internacao(quarto_id, tipo_quarto_id, pacientes_id, medicos_id, medicos_especialidade_id, data_entrada, data_prev_alta, data_alta, procedimento)
values (3, 2, 1, 3, 3, '2019-03-01', '2019-03-08', '2019-03-010', "Medicação intravenosa"),
(1, 1, 8, 6, 1, '2020-03-07', '2020-03-14', '2020-03-14', "Medicação intravenosa"),
(2, 2, 8, 6, 1, '2020-03-20', '2020-03-22', '2020-03-23', "Cirurgia"),
(1, 1, 9, 7, 3, '2020-04-20', '2020-04-21', '2020-04-22', "Cirurgia"),
(1, 1, 10, 4, 1, '2020-05-16', '2020-05-16', '2020-05-16', "Medicação intravenosa"),
(3, 2, 10, 4, 1, '2020-05-17', '2020-05-17', '2020-05-17', "Cirurgia"),
(1, 1, 1, 1, 2, '2020-08-15', '2020-08-15', '2020-08-15', "Endoscopia e colonoscopia");

insert into tipo_quarto(descricao, valor_diaria)
values ("Quarto duplo", 400);

insert into quarto(tipo_quarto_id, numeracao)
values (3, 500), (3, 501);

insert into enfermeiro(nome, cpf, cre)
values ("Alice Girão", "82938878001", "Conren-PE 123.456-AE"),
("Aina Moraes", "01191596001", "Conren-PE 213.496-AE"),
("Carolina Rodrigues", "52469102022", "Conren-PE 743.886-AE"),
("Fernanda Alves", "12113205025", "Conren-PE 321.456-AE"),
("Rafaela Laranjeira", "36514764053", "Conren-PE 555.986-AE"),
("Erick Cardoso", "01720480010", "Conren-PE 496.256-AE");

insert into enfermaria(internacao_id, enfermeiro_id)
values (1, 2), (2, 3), (3, 1), (4, 2), (5, 4), (6, 5), (7, 6); 
