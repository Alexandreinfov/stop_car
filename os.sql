-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 20-Jun-2019 às 17:16
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
  `TOTAL_OS` double(8,2) NOT NULL,
  `STATUS` enum('orçamento','aprovado','finalizado','faturado') NOT NULL DEFAULT 'orçamento',
  PRIMARY KEY (`COD_OS`),
  KEY `COD_FUNCIONARIO` (`COD_FUNCIONARIO`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`),
  KEY `COD_VEICULO` (`COD_VEICULO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`COD_OS`, `DATA_ABERTURA`, `DATA_FECHAMENTO`, `COD_FUNCIONARIO`, `COD_CLIENTE`, `COD_VEICULO`, `TOTAL_OS`, `STATUS`) VALUES
(1, '2019-06-18 23:30:06', NULL, 2, 5, 29, 0.00, 'orçamento'),
(2, '2019-06-18 23:30:08', NULL, 2, 5, 29, 0.00, 'orçamento'),
(3, '2019-06-18 23:30:58', NULL, 2, 3, 28, 0.00, 'orçamento'),
(4, '2019-06-18 23:31:43', NULL, 2, 3, 29, 0.00, 'orçamento'),
(5, '2019-06-18 23:33:11', NULL, 2, 3, 28, 0.00, 'orçamento'),
(6, '2019-06-18 23:34:56', NULL, 2, 3, 28, 0.00, 'orçamento'),
(7, '2019-06-18 23:35:41', NULL, 2, 3, 28, 0.00, 'orçamento'),
(8, '2019-06-18 23:48:14', NULL, 2, 4, 28, 0.00, 'orçamento'),
(9, '2019-06-18 23:50:21', NULL, 2, 3, 28, 0.00, 'orçamento'),
(10, '2019-06-18 23:51:08', NULL, 2, 4, 28, 0.00, 'orçamento'),
(11, '2019-06-18 23:58:04', NULL, 0, 0, 0, 0.00, 'orçamento'),
(12, '2019-06-18 23:58:40', NULL, 0, 0, 0, 0.00, 'orçamento'),
(13, '2019-06-19 00:02:59', NULL, 0, 0, 0, 0.00, 'orçamento'),
(14, '2019-06-19 00:03:33', NULL, 0, 0, 0, 0.00, 'orçamento'),
(15, '2019-06-19 00:04:20', NULL, 0, 0, 0, 0.00, 'orçamento'),
(16, '2019-06-19 00:04:21', NULL, 0, 0, 0, 0.00, 'orçamento'),
(17, '2019-06-19 00:04:22', NULL, 0, 0, 0, 0.00, 'orçamento'),
(18, '2019-06-19 00:04:39', NULL, 0, 0, 0, 0.00, 'orçamento'),
(19, '2019-06-19 00:06:38', NULL, 0, 0, 0, 0.00, 'orçamento'),
(20, '2019-06-19 00:08:19', NULL, 0, 0, 0, 0.00, 'orçamento'),
(21, '2019-06-19 00:16:54', NULL, 0, 0, 0, 0.00, 'orçamento'),
(22, '2019-06-19 00:18:08', NULL, 0, 0, 0, 0.00, 'orçamento'),
(23, '2019-06-19 00:20:07', NULL, 0, 0, 0, 0.00, 'orçamento'),
(24, '2019-06-19 00:22:38', NULL, 0, 0, 0, 0.00, 'orçamento'),
(25, '2019-06-19 00:23:01', NULL, 0, 0, 0, 0.00, 'orçamento'),
(26, '2019-06-19 00:23:29', NULL, 0, 0, 0, 0.00, 'orçamento'),
(27, '2019-06-19 00:25:10', NULL, 0, 0, 0, 0.00, 'orçamento'),
(28, '2019-06-19 00:41:05', NULL, 2, 4, 28, 0.00, 'orçamento'),
(29, '2019-06-19 00:42:01', NULL, 2, 4, 29, 0.00, 'orçamento'),
(30, '2019-06-19 00:42:31', NULL, 2, 4, 28, 0.00, 'orçamento'),
(31, '2019-06-19 00:48:22', NULL, 0, 0, 0, 0.00, 'orçamento');

-- --------------------------------------------------------

--
-- Stand-in structure for view `os`
--
CREATE TABLE IF NOT EXISTS `os` (
`CODIGO` int(11)
,`DATA ABERTURA` datetime
,`DATA FECHAMENTO` datetime
,`FUNCIONARIO` varchar(50)
,`CLIENTE` varchar(50)
,`PLACA` varchar(7)
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
  `QTDE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COD_OS` (`COD_OS`),
  KEY `COD_ITEM` (`COD_ITEM`),
  KEY `COD_ITEM_2` (`COD_ITEM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `os_item`
--

INSERT INTO `os_item` (`ID`, `COD_OS`, `COD_ITEM`, `QTDE`) VALUES
(1, 0, 26, 0),
(2, 0, 0, NULL),
(3, 0, 26, 1),
(4, 0, 24, NULL),
(5, 0, 26, 2),
(6, 0, 24, NULL),
(7, 12, 0, 0),
(8, 12, 0, NULL),
(9, 0, 0, 0),
(10, 0, 0, NULL),
(11, 0, 0, 0),
(12, 0, 0, NULL),
(13, 0, 0, 0),
(14, 0, 0, NULL),
(15, 0, 0, 0),
(16, 0, 0, NULL),
(17, 0, 0, 0),
(18, 0, 0, NULL),
(19, 0, 0, 0),
(20, 0, 0, NULL),
(21, 0, 0, 0),
(22, 0, 0, NULL),
(23, 2525, 0, 0),
(24, 2525, 0, NULL),
(25, 26, 0, 0),
(26, 26, 0, NULL),
(27, 2710, 0, 0),
(28, 2710, 0, NULL),
(29, 10, 27, 2),
(30, 10, 25, NULL),
(31, 10, 26, 2),
(32, 10, 25, NULL),
(33, 0, 26, 3),
(34, 0, 24, NULL),
(35, 0, 0, 0),
(36, 0, 0, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`COD_TIPO`, `DESCRICAO_TIPO`, `PARCELAS`) VALUES
(6, 'CARTAO', 0),
(7, 'DINHEIRO', 0);

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
  `TIPO_PAGAMENTO` int(11) NOT NULL,
  `COD_OS` int(6) NOT NULL,
  `VALOR_TOTAL` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`COD_VENDA`),
  KEY `COD_OS` (`COD_OS`),
  KEY `TIPO_PAGAMENTO` (`TIPO_PAGAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `os`
--
DROP TABLE IF EXISTS `os`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `os` AS select `COD_OS` AS `CODIGO`,`DATA_ABERTURA` AS `DATA ABERTURA`,`DATA_FECHAMENTO` AS `DATA FECHAMENTO`,`f`.`NOME` AS `FUNCIONARIO`,`c`.`NOME` AS `CLIENTE`,`v`.`PLACA` AS `PLACA`,`STATUS` AS `STATUS` from (((`ordem_servico` `os` join `cliente` `c` on((`COD_CLIENTE` = `c`.`COD_CLIENTE`))) join `funcionario` `f` on((`COD_FUNCIONARIO` = `f`.`COD_FUNCIONARIO`))) join `veiculo` `v` on((`COD_VEICULO` = `v`.`COD_VEICULO`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
