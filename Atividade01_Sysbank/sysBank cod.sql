DROP DATABASE IF EXISTS SysBank;
CREATE DATABASE SysBank;
USE SysBank;

-- =========================
-- Tabela de Agências
-- =========================
CREATE TABLE Agencias (
    numero_agencia INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

INSERT INTO Agencias (numero_agencia, nome, endereco) VALUES
(101, 'Agência Centro Recife', 'Avenida Conde da Boa Vista, 800, Boa Vista, Recife, PE'),
(102, 'Agência Boa Viagem', 'Avenida Conselheiro Aguiar, 450, Boa Viagem, Recife, PE'),
(103, 'Agência Olinda', 'Rua do Sol, 321, Olinda, PE'),
(104, 'Agência Paulista', 'Av. Floriano Peixoto, 150, Paulista, PE'),
(105, 'Agência Jaboatão', 'Av. Bernardo Vieira de Melo, 900, Jaboatão, PE'),
(201, 'Agência Recife Norte', 'Av. Norte, 1000, Recife, PE'),
(202, 'Agência Recife Sul', 'Av. Sul, 200, Recife, PE'),
(203, 'Agência Olinda Centro', 'Rua Central, 500, Olinda, PE'),
(204, 'Agência Paulista Nova', 'Av. Nova Paulista, 300, Paulista, PE'),
(205, 'Agência Jaboatão Leste', 'Av. Leste, 1500, Jaboatão, PE');

-- =========================
-- Tabela de Funcionários
-- =========================
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome_completo VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    numero_agencia INT,
    FOREIGN KEY (numero_agencia) REFERENCES Agencias(numero_agencia)
);

INSERT INTO Funcionarios (id_funcionario, cpf, nome_completo, cargo, numero_agencia) VALUES
(1, '11122233301', 'Carlos Alberto de Nóbrega', 'Gerente Geral', 101),
(2, '11122233302', 'Mariana Rios da Costa', 'Gerente de Contas', 101),
(5, '22233344401', 'Ricardo Gomes Pereira', 'Gerente Geral', 102),
(6, '22233344402', 'Beatriz Oliveira Santos', 'Gerente de Contas', 102),
(7, '33344455501', 'Marcelo Araújo Pinto', 'Caixa Executivo', 103),
(8, '33344455502', 'Débora Martins Silva', 'Analista de Crédito', 103),
(9, '33344455503', 'Henrique Souza Ramos', 'Atendente', 104),
(10,'33344455504', 'Camila Ferreira Lopes', 'Assistente Operacional', 105);

-- =========================
-- Tabela de Clientes
-- =========================
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome_completo VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

INSERT INTO Clientes (id_cliente, cpf, nome_completo, data_nascimento, endereco, email, telefone) VALUES
(1, '12345678901', 'João da Silva Santos', '1985-03-15', 'Rua da Aurora, 295, Boa Vista, Recife, PE', 'joao.silva.santos@emailficticio.com', '81998765432'),
(2, '23456789012', 'Maria Oliveira Costa', '1992-07-22', 'Avenida Boa Viagem, 920, Pina, Recife, PE', 'maria.o.costa@emailficticio.com', '81987654321'),
(3, '34567890123', 'Carlos Pereira Lima', '1978-11-05', 'Rua do Futuro, 959, Graças, Recife, PE', 'carlos.pereira@emailficticio.com', '81976543210'),
(4, '45678901234', 'Lucas Almeida Torres', '1990-05-14', 'Rua das Flores, 120, Olinda, PE', 'lucas.torres@email.com', '81988887777'),
(5, '56789012345', 'Patrícia Gomes da Silva', '1988-10-22', 'Av. Getúlio Vargas, 45, Paulista, PE', 'patricia.silva@email.com', '81999998888'),
(6, '67890123456', 'Rafael Nogueira Santos', '1995-03-01', 'Rua Frei Caneca, 77, Recife, PE', 'rafael.nogueira@email.com', '81991112222'),
(7, '78901234567', 'Fernanda Moura Cavalcanti', '1982-07-19', 'Rua 7 de Setembro, 60, Jaboatão, PE', 'fernanda.moura@email.com', '81992223333'),
(8, '89012345678', 'Bruno Henrique Souza', '1993-12-30', 'Av. Recife, 500, Recife, PE', 'bruno.souza@email.com', '81993334444'),
(9, '90123456789', 'Tatiane Bezerra Lopes', '1997-02-11', 'Rua São José, 98, Olinda, PE', 'tatiane.lopes@email.com', '81994445555'),
(10, '01234567890', 'Gabriel Lima Fernandes', '1986-09-05', 'Av. Agamenon Magalhães, 750, Recife, PE', 'gabriel.fernandes@email.com', '81995556666'),
(201, '20120120101', 'Roberto Almeida', '1980-01-10', 'Rua das Palmeiras, 10, Recife, PE', 'roberto.almeida@email.com', '81990000001'),
(202, '20220220202', 'Sofia Ribeiro', '1990-03-15', 'Av. Boa Viagem, 200, Recife, PE', 'sofia.ribeiro@email.com', '81990000002'),
(203, '20320320303', 'Vinicius Lopes', '1985-07-20', 'Rua do Sol, 300, Olinda, PE', 'vinicius.lopes@email.com', '81990000003'),
(204, '20420420404', 'Camila Martins', '1992-09-25', 'Av. Paulista, 400, Paulista, PE', 'camila.martins@email.com', '81990000004'),
(205, '20520520505', 'Felipe Costa', '1988-12-05', 'Rua da Paz, 500, Jaboatão, PE', 'felipe.costa@email.com', '81990000005'),
(206, '20620620606', 'Laura Nascimento', '1995-05-30', 'Av. Nova, 600, Recife, PE', 'laura.nascimento@email.com', '81990000006'),
(207, '20720720707', 'Lucas Andrade', '1983-11-11', 'Rua das Flores, 700, Olinda, PE', 'lucas.andrade@email.com', '81990000007'),
(208, '20820820808', 'Mariana Silva', '1996-02-22', 'Av. Leste, 800, Jaboatão, PE', 'mariana.silva@email.com', '81990000008'),
(209, '20920920909', 'Ricardo Mendes', '1987-08-18', 'Rua Central, 900, Recife, PE', 'ricardo.mendes@email.com', '81990000009'),
(210, '21021021010', 'Fernanda Rocha', '1991-06-05', 'Av. Norte, 1000, Recife, PE', 'fernanda.rocha@email.com', '81990000010');


CREATE TABLE Contas (
    numero_conta INT PRIMARY KEY,
    tipo ENUM('Corrente', 'Poupança') NOT NULL,
    saldo_atual DECIMAL(10, 2) DEFAULT 0.00,
    data_abertura DATE NOT NULL,
    status ENUM('Ativa', 'Inativa', 'Bloqueada') NOT NULL,
    id_cliente INT NOT NULL,
    numero_agencia INT NOT NULL,
    id_gerente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (numero_agencia) REFERENCES Agencias(numero_agencia),
    FOREIGN KEY (id_gerente) REFERENCES Funcionarios(id_funcionario)
);


INSERT INTO Contas (numero_conta, tipo, saldo_atual, data_abertura, status, id_cliente, numero_agencia, id_gerente) VALUES
(1001, 'Corrente', 5000.00, '2024-01-10', 'Ativa', 1, 101, 2),
(1002, 'Poupança', 15000.00, '2024-01-10', 'Ativa', 1, 101, 2),
(1003, 'Corrente', 2500.00, '2024-03-22', 'Ativa', 2, 102, 5),
(1004, 'Poupança', 8500.00, '2024-05-15', 'Ativa', 3, 103, 7),
(1005, 'Corrente', 3200.00, '2024-06-10', 'Ativa', 2, 102, 5),
(1006, 'Poupança', 12000.00, '2023-11-12', 'Ativa', 3, 104, 9),
(1007, 'Corrente', 700.00, '2024-07-01', 'Ativa', 1, 105, 10),
(1008, 'Corrente', 5000.00, '2024-01-10', 'Ativa', 4, 101, 2),
(1009, 'Poupança', 12000.00, '2024-02-15', 'Ativa', 5, 102, 6),
(1010, 'Corrente', 3000.00, '2024-03-01', 'Ativa', 6, 103, 7);


