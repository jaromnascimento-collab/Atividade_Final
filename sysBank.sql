DROP DATABASE IF EXISTS SysBank;
CREATE DATABASE SysBank;
USE SysBank;


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
(105, 'Agência Jaboatão', 'Av. Bernardo Vieira de Melo, 900, Jaboatão, PE');




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
(10, '01234567890', 'Gabriel Lima Fernandes', '1986-09-05', 'Av. Agamenon Magalhães, 750, Recife, PE', 'gabriel.fernandes@email.com', '81995556666');


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
(1001, 'Corrente', 5000.00, '2024-01-10', 'Ativa', 1, 101, 2), -- Conta Corrente do João
(1002, 'Poupança', 15000.00, '2024-01-10', 'Ativa', 1, 101, 2), -- Conta Poupança do João
(2001, 'Corrente', 2500.00, '2024-03-22', 'Ativa', 2, 102, 6), -- Conta da Maria
(3001, 'Poupança', 85000.00, '2020-05-15', 'Ativa', 3, 101, 2), -- Conta do Carlo
(5, 'Depósito', 1000.00, '2024-07-20 10:00:00', NULL, 4001),
(6, 'Transferência', 750.00, '2024-07-22 14:00:00', 4001, 5001),
(7, 'Saque', 300.00, '2024-07-25 09:15:00', 5001, NULL),
(8, 'Pagamento Cartão', 1200.00, '2024-08-01 16:30:00', 4001, NULL),
(9, 'Depósito', 2000.00, '2024-08-05 11:00:00', NULL, 6001);

CREATE TABLE Cartoes (
    numero_cartao VARCHAR(16) PRIMARY KEY,
    tipo ENUM('Crédito', 'Débito') NOT NULL,
    data_validade DATE NOT NULL,
    limite DECIMAL(10, 2),
    status ENUM('Ativo', 'Bloqueado') NOT NULL,
    numero_conta INT NOT NULL,
    FOREIGN KEY (numero_conta) REFERENCES Contas(numero_conta)
);
INSERT INTO Cartoes (numero_cartao, tipo, data_validade, limite, status, numero_conta) VALUES
('5555444433331111', 'Crédito', '2027-12-31', 10000.00, 'Ativo', 1001),
('5555444433332222', 'Débito', '2026-08-31', NULL, 'Ativo', 1001),      
('5555444433333333', 'Crédito', '2026-05-31', 5000.00, 'Ativo', 2001),  
('5555444433334444', 'Débito', '2028-03-31', NULL, 'Ativo', 3001),      
('5555444433335555', 'Crédito', '2028-04-30', 8000.00, 'Ativo', 4001),
('5555444433336666', 'Débito', '2026-12-31', NULL, 'Ativo', 4002),
('5555444433337777', 'Crédito', '2027-06-30', 6000.00, 'Ativo', 5001),
('5555444433338888', 'Débito', '2029-01-31', NULL, 'Ativo', 6001),
('5555444433339999', 'Crédito', '2026-10-31', 15000.00, 'Ativo', 7001),
('5555444433340000', 'Débito', '2028-09-30', NULL, 'Ativo', 8001);




CREATE TABLE Faturas (
    id_fatura INT PRIMARY KEY,
    data_vencimento DATE NOT NULL,
    valor_total DECIMAL(10, 2) DEFAULT 0.00,
    status ENUM('Aberta', 'Paga', 'Vencida') NOT NULL,
    numero_cartao VARCHAR(16) NOT NULL,
    FOREIGN KEY (numero_cartao) REFERENCES Cartoes(numero_cartao)
);
INSERT INTO Faturas (id_fatura, data_vencimento, valor_total, status, numero_cartao) VALUES
(1, '2024-09-10', 2500.00, 'Aberta', '5555444433331111'),
(2, '2024-08-10', 1800.00, 'Paga', '5555444433331111'),
(3, '2024-09-15', 750.00, 'Aberta', '5555444433333333'),
(4, '2024-09-20', 1200.00, 'Aberta', '5555444433335555'),
(5, '2024-09-25', 3000.00, 'Aberta', '5555444433337777'),
(6, '2024-08-20', 5000.00, 'Paga', '5555444433339999');



CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY,
    tipo ENUM('Depósito', 'Saque', 'Transferência', 'Pagamento Cartão') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_hora DATETIME NOT NULL,
    numero_conta_origem INT,
    numero_conta_destino INT,
    FOREIGN KEY (numero_conta_origem) REFERENCES Contas(numero_conta),
    FOREIGN KEY (numero_conta_destino) REFERENCES Contas(numero_conta)
);

INSERT INTO Transacoes (id_transacao, tipo, valor, data_hora, numero_conta_origem, numero_conta_destino) VALUES
(1, 'Depósito', 2000.00, '2024-07-05 10:30:00', NULL, 1001),       
(2, 'Transferência', 500.00, '2024-07-06 15:00:00', 1001, 2001),  
(3, 'Pagamento Cartão', 1800.00, '2024-08-05 09:00:00', 1001, NULL), 
(4, 'Saque', 300.00, '2024-08-12 13:20:00', 2001, NULL),       
(5, 'Depósito', 1000.00, '2024-07-20 10:00:00', NULL, 4001),
(6, 'Transferência', 750.00, '2024-07-22 14:00:00', 4001, 5001),
(7, 'Saque', 300.00, '2024-07-25 09:15:00', 5001, NULL),
(8, 'Pagamento Cartão', 1200.00, '2024-08-01 16:30:00', 4001, NULL),
(9, 'Depósito', 2000.00, '2024-08-05 11:00:00', NULL, 6001);




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
(7, 'Camila Ferreira Lopes', '01278945633', 'Nubank', '0001', '77777-7', 7);


CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY,
    valor_total DECIMAL(10, 2) NOT NULL,
    taxa_juros DECIMAL(5, 2) NOT NULL,
    numero_parcelas INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    status ENUM('Em análise', 'Aprovado', 'Quitado') NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
INSERT INTO Emprestimos (id_emprestimo, valor_total, taxa_juros, numero_parcelas, data_solicitacao, status, id_cliente) VALUES
(1, 20000.00, 2.5, 24, '2024-06-10', 'Aprovado', 1), 
(2, 10000.00, 3.0, 12, '2024-07-15', 'Em análise', 2), 
(3, 50000.00, 1.8, 36, '2023-03-20', 'Quitado', 3),
(4, 15000.00, 2.0, 18, '2024-04-12', 'Aprovado', 4),
(5, 8000.00, 3.5, 10, '2024-05-20', 'Em análise', 5),
(6, 30000.00, 2.2, 24, '2023-08-18', 'Quitado', 6);


CREATE TABLE Parcelas_Emprestimo (
    id_parcela INT PRIMARY KEY,
    numero_parcela INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    id_emprestimo INT NOT NULL,
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo)
);
INSERT INTO Emprestimos (id_emprestimo, valor_total, taxa_juros, numero_parcelas, data_solicitacao, status, id_cliente) VALUES
(1, 20000.00, 2.5, 24, '2024-06-10', 'Aprovado', 1), 
(2, 10000.00, 3.0, 12, '2024-07-15', 'Em análise', 2), 
(3, 50000.00, 1.8, 36, '2023-03-20', 'Quitado', 3);   


CREATE TABLE Investimentos (
    id_investimento INT PRIMARY KEY,
    tipo_produto VARCHAR(100) NOT NULL,
    valor_aplicado DECIMAL(10, 2) NOT NULL,
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
(6, 'Fundo Multimercado', 15000.00, '2023-09-10', 10.0, 6);

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