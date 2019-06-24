-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 24-Jun-2019 às 04:11
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`COD_CLIENTE`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`) VALUES
(3, 'Andrea', '401.321.70-96', 'R. Wallace Landal', '(16)36415859'),
(4, 'Filipe', '369.321.70-50', '\nR. Antônio Matar ', '(21)3326585'),
(5, 'Jose', '101.341.10-10', 'R. dos Oitis', '(11)3335939'),
(6, 'Gabrila', '401.301.20-30', 'Rua Sergipe', '(16)3334587');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`COD_FUNCIONARIO`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`, `SALARIO`) VALUES
(2, 'Rogerio', '333.321.70-33', 'Rua Bahia', '(16)33336565', '2000');

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
  `STATUS` enum('orçamento','aprovado','finalizado','faturado') NOT NULL DEFAULT 'orçamento',
  PRIMARY KEY (`COD_OS`),
  KEY `COD_FUNCIONARIO` (`COD_FUNCIONARIO`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`),
  KEY `COD_VEICULO` (`COD_VEICULO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`COD_OS`, `DATA_ABERTURA`, `DATA_FECHAMENTO`, `COD_FUNCIONARIO`, `COD_CLIENTE`, `COD_VEICULO`, `STATUS`) VALUES
(54, '2019-06-23 21:30:50', NULL, 2, 3, 28, 'orçamento'),
(55, '2019-06-23 21:30:59', NULL, 2, 4, 28, 'aprovado'),
(56, '2019-06-23 21:31:08', NULL, 2, 5, 28, 'finalizado'),
(57, '2019-06-24 00:59:28', NULL, 2, 3, 29, 'faturado'),
(58, '2019-06-24 01:01:00', NULL, 2, 3, 29, 'orçamento'),
(59, '2019-06-24 01:01:04', NULL, 2, 5, 29, 'orçamento'),
(60, '2019-06-24 01:01:06', NULL, 2, 3, 29, 'orçamento');

-- --------------------------------------------------------

--
-- Stand-in structure for view `os`
--
CREATE TABLE IF NOT EXISTS `os` (
`COD_OS` int(11)
,`NOME_CLIENTE` varchar(50)
,`TELEFONE` varchar(20)
,`NOME_FUNCIONARIO` varchar(50)
,`PLACA` varchar(7)
,`MODELO` varchar(20)
,`MARCA` varchar(20)
,`ANO` year(4)
,`DATA ABERTURA` datetime
,`DATA FECHAMENTO` datetime
,`STATUS` enum('orçamento','aprovado','finalizado','faturado')
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
  KEY `COD_ITEM` (`COD_ITEM`),
  KEY `COD_ITEM_2` (`COD_ITEM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

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
(26, 60, 24, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_produto`
--

CREATE TABLE IF NOT EXISTS `servico_produto` (
  `COD_SERVICO_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` enum('p','s') NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `PRECO` decimal(8,2) NOT NULL,
  PRIMARY KEY (`COD_SERVICO_PRODUTO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `servico_produto`
--

INSERT INTO `servico_produto` (`COD_SERVICO_PRODUTO`, `TIPO`, `DESCRICAO`, `PRECO`) VALUES
(24, 's', 'PNEU', '120.78'),
(25, 's', 'RODA', '987.98'),
(26, 'p', 'TROCA DE OLEO', '11.78'),
(27, 'p', 'BALANCEAMENTO', '300.98');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE IF NOT EXISTS `tipo_pagamento` (
  `COD_TIPO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO_TIPO` varchar(30) NOT NULL,
  `PARCELAS` int(11) NOT NULL,
  PRIMARY KEY (`COD_TIPO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`COD_TIPO`, `DESCRICAO_TIPO`, `PARCELAS`) VALUES
(6, 'CARTAO', 0),
(7, 'DINHEIRO', 0),
(8, '', 0);

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
  PRIMARY KEY (`COD_VEICULO`),
  UNIQUE KEY `PLACA` (`PLACA`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`COD_VEICULO`, `PLACA`, `MODELO`, `MARCA`, `ANO`, `COD_CLIENTE`) VALUES
(28, 'ABP0987', 'HILUX', 'TOYOTA', 2019, 3),
(29, 'ATT0101', 'TORO', 'FIAT', 2018, 6);

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
  KEY `COD_OS` (`COD_OS`),
  KEY `TIPO_PAGAMENTO` (`TIPO_PAGAMENTO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`COD_VENDA`, `TIPO_PAGAMENTO`, `PARCELAS`, `COD_OS`, `VALOR_TOTAL`) VALUES
(7, 'cartao', 6, 54, '1023.32'),
(8, 'cartao', 4, 55, '35.34');

--
-- Acionadores `venda`
--
DROP TRIGGER IF EXISTS `FECHAMENTO_OS`;
DELIMITER //
CREATE TRIGGER `FECHAMENTO_OS` AFTER UPDATE ON `venda`
 FOR EACH ROW UPDATE ORDEM_SERVICO SET STATUS = 'FATURADO' WHERE COD_OS
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `os`
--
DROP TABLE IF EXISTS `os`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `os` AS select `ordem_servico`.`COD_OS` AS `COD_OS`,`cliente`.`NOME` AS `NOME_CLIENTE`,`cliente`.`TELEFONE` AS `TELEFONE`,`funcionario`.`NOME` AS `NOME_FUNCIONARIO`,`veiculo`.`PLACA` AS `PLACA`,`veiculo`.`MODELO` AS `MODELO`,`veiculo`.`MARCA` AS `MARCA`,`veiculo`.`ANO` AS `ANO`,`ordem_servico`.`DATA_ABERTURA` AS `DATA ABERTURA`,`ordem_servico`.`DATA_FECHAMENTO` AS `DATA FECHAMENTO`,`ordem_servico`.`STATUS` AS `STATUS` from (((`ordem_servico` join `funcionario` on((`ordem_servico`.`COD_FUNCIONARIO` = `funcionario`.`COD_FUNCIONARIO`))) join `cliente` on((`ordem_servico`.`COD_CLIENTE` = `cliente`.`COD_CLIENTE`))) join `veiculo` on((`ordem_servico`.`COD_VEICULO` = `veiculo`.`COD_VEICULO`)));

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `os_item`
--
ALTER TABLE `os_item`
  ADD CONSTRAINT `os_item_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`),
  ADD CONSTRAINT `os_item_ibfk_2` FOREIGN KEY (`COD_ITEM`) REFERENCES `servico_produto` (`COD_SERVICO_PRODUTO`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
