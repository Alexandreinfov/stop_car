

/* -------------------------------------CRIANDO BANCO DE DADOS OS---------------------------------- */
DROP DATABASE IF EXISTS OS;
CREATE DATABASE IF NOT EXISTS OS;
USE OS;

/*-----------------------------------------CRIANDO TABELAS E GATILHOS - ESQUEMA BANCO DE DADOS ----------------------------------*/

/*------------------------------------------ TABELA CLIENTE  ----------------------------------*/


CREATE TABLE IF NOT EXISTS cliente (
    COD_CLIENTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    CPF VARCHAR(50) NOT NULL UNIQUE,
    ENDERECO VARCHAR(80) NOT NULL,
    TELEFONE VARCHAR(20) NOT NULL,
    PRIMARY KEY (COD_CLIENTE)
);
--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO cliente (COD_CLIENTE, NOME, CPF, ENDERECO, TELEFONE) VALUES
(3, 'Andrea', '401.321.70-96', 'R. Wallace Landal', '(16)36415859'),
(4, 'Filipe', '369.321.70-50', '\nR. Antônio Matar ', '(21)3326585'),
(5, 'Jose', '101.341.10-10', 'R. dos Oitis', '(11)3335939'),
(6, 'Gabrila', '401.301.20-30', 'Rua Sergipe', '(16)3334587');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS funcionario (
    COD_FUNCIONARIO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    CPF VARCHAR(50) NOT NULL UNIQUE,
    ENDERECO VARCHAR(50) NOT NULL,
    TELEFONE VARCHAR(20) NOT NULL,
    SALARIO DECIMAL(20 , 0 ) NOT NULL,
    PRIMARY KEY (COD_FUNCIONARIO)
);
--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO funcionario (COD_FUNCIONARIO, NOME, CPF, ENDERECO, TELEFONE, SALARIO) VALUES
(2, 'Rogerio', '222.321.70-22', 'Rua Bahia', '(16)33336565', '2000'),
(3, 'Fabio', '333.123.20-33', 'Rua Bahia', '(16)33333333', '50000'),
(4, 'Paulo', '444.321.30-44', 'Rua Bahia', '(16)33346444', '10000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_produto`
--

CREATE TABLE IF NOT EXISTS servico_produto (
    COD_SERVICO_PRODUTO INT NOT NULL AUTO_INCREMENT,
    TIPO ENUM('servico', 'produto') NOT NULL,
    DESCRICAO VARCHAR(50) NOT NULL,
    PRECO NUMERIC(8 , 2 ) NOT NULL,
    PRIMARY KEY (COD_SERVICO_PRODUTO)
);

--
-- Extraindo dados da tabela `servico_produto`
--

INSERT INTO servico_produto (COD_SERVICO_PRODUTO, TIPO, DESCRICAO, PRECO) VALUES
(24, 'servico', 'PNEU', '120.78'),
(25, 'servico', 'RODA', '987.98'),
(26, 'produto', 'TROCA DE OLEO', '11.78'),
(27, 'produto', 'BALANCEAMENTO', '300.98');

-- --------------------------------------------------------
--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS veiculo (
    COD_VEICULO INT NOT NULL AUTO_INCREMENT,
    PLACA VARCHAR(7) NOT NULL UNIQUE,
    MODELO VARCHAR(20) NOT NULL,
    MARCA VARCHAR(20) NOT NULL,
    ANO YEAR NOT NULL,
    COD_CLIENTE INT NOT NULL,
    PRIMARY KEY (COD_VEICULO,PLACA),
    FOREIGN KEY (COD_CLIENTE)
        REFERENCES CLIENTE (COD_CLIENTE)
        ON UPDATE CASCADE
);

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO veiculo (COD_VEICULO, PLACA, MODELO, MARCA, ANO, COD_CLIENTE) VALUES
(28, 'ABP0987', 'HILUX', 'TOYOTA', 2019, 3),
(29, 'ATT0101', 'TORO', 'FIAT', 2018, 6);

-- --------------------------------------------------------
--
-- Estrutura da tabela `ordem_servico`
--
CREATE TABLE IF NOT EXISTS ordem_servico (
    COD_OS INT NOT NULL AUTO_INCREMENT,
    DATA_ABERTURA DATETIME DEFAULT NOW() NOT NULL,
    DATA_FECHAMENTO DATETIME,
    COD_FUNCIONARIO INT NOT NULL,
    COD_CLIENTE INT NOT NULL,
    COD_VEICULO INT NOT NULL,
    STATUS ENUM('Orçamento', 'Aprovado', 'Finalizado', 'Faturado') DEFAULT 'Orçamento' NOT NULL,
    PRIMARY KEY (COD_OS),
    FOREIGN KEY (COD_FUNCIONARIO)
        REFERENCES FUNCIONARIO (COD_FUNCIONARIO)
        ON UPDATE CASCADE,
    FOREIGN KEY (COD_CLIENTE)
        REFERENCES CLIENTE (COD_CLIENTE)
        ON UPDATE CASCADE,
    FOREIGN KEY (COD_VEICULO)
        REFERENCES VEICULO (COD_VEICULO)
        ON UPDATE CASCADE
);


--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO ordem_servico (COD_OS, DATA_ABERTURA, DATA_FECHAMENTO, COD_FUNCIONARIO, COD_CLIENTE, COD_VEICULO, STATUS) VALUES
(54, '2019-06-23 21:30:50', NULL, 2, 3, 28, 'orçamento'),
(55, '2019-06-23 21:30:59', NULL, 3, 4, 28, 'orçamento'),
(56, '2019-06-23 21:31:08', NULL, 4, 5, 28, 'orçamento'),
(57, '2019-06-24 00:59:28', NULL, 2, 6, 29, 'orçamento'),
(58, '2019-06-24 01:01:00', NULL, 3, 3, 29, 'orçamento'),
(59, '2019-06-24 01:01:04', NULL, 4, 4, 29, 'orçamento'),
(60, '2019-06-24 01:01:06', NULL, 2, 5, 29, 'orçamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `os_item`
--

CREATE TABLE IF NOT EXISTS os_item (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    COD_OS INT(11) NOT NULL,
    COD_ITEM INT(11) DEFAULT NULL,
    QTDE INT(11) NOT NULL DEFAULT '1',
    PRIMARY KEY (ID),
    FOREIGN KEY (COD_OS)
        REFERENCES ordem_servico (COD_OS)
        ON UPDATE CASCADE,
    FOREIGN KEY (COD_ITEM)
        REFERENCES servico_produto (COD_SERVICO_PRODUTO)
        ON UPDATE CASCADE
);

--
-- Extraindo dados da tabela `os_item`
--

INSERT INTO os_item (ID, COD_OS, COD_ITEM, QTDE) VALUES
(19, 54, 26, 3),
(20, 54, 25, 1),
(21, 55, 26, 3),
(22, 56, 24, 1),
(23, 57, 27, 10),
(24, 58, 24, 1),
(25, 59, 24, 1),
(26, 60, 24, 1);

-- --------------------------------------------------------
--
-- Criando view `os`
--

CREATE OR REPLACE VIEW OS AS
    SELECT 
        OS.COD_OS AS CODIGO,
        C.NOME AS CLIENTE,
        C.TELEFONE,
        F.NOME AS FUNCIONARIO,
        V.PLACA,
        V.MODELO,
        V.MARCA,
        V.ANO,
        DATA_ABERTURA,
        DATA_FECHAMENTO,
        STATUS
    FROM
        ORDEM_SERVICO OS
            INNER JOIN
        FUNCIONARIO F ON OS.COD_FUNCIONARIO = F.COD_FUNCIONARIO
            INNER JOIN
        CLIENTE C ON OS.COD_CLIENTE = OS.COD_CLIENTE
            INNER JOIN
        VEICULO V ON OS.COD_VEICULO = V.COD_VEICULO;
        

-- --------------------------------------------------------
--
-- Estrutura da tabela `venda`
--


CREATE TABLE IF NOT EXISTS venda (
    COD_VENDA INT(11) NOT NULL AUTO_INCREMENT,
    TIPO_PAGAMENTO VARCHAR(50) NOT NULL,
    PARCELAS INT(11) NOT NULL,
    COD_OS INT(6) NOT NULL,
    VALOR_TOTAL DECIMAL(8 , 2 ) DEFAULT NULL,
    PRIMARY KEY (COD_VENDA),
    FOREIGN KEY (COD_OS)
        REFERENCES ORDEM_SERVICO (COD_OS)
        ON UPDATE CASCADE
);
-- --------------------------------------------------------
--
-- Acionadores `venda`
--


DROP TRIGGER IF EXISTS `FECHAMENTO_OS`;
DELIMITER //
CREATE TRIGGER FECHAMENTO_OS AFTER INSERT ON venda
 FOR EACH ROW UPDATE ORDEM_SERVICO SET STATUS = 'FATURADO' WHERE COD_OS = new.COD_OS
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER FECHA_DATA_OS BEFORE UPDATE ON ORDEM_SERVICO
FOR EACH ROW
BEGIN
IF NEW.STATUS = 'finalizado' THEN
    SET NEW.DATA_FECHAMENTO = NOW() ;
END IF;
END;
//
DELIMITER ;
/*

UPDATE ORDEM_SERVICO
SET STATUS = 'finalizado'
WHERE cod_os = 55;


select * from ordem_servico;
*/
--
-- Extraindo dados da tabela `venda`
--
/*
INSERT INTO venda (COD_VENDA, TIPO_PAGAMENTO, PARCELAS, COD_OS, VALOR_TOTAL) VALUES
(7, 'cartao', 6, 54, '1023.32'),
(8, 'cartao', 4, 55, '35.34'),
(9, 'cartao', 1, 55, '35.34'),
(10, 'cartao', 1, 54, '1023.32');
*/

/*------------------------------------------ TABELA USUARIO  ----------------------------------*/
/*
CREATE TABLE IF NOT EXISTS usuario (
    ID_USUARIO INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sexo CHAR(1) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    permissao INT(1),
    PRIMARY KEY (ID_USUARIO)
);
--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO usuario (id_usuario, nome, sexo, data_nascimento, email, senha, permissao) VALUES
(1, 'Alexandre', 'M', '2019-03-03', 'ale@gmail.com', '375c0b2d473c97f207c16eadafee46c5', 1);*/

/*
-- 1. Mostre as Ordens de Serviço foram abertas e finalizadas no período de 01/01/2019 a 31/01/2019.
select * from ordem_servico 
where data_abertura between '2019-01-01' and '2019-01-31' 
and status = 'finalizado';

-- 2. Mostre a quantidade de Ordens de Serviço em Aberto.
select count(cod_os) from ordem_servico 
where status like 'orcamento' 
or status like 'aprovado';

-- 3. Faça uma visão que mostre Nome e Telefone do Cliente, Nome do Funcionário, Placa, Modelo e Ano do Veículo.
create or replace view OS as
	select c.nome as Cliente, c.Telefone, f.nome as Funcionario, v.Placa, v.Modelo, v.Ano from ordem_servico os
	inner join cliente c
    on os.cod_cliente = c.cod_cliente
    inner join funcionario f
    on os.cod_funcionario = f.cod_funcionario
    inner join veiculo v
    on os.cod_veiculo = v.cod_veiculo;
    
select * from os;

-- 4. Através de SELECT aninhados mostre os nomes dos clientes que possuem veículos do ano 2018.
select nome from cliente
where cod_cliente in (select cod_cliente from veiculo
					  where ano = 2018);

-- 5. Através de SELECT aninhados mostre as placas dos veículos que estão com OS abertas.
select placa from veiculo
where cod_veiculo in (select cod_veiculo from ordem_servico
					  where status like 'orcamento' 
					  or status like 'aprovado');

-- 6. Mostre o faturamento da Oficina no mês de março.
select sum(valor_total) from venda;

-- 7. Mostre o nome do funcionário que fez mais aberturas de OS.
select f.nome as Funcionario from ordem_servico os
inner join funcionario f
on os.cod_funcionario = f.cod_funcionario
where os.cod_funcionario = (select cod_funcionario from ordem_servico
						 group by cod_funcionario
						 order by count(cod_os) desc
						 limit 1);
group by f.nome;

select nome from funcionario
where cod_funcionario = (select cod_funcionario 
	from
		(select cod_funcionario, max(TOT_OS)
			from
				(select cod_funcionario, count(*) AS TOT_OS from ordem_servico group by cod_funcionario) as TT) as TT2);
                
-- 8. Mostre o nome do cliente que mais gastou na Oficina.
select c.nome from venda v
inner join ordem_servico os
on v.cod_os = os.cod_os
inner join cliente c
on c.cod_cliente = os.cod_cliente
group by c.cod_cliente
order by sum(v.valor_total) desc
limit 1;

select * from venda;

-- 9. Mostre quantos veículos distintos trocaram os pneus na Oficina.

 SELECT 
    COUNT(DISTINCT (PLACA)) AS 'QUANTIDADE DE VEICULOS QUE TROCARAM O PNEU'
FROM
    ORDEM_SERVICO,
    OS_ITEM,
    servico_produto,
    VEICULO
WHERE
    ORDEM_SERVICO.COD_OS = OS_ITEM.COD_OS
        AND ORDEM_SERVICO.COD_CLIENTE = VEICULO.COD_CLIENTE
        AND OS_ITEM.COD_ITEM = servico_produto.COD_SERVICO_PRODUTO
        AND servico_produto.DESCRICAO LIKE '%PNEU%';
       
-- 10. Mostre qual OS teve maior número de itens de serviço ou produtos na sua execução 
*/