-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 15-Jun-2019 às 17:13
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
  `COD_SERVICO_PRODUTO` int(6) NOT NULL,
  `COD_FUNCIONARIO` int(11) NOT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `COD_VEICULO` int(11) NOT NULL,
  `STATUS` enum('aberto','fechada') NOT NULL DEFAULT 'aberto',
  PRIMARY KEY (`COD_OS`),
  KEY `COD_FUNCIONARIO` (`COD_FUNCIONARIO`),
  KEY `COD_CLIENTE` (`COD_CLIENTE`),
  KEY `COD_VEICULO` (`COD_VEICULO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`COD_OS`, `DATA_ABERTURA`, `DATA_FECHAMENTO`, `COD_SERVICO_PRODUTO`, `COD_FUNCIONARIO`, `COD_CLIENTE`, `COD_VEICULO`, `STATUS`) VALUES
(1, '2019-06-12 20:13:24', NULL, 3, 1, 1, 5, 'aberto'),
(2, '2019-06-12 21:31:10', NULL, 10, 1, 1, 7, 'aberto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `COD_OS` int(11) NOT NULL,
  `COD_TIPO` int(11) DEFAULT NULL,
  `VALOR` decimal(8,2) DEFAULT '0.00',
  `STATUS` enum('pendente','pago') NOT NULL DEFAULT 'pendente',
  PRIMARY KEY (`COD_OS`),
  KEY `COD_TIPO` (`COD_TIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `servico_produto`
--

INSERT INTO `servico_produto` (`COD_SERVICO_PRODUTO`, `TIPO`, `DESCRICAO`, `PRECO`) VALUES
(1, '', 'asdds', '10.00'),
(2, 'p', 'asdds', '10.00'),
(3, 's', 'hbhj', '15247.00'),
(4, 's', 'hbhj', '15247.00'),
(5, 's', 'hbhj', '15247.00'),
(6, 's', 'hbhj', '15247.00'),
(7, 's', 'hbhj', '15247.00'),
(8, 's', 'OLA', '1.00'),
(9, 's', 'OLA', '1.00'),
(10, 'p', 'OLAaaa', '54.00'),
(11, 'p', 'zx', '0.00'),
(12, 's', 'zx', '0.00'),
(13, 'p', 'zx', '0.00'),
(14, 'p', 'zx', '0.00'),
(15, 'p', 'zx', '0.00'),
(16, 'p', 'zx', '0.00'),
(17, 'p', 'zx', '0.00'),
(18, 'p', 'zx', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE IF NOT EXISTS `tipo_pagamento` (
  `COD_TIPO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO_TIPO` varchar(30) NOT NULL,
  PRIMARY KEY (`COD_TIPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `COD_OS` int(6) NOT NULL,
  `COD_SERVICO_PRODUTO` int(6) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL DEFAULT '1',
  `VALOR` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`COD_VENDA`),
  KEY `COD_OS` (`COD_OS`),
  KEY `COD_SERVICO_PRODUTO` (`COD_SERVICO_PRODUTO`)
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
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`COD_OS`) REFERENCES `ordem_servico` (`COD_OS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`COD_TIPO`) REFERENCES `tipo_pagamento` (`COD_TIPO`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`COD_SERVICO_PRODUTO`) REFERENCES `servico_produto` (`COD_SERVICO_PRODUTO`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