-- =========================
-- Tabela Cartoes corrigida
-- =========================
CREATE TABLE Cartoes (
    numero_cartao VARCHAR(16) PRIMARY KEY,
    tipo ENUM('Crédito', 'Débito') NOT NULL,
    data_validade DATE NOT NULL,
    limite DECIMAL(10, 2),
    status ENUM('Ativo', 'Bloqueado') NOT NULL,
    numero_conta INT NOT NULL,
    FOREIGN KEY (numero_conta) REFERENCES Contas(numero_conta)
);

-- =========================
-- Inserção de dados consistentes
-- =========================
INSERT INTO Cartoes (numero_cartao, tipo, data_validade, limite, status, numero_conta) VALUES
('5555444433331111', 'Crédito', '2027-12-31', 10000.00, 'Ativo', 1001),
('5555444433332222', 'Débito', '2026-08-31', NULL, 'Ativo', 1001),
('5555444433333333', 'Crédito', '2026-05-31', 5000.00, 'Ativo', 1002),
('5555444433334444', 'Débito', '2028-03-31', NULL, 'Ativo', 1003),
('5555444433335555', 'Crédito', '2028-04-30', 8000.00, 'Ativo', 1004),
('5555444433336666', 'Débito', '2027-06-30', NULL, 'Ativo', 1005),
('5555444433337777', 'Crédito', '2029-01-31', 6000.00, 'Ativo', 1006),
('5555444433338888', 'Débito', '2027-12-31', NULL, 'Ativo', 1007),
('5555444433339999', 'Crédito', '2028-09-30', 12000.00, 'Ativo', 1008),
('5555444433340000', 'Débito', '2029-03-31', NULL, 'Ativo', 1009),
('5555444433341111', 'Crédito', '2029-12-31', 15000.00, 'Ativo', 1010);


-- =========================
-- Tabela de Faturas
-- =========================
-- Tabela Faturas corrigida
-- =========================
CREATE TABLE Faturas (
    id_fatura INT PRIMARY KEY,
    data_vencimento DATE NOT NULL,
    valor_total DECIMAL(10, 2) DEFAULT 0.00,
    status ENUM('Aberta', 'Paga', 'Vencida') NOT NULL,
    numero_cartao VARCHAR(16) NOT NULL,
    FOREIGN KEY (numero_cartao) REFERENCES Cartoes(numero_cartao)
);

-- =========================
-- Inserção de dados consistentes
-- =========================
INSERT INTO Faturas (id_fatura, data_vencimento, valor_total, status, numero_cartao) VALUES
(1, '2024-09-10', 2500.00, 'Aberta', '5555444433331111'),
(2, '2024-08-10', 1800.00, 'Paga', '5555444433331111'),
(3, '2024-09-15', 750.00, 'Aberta', '5555444433332222'),
(4, '2024-09-20', 1200.00, 'Aberta', '5555444433333333'),
(5, '2024-09-25', 3000.00, 'Aberta', '5555444433334444'),
(6, '2024-10-05', 2200.00, 'Aberta', '5555444433335555'),
(7, '2024-10-10', 1800.00, 'Paga', '5555444433336666'),
(8, '2024-10-15', 950.00, 'Aberta', '5555444433337777'),
(9, '2024-10-20', 1200.00, 'Aberta', '5555444433338888'),
(10,'2024-10-25', 1700.00, 'Aberta', '5555444433339999');

-- =========================
-- Tabela Transacoes corrigida
-- =========================
CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY,
    tipo ENUM('Depósito', 'Saque', 'Transferência', 'Pagamento Cartão') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL CHECK (valor > 0),
    data_hora DATETIME NOT NULL,
    numero_conta_origem INT,
    numero_conta_destino INT,
    FOREIGN KEY (numero_conta_origem) REFERENCES Contas(numero_conta),
    FOREIGN KEY (numero_conta_destino) REFERENCES Contas(numero_conta)
);

