
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
(55, 'Figueira', 11),
(56, 'Bucarein', 2),
(57, 'floresta', 2),
(58, 'Boehemerwald', 2),
(59, 'Saguaçu', 2),
(60, 'Volta Redonda', 3),
(61, 'Morro Grande', 42),
(62, 'Rocio Grande', 42),
(63, 'Água Branca', 42),
(64, 'Centro', 42),
(65, 'Parque Res. Cerro Azul', 3),
(66, 'Bucarein', 2),
(67, 'floresta', 2),
(68, 'Boehemerwald', 2),
(69, 'Saguaçu', 2),
(70, 'Volta Redonda', 3),
(71, 'Morro Grande', 42),
(72, 'Rocio Grande', 42),
(73, 'Água Branca', 42),
(74, 'Centro', 42),
(75, 'Parque Res. Cerro Azul', 3);

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
(41, 'Pato Branco', 31),
(42, 'São Francisco do Sul', 30);

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
(0, '04:45-08:00', '544-3 - ARAQUARI', '1'),
(1, '12:10-17:10', '544-2 - TREVO', '1'),
(2, '06:00-21:00', '544-5 - SÃO FRANCISCO DO SUL', '1'),
(3, '11:20-18:20', '544-1 - PORTO GRANDE', '1');

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
(5, '-26.3018889,-48.8417233', 5),
(6, '-26.3109111,-48.8455687', 5),
(7, '-26.3299619,-48.8466223', 5),
(8, '-26.3547138,-48.8465801', 5),
(9, '-26.374477,-48.832219', 5),
(10, '-26.4183727,-48.7795074', 5),
(11, '-26.3771836,-48.7194306', 5),
(12, '-26.3760559,-48.7196721', 5),
(13, '-26.3720973,-48.7231166', 5),
(14, '-26.3696777,-48.7209301', 5),
(15, '-26.3692109,-48.7189904', 5),
(16, '-26.3711527,-48.7130368', 5),
(17, '-26.2986086,-48.6411654', 5),
(19, '-26.2707699,-48.6408368', 5),
(20, '-26.2677386,-48.6414572', 5),
(21, '-26.253193,-48.6425199', 5),
(22, '-26.251151,-48.6380713', 5),
(23, '-26.249266,-48.6352327', 5),
(24, '-26.2468231,-48.6338569', 6),
(25, '-26.2501271,-48.6313484', 6),
(26, '-26.2483799,-48.6378458', 6),
(27, '-26.3698205,-48.7163119', 6),
(28, '-26.3744469,-48.7202827', 6),
(29, '-26.3775128,-48.7197527', 6),
(30, '-26.374477,-48.832219', 6),
(31, '-26.3547138,-48.8465801', 6),
(32, '-26.3154502,-48.8426427', 6),
(33, '-26.3016338,-48.846875', 6),
(34, '-26.3007174,-48.8417323', 6),
(35, '-26.3005174,-48.8423281', 6),
(37, '-26.3018889,-48.8417233', 7),
(38, '-26.3109111,-48.8455687', 7),
(39, '-26.3299619,-48.8466223', 7),
(40, '-26.3547138,-48.8465801', 7),
(41, '-26.374477,-48.832219', 7),
(42, '-26.416255,-48.755186', 7),
(43, '-26.419761,-48.754063', 7),
(44, '-26.394547,-48.738591', 7),
(47, '-26.374477,-48.832219', 8),
(48, '-26.3547138,-48.8465801', 8),
(49, '-26.3154502,-48.8426427', 8),
(50, '-26.3016338,-48.846875', 8),
(51, '-26.3007174,-48.8417323', 8),
(52, '-26.3005174,-48.8423281', 8),
(53, '-26.3018889,-48.8417233', 3),
(54, '-26.3109111,-48.8455687', 3),
(55, '-26.3299619,-48.8466223', 3),
(56, '-26.3547138,-48.8465801', 3),
(57, '-26.374477,-48.832219', 3),
(58, '-26.398021,-48.797519', 3),
(59, '-26.400846,-48.799719', 3),
(60, '-26.406660,-48.801678', 3),
(61, '-26.410890,-48.807761', 3),
(62, '-26.404760,-48.792466', 3),
(63, '-26.406507,-48.793278', 3),
(64, '-26.420170,-48.790953', 3),
(65, '-26.420760,-48.787371', 3),
(66, '-26.406507,-48.793278', 4),
(67, '-26.404760,-48.792466', 4),
(68, '-26.411309,-48.807869', 4),
(69, '-26.406660,-48.801678', 4),
(70, '-26.400846,-48.799719', 4),
(71, '-26.398021,-48.797519', 4),
(72, '-26.374477,-48.832219', 4),
(73, '-26.3547138,-48.8465801', 4),
(74, '-26.3154502,-48.8426427', 4),
(75, '-26.3016338,-48.846875', 4),
(76, '-26.3007174,-48.8417323', 4),
(77, '-26.3005174,-48.8423281', 4),
(78, '-26.3018889,-48.8417233', 1),
(79, '-26.3109111,-48.8455687', 1),
(80, '-26.3299619,-48.8466223', 1),
(81, '-26.3547138,-48.8465801', 1),
(82, '-26.374477,-48.832219', 1),
(83, '-26.4183727,-48.7795074', 1),
(84, '-26.3771836,-48.7194306', 1),
(85, '-26.3760559,-48.7196721', 1),
(86, '-26.3720973,-48.7231166', 1),
(87, '-26.3696777,-48.7209301', 1),
(88, '-26.3692109,-48.7189904', 1),
(89, '-26.3698205,-48.7163119', 1),
(90, '-26.3744469,-48.7202827', 2),
(91, '-26.3775128,-48.7197527', 2),
(92, '-26.374477,-48.832219', 2),
(93, '-26.3547138,-48.8465801', 2),
(94, '-26.3154502,-48.8426427', 2),
(95, '-26.3016338,-48.846875', 2),
(96, '-26.3007174,-48.8417323', 2),
(97, '-26.3005174,-48.8423281', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

CREATE TABLE `percurso` (
  `idPercurso` int(11) NOT NULL,
  `Cord_Inicio` varchar(100) NOT NULL,
  `onibus_NumOnibus` int(11) NOT NULL,
  `nome_percurso` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`idPercurso`, `Cord_Inicio`, `onibus_NumOnibus`, `nome_percurso`) VALUES
(1, '-26.3005174,-48.8423281', 0, 'Araquari (Ida)'),
(2, '-26.3698205,-48.7163119', 0, 'Araquari (Volta)'),
(3, '-26.3005174,-48.8423281', 1, 'Trevo (Ida)'),
(4, '-26.420760, -48.787371', 1, 'Trevo (Volta)'),
(5, '-26.3005174,-48.8423281', 2, 'São Francisco do Sul (Ida)'),
(6, '-26.249266,-48.6352327', 2, 'São Francisco do Sul (Volta)'),
(7, '-26.3005174,-48.8423281', 3, 'Porto Grande (Ida)'),
(8, '-26.394547,-48.738591', 3, 'Porto Grande (Volta)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ruas`
--

CREATE TABLE `ruas` (
  `idRuas` int(11) NOT NULL,
  `nome_rua` varchar(45) NOT NULL,
  `Bairros_idBairros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ruas`
--

INSERT INTO `ruas` (`idRuas`, `nome_rua`, `Bairros_idBairros`) VALUES
(1, 'Av. Dr. Paulo Medeiros', 3),
(2, 'R.Min Cológeras', 3),
(3, 'Av Getúlio Vargas(Joinville)', 56),
(4, 'R. Santa Catarina', 57),
(5, 'R. Waldemiro José Borges', 58),
(6, 'Av. Placidio Hugo de Oliveira', 1),
(7, 'SC 418', 1),
(8, 'SC 301', 1),
(9, 'BR 280', 20),
(10, 'R. João Z. Corrêa', 16),
(11, 'R. Cel. Almeida', 16),
(12, 'Av. Nereu Ramos', 16),
(13, 'R. Pref. Higino Águiar', 16),
(14, 'Av Getúlio Vargas(Araquari)', 16),
(15, 'R. Bento C. Francisco', 16),
(16, 'R. Augusto Schmidt', 57),
(17, 'R. São Paulo', 57),
(18, 'Av. Juscelino Kubitscheck', 3),
(19, 'R. Nove de Março', 3),
(20, 'Av. Hermann August Lepper', 59),
(21, 'Rua Pincesa Isabel', 3),
(22, 'Av. Albano Schulz', 3),
(23, 'Av. Cel. Procópio Gomes', 3),
(24, 'R. Pacifico Pereira', 23),
(25, 'R. Olaria', 23),
(26, 'R. Rio Tocantins', 23),
(27, 'R. Santa Môica', 23),
(28, 'R. Santa Fé', 23),
(29, 'Rua Santa Felicidade', 23),
(30, 'R. São José', 23),
(31, 'R. São Vicente', 23),
(32, 'R. São João', 23),
(33, 'R. Nerildo Lickfett', 23),
(34, 'R. São Benedito', 23),
(35, 'R. Itália', 23),
(36, 'R. São Francisco', 3),
(37, 'R. João Martinho Corrêa', 60),
(38, 'Rod. Olívio Nóbrega', 61),
(39, 'Av. Dr. Nereu Ramos(São Francisco do Sul)', 62),
(40, 'Alameda Ipiranga', 62),
(41, 'São José do Acaraí', 62),
(42, 'R. Dom Fernando Trejo y Sanabria', 62),
(43, 'R. Barão do Rio Branco', 64),
(44, 'R. Augusto Afonso dos Santos', 64),
(45, 'R. Marcílio Dias', 64),
(46, 'R. Cel. Carvalho', 64),
(47, 'R. Dr. Adolfo Bezerra de Menezes', 65),
(48, 'R. Amador Coelho', 65),
(49, 'Estr. Geral Porto Grande', 65);

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
(7, 'Passageiro', 37, 37),
(9, 'Passageiro', 11, 11),
(10, 'Passageiro', 12, 12),
(11, 'Passageiro', 13, 13),
(12, 'Passageiro', 14, 14),
(18, 'Motorista', 44, 44),
(28, 'Motorista', 54, 54),
(33, 'Cobrador', 61, 61),
(35, 'Deficiente', 63, 63);

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
  `CNH_Motorista` varchar(11) NOT NULL,
  `tipo_carteira` varchar(1) NOT NULL,
  `data_nasc` varchar(10) NOT NULL,
  `imagem` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nome_completo`, `login`, `email`, `senha`, `sexo`, `telefone`, `CNH_Motorista`, `tipo_carteira`, `data_nasc`, `imagem`) VALUES
(10, 'Picollo', 'Picollo', 'Picolino.Freitas@email.com', 'aaa', 'Masculino', '99 9999-9999', '22222222222', 'B', '2002-02-02', 0x4172726179),
(11, 'jubiscleusa de Fatima', 'jubiscleusa', 'jubiscleusa.Fatima@email.com', 'yubiwayumidesu', 'Feminino', '99 9999-9998', '0', '', '2004-10-13', ''),
(12, 'Otto Silva', 'OttSil', 'Otto.Silva@email.com', 'otto51lv4', 'Masculino', '98 8888-8889', '0', '', '2001-01-01', ''),
(13, 'Herdbert Bixards', 'HxHunter', 'Herbert.Bixards@email.com', 'Zépovin06123', 'Masculino', '12 3456-7890', '0', '', '2006-03-23', ''),
(14, 'Pedro Rocha', 'proca101010', 'pedraolokao@email.com', '01010000 01010010 ', 'Masculino', '78 9042-3132', '0', '', '2012-07-15', ''),
(37, 'Session', 'Session', 'Session@gmail.com', 'session', 'Outro', '00000-0000', '0', '', '2020-10-21', ''),
(44, 'Joseph Henrique', 'de Lara Barreto', 'josephhgodin@gmail.com', 'senha', 'Masculino', '(99) 99999-9999', '22222222222', 'B', '2021-02-18', 0x4172726179),
(54, 'gustavo', 'gordo', 'gusgordo@gmail.com', 'freefire', 'Feminino', '(69) 96969-6969', '69696969696', 'B', '2021-02-28', 0xffd8ffe000104a46494600010100000100010000ffdb0084000906071413121414131415151517181a1716181718181818181c1717171815151d17181c2820181a251c1c1824312125292b2e2e2e1c203338332c37282d2e2b010a0a0a0e0d0e1a10101b2d241f242c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2cffc000110800b4011903012200021101031101ffc4001c0000010501010100000000000000000000040002030506010708ffc400441000010204030505060208040603000000010211000321310412410551617181062291a1b1133242c1d1f052e107141516236272923382b2f14353a2a3c2d2244454ffc400190100030101010000000000000000000000000102030405ffc400291100020201030401040203000000000000000102110312213104134151322242719114610581a1ffda000c03010002110311003f00b7684d0e684d1e99c431a13439a1340031a38d0f68e340218d1c6891a38d0c08da384448d0d680631a38d0f68e340031a390f684d0c063471a1ed1c6800634287342686218d1c687b4268008da1343da38d000c684d0f684d0011b42687b4268008da13448d1c68006342687b4268006342687b42686031a1343da1340031a1343da134005b3471a1f0a3218ccb1c689238d05811911c6895a39961d8113471a24cb1ccb0011b47088942626181986d2d7fda7e909c92e429b0368e1116b2b6162156967a903d4c108ecc4f37094f33f478879b1afb915a25e8a1cb0b2c6911d9399aad03c4fca10ecaa896f680f249fad223f958bd95d99fa334530d68d3abb30c5bda126d44fe712feeaa4302b5b9dc07e6d13fccc5eff00e32bb13326d1c68d8ceec922c998a7e2c471a5233db6f669c3556a490775ff00b62a3d5627e7f627827e8ae684d1c95352af7483ca2468e84d3dd19355c8c684d0e684d0c431a1344812f06cad8f3941c20b1b3b07f13132c918fc9d0d464f84573471a0e9db3a626e83d2be90329045c3738719c65c3b0716b94459613448d09a2ac4479638d12e585960b022684d12e58596011134268972c732c0046d09a24684d00166d1c680d5da2c0a43ab1483c11def3b437f7eb6722ceb3c5cf90a78c714ba982e373a161930f4a09b07e504cad9b315f091ce9150afd23c9ca4a404a74d3ca0199fa484905954d1adf9c612eae5f6a355817966ce46c27233cc03800e7ce0cfd87252ce54a3c5400f211e6ffbe8a3de0b49d482a63d1818813db72eca71fe671e31cf2ea32bf26ab141783d3ff53c3a6e91e24fce2592ac3821928f01f311e627b582e5b9e73e82225768c9341afe25464e737cb7fb2d463e8f5f56d2480c29cbf21122718822a4b794795caed0b33e5f15003e71cc6f6bc252c95316672a537a8111bb1ec7ae48c7cb2031f943e663d02fea3eb1e33b33b4e544933052bbc96f1f588e6f6d99dc851ff2f9efe914a5216947b57eba967fbf281a463d002abca3cab64f6b4972a580371a712c0560d9fdad9614128651356a75d75e312e721a8a37ff00b5066b803422be2f041da3a6a6c4b57c23cde6edb4a94109ca4d8ee0770d62cb13da24cb965c82680100973b837d8888cdf0538a3493f6ca52f50c2a6b5096f576a4795f6c76f19ab528ab90f40d78eedeed3a0cb59400f3080a20b939052dcfd63ce7686d15294f16a2e4ca4d4559688da652a74a883bc50c5ee1fb5b319941078b1f9462706852ea07573166996dba958de33963da2c971593768d84aed2ac8f752fd7eb122b6f288f7424f8fac6670eb2044932cf0de7cb5f22561c77c16d37689352498b0d93dac9b2d407b42522e95547e5d23249512ff38026cf5056b1cee366f7b1efbb3b6aa27f7c28b6eeef507ab794418ac6a52b2c451a86a0bd84794766bb4865aca544e523460c47df9413b436f12b0a2a20368c6a6a0d868d4785a199368f5412a4af2ba000ab35083aa490ce3f2862b624b365149dd43f7e3184d9fda87094a5ce56bfbcad6af4022e13da9ef77d2525ac0857983431a47365870d9938425e0b4c46c8526c41f2fcbce059b845a6e9238b53c605fdeacc9aefa0dc041584ed4000853b70bdb58e88f5f917c9599be962f8d889a16589e5eda9331a8927cc732209c92541c1293ce9e7f58e88ff0090c6fe49a32974b25c6e57b42682572468a07efc21ab9045c7df38ea86684fe2cc658e51e51034268932c2cb1ad99983db9804ad7ed264aca5474a1b6aa17347722b14588d82aafb35a4b07215435d1c53c5a366b9440512964ee704b2998f7868e294dd58abd9b2b328a4b59d9d82b4cafc6ac0b478ce2f51da9d231b3b03351554b536f01c5357168184de263632b139565209ad45cf43d5bf38e6d39327394a920bd01200503bdc06343e511ab6dcbd463d33624cf1693b66caab3834b17b9dc621c46c800b256f63de4b1ea013c60524c7680d335ac4831d978850b13e260b3b1961214c1419fbaa49d1ec58c433306a1f0a83871dd55b7eb03631c9c6ccfc6af1864dc428fc47c60776358e66810c991354d425b9c24a95bfc4fe710bc701ac311672a62d297cedc331f9189113d6f9b355b7efe103cb4029ae57e309080773f28c9b29209958e980bdfc0de24c6e3e62c00a3e1cf840e255238127589b28131f89340377df28af52c982f1e9d7c60278e8870448d07665771c588df17f8bc18f85beef143d8f9ddf52589762183b33b9f48d162e60f7925f7b58fe71cf92553a3a712fa6c1a54970ed6a11f38ec90194e37fa69c23b2266671f6c756858894ce68da9dd140770b867493402f5f38caedac41ce520d07ce34f8c9cc8606ff006d18ec655679fca1e35bd9195ed4498024ad2e79c5c098e9d7af48076761daa5a0a9d353be094b7d8cd224429418a6feb0362316b4a8b2943a9f944671f94bb8eb024c9f98bbc38a64b2cced65e44a7f0dbeda2595b62606adb89114e95136ac108c3cc57b92d6afe94295e822b4dec165aa36e905dbeb040ed32b711c41f93c57e1bb358c5b6591303fe2193fd6d17384fd1fe255efae5cb1ccacf800079c52c127e097912f2409ed491475756fac128ed9cd2a4a509528d993427a0ac5d60ff47b213fe22e64ce01909f2af9c693676c9932034996946f2054f351a9ea6368f46df2672ea2b829b64ab1ebacc12e52372815ccf0043753d22f721de7cbe90434268eec7050548e6949c9db32985c229692a502e090901fbd96f402d56704454cfc392a526c4b153125343dd0522c01f9c5fe3307ecca94962124909242925ec18b3e8e6b00627093a4aaac994e0ad606700104824015009673ba3cfd26f6524c96a0d294c0a56f9c06cc694cc454b3d3910f03cf0a39c9398fc59f4dc5dbccb45f9c2cb980250b0321d14495b01de4a39d8fe6d4c546512a54bce0b163b81aa660068e39bc438fe8a4c1e76c89b29017310a0956548533836abdd3717bc1d86959d066252104300c43b24a4134d1aaf126d9c66797930e4a6565efca041482135565f84702d57222bf64ed02947b21953ed12d9aa681d550c5f40346eb0ea29d20dc93694b48534a24b8ef0206607e23427baed57df134b480849676195eb529dc43fd88ac924157bd770a35e2083943dbca2c15b6cae5842d08391472900a490cc428eee37a44349ee32ebb3f3904152be1aef07404b0a54277d63592f65e1a72429587945f7cb4bf8b462361c8ef8647b40b57ba14051440cc7fa6af6ada3d036564968c816484015340c45002c0111d5838a6673e4117d98c1fff009a4ff60fa40cbec8608fff005d1d330f431a25261b963a34c7d116fd99f4764b062d8747fd47d4c4a3b3585ff912fc22eb2c732c1a63e90b54bd99fc6ec3c221254a9086a02cfa90343c630db76549415a908225014ef1cc783396ab08f4dda5834ad24a9d8020b71b9620827a479ded9eceae6ca28400085d18e605bf16b666e6291cd9e09b49235c727ecf3ec4624a89d01d2fe7ac472e52945920a8ee158d8abb188974993dd6cea4a42401476a9249b6967dd1dc1e152805084e507de51d58d95d0d9b58c25251d8d6eca1c1ecc5851428e5cc836e0a4d0f0768d36cb92992909529d4ceea60395cf9c536d221331193714f3abd3ca089124acb9d1a39b35cb97b1d581a5f92c254d409c741a7222de305e28355e90049c03afcc728b09e821245dbd21459a34ccbed2c7289ca0f1fa7ce288a8bbd5e2ca7c92175b1248e4e62d152d1325a5d20a86acc7c6f1d09a89ced3910f67a7198ac995d4015506890ef1b43b5c89495e5943bd954c94ba98024b1b11c29de1195ecc484231209247716d514eefd1e231882d949b1e8e2863397cad171e2a47a7ec4da32a706ca84ccd52c2a3f10de3869e66dc4b1b84791e0b12b4ff15058ca292ffd458747d3898f57d918e4cf9289a9f88546e228a4f42f1e874f9b5aa97270e7c5a5dae09f2c268972c2cb1d3673d11342cb12e584d058e889a13448d0b2c161446d1c68972c2cb05851e7dd9e2ac425490a00a12592a37cfa86a38207e5116d1d92b4a01cf994f950804a945b7d1806d341ba31db0f13352a252a504fc55a1dc1ac7ac68715b7262901192596208504b102940536768f32d254ce96995ebf692d61c9494d0de80583a4bf4820cef680e5cd3120e525214e1d8392070e674b43f09b4a51acd495107b812c41a9241cc1869bc9e8d16db0b6a494cb29534a9a12aca5982ae594b4f78d18007740a29bdd81518dc39952b3839d1342bbc47bb9412ce431cdc2b4de620c2c9fe1ad2a4a02a566f7bbab59530425c0fe67ad803ce2df6bce4a70bec50d3252c8524e5caa4a839282c3bc9a9622d5158cce1d64cf492bca0659957a94a12c43dec3845ba5b2046970db330ee9948980acd0ad6e04c51d00c8a21399c3d1c31111edad8670f3139c1c8afc29a92f6a3e8d5e10114098aee2d89579ddc0b5f478f56d833bdbe1d0b5a4b94e52543dfcb7536809731515a96e26e8f3cc24b9c896664b499619391ae4a8d6b94162e7c1ab1a4ec7e2904645a5614a398e7480952cb9701c934601c0b18d1cdd982a52a524b3339293b8149f934554ad879e727109742eb98b28391dd042697ad7f28b5169ec4dd9a2684d1d9aa604c55e176d4b212147bcec5ac0d6a4ee8d5cd2268b368a9dab266ad5952a2949152000c482ce751a758b2918a42e8935dc4110f9f2c9496bfaf081bb41c190966782a08eea07769602e087a6a785603c5ed05cb5205028e75129203824e5a07b54bb1f9c5fac2a74b29424caae5550686a380beee750f9dc7604a67a52495dcb30ef3072dd58758e69b71e0d153e4ac0875952d5fd4c412e58bd6e3c7414706054e14cd5cc423be028b306b9a1d3c3c635f85d8e33833731028519aaed7194837d39f08886cf4e17119e5a7bb34fb298e688528bc95241ad6610925cfbc2cd54b0f163d5e8c1768309ecf2d3bc85d482f4a6b7bb5e2694596401cce91ded0ce2b54dcf973e7caac9ee160cfcf3d5c6e8824e23bc096631cd96275e065b48c40a06ebac1136a9e9155266ff001183b70e3172708a48a83d78c629a474d366336a0e1572075bfa7ac325620253de3c22df6ce04905925f86f8ca6209762188a36ede39c74c2a48e6c9f4b2c309896524eb63d411f387e30b4c094d94cdab3d08e35781e561541095b862a000d6f7e56f182e4292a3a38d757d0c374676586cd0a12f10851621881a299cd3c046c7f4538dcc8c44a77caa4ac700b041f34c61462ac2a4efd3737ac6cbf4552489f89203254896dcdd54f58d306d3b232bb89e8b9616587b4268edd47250ccb0b2c3da38d06a1d0ccb0b2c3da38d0b5050c684d0f68e341a828f9f2502450b0e27cb8c3913c077726cc2d4f58970b822a556a86d61f330812f95c39a0a100f576a4705ae0e8065ce7f85a094e2092c55c8eef0a457fb15d5c16dfa43b0e6f53d35eb0da40587b73ef52940773eb02a57df0541c2433701a7086e7a82dc84251bb0b13cdcb425b007eccc600b0486ef034f85b83574a8dd1e9b86edd48f66f9482ec94015a6aa2cc973a078f1e24f231612ac1831201bb694e506b71e0547ad603b632160fb51ec880e1ce6079102fd205da7dba96292415176ccaa01c5ae7ca3cd71130240157dc2af12c85be96ad7526fc213cb3a0d28d4623b45889a9652d937eed1f9c569c7949aa8da039d38d8166bfdee81b2a945f75be51926deed95f83d3bb253ccc4e70a007ba41b921e95e60f58b5db5b5d1864665d49f7522eadfd2319fa32c6ab3cf4172960a059c020b10fbc8f4e1157da5da0a9f3b3add395d294b2865492e09717a876dd1d12c8e30db922ad9e81d9bc74a9d2899619890a059dcb9d2e0d58f082c60b28395816395c0a537ee7d23cd3b29b5c489c14a3dc3dc5317bd983500bdf7c697b53da39b2e62a4cb6480ce4557548343617e7ca1c32fd37216934b8292a4bb86a78f177e7e30076b262bf579894a14732163353bac9252abd194c5cb35f48c123694d62acea1604e6539624804eb6f282b0fda859cc89dfc596b494e526db9409a937b9f487de5c31e92bb61ecff6b39099b55290261a7bded492f5b0a9f1114188c24c918854858232a8804ea9a9491bc1158def62302a99227299963d9cb94a51f755265e50a06a43127a53840db5b611595e25659491517cbfc3ca87b96f6805772d5ba33cad289ae2f901e00a50a0b0066cbdc714040bd758581ed184932b1a17ed16a396683dc29360df6d14c9ed10ca65aa58531df63678627b42549285c9953123ddce9cd95b76a3c638d637bea4764b22fb59b0c4265252c26a6a1f8fe71e7fb470e85e226ac1265e6395eeaf0d1de122a5cd758827ad5dde9d235c50d2f631c93d482e538069576fcfd202f602c0dfbdcebe906a66120db9137357f94459180d54c6ad6ad87de91a7064325bb8eaf1ea5fa31c2293875cd57fc45f77fa51407c73479c6c9c1899365a0ab2a54a00ab70dedad098f45fdf19529225489472a004a1cb06019daff58d31c92dd913f46c662c24392c221c26311303a14f7e0694343189c776b0ce404e5caa05e8aa1ad0337cef10c9ed2a9086619998126f52554d4c37d4a52a2341e86f1dcd187d9ddb2291fc40574150475ff682d7db306a8974dea557c045f7e156c5a59ab851e7933b4f394149ced9ac40623781ba20c376831000409a785013e24466bab8bf0c7a0f469d34252544b001cc653f7b8ef95ff73e9143b436dce5a1614b2a0aa29346bee16e919ffd713c7c0c12cedfc46a2904ab62280644da5fbc93f28e9d92aa10b19b5dc4b1b0cb4ab79c5fe530e293c2387b9334a46746ce5a9473b148b330abd3c9e039fb0964ba180fe62e7c846bc24d9a1a65ee4f9c52cd25c50b498e99b026834a8beee903fea4b58514a49ef69be369350a62022e0b54401b3252e502172d64953ba58866037f08b59a5a7fb0a3333301387c143bb4890492909eea9c7f296d7568d709e350a4f34a879b47062a59ff00889f11f389efcbd0a8c5ae4ad7f011e5c7e7124d9a9ee866615f162e386f78d9b20fc483fdbf58e0d9e86ff0c577248f483bfed06928c14843a99bd6075e24b6e161c62fb11b2dfdd0134d4123c1c453cfd88b247f111bb54ea6ddea50b438648f91ee1bd97ed11c395cb6cc260b85105245d41c119b9f0dd00e3f1155325595c90a53125daa4b0730fc3ec62834039b9ebbe0afd9f993948290d4ba98ef6610e7913a268cf2a551d4433d87df9c5a9985d81674fd88255d9f70cfd729a7478e4ed8130d9acc2e2a041dd83f23a6053716bb3b8b8af2d6055cd63be0c9db0a702084d85581bf8521d27652c1efcb50620bb5399e02f15ae3ec469bb33da3fd5e4fb212f390a59bb5ce94ad5e1f2b6f2ccc5aa60744d1956870cd60cf6f42ed196ccb54c2a44b514151292d46249bb6f82ce215f1023fde85da8d064937b5951d9d992dab24a27cc4bbb2c806ce3e12da386307ca900b38789b18ca39cb39f78b5dac786910e1e6d3a96e44c5eab45b54c76256115d0c093e6d1f4af5837267507f745546efc229b682ff0088a02c145bc61415b13916125258005dfbc06e04061eb0e9cb28a16df7e95fa40fb3a6152ab52cc1a8690e9a87e3f38a6b715969802e9075fabeb059c83424ef7dde9680706bb01701c9b91a0b03489c247bd99df76bfeedeb194f924202d201d135a6f3eb10050a3503bbabaf38e248b9be9a31d007e71dc3174935ad492c2f5a3e913c012e10104b9adc0e7ca0a2484d2fabd9b9c012e71a001eecc2e387086cdc700d979905aa350fa42945b00c74ac9a1eeeefa11a471731dd83eeac0d2a6a3bca7487340e1eada0d1e38859512d95c7cb57895101f89c53a123bc4e662f722e69a443ed8ff3781fac12a3dcbb299dd9b4e3a6914fedc7e11e07ff0068d21bad847a02c7186e63bdc723f381139854171ca244a8b839a8469c2f48e735b0c0adec29b8d61ab01efc6f032f14cc2e38b79c4c99f9b816de3eeb00138e7e1ac75035681d13391aeff9fdde3aa9c295e806821013acdaa5f9787286800dc7888e214f40e4ff004bf2b472cf5ad5dc59a8d000d18796a3de424f343f9c3d5814060128aee0da56d68e85b960dc786fa88725469536d3750416c290a5e1d83391c94df7bdf84212e84665bbd2a0befa9b79c25853b3b1abd09d2d484a4addf301d2b4d6100f97286a4f500fca263200d478088908208ae9f93f277f086a5603b96d793e9f7be11544a658dd6e10fc89e1e11c3268f985f7f9f087107874636f584143bd88dc207c561dd2a000a82055b482321dfd68fbe199c8a52977e3a521ad8281b66ecf5265a5252e43bf524fce275c8a07492fc21e859e1bed0ffd60f2e84d37c0db6ec548c8769b0812b4a82484afba5c101c58d46a1fc229f63c842b15ec66d52524a342ec080e38057846cf6e23da4a2959a02082d62fe573e3194db084a276166cbba56907a2811d19fc63a313b5453f89ac46c89490e10da08f2fdb597f589c13ee898a03a1223d7a7e2bbaa66762c1c5c0a523c51dcb9b9bfce2fa5b6db66520dc34d32d482430357de0d1c7071e516dda2c54b33499613959000140ec547d61fb62585e0309340aa09944f8dfaa4f8c67e61bc6eaa5bfe40f42ecbecd97370c9590ea25598d0542886a6e0d04633b3c8772b525f4012c2952c069bcc15d96c28938794950a9495a99dc15176346b36b16a66dbbb434bc70ca6d49d1548a2c376710085675ab515a7a419fb2e57e14f87e507e605a847588cad21c17fbe710e4df90aa05182963e14f9f5d218ad9924dd12fc07d20ecc96b185ddb90c3ee8ef13b815dfb16437f852fc04315b0e49a641e3e165458908b9f9c2f6683bc72fcc43b7ec3fd1573361cb3648e63d2f02feee0ff0099ff004a62ef20a872df75e10ff663f1abc21a72f62afe8a3294ea4beef1727ef5874d9750c5c048b721bf8f384ac23077ff007a69e558915912a35635737b3d6b478b18c18674de86aee090d473c9e39265b6afb98124eed625ccc157075dedcf50ed0cce95303a3d77b7c8b4203a50687982478b353ede2404862937a9a6e7a7381fdb1a70abe95bd357bc4b86c416b577e9a976f0f0828029055a923a11c5bef8c4e2437c4e542a05831de43c00b7228ad74df4ab68f095326703a5073d1a874ac21d074c25cd5247813c79446b5909a33ef7a31274f080a52976234a7405eadba09127e2240041bd77d39bfd7742a00a44e533b71d3d7c61a924ebb8dec6200b00730f7a710dd6262964bd8f3b0602b0500f12da99bc55cead7358773b387a0ea222968ab135d2afa56109a028b1a51fc9decef050d12cb984120071bdad5894cd2ce03807771a7d3a40a67d7467f0a1a71aeed5a1c712e03f76828ed6af990f00c91049d156a9f936a7ef9bf3b8afbbc987db7a433da9151eedacfbf4f8614c56605c103cfcbd61301e24e537b5b8fd98994b1ad00a3d7ef8c092a716a8240b13cfefc2389511453f3a0dcfcf742027c5611132594a94e1408dc7a7178c1cbd9ea56230e9529d3ed134e47357c1a372b350c7807b391e51e70bda8afd6ca89ee89d616004c6a748e8c16ee85268f499b827b8538ad3d29d23cb7b51b2ff00579e521f2abbe870d424d38b1f947a7cc9acb0e082d7a901f52d4e1187fd206312b54b0082a49558bb0565a13a9a41d336a7429a5415b5a4251b2a50049712d4469994a727ccc6308f945ce3f6cfb4c24991958219c8f8981166bd5e2a1a91d78e2d277ed90e8f55d8caff00e3ca055f087e4c5afc1bc22c25299cbdb788f304ed89ac91ed140001802ccd68955b5e6aaf3567fcc7e51ccfa67ec7ad1e90a99bbab6912281614b8b977dc2317b3fb4d30654ac058767619b46aea79c6bb05b4a54c2af66b722e350c5add2f18cf1ca3c96a49924d904df8d29d7ac0cbdddebe96a0fca0c0c438bf86ed37f487a58b9205b95be4cf103a2bfd9def76d6193927573c04582c9662135bd7758b5e214cc1424fafd21934049400e6b46dfc691dea7fb7f282d331837777dbc38bbc7338dfe90f715142b9a580259d8f32ce391881c85126b5b6a5eadd07dd21b3a60cea5077075767761124b41ef50800b1d2ece39b36faf38d08b12559121fd7a11e9e70f131252e342ec5c353869d21a2601958160583b25c8724e8013cdfcdde7bc0860052a08e41b7d9aa6f785434c084f09f74382e09a599cf27060b18a23baa6e0d4b9635d0f3899385b022a412cd72e6b4725d85408694019b2a6b50d51bfefca01a0c54bfc4d71a5407a9246948ece500f671662f4a3ded4300a553012e0b00dfcc2a12c2ec3f282d692092e332fc999c6e275eb1343b1cbc5a826ccc29a122a481bb4630c978d528939742000092fa51ad5f3d6212820e62684ea0bb17b8f841a1e51d2095dc94e5720072e2b95fc3cb9928074f428259db2aadab503bee82308bf7429abaf200a7e7d0448849345025246a0d2b7a568e3c2d106226e4cb767a03c097361a1f58064d899a2a027bda742012dbc31b7388e54e0b2cd7bb86620b077e03488311b412e333312483f2e069c6af11c9da68295656a0a3915ad1f9fce1d3a120d992083ad286e05d9cb1def4860cae4b666a57a5a2ae6ed65582e5b5c82ceecf562731bbc770bb56529273a994428a8806ecd4ad075d5e1e8743d8bbf6e01a6509146006bc07cbac7178a1b9c509bbb1d7d62ba46d1964fbc936a12c4d08bea6d6d2211b5e52565254ce0d4d52fa0fa1d2176dfa19792b120a2a4076e2df75878585339d1a82fc39c6695b664a4b672ab9ccc43b03dd20c41fb6d058e636ad3733560eccbd0acd563481294b7ca50855e9ee826af71f7a4791e26ee2815de1c1ddc742e3a46b36d6d7132565428d5b370007bbe3aeb19f12f3a001704b7255fcc79c7574f07056c993b3769ed2cb4a1254aef9961547ae648ddca307b766cb52f34a05292e483563c0ee8271f2657f0d32d6a5808abd08a93978b3de02992c70f9c5e2c4a3ba14a57b03c8b375899498eca46b4684c046c41c29d6266609f1f3603cbce0e95b3094053a40a9be8c9229e3134a95877493348cace12924d054bd9c98cdcd0e8eecac128aa5b02ce4bb6ead7c00eb175b2367192bcded03fe1e42a09d43f28e627b509497415aef421879dc4043b48970552896afbcd1cf2ee4bc155146c654d4efa0e25debf387a6706e3ad6fc39de32333b452d441095a48d69ccd040e8dbec494a555bd6d7a88cbb33f45ea46da7adc929372fcdeadf386281503ab5ea7a5c465707da104f7c102a472dde358b7c1eda9648a846ae6803d81dcf12f1c97804d30d90a2d51472789777a35224fd60f0f3fa43538f96aa0525c6808fbdff6617b497f6442a1d14f872d3142f995ae9f138ea043e6bbd0914269bf310fe51d8516482e3b1252121811de15af13e3066cf4e640726fe1dd8ec284c44453dc2adce06e0e58c121641672cc68e5be1af1850a0040b3e712922c3369fd2b57a810661123282d52a03c0c28508681f149fe2015663472d411300c0104dbff002483e2e63b0a102e40e4d5731eb90867fe62a07fd2221da52ebef2a8cd5de6a394285171e45f695fb528bc8e58124752c4f8011578e93952589a922be30a147440cd93e1706952564bb84e6bff003e56e513230890a50b8ee8aee2b0f0a140dbb2a89266cc404bd7dd2ad3702d6b5604c6e1529200767ffc88d394285045b1305c54b095900500d6239405690a146ab807c87a3089aa6ac528373757b372dfe630c186099b94380cde054dfe910a1445b002c421a6280d1dbc1e0730a14691109141e11c529a1428a11324d386e82b0b8706ef5a793bf3a4285112e068865cb0e7ef7fd224972410ff007ac72141605decfd892d658955d22840b900e916927b3d22a729a68e5aed0a14724e72be4d609124bd9b282920213f16fa3189a64b4a582529014a62183172a70d0a14676d955c9d95b124ad69050ce58b16d1fe7e9ba17eeec8fc27fb95f5850a0d72f65e957c1fffd9),
(61, 'Barreto', 'Joseph', 'barreto@mail.com', 'technoblade', 'Masculino', '(47) 99000-0016', '', '', '2021-03-03', 0x4172726179),
(63, 'tijolinho', 'tijolo', 'tijolo@tijolo.com', 'hurdur', 'Masculino', '(47) 99445-5556', '', '', '2021-02-10', '');

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
  MODIFY `idBairros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idCidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `paradas`
--
ALTER TABLE `paradas`
  MODIFY `Cd_Paradas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `percurso`
--
ALTER TABLE `percurso`
  MODIFY `idPercurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `ruas`
--
ALTER TABLE `ruas`
  MODIFY `idRuas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idTipo_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `uf`
--
ALTER TABLE `uf`
  MODIFY `idUf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
