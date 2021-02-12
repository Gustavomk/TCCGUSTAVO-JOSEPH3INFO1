-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Fev-2021 às 13:21
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_tcc_gujo_20`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `qtd_cid_numa_uf` (`val` VARCHAR(30)) RETURNS INT(11) BEGIN
Declare CidQt Int(6);
select count(idCidade) into CidQt from cidade, uf where
uf.idUf = cidade.Uf_idUf and
 nome_uf = val;

RETURN CidQt;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `qtd_user_por_tipo` (`val` VARCHAR(30)) RETURNS INT(11) BEGIN
Declare UserQtd Int(6);
select count(id_Usuario) into UserQtd from usuario, tipo_usuario where
Usuario.id_Usuario = tipo_usuario.Usuario_id_Usuario and
 Descricao = val;

RETURN UserQtd;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros`
--

CREATE TABLE `bairros` (
  `idBairros` int(11) NOT NULL,
  `nome_bairros` varchar(45) NOT NULL,
  `Cidade_idCidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bairros`
--

INSERT INTO `bairros` (`idBairros`, `nome_bairros`, `Cidade_idCidade`) VALUES
(1, 'Itinga', 2),
(2, 'Glória', 2),
(3, 'Centro', 2),
(4, 'Aventureiro', 2),
(5, 'América', 2),
(6, 'Nova Brasília', 4),
(7, 'Rio Cerro', 4),
(8, 'Vila Nova', 4),
(9, 'João Pessoa', 4),
(10, 'Tifa Martins', 4),
(11, 'Atiradores', 2),
(12, 'Aventureiro', 2),
(13, 'Centro', 2),
(14, 'Glória', 2),
(15, 'Adhermar Garcia', 2),
(16, 'Centro', 3),
(17, 'Guamiranga', 3),
(18, 'Colégio Agrícola', 3),
(19, 'Itinga', 3),
(20, 'Porto Grande', 3),
(21, 'Centro', 5),
(22, 'Itinga I', 5),
(23, 'Itinga II', 5),
(24, 'Itajuba', 5),
(25, 'Itajubá', 5),
(26, 'Centro', 6),
(27, 'Balneario', 6),
(28, 'Cacupé', 6),
(29, 'Ingleses', 6),
(30, 'Barra da Lagoa', 6),
(31, 'Center', 7),
(32, 'Barra Norte', 7),
(33, 'Estaleirinho', 7),
(34, 'Praia dos Amores', 7),
(35, 'Taquaras', 7),
(36, 'Vila Rica', 8),
(37, 'Jardin América', 8),
(38, 'Jardin Europa', 8),
(39, 'Centro', 8),
(40, 'Bela Visto', 8),
(41, 'Cidade Nova', 9),
(42, 'Cabecudas', 9),
(43, 'Fazenda', 9),
(44, 'Itaipava', 9),
(45, 'Murta', 9),
(46, 'Gravatá', 10),
(47, 'Santa  Lídia', 10),
(48, 'São Cristovão', 10),
(49, 'Centro', 10),
(50, 'São Nicolau', 10),
(51, 'Centro', 11),
(52, 'Brasília', 11),
(53, 'Itapema', 11),
(54, 'Verdes Mares', 11),
(55, 'Figueira', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL,
  `nome_cidade` varchar(45) NOT NULL,
  `Uf_idUf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`idCidade`, `nome_cidade`, `Uf_idUf`) VALUES
(2, 'joinville', 30),
(3, 'Araquari', 30),
(4, 'Jaraguá do Sul', 30),
(5, 'Barra Velha', 30),
(6, 'Florianópolis', 30),
(7, 'Balneário Camburiú', 30),
(8, 'Chapecó', 30),
(9, 'Itajai', 30),
(10, 'Penha', 30),
(11, 'Itapoá', 30),
(12, 'São Paulo', 29),
(13, 'Guarulhos', 29),
(14, 'Sorocaba', 29),
(15, 'Osasco', 29),
(16, 'Campinas', 29),
(17, 'Ribeirão Preto', 29),
(18, 'Jundiaí', 29),
(19, 'Mauá', 29),
(20, 'Pindamonhangaba', 29),
(21, 'Socorro', 29),
(22, 'Porto Alegre', 32),
(23, 'Pelotas', 32),
(24, 'Caxias do Sul', 32),
(25, 'Canoas', 32),
(26, 'Santa Maria', 32),
(27, 'Gramado', 32),
(28, 'Alvorada', 32),
(29, 'Gravatai', 32),
(30, 'Erechim', 32),
(31, 'Guaíba', 32),
(32, 'Curitiba', 31),
(33, 'Londrina', 31),
(34, 'Maringá', 31),
(35, 'Ponta Grossa', 31),
(36, 'Cascavel', 31),
(37, 'Colombo', 31),
(38, 'Toledo', 31),
(39, 'Apucarana', 31),
(40, 'Sarandi', 31),
(41, 'Pato Branco', 31);

-- --------------------------------------------------------

--
-- Estrutura da tabela `onibus`
--

CREATE TABLE `onibus` (
  `NumOnibus` int(11) NOT NULL,
  `HorariosOnibus` varchar(45) NOT NULL,
  `Nome_Onibus` varchar(45) NOT NULL,
  `Tipo_Onibus` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `onibus`
--

INSERT INTO `onibus` (`NumOnibus`, `HorariosOnibus`, `Nome_Onibus`, `Tipo_Onibus`) VALUES
(0, '16:45-19:45', 'Panetone', '1'),
(1, '16:45-19:45', 'Panetone', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paradas`
--

CREATE TABLE `paradas` (
  `Cd_Paradas` int(11) NOT NULL,
  `Parada` varchar(100) NOT NULL,
  `percurso_idPercurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `paradas`
--

INSERT INTO `paradas` (`Cd_Paradas`, `Parada`, `percurso_idPercurso`) VALUES
(1, '-26.4821205,-49.0814032', 3),
(2, '-26.4885456,-49.0830045', 3),
(3, '-26.4940286,-49.0872078', 3),
(4, '-25.4623372,-49.5311985', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

CREATE TABLE `percurso` (
  `idPercurso` int(11) NOT NULL,
  `Cord_Inicio` varchar(100) NOT NULL,
  `onibus_NumOnibus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`idPercurso`, `Cord_Inicio`, `onibus_NumOnibus`) VALUES
(3, '-26.47926424615351,-49.08636458895767', 0),
(4, '-25.4619007,-49.5289857', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ruas`
--

CREATE TABLE `ruas` (
  `idRuas` int(11) NOT NULL,
  `nome_rua` varchar(45) NOT NULL,
  `Bairros_idBairros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idTipo_Usuario` int(11) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Usuario_id_Usuario` int(11) NOT NULL,
  `especialização_idespecialização` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idTipo_Usuario`, `Descricao`, `Usuario_id_Usuario`, `especialização_idespecialização`) VALUES
(1, 'Motorista', 10, 10),
(7, 'Motorista', 37, 37),
(9, 'Passageiro', 11, 11),
(10, 'Passageiro', 12, 12),
(11, 'Passageiro', 13, 13),
(12, 'Passageiro', 14, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE `uf` (
  `idUf` int(11) NOT NULL,
  `sigla_uf` varchar(45) NOT NULL,
  `nome_uf` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uf`
--

INSERT INTO `uf` (`idUf`, `sigla_uf`, `nome_uf`) VALUES
(29, 'SP', 'São Paulo'),
(30, 'SC', 'Santa Catarina'),
(31, 'PR', 'Parana'),
(32, 'RS', 'Rio Grande do Sul');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL,
  `nome_completo` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `CNH` varchar(45) DEFAULT NULL,
  `tipo_carteira` int(11) DEFAULT NULL,
  `data_nasc` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nome_completo`, `login`, `email`, `senha`, `sexo`, `telefone`, `CNH`, `tipo_carteira`, `data_nasc`) VALUES
(10, 'Picollo', 'picolo', 'Picolino.Freitas@email.com', 'aaa', 'Masculino', '99 9999-9999', NULL, NULL, '2002-02-02'),
(11, 'jubiscleusa de Fatima', 'jubiscleusa', 'jubiscleusa.Fatima@email.com', 'yubiwayumidesu', 'Feminino', '99 9999-9998', NULL, NULL, '2004-10-13'),
(12, 'Otto Silva', 'OttSil', 'Otto.Silva@email.com', 'otto51lv4', 'Masculino', '98 8888-8889', NULL, NULL, '2001-01-01'),
(13, 'Herdbert Bixards', 'HxHunter', 'Herbert.Bixards@email.com', 'Zépovin06123', 'Masculino', '12 3456-7890', NULL, NULL, '2006-03-23'),
(14, 'Pedro Rocha', 'proca101010', 'pedraolokao@email.com', '01010000 01010010 ', 'Masculino', '78 9042-3132', NULL, NULL, '2012-07-15'),
(37, 'Session', 'Session', 'Session@gmail.com', 'session', 'Outro', '00000-0000', NULL, NULL, '2020-10-21');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairros`
--
ALTER TABLE `bairros`
  ADD PRIMARY KEY (`idBairros`),
  ADD KEY `Cidade_idCidade` (`Cidade_idCidade`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idCidade`),
  ADD KEY `fk_Cidade_Uf_idx` (`Uf_idUf`);

--
-- Índices para tabela `onibus`
--
ALTER TABLE `onibus`
  ADD PRIMARY KEY (`NumOnibus`);

--
-- Índices para tabela `paradas`
--
ALTER TABLE `paradas`
  ADD PRIMARY KEY (`Cd_Paradas`),
  ADD KEY `percurso_idPercurso` (`percurso_idPercurso`);

--
-- Índices para tabela `percurso`
--
ALTER TABLE `percurso`
  ADD PRIMARY KEY (`idPercurso`),
  ADD KEY `onibus_NumOnibus` (`onibus_NumOnibus`);

--
-- Índices para tabela `ruas`
--
ALTER TABLE `ruas`
  ADD PRIMARY KEY (`idRuas`),
  ADD KEY `fk_Ruas_Bairros1_idx` (`Bairros_idBairros`);

--
-- Índices para tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idTipo_Usuario`),
  ADD KEY `fk_Tipo_Usuario_Usuario1_idx` (`Usuario_id_Usuario`);

--
-- Índices para tabela `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`idUf`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairros`
--
ALTER TABLE `bairros`
  MODIFY `idBairros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `paradas`
--
ALTER TABLE `paradas`
  MODIFY `Cd_Paradas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `percurso`
--
ALTER TABLE `percurso`
  MODIFY `idPercurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `ruas`
--
ALTER TABLE `ruas`
  MODIFY `idRuas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idTipo_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `uf`
--
ALTER TABLE `uf`
  MODIFY `idUf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairros`
--
ALTER TABLE `bairros`
  ADD CONSTRAINT `bairros_ibfk_1` FOREIGN KEY (`Cidade_idCidade`) REFERENCES `cidade` (`idCidade`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_Cidade_Uf` FOREIGN KEY (`Uf_idUf`) REFERENCES `uf` (`idUf`);

--
-- Limitadores para a tabela `paradas`
--
ALTER TABLE `paradas`
  ADD CONSTRAINT `paradas_ibfk_1` FOREIGN KEY (`percurso_idPercurso`) REFERENCES `percurso` (`idPercurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `percurso`
--
ALTER TABLE `percurso`
  ADD CONSTRAINT `percurso_ibfk_1` FOREIGN KEY (`onibus_NumOnibus`) REFERENCES `onibus` (`NumOnibus`);

--
-- Limitadores para a tabela `ruas`
--
ALTER TABLE `ruas`
  ADD CONSTRAINT `fk_Ruas_Bairros1` FOREIGN KEY (`Bairros_idBairros`) REFERENCES `bairros` (`idBairros`);

--
-- Limitadores para a tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD CONSTRAINT `fk_Tipo_Usuario_Usuario1` FOREIGN KEY (`Usuario_id_Usuario`) REFERENCES `usuario` (`id_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