-- =========================
-- Inserção de dados consistentes
-- =========================
INSERT INTO Transacoes (id_transacao, tipo, valor, data_hora, numero_conta_origem, numero_conta_destino) VALUES
(1, 'Depósito', 2000.00, '2024-07-05 10:30:00', NULL, 1001),
(2, 'Transferência', 500.00, '2024-07-06 15:00:00', 1001, 1003),
(3, 'Pagamento Cartão', 1800.00, '2024-08-05 09:00:00', 1001, NULL),
(4, 'Saque', 300.00, '2024-08-12 13:20:00', 1003, NULL),
(5, 'Depósito', 1000.00, '2024-07-20 10:00:00', NULL, 1004),
(6, 'Transferência', 750.00, '2024-07-22 14:00:00', 1004, 1005),
(7, 'Saque', 300.00, '2024-07-25 09:15:00', 1005, NULL),
(8, 'Pagamento Cartão', 1200.00, '2024-08-01 16:30:00', 1004, NULL),
(9, 'Depósito', 2000.00, '2024-08-05 11:00:00', NULL, 1006),
(10, 'Transferência', 600.00, '2024-08-10 12:00:00', 1006, 1007),
(11, 'Saque', 400.00, '2024-08-15 09:45:00', 1007, NULL),
(12, 'Pagamento Cartão', 900.00, '2024-08-20 10:30:00', 1008, NULL),
(13, 'Depósito', 1500.00, '2024-08-25 11:20:00', NULL, 1009),
(14, 'Transferência', 800.00, '2024-08-30 14:00:00', 1009, 1010),
(15, 'Saque', 500.00, '2024-09-01 15:10:00', 1010, NULL);


-- =========================
-- Tabela Beneficiarios corrigida
-- =========================
CREATE TABLE Beneficiarios (
    id_beneficiario INT PRIMARY KEY,
    nome_favorecido VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    banco VARCHAR(100),
    agencia_favorecido VARCHAR(20),
    conta_favorecido VARCHAR(20),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Beneficiarios (id_beneficiario, nome_favorecido, cpf_cnpj, banco, agencia_favorecido, conta_favorecido, id_cliente) VALUES
(1, 'Pedro Alves Souza', '45678912300', 'Banco do Brasil', '1234', '56789-0', 1), 
(2, 'Ana Paula Ramos', '56789123400', 'Caixa Econômica', '4321', '98765-4', 2), 
(3, 'José Lima Ferreira', '67891234500', 'Itaú', '1111', '22222-2', 3),      
(4, 'Marcelo Araújo Pinto', '78945612300', 'Santander', '2222', '44444-4', 4),
(5, 'Débora Martins Silva', '89056723411', 'Bradesco', '3333', '55555-5', 5),
(6, 'Henrique Souza Ramos', '90167834522', 'Banco Inter', '4444', '66666-6', 6),
(7, 'Camila Ferreira Lopes', '01278945633', 'Nubank', '0001', '77777-7', 7),
(8, 'Paulo Henrique', '30130130101', 'Banco do Brasil', '201', '10001-0', 8),
(9, 'Ana Beatriz', '30230230202', 'Caixa Econômica', '202', '20001-1', 9),
(10,'Lucas Fernandes', '30330330303', 'Itaú', '203', '30001-2', 10);

CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY,
    valor_total DECIMAL(10,2) NOT NULL CHECK(valor_total>0),
    taxa_juros DECIMAL(5,2) NOT NULL,
    numero_parcelas INT NOT NULL CHECK(numero_parcelas>0),
    data_solicitacao DATE NOT NULL,
    status ENUM('Em análise','Aprovado','Quitado') NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Emprestimos (id_emprestimo, valor_total, taxa_juros, numero_parcelas, data_solicitacao, status, id_cliente) VALUES
(1, 20000.00, 2.5, 24, '2024-06-10', 'Aprovado', 1),
(2, 10000.00, 3.0, 12, '2024-07-15', 'Em análise', 2),
(3, 50000.00, 1.8, 36, '2023-03-20', 'Quitado', 3),
(4,15000.00, 2.5, 12, '2024-01-05', 'Aprovado', 201),
 (5,8000.00, 3.0, 8, '2024-02-10', 'Em análise', 202), 
 (6,50000.00, 1.8, 24, '2024-03-15', 'Quitado', 203), 
 (7,12000.00, 2.2, 10, '2024-04-20', 'Aprovado', 204), 
 (8,7000.00, 3.5, 6, '2024-05-25', 'Em análise', 205), 
 (9,30000.00, 2.0, 15, '2024-06-10', 'Quitado', 206);


CREATE TABLE Parcelas_Emprestimo (
    id_parcela INT PRIMARY KEY,
    numero_parcela INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK(valor>0),
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    id_emprestimo INT NOT NULL,
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo)
);

