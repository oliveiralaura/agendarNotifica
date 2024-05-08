-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2024 at 12:50 PM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u414251701_laurao`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `agenda`
-- (See below for the actual view)
--
CREATE TABLE `agenda` (
`cliente` varchar(90)
,`profissional` varchar(90)
,`data` date
);

-- --------------------------------------------------------

--
-- Table structure for table `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id_agendamento` int(11) NOT NULL,
  `clientes_id_cliente` int(11) NOT NULL,
  `profissionais_id_profissional` int(11) NOT NULL,
  `data_agendamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agendamentos`
--

INSERT INTO `agendamentos` (`id_agendamento`, `clientes_id_cliente`, `profissionais_id_profissional`, `data_agendamento`) VALUES
(1, 1, 6, '2024-05-09'),
(2, 5, 10, '2024-05-02'),
(3, 2, 6, '2024-05-02'),
(4, 4, 9, '2024-05-07'),
(5, 2, 8, '2024-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(90) NOT NULL,
  `telefone_cliente` varchar(45) NOT NULL,
  `endereco_cliente` varchar(45) DEFAULT NULL,
  `numero_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `telefone_cliente`, `endereco_cliente`, `numero_cliente`) VALUES
(1, 'Laura Pimenta de Oliveira', '18996534856', 'José Cabadeldo', 111),
(2, 'Thierulys', '18996548782', NULL, NULL),
(3, 'Malu', '19998745632', NULL, NULL),
(4, 'Samuel', '1899654785', NULL, NULL),
(5, 'Ana Clara', '1898756354', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `google_calendar_event_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `location`, `date`, `time_from`, `time_to`, `google_calendar_event_id`, `created`) VALUES
(1, 'ir para escola', 'acordar e se ferrar pq foi dormir tarde', 'sesi', '2024-05-10', '00:00:00', '00:00:00', NULL, '2024-05-06 00:15:57'),
(2, 'Será que agora vai', 'vai sim', 'sesi', '2225-04-05', '12:25:00', '12:40:00', NULL, '2024-05-06 19:24:02'),
(3, 'gre', 'grgr', 'gr', '0024-03-31', '03:23:00', '03:02:00', NULL, '2024-05-06 20:18:15'),
(4, 'rgre', 'gregr', 'grege', '2024-05-06', '04:04:00', '07:07:00', NULL, '2024-05-06 20:20:08'),
(5, 'vai', 'vai agora', 'sesi', '2024-05-06', '20:00:00', '21:00:00', NULL, '2024-05-06 20:26:35'),
(6, 'Não entendi', 'uai', 'sesi', '2024-05-07', '08:00:00', '10:00:00', NULL, '2024-05-06 20:29:27'),
(7, 'aaa', 'aaa', 'aaa', '2024-05-06', '22:22:00', '23:23:00', NULL, '2024-05-06 20:31:34'),
(8, 'nilo', 'nilão', 'bfhrj', '2024-05-15', '20:00:00', '21:00:00', NULL, '2024-05-07 12:32:32');

-- --------------------------------------------------------

--
-- Stand-in structure for view `procedimento`
-- (See below for the actual view)
--
CREATE TABLE `procedimento` (
`procedimento` varchar(45)
,`inicio` time
,`fim` time
,`profissional` varchar(90)
);

-- --------------------------------------------------------

--
-- Table structure for table `procedimentos`
--

CREATE TABLE `procedimentos` (
  `id_procedimento` int(11) NOT NULL,
  `nome_procedimento` varchar(45) NOT NULL,
  `inicio_procedimento` time NOT NULL,
  `fim_procedimento` time NOT NULL,
  `profissionais_id_profissional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `procedimentos`
--

INSERT INTO `procedimentos` (`id_procedimento`, `nome_procedimento`, `inicio_procedimento`, `fim_procedimento`, `profissionais_id_profissional`) VALUES
(1, 'Corte de cabelo', '08:30:00', '09:00:00', 6),
(2, 'Depilação Perna', '13:00:00', '13:40:00', 8),
(3, 'Corte - barba', '09:00:00', '09:30:00', 9),
(4, 'Massagem', '09:00:00', '09:40:00', 7),
(5, 'Design de sombrancelha', '14:00:00', '14:30:00', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `profissao`
-- (See below for the actual view)
--
CREATE TABLE `profissao` (
`Profissionais` varchar(90)
,`servico` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `profissionais`
--

CREATE TABLE `profissionais` (
  `id_profissional` int(11) NOT NULL,
  `nome_profissional` varchar(90) NOT NULL,
  `tipos_servicos_id_tipo_servico` int(11) NOT NULL,
  `local_profissional` enum('Presencial','Domiciliar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profissionais`
--

INSERT INTO `profissionais` (`id_profissional`, `nome_profissional`, `tipos_servicos_id_tipo_servico`, `local_profissional`) VALUES
(6, 'Geovana', 4, 'Presencial'),
(7, 'Luise', 9, 'Presencial'),
(8, 'Maria Vitória', 5, 'Presencial'),
(9, 'Alysson', 8, 'Presencial'),
(10, 'Nilo', 6, 'Presencial');

-- --------------------------------------------------------

--
-- Table structure for table `tipos_servicos`
--

CREATE TABLE `tipos_servicos` (
  `id_tipo_servico` int(11) NOT NULL,
  `nome_tipo_servico` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipos_servicos`
--

INSERT INTO `tipos_servicos` (`id_tipo_servico`, `nome_tipo_servico`) VALUES
(1, 'Manicure'),
(2, 'Pedicure'),
(3, 'Esteticista'),
(4, 'Cabeleireiro'),
(5, 'Depiladora'),
(6, 'Designer de sobrancelhas'),
(7, 'Maquiadora'),
(8, 'Barbeiro'),
(9, 'Massagista');

-- --------------------------------------------------------

--
-- Structure for view `agenda`
--
DROP TABLE IF EXISTS `agenda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u414251701_laurao`@`127.0.0.1` SQL SECURITY DEFINER VIEW `agenda`  AS SELECT `clientes`.`nome_cliente` AS `cliente`, `profissionais`.`nome_profissional` AS `profissional`, `agendamentos`.`data_agendamento` AS `data` FROM ((`agendamentos` join `clientes` on(`agendamentos`.`clientes_id_cliente` = `clientes`.`id_cliente`)) join `profissionais` on(`agendamentos`.`profissionais_id_profissional` = `profissionais`.`id_profissional`)) ;

-- --------------------------------------------------------

--
-- Structure for view `procedimento`
--
DROP TABLE IF EXISTS `procedimento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u414251701_laurao`@`127.0.0.1` SQL SECURITY DEFINER VIEW `procedimento`  AS SELECT `procedimentos`.`nome_procedimento` AS `procedimento`, `procedimentos`.`inicio_procedimento` AS `inicio`, `procedimentos`.`fim_procedimento` AS `fim`, `profissionais`.`nome_profissional` AS `profissional` FROM (`procedimentos` join `profissionais` on(`procedimentos`.`profissionais_id_profissional` = `profissionais`.`id_profissional`)) ;

-- --------------------------------------------------------

--
-- Structure for view `profissao`
--
DROP TABLE IF EXISTS `profissao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u414251701_laurao`@`127.0.0.1` SQL SECURITY DEFINER VIEW `profissao`  AS SELECT `profissionais`.`nome_profissional` AS `Profissionais`, `tipos_servicos`.`nome_tipo_servico` AS `servico` FROM (`profissionais` join `tipos_servicos` on(`profissionais`.`tipos_servicos_id_tipo_servico` = `tipos_servicos`.`id_tipo_servico`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `fk_agendamentos_clientes1_idx` (`clientes_id_cliente`),
  ADD KEY `fk_agendamentos_profissionais1_idx` (`profissionais_id_profissional`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procedimentos`
--
ALTER TABLE `procedimentos`
  ADD PRIMARY KEY (`id_procedimento`),
  ADD KEY `fk_procedimentos_profissionais1_idx` (`profissionais_id_profissional`);

--
-- Indexes for table `profissionais`
--
ALTER TABLE `profissionais`
  ADD PRIMARY KEY (`id_profissional`),
  ADD KEY `fk_profissionais_tipos_servicos_idx` (`tipos_servicos_id_tipo_servico`);

--
-- Indexes for table `tipos_servicos`
--
ALTER TABLE `tipos_servicos`
  ADD PRIMARY KEY (`id_tipo_servico`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `procedimentos`
--
ALTER TABLE `procedimentos`
  MODIFY `id_procedimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profissionais`
--
ALTER TABLE `profissionais`
  MODIFY `id_profissional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tipos_servicos`
--
ALTER TABLE `tipos_servicos`
  MODIFY `id_tipo_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `fk_agendamentos_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_agendamentos_profissionais1` FOREIGN KEY (`profissionais_id_profissional`) REFERENCES `profissionais` (`id_profissional`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `procedimentos`
--
ALTER TABLE `procedimentos`
  ADD CONSTRAINT `fk_procedimentos_profissionais1` FOREIGN KEY (`profissionais_id_profissional`) REFERENCES `profissionais` (`id_profissional`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profissionais`
--
ALTER TABLE `profissionais`
  ADD CONSTRAINT `fk_profissionais_tipos_servicos` FOREIGN KEY (`tipos_servicos_id_tipo_servico`) REFERENCES `tipos_servicos` (`id_tipo_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
