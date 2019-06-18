-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 18-Jun-2019 às 23:11
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
  `CPF` int(11) NOT NULL,
  `ENDERECO` varchar(80) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  PRIMARY KEY (`COD_CLIENTE`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`COD_CLIENTE`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`) VALUES
(1, 'Filipe', 2147483647, '465sd45df64sdf', '445212525'),
(2, 'adas', 548575, 'fgfdzg', '75741');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `COD_FUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `CPF` int(11) NOT NULL,
  `ENDERECO` varchar(50) NOT NULL,
  `TELEFONE` varchar(20) NOT NULL,
  `SALARIO` decimal(20,0) NOT NULL,
  PRIMARY KEY (`COD_FUNCIONARIO`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`COD_FUNCIONARIO`, `NOME`, `CPF`, `ENDERECO`, `TELEFONE`, `SALARIO`) VALUES
(1, 'asdre', 546, 'nkinj', '9926486165', '53436');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`COD_OS`, `DATA_ABERTURA`, `DATA_FECHAMENTO`, `COD_FUNCIONARIO`, `COD_CLIENTE`, `COD_VEICULO`, `STATUS`) VALUES
(4, '2019-06-17 19:30:32', NULL, 1, 1, 18, ''),
(5, '2019-06-17 19:30:41', NULL, 1, 1, 5, ''),
(6, '2019-06-17 20:35:52', NULL, 1, 2, 18, 'orçamento'),
(7, '2019-06-17 20:42:37', NULL, 1, 1, 5, 'orçamento'),
(8, '2019-06-17 20:42:41', NULL, 1, 1, 5, 'orçamento'),
(9, '2019-06-17 21:37:03', NULL, 1, 1, 19, 'orçamento'),
(10, '2019-06-17 21:37:06', NULL, 1, 1, 19, 'orçamento'),
(11, '2019-06-17 21:39:46', NULL, 1, 1, 7, 'orçamento'),
(15, '2019-06-17 21:46:26', NULL, 1, 1, 5, 'orçamento'),
(17, '2019-06-17 21:46:54', NULL, 1, 2, 18, 'orçamento'),
(18, '2019-06-17 21:56:56', NULL, 1, 1, 18, 'orçamento'),
(20, '2019-06-17 21:57:34', NULL, 1, 1, 18, 'orçamento'),
(21, '2019-06-17 22:01:46', NULL, 1, 1, 18, 'orçamento'),
(22, '2019-06-17 22:03:24', NULL, 1, 2, 17, 'orçamento'),
(23, '2019-06-17 22:04:34', NULL, 1, 1, 18, 'orçamento'),
(24, '2019-06-17 22:22:26', NULL, 1, 1, 7, 'orçamento'),
(26, '2019-06-17 22:23:16', NULL, 1, 1, 5, 'orçamento'),
(27, '2019-06-17 22:23:18', NULL, 1, 1, 5, 'orçamento'),
(28, '2019-06-17 22:24:04', NULL, 1, 1, 5, 'orçamento'),
(29, '2019-06-17 22:24:09', NULL, 1, 1, 5, 'orçamento'),
(30, '2019-06-17 22:24:09', NULL, 1, 1, 5, 'orçamento'),
(31, '2019-06-17 22:24:10', NULL, 1, 1, 5, 'orçamento'),
(32, '2019-06-17 22:25:16', NULL, 1, 1, 18, 'orçamento'),
(33, '2019-06-17 22:25:52', NULL, 1, 1, 7, 'orçamento'),
(34, '2019-06-17 22:27:58', NULL, 1, 1, 18, 'orçamento');

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
  KEY `COD_OS` (`COD_OS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Extraindo dados da tabela `servico_produto`
--

INSERT INTO `servico_produto` (`COD_SERVICO_PRODUTO`, `TIPO`, `DESCRICAO`, `PRECO`) VALUES
(19, 's', 'PNEU', '120.78'),
(20, 's', 'RODA', '987.98'),
(21, 'p', 'TROCA DE OLEO', '11.78'),
(22, 'p', 'BALANCEAMENTO', '300.98'),
(23, 'p', 'xfdg', '45.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE IF NOT EXISTS `tipo_pagamento` (
  `COD_TIPO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO_TIPO` varchar(30) NOT NULL,
  `PARCELAS` int(11) NOT NULL,
  PRIMARY KEY (`COD_TIPO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`COD_TIPO`, `DESCRICAO_TIPO`, `PARCELAS`) VALUES
(4, 'CARTAO', 0),
(5, 'DINHEIRO', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Extraindo dados da tabela `veiculo`
--

INSERT INTO `veiculo` (`COD_VEICULO`, `PLACA`, `MODELO`, `MARCA`, `ANO`, `COD_CLIENTE`) VALUES
(5, 'ale1506', 'ford', 'fusca', 1951, 1),
(7, 'ale758', 'ford', 'fusca', 1951, 1),
(17, 'as5844', 'ASD', 'SAD', 1968, 1),
(18, 'ABP0987', 'HILUX', 'TOYOTA', 2019, 1),
(19, 'ATT0101', 'TORO', 'FIAT', 2018, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `COD_VENDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_PAGAMENTO` int(11) NOT NULL,
  `COD_OS` int(6) NOT NULL,
  `COD_OS_ITEM` int(6) NOT NULL,
  `VALOR_TOTAL` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`COD_VENDA`),
  KEY `COD_OS` (`COD_OS`),
  KEY `COD_SERVICO_PRODUTO` (`COD_OS_ITEM`),
  KEY `TIPO_PAGAMENTO` (`TIPO_PAGAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  ADD CONSTRAINT `os_item_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`COD_OS_ITEM`) REFERENCES `servico_produto` (`COD_SERVICO_PRODUTO`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`TIPO_PAGAMENTO`) REFERENCES `tipo_pagamento` (`COD_TIPO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
