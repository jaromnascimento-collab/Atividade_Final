DROP DATABASE IF EXISTS SIGH;
CREATE DATABASE SIGH;
USE SIGH;

CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

INSERT INTO Pacientes (cpf, nome_completo, data_nascimento, endereco, telefone) VALUES
('123.456.789-01','João Silva','1980-05-12','Rua A, 123, São Paulo','(11) 98765-4321'),
('234.567.890-12','Maria Souza','1990-07-23','Rua B, 456, Rio de Janeiro','(21) 99876-5432'),
('345.678.901-23','Carlos Oliveira','1975-02-15','Av. C, 789, Belo Horizonte','(31) 91234-5678'),
('999.888.777-66','Fernanda Lima','2000-11-30','Rua Z, 321, Curitiba','(41) 98765-4321'),
('456.789.012-34', 'Ana Santos', '1988-09-08', 'Rua D, 101, Porto Alegre', '(51) 98765-4321'),
('567.890.123-45', 'Pedro Costa', '1995-03-21', 'Av. E, 202, Salvador', '(71) 99876-5432'),
('678.901.234-56', 'Juliana Almeida', '1982-12-14', 'Rua F, 303, Brasília', '(61) 91234-5678'),
('789.012.345-67', 'Lucas Pereira', '1991-06-05', 'Av. G, 404, Recife', '(81) 98765-4321'),
('890.123.456-78', 'Camila Rodrigues', '1979-10-25', 'Rua H, 505, Fortaleza', '(85) 99876-5432'),
('901.234.567-89', 'Ricardo Lima', '1985-04-18', 'Av. I, 606, Belém', '(91) 91234-5678'),
('012.345.678-90', 'Patrícia Fernandes', '1993-01-10', 'Rua J, 707, Manaus', '(92) 98765-4321'),
('112.233.445-56', 'Daniel Martins', '1987-08-28', 'Av. K, 808, Goiânia', '(62) 99876-5432'),
('223.344.556-67', 'Aline Gomes', '1998-02-09', 'Rua L, 909, Curitiba', '(41) 91234-5678'),
('334.455.667-78', 'Eduardo Santos', '1976-11-03', 'Av. M, 111, Campinas', '(19) 98765-4321'),
('445.566.778-89', 'Viviane Rocha', '1990-05-17', 'Rua N, 222, São Paulo', '(11) 99876-5432'),
('556.677.889-90', 'Felipe Oliveira', '1984-07-29', 'Av. O, 333, Rio de Janeiro', '(21) 91234-5678'),
('667.788.990-01', 'Luiza Castro', '1996-03-12', 'Rua P, 444, Belo Horizonte', '(31) 98765-4321'),
('778.899.001-12', 'Roberto Diniz', '1981-09-01', 'Av. Q, 555, Porto Alegre', '(51) 99876-5432'),
('889.900.112-23', 'Mariana Neves', '1994-12-04', 'Rua R, 666, Salvador', '(71) 91234-5678'),
('990.011.223-34', 'Marcelo Costa', '1983-06-19', 'Av. S, 777, Brasília', '(61) 98765-4321'),
('001.122.334-45', 'Larissa Mendes', '1997-01-26', 'Rua T, 888, Recife', '(81) 99876-5432'),
('112.334.556-77', 'Gustavo Pires', '1989-10-11', 'Av. U, 999, Fortaleza', '(85) 91234-5678'),
('223.445.667-88', 'Letícia Santos', '1986-04-20', 'Rua V, 1010, Belém', '(91) 98765-4321'),
('334.556.778-99', 'Thiago Lima', '1992-08-07', 'Av. W, 1111, Manaus', '(92) 99876-5432'),
('445.667.889-00', 'Gabriela Fernandes', '1980-02-22', 'Rua X, 1212, Goiânia', '(62) 91234-5678'),
('556.778.990-11', 'Rafael Barbosa', '1999-05-15', 'Av. Y, 1313, Curitiba', '(41) 98765-4321'),
('667.889.001-22', 'Beatriz Silva', '1985-11-09', 'Rua Z, 1414, Campinas', '(19) 99876-5432'),
('778.990.112-33', 'João Gabriel', '1993-07-03', 'Av. AA, 1515, São Paulo', '(11) 91234-5678'),
('889.001.223-44', 'Renata Nunes', '1988-03-24', 'Rua BB, 1616, Rio de Janeiro', '(21) 98765-4321'),
('990.112.334-55', 'Hugo Costa', '1977-09-06', 'Av. CC, 1717, Belo Horizonte', '(31) 99876-5432'),
('001.223.445-66', 'Isabela Pires', '1995-12-31', 'Rua DD, 1818, Porto Alegre', '(51) 91234-5678'),
('112.334.556-78', 'Vinícius Martins', '1982-06-10', 'Av. EE, 1919, Salvador', '(71) 98765-4321'),
('223.445.667-89', 'Lorena Almeida', '1991-01-29', 'Rua FF, 2020, Brasília', '(61) 99876-5432'),
('334.556.778-90', 'Arthur Gomes', '1984-04-05', 'Av. GG, 2121, Recife', '(81) 91234-5678');


CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

INSERT INTO Departamentos (nome_departamento) VALUES
('Cardiologia'),
('Pediatria'),
('Ortopedia'),
('Neurologia'),
('Ginecologia'),
('Dermatologia'),
('Oncologia'),
('Endocrinologia'),
('Psiquiatria'),
('Clínica Geral');


CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    crm VARCHAR(20) UNIQUE NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

INSERT INTO Medicos (crm, nome_completo, especialidade, id_departamento) VALUES
('CRM1001','Dr. Ricardo Alves','Cardiologia',1),
('CRM1002','Dra. Ana Martins','Pediatria',2),
('CRM1003','Dr. Pedro Costa','Ortopedia',3),
('CRM1004','Dra. Juliana Ferreira','Neurologia',4),
('CRM1005','Dr. Fernando Lima','Ginecologia',5),
('CRM1006','Dra. Patrícia Gomes','Dermatologia',6),
('CRM1007','Dr. Marcelo Ribeiro','Oncologia',7),
('CRM1008','Dra. Carla Souza','Endocrinologia',8),
('CRM1009','Dr. André Costa','Psiquiatria',9),
('CRM1010','Dra. Renata Alves','Clínica Geral',10),
('CRM1011', 'Dr. Gustavo Santos', 'Gastroenterologia', 1),
('CRM1012', 'Dra. Fernanda Oliveira', 'Oftalmologia', 2),
('CRM1013', 'Dr. Lucas Pereira', 'Urologia', 3),
('CRM1014', 'Dra. Mariana Rocha', 'Otorrinolaringologia', 4),
('CRM1015', 'Dr. Eduardo Nunes', 'Pneumologia', 5),
('CRM1016', 'Dra. Camila Castro', 'Reumatologia', 6),
('CRM1017', 'Dr. Rafael Diniz', 'Cirurgia Geral', 7),
('CRM1018', 'Dra. Letícia Neves', 'Anestesiologia', 8),
('CRM1019', 'Dr. Thiago Mendes', 'Nefrologia', 9),
('CRM1020', 'Dra. Gabriela Pires', 'Geriatria', 10),
('CRM1021', 'Dr. João Gabriel', 'Infectologia', 1),
('CRM1022', 'Dra. Renata Barbosa', 'Hematologia', 2),
('CRM1023', 'Dr. Hugo Costa', 'Cardiologia', 3),
('CRM1024', 'Dra. Isabela Pires', 'Pediatria', 4),
('CRM1025', 'Dr. Vinícius Martins', 'Ortopedia', 5),
('CRM1026', 'Dra. Lorena Almeida', 'Neurologia', 6),
('CRM1027', 'Dr. Arthur Gomes', 'Ginecologia', 7),
('CRM1028', 'Dra. Luana Ribeiro', 'Dermatologia', 8),
('CRM1029', 'Dr. Daniel Silva', 'Oncologia', 9),
('CRM1030', 'Dra. Beatriz Santos', 'Endocrinologia', 10),
('CRM1031', 'Dr. Felipe Oliveira', 'Psiquiatria', 1),
('CRM1032', 'Dra. Viviane Rocha', 'Clínica Geral', 2),
('CRM1033', 'Dr. Marcelo Costa', 'Gastroenterologia', 3),
('CRM1034', 'Dra. Larissa Mendes', 'Oftalmologia', 4),
('CRM1035', 'Dr. Roberto Diniz', 'Urologia', 5),
('CRM1036', 'Dra. Mariane Vieira', 'Otorrinolaringologia', 6),
('CRM1037', 'Dr. Paulo Henrique', 'Pneumologia', 7),
('CRM1038', 'Dra. Lídia Machado', 'Reumatologia', 8),
('CRM1039', 'Dr. Otávio Ramos', 'Cirurgia Geral', 9),
('CRM1040', 'Dra. Sofia Lima', 'Anestesiologia', 10);