INSERT INTO Parcelas_Emprestimo (id_parcela, numero_parcela, valor, data_vencimento, data_pagamento, id_emprestimo) VALUES
(1, 1, 850.00, '2024-07-10', NULL, 1),
(2, 2, 850.00, '2024-08-10', NULL, 1),
(3, 3, 1250.00, '2024-02-05', '2024-02-05', 1),
(4, 4, 1250.00, '2024-03-05', '2024-03-05', 1),
(5, 5, 1250.00, '2024-04-05', NULL, 1),
(6, 1, 950.00, '2024-08-15', NULL, 2),
(7, 2, 1000.00, '2024-03-10', NULL, 2),
(8, 3, 1100.00, '2024-04-10', NULL, 2),
(9, 1, 1400.00, '2023-04-20', '2023-04-20', 3),
(10, 2, 2083.33, '2024-04-15', '2024-04-15', 3),
(11, 3, 2083.33, '2024-05-15', '2024-05-15', 3);



CREATE TABLE Investimentos (
    id_investimento INT PRIMARY KEY,
    tipo_produto VARCHAR(100) NOT NULL,
    valor_aplicado DECIMAL(10, 2) NOT NULL CHECK (valor_aplicado > 0),
    data_aplicacao DATE NOT NULL,
    rentabilidade DECIMAL(5, 2),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Investimentos (id_investimento, tipo_produto, valor_aplicado, data_aplicacao, rentabilidade, id_cliente) VALUES
(1, 'CDB', 10000.00, '2023-12-20', 9.5, 1), 
(2, 'Tesouro Selic', 5000.00, '2024-02-10', 8.2, 2), 
(3, 'Fundo Imobiliário', 30000.00, '2022-06-15', 12.0, 3), 
(4, 'LCI', 20000.00, '2024-01-20', 7.5, 4),
(5, 'Tesouro IPCA+', 10000.00, '2024-02-15', 6.8, 5),
(6, 'Fundo Multimercado', 15000.00, '2023-09-10', 10.0, 6),
(7, 'CDB', 10000.00, '2024-01-20', 9.5, 201),
(8, 'Tesouro Selic', 5000.00, '2024-02-15', 8.2, 202),
(9, 'Fundo Imobiliário', 30000.00, '2024-03-10', 12.0, 203),
(10, 'LCI', 15000.00, '2024-04-05', 7.5, 204),
(11, 'Tesouro IPCA+', 10000.00, '2024-05-01', 6.8, 205),
(12, 'Fundo Multimercado', 12000.00, '2024-06-01', 10.0, 206),
(13, 'CDB', 8000.00, '2024-07-01', 9.0, 207),
(14, 'Fundo Imobiliário', 15000.00, '2024-07-10', 11.5, 208),
(15, 'LCI', 5000.00, '2024-08-01', 7.8, 209),
(16,'Tesouro Selic', 20000.00, '2024-08-10', 8.5, 210);

-- =========================
-- VIEW para saldo total por cliente
-- =========================
CREATE VIEW Vw_SaldoClientes AS
SELECT c.id_cliente, cli.nome_completo, SUM(c.saldo_atual) AS saldo_total
FROM Contas c
JOIN Clientes cli ON c.id_cliente = cli.id_cliente
GROUP BY c.id_cliente;

-- =========================
-- Testes
select*from Agencias;
select*from funcionarios;
select*from clientes;
select*from contas;
select*from cartoes;
select*from faturas;
select*from Transacoes;
select*from beneficiarios;
select*from emprestimos;
select*from Parcelas_Emprestimo;
select*from investimentos ;