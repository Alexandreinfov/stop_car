-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 29-Jun-2019 às 02:24
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `os`
--
CREATE DATABASE IF NOT EXISTS `os` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `os`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `COD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `CPF` varchar(50) NOT NULL,
  `ENDERECO` varchar(80) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  PRIMARY KEY (`COD_CLIENTE`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`COD_CLIENTE`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`) VALUES
(3, 'Andrea', '401.321.70-96', 'R. Wallace Landal', '(16)36415859'),
(4, 'Filipe', '369.321.70-50', '\nR. Antônio Matar ', '(21)3326585'),
(5, 'Jose', '101.341.10-10', 'R. dos Oitis', '(11)3335939'),
(6, 'Gabrila', '401.301.20-30', 'Rua Sergipe', '(16)3334587'),
(7, 'Vitor ferraz', '492.734.509-29', 'av jkl', '333456789'),
(8, 'Beluzo', '456789123', 'ifsp', '124563');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `COD_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `CPF` varchar(50) NOT NULL,
  `ENDERECO` varchar(50) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  `SALARIO` decimal(20,0) NOT NULL,
  PRIMARY KEY (`COD_FUNCIONARIO`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`COD_FUNCIONARIO`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`, `SALARIO`) VALUES
(2, 'Rogerio', '222.321.70-22', 'Rua Bahia', '(16)33336565', '2000'),
(3, 'Fabio', '333.123.20-33', 'Rua Bahia', '(16)33333333', '50000'),
(4, 'Paulo', '444.321.30-44', 'Rua Bahia', '(16)33346444', '10000'),
(5, 'Welton Souza Oliveira', '492.734.509-29', 'AV Sete de setembro', '33226286', '50000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE IF NOT EXISTS `ordem_servico` (
  `COD_OS` int(11) NOT NULL AUTO_INCREMENT,
  `DATA_ABERTURA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_FECHAMENTO` datetime DEFAULT NULL,
  `COD_FUNCIONARIO` int(11) NOT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `COD_VEICULO` int(11) NOT NULL,
  `STATUS` enum('Orçamento','Aprovado','Finalizado','Faturado') NOT NULL DEFAULT 'Orçamento',
  PRIMARY KEY (`COD_OS`),
  KEY `COD_FUNCIONARIO` (`COD_FUNCIONARIO`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`),
  KEY `COD_VEICULO` (`COD_VEICULO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`COD_OS`, `DATA_ABERTURA`, `DATA_FECHAMENTO`, `COD_FUNCIONARIO`, `COD_CLIENTE`, `COD_VEICULO`, `STATUS`) VALUES
(54, '2019-06-23 21:30:50', '2019-06-27 21:10:40', 2, 3, 28, 'Faturado'),
(55, '2019-06-23 21:30:59', NULL, 3, 4, 28, 'Orçamento'),
(56, '2019-06-23 21:31:08', NULL, 4, 5, 28, 'Orçamento'),
(57, '2019-06-24 00:59:28', NULL, 2, 6, 29, 'Orçamento'),
(58, '2019-06-24 01:01:00', NULL, 3, 3, 29, 'Orçamento'),
(59, '2019-06-24 01:01:04', '2019-06-27 21:10:44', 4, 4, 29, 'Finalizado'),
(60, '2019-06-24 01:01:06', NULL, 2, 5, 29, 'Orçamento'),
(61, '2019-06-27 23:55:06', '2019-06-27 23:55:34', 5, 5, 32, 'Faturado'),
(62, '2019-06-28 20:03:40', '2019-06-28 20:05:35', 2, 5, 32, 'Faturado');

--
-- Acionadores `ordem_servico`
--
DROP TRIGGER IF EXISTS `FECHA_DATA_OS`;
DELIMITER //
CREATE TRIGGER `FECHA_DATA_OS` BEFORE UPDATE ON `ordem_servico`
 FOR EACH ROW BEGIN
IF NEW.STATUS = 'finalizado' THEN
    SET NEW.DATA_FECHAMENTO = NOW() ;
END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `os`
--
CREATE TABLE IF NOT EXISTS `os` (
`CODIGO` int(11)
,`CLIENTE` varchar(50)
,`TELEFONE` varchar(20)
,`FUNCIONARIO` varchar(50)
,`PLACA` varchar(7)
,`MODELO` varchar(20)
,`MARCA` varchar(20)
,`ANO` year(4)
,`DATA ABERTURA` datetime
,`DATA FECHAMENTO` datetime
,`STATUS` enum('Orçamento','Aprovado','Finalizado','Faturado')
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `os_item`
--

CREATE TABLE IF NOT EXISTS `os_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COD_OS` int(11) NOT NULL,
  `COD_ITEM` int(11) DEFAULT NULL,
  `QTDE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `COD_OS` (`COD_OS`),
  KEY `COD_ITEM` (`COD_ITEM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `os_item`
--

INSERT INTO `os_item` (`ID`, `COD_OS`, `COD_ITEM`, `QTDE`) VALUES
(19, 54, 26, 3),
(20, 54, 25, 1),
(21, 55, 26, 3),
(22, 56, 24, 1),
(23, 57, 27, 10),
(24, 58, 24, 1),
(25, 59, 24, 1),
(26, 60, 24, 1),
(27, 61, 31, 20),
(28, 61, 30, 1),
(29, 62, 24, 1),
(30, 62, 27, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_produto`
--

CREATE TABLE IF NOT EXISTS `servico_produto` (
  `COD_SERVICO_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` enum('servico','produto') NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `PRECO` decimal(8,2) NOT NULL,
  PRIMARY KEY (`COD_SERVICO_PRODUTO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Extraindo dados da tabela `servico_produto`
--

INSERT INTO `servico_produto` (`COD_SERVICO_PRODUTO`, `TIPO`, `DESCRICAO`, `PRECO`) VALUES
(24, 'servico', 'PNEU', '120.78'),
(25, 'servico', 'RODA', '987.98'),
(26, 'produto', 'TROCA DE OLEO', '11.78'),
(27, 'produto', 'BALANCEAMENTO', '300.98'),
(30, 'servico', 'Retificar Motor', '5000.00'),
(31, 'produto', 'Velha', '150.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `permissao` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `sexo`, `data_nascimento`, `email`, `senha`, `permissao`) VALUES
(1, 'Alexandre', 'M', '2019-03-03', 'ale@gmail.com', '375c0b2d473c97f207c16eadafee46c5', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
  `COD_VEICULO` int(11) NOT NULL AUTO_INCREMENT,
  `PLACA` varchar(7) NOT NULL,
  `MODELO` varchar(20) NOT NULL,
  `MARCA` varchar(20) NOT NULL,
  `ANO` year(4) NOT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  PRIMARY KEY (`COD_VEICULO`,`PLACA`),
  UNIQUE KEY `PLACA` (`PLACA`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`COD_VEICULO`, `PLACA`, `MODELO`, `MARCA`, `ANO`, `COD_CLIENTE`) VALUES
(28, 'ABP0987', 'HILUX', 'TOYOTA', 2019, 3),
(29, 'ATT0101', 'TORO', 'FIAT', 2018, 6),
(32, 'BBP0987', 'FORD', 'FUSCA', 1950, 5),
(33, 'pwd - 1', 'Ford', 'Pampa GL', 1964, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `COD_VENDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_PAGAMENTO` varchar(50) NOT NULL,
  `PARCELAS` int(11) NOT NULL,
  `COD_OS` int(6) NOT NULL,
  `VALOR_TOTAL` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`COD_VENDA`),
  KEY `COD_OS` (`COD_OS`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`COD_VENDA`, `TIPO_PAGAMENTO`, `PARCELAS`, `COD_OS`, `VALOR_TOTAL`) VALUES
(1, 'boleto', 10, 61, '8000.00'),
(2, 'cartao', 4, 54, '1023.32'),
(3, 'cartao', 5, 62, '421.76');

--
-- Acionadores `venda`
--
DROP TRIGGER IF EXISTS `FECHAMENTO_OS`;
DELIMITER //
CREATE TRIGGER `FECHAMENTO_OS` AFTER INSERT ON `venda`
 FOR EACH ROW UPDATE ORDEM_SERVICO SET STATUS = 'FATURADO' WHERE COD_OS = new.COD_OS
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `os`
--
DROP TABLE IF EXISTS `os`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `os` AS select `COD_OS` AS `CODIGO`,`c`.`NOME` AS `CLIENTE`,`c`.`TELEFONE` AS `TELEFONE`,`f`.`NOME` AS `FUNCIONARIO`,`v`.`PLACA` AS `PLACA`,`v`.`MODELO` AS `MODELO`,`v`.`MARCA` AS `MARCA`,`v`.`ANO` AS `ANO`,`DATA_ABERTURA` AS `DATA ABERTURA`,`DATA_FECHAMENTO` AS `DATA FECHAMENTO`,`STATUS` AS `STATUS` from (((`ordem_servico` `os` join `funcionario` `f` on((`COD_FUNCIONARIO` = `f`.`COD_FUNCIONARIO`))) join `cliente` `c` on((`COD_CLIENTE` = `c`.`COD_CLIENTE`))) join `veiculo` `v` on((`COD_VEICULO` = `v`.`COD_VEICULO`)));

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD CONSTRAINT `ordem_servico_ibfk_1` FOREIGN KEY (`COD_FUNCIONARIO`) REFERENCES `funcionario` (`COD_FUNCIONARIO`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ordem_servico_ibfk_2` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ordem_servico_ibfk_3` FOREIGN KEY (`COD_VEICULO`) REFERENCES `veiculo` (`COD_VEICULO`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `os_item`
--
ALTER TABLE `os_item`
  ADD CONSTRAINT `os_item_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `os_item_ibfk_2` FOREIGN KEY (`COD_ITEM`) REFERENCES `servico_produto` (`COD_SERVICO_PRODUTO`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