CREATE TABLE Consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data_hora DATETIME NOT NULL,
    sala VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);
INSERT INTO Consultas (id_paciente, id_medico, data_hora, sala, status) VALUES
(1, 2, '2025-09-05 09:00:00', 'Sala 01', 'Agendada'),
(2, 1, '2025-09-05 09:30:00', 'Sala 02', 'Concluída'),
(3, 3, '2025-09-05 10:00:00', 'Sala 03', 'Cancelada'),
(4, 2, '2025-09-05 10:30:00', 'Sala 01', 'Agendada'),
(5, 4, '2025-09-05 11:00:00', 'Sala 04', 'Concluída'),
(6, 5, '2025-09-05 11:30:00', 'Sala 05', 'Agendada'),
(7, 1, '2025-09-05 13:00:00', 'Sala 02', 'Agendada'),
(8, 3, '2025-09-05 13:30:00', 'Sala 03', 'Concluída'),
(9, 4, '2025-09-05 14:00:00', 'Sala 04', 'Agendada'),
(10, 2, '2025-09-05 14:30:00', 'Sala 01', 'Cancelada'),

(1, 5, '2025-09-06 09:00:00', 'Sala 05', 'Agendada'),
(2, 4, '2025-09-06 09:30:00', 'Sala 04', 'Concluída'),
(3, 2, '2025-09-06 10:00:00', 'Sala 01', 'Agendada'),
(4, 3, '2025-09-06 10:30:00', 'Sala 03', 'Cancelada'),
(5, 1, '2025-09-06 11:00:00', 'Sala 02', 'Agendada'),
(6, 5, '2025-09-06 11:30:00', 'Sala 05', 'Concluída'),
(7, 4, '2025-09-06 13:00:00', 'Sala 04', 'Agendada'),
(8, 2, '2025-09-06 13:30:00', 'Sala 01', 'Agendada'),
(9, 3, '2025-09-06 14:00:00', 'Sala 03', 'Concluída'),
(10, 1, '2025-09-06 14:30:00', 'Sala 02', 'Agendada'),

(1, 3, '2025-09-07 09:00:00', 'Sala 03', 'Agendada'),
(2, 5, '2025-09-07 09:30:00', 'Sala 05', 'Cancelada'),
(3, 4, '2025-09-07 10:00:00', 'Sala 04', 'Agendada'),
(4, 2, '2025-09-07 10:30:00', 'Sala 01', 'Concluída'),
(5, 1, '2025-09-07 11:00:00', 'Sala 02', 'Agendada'),
(6, 3, '2025-09-07 11:30:00', 'Sala 03', 'Agendada'),
(7, 5, '2025-09-07 13:00:00', 'Sala 05', 'Concluída'),
(8, 4, '2025-09-07 13:30:00', 'Sala 04', 'Agendada'),
(9, 1, '2025-09-07 14:00:00', 'Sala 02', 'Cancelada'),
(10, 2, '2025-09-07 14:30:00', 'Sala 01', 'Agendada');





CREATE TABLE Internacoes_Paciente (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico_responsavel INT,
    quarto VARCHAR(50),
    data_entrada DATETIME,
    data_alta DATETIME,
    diagnostico TEXT,
    tipo_convenio ENUM('Particular', 'Plano', 'SUS'),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico_responsavel) REFERENCES Medicos(id_medico)
);
INSERT INTO Internacoes_Paciente (id_paciente, id_medico_responsavel, quarto, data_entrada, data_alta, diagnostico, tipo_convenio) VALUES
(1, 2, '101-A', '2025-08-20 14:00:00', '2025-08-25 10:00:00', 'Pneumonia bacteriana', 'Plano'),
(2, 1, '102-B', '2025-08-21 09:30:00', '2025-08-26 15:00:00', 'Fratura de fêmur', 'SUS'),
(3, 3, '103-C', '2025-08-22 11:00:00', NULL, 'Covid-19 com insuficiência respiratória', 'Particular'),
(4, 4, '104-A', '2025-08-23 08:00:00', '2025-08-27 14:00:00', 'Apendicite aguda', 'Plano'),
(5, 5, '105-B', '2025-08-23 20:00:00', '2025-08-29 09:00:00', 'Infecção urinária grave', 'SUS'),
(6, 2, '106-C', '2025-08-24 13:00:00', NULL, 'Insuficiência cardíaca descompensada', 'Plano'),
(7, 1, '201-A', '2025-08-25 10:00:00', '2025-08-28 16:00:00', 'Crise asmática severa', 'Particular'),
(8, 3, '202-B', '2025-08-25 12:30:00', '2025-08-30 10:00:00', 'Cirurgia de hérnia', 'Plano'),
(9, 4, '203-C', '2025-08-26 09:00:00', NULL, 'Acidente vascular cerebral isquêmico', 'SUS'),
(10, 5, '204-A', '2025-08-26 21:00:00', '2025-08-31 11:00:00', 'Infarto agudo do miocárdio', 'Plano'),

(1, 3, '301-B', '2025-08-27 08:00:00', '2025-08-30 14:00:00', 'Colecistite aguda', 'SUS'),
(2, 2, '302-C', '2025-08-27 11:30:00', '2025-09-01 15:00:00', 'Cirurgia ortopédica - joelho', 'Particular'),
(3, 4, '303-A', '2025-08-28 07:00:00', NULL, 'Septicemia', 'Plano'),
(4, 5, '304-B', '2025-08-28 16:00:00', '2025-09-02 12:00:00', 'Acidente de trânsito - politrauma', 'SUS'),
(5, 1, '305-C', '2025-08-29 09:00:00', '2025-09-03 09:00:00', 'Pós-operatório de apendicectomia', 'Plano'),
(6, 3, '306-A', '2025-08-29 15:00:00', NULL, 'Insuficiência renal aguda', 'Particular'),
(7, 2, '401-B', '2025-08-30 10:00:00', '2025-09-01 13:00:00', 'Crise epiléptica', 'SUS'),
(8, 4, '402-C', '2025-08-30 18:30:00', NULL, 'Pneumonia viral', 'Plano'),
(9, 5, '403-A', '2025-08-31 08:00:00', '2025-09-02 17:00:00', 'Infecção hospitalar', 'Particular'),
(10, 1, '404-B', '2025-08-31 20:00:00', NULL, 'Queimaduras extensas', 'SUS'),

(1, 2, '501-C', '2025-09-01 09:00:00', '2025-09-03 14:00:00', 'Desidratação grave', 'Plano'),
(2, 3, '502-A', '2025-09-01 13:00:00', NULL, 'Pancreatite aguda', 'Particular'),
(3, 5, '503-B', '2025-09-01 22:00:00', '2025-09-04 11:00:00', 'Infecção abdominal', 'SUS'),
(4, 4, '504-C', '2025-09-02 08:00:00', '2025-09-05 15:00:00', 'Cirurgia cardíaca', 'Plano'),
(5, 2, '505-A', '2025-09-02 14:00:00', NULL, 'Leucemia em tratamento', 'SUS'),
(6, 1, '506-B', '2025-09-02 19:00:00', '2025-09-06 10:00:00', 'Pneumonia aspirativa', 'Particular'),
(7, 3, '601-C', '2025-09-03 09:30:00', '2025-09-06 12:00:00', 'Doença pulmonar obstrutiva crônica (DPOC)', 'Plano'),
(8, 5, '602-A', '2025-09-03 15:00:00', NULL, 'Complicações pós-parto', 'SUS'),
(9, 4, '603-B', '2025-09-04 10:00:00', NULL, 'Hemorragia digestiva alta', 'Particular'),
(10, 2, '604-C', '2025-09-04 17:00:00', '2025-09-07 14:00:00', 'Cirurgia de vesícula', 'Plano');






CREATE TABLE Prontuario_Eletronico (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    data_hora DATETIME NOT NULL,
    descricao TEXT,
    id_consulta INT,
    id_internacao INT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta),
    FOREIGN KEY (id_internacao) REFERENCES Internacoes_Paciente(id_internacao)
);
INSERT INTO Prontuario_Eletronico (id_paciente, data_hora, descricao, id_consulta, id_internacao) VALUES
(1, '2025-08-20 14:30:00', 'Paciente apresentou febre e tosse persistente. Exame físico compatível com pneumonia.', 1, 1),
(2, '2025-08-21 10:00:00', 'Paciente sofreu fratura no fêmur esquerdo. Encaminhado para cirurgia ortopédica.', 2, 2),
(3, '2025-08-22 11:30:00', 'Paciente internado com quadro de Covid-19. Saturação baixa, iniciou oxigenoterapia.', NULL, 3),
(4, '2025-08-23 08:30:00', 'Paciente com dor abdominal intensa. Diagnóstico de apendicite.', 4, 4),
(5, '2025-08-23 20:30:00', 'Paciente com febre alta e dor lombar. Infecção urinária grave confirmada.', NULL, 5),
(6, '2025-08-24 13:30:00', 'Paciente internado por insuficiência cardíaca descompensada. ECG alterado.', NULL, 6),
(7, '2025-08-25 10:30:00', 'Paciente em crise asmática, administrado broncodilatador.', 7, NULL),
(8, '2025-08-25 12:45:00', 'Paciente submetido a cirurgia de hérnia inguinal. Pós-operatório estável.', NULL, 8),
(9, '2025-08-26 09:15:00', 'Paciente com sinais de AVC isquêmico. Tomografia realizada.', NULL, 9),
(10, '2025-08-26 21:30:00', 'Paciente internado após infarto agudo do miocárdio. Iniciado tratamento trombolítico.', NULL, 10),

(1, '2025-08-27 09:00:00', 'Paciente com colecistite aguda. Encaminhado para cirurgia.', NULL, 11),
(2, '2025-08-27 12:00:00', 'Paciente em recuperação de cirurgia ortopédica. Dor controlada.', 12, 12),
(3, '2025-08-28 07:30:00', 'Paciente com septicemia. Antibioticoterapia em andamento.', NULL, 13),
(4, '2025-08-28 16:30:00', 'Paciente politraumatizado após acidente. Feito estabilização inicial.', NULL, 14),
(5, '2025-08-29 09:30:00', 'Paciente no pós-operatório de apendicectomia. Evoluindo bem.', 15, 15),
(6, '2025-08-29 15:30:00', 'Paciente com insuficiência renal aguda. Iniciada hemodiálise.', NULL, 16),
(7, '2025-08-30 10:15:00', 'Paciente com crise epiléptica. Prescrita medicação anticonvulsivante.', 17, 17),
(8, '2025-08-30 18:45:00', 'Paciente com pneumonia viral. Iniciado suporte ventilatório.', NULL, 18),
(9, '2025-08-31 08:15:00', 'Paciente apresentou febre após 48h de internação. Infecção hospitalar suspeita.', NULL, 19),
(10, '2025-08-31 20:30:00', 'Paciente com queimaduras extensas. Iniciado protocolo de hidratação.', NULL, 20),

(1, '2025-09-01 09:15:00', 'Paciente apresentou quadro de desidratação grave. Reposição hídrica feita.', 21, 21),
(2, '2025-09-01 13:15:00', 'Paciente com pancreatite aguda. Mantido em jejum e analgesia.', NULL, 22),
(3, '2025-09-01 22:15:00', 'Paciente com infecção abdominal pós-operatória.', NULL, 23),
(4, '2025-09-02 08:30:00', 'Paciente submetido a cirurgia cardíaca. Evoluindo em UTI.', NULL, 24),
(5, '2025-09-02 14:30:00', 'Paciente em tratamento de leucemia. Sessão de quimioterapia realizada.', NULL, 25),
(6, '2025-09-02 19:15:00', 'Paciente com pneumonia aspirativa. Suporte antibiótico iniciado.', NULL, 26),
(7, '2025-09-03 09:45:00', 'Paciente com DPOC. Necessitou ventilação não invasiva.', 27, 27),
(8, '2025-09-03 15:15:00', 'Paciente com complicações pós-parto. Hemorragia controlada.', NULL, 28),
(9, '2025-09-04 10:15:00', 'Paciente com hemorragia digestiva alta. Endoscopia realizada.', NULL, 29),
(10, '2025-09-04 17:15:00', 'Paciente submetido a cirurgia de vesícula. Recuperação satisfatória.', NULL, 30);




SELECT * FROM Pacientes;
SELECT * FROM Medicos;
SELECT * FROM Departamentos;
SELECT * FROM Consultas;
SELECT * FROM Internacoes_Paciente;
SELECT * FROM Prontuario_Eletronico;
