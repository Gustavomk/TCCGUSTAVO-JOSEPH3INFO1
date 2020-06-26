-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema BD_TCC_GuJo_20
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_TCC_GuJo_20
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_TCC_GuJo_20` DEFAULT CHARACTER SET utf8 ;
USE `BD_TCC_GuJo_20` ;

-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Uf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Uf` (
  `idUf` INT(11) NOT NULL AUTO_INCREMENT,
  `sigla_uf` VARCHAR(45) NOT NULL,
  `nome_uf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUf`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Cidade` (
  `idCidade` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` VARCHAR(45) NOT NULL,
  `Uf_idUf` INT(11) NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_Uf_idx` (`Uf_idUf` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Uf`
    FOREIGN KEY (`Uf_idUf`)
    REFERENCES `BD_TCC_GuJo_20`.`Uf` (`idUf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Bairros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Bairros` (
  `idBairros` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_bairros` VARCHAR(45) NOT NULL,
  `Cidade_idCidade` INT(11) NOT NULL,
  PRIMARY KEY (`idBairros`),
  INDEX `fk_Bairros_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_Bairros_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `BD_TCC_GuJo_20`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Onibus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Onibus` (
  `NumOnibus` INT(11) NOT NULL,
  `HorariosOnibus` VARCHAR(45) NOT NULL,
  `Nome_Onibus` VARCHAR(45) NOT NULL,
  `Tipo_Onibus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumOnibus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Ruas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Ruas` (
  `idRuas` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_rua` VARCHAR(45) NOT NULL,
  `Bairros_idBairros` INT(11) NOT NULL,
  PRIMARY KEY (`idRuas`),
  INDEX `fk_Ruas_Bairros1_idx` (`Bairros_idBairros` ASC) VISIBLE,
  CONSTRAINT `fk_Ruas_Bairros1`
    FOREIGN KEY (`Bairros_idBairros`)
    REFERENCES `BD_TCC_GuJo_20`.`Bairros` (`idBairros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Percurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Percurso` (
  `idPercurso` INT(11) NOT NULL AUTO_INCREMENT,
  `inicio_Percurso_X` VARCHAR(45) NOT NULL,
  `inicio_Percurso_Y` VARCHAR(45) NOT NULL,
  `rota_Percurso` VARCHAR(45) NOT NULL,
  `destino_Percurso_X` VARCHAR(45) NOT NULL,
  `destino_Percurso_Y` VARCHAR(45) NOT NULL,
  `Linhas_NumLinha` INT(11) NOT NULL,
  `Ruas_idRuas` INT(11) NOT NULL,
  PRIMARY KEY (`idPercurso`),
  INDEX `fk_Percurso_Linhas1_idx` (`Linhas_NumLinha` ASC) VISIBLE,
  INDEX `fk_Percurso_Ruas1_idx` (`Ruas_idRuas` ASC) VISIBLE,
  CONSTRAINT `fk_Percurso_Linhas1`
    FOREIGN KEY (`Linhas_NumLinha`)
    REFERENCES `BD_TCC_GuJo_20`.`Onibus` (`NumOnibus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Percurso_Ruas1`
    FOREIGN KEY (`Ruas_idRuas`)
    REFERENCES `BD_TCC_GuJo_20`.`Ruas` (`idRuas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Usuario` (
  `id_Usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `cpf` INT(13) NOT NULL,
  `nome_completo` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `CNH` VARCHAR(45) NULL,
  `tipo_carteira` INT(2) NULL,
  `Linhas_NumLinha` INT(11) NOT NULL,
  PRIMARY KEY (`id_Usuario`),
  INDEX `fk_Usuario_Linhas1_idx` (`Linhas_NumLinha` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Linhas1`
    FOREIGN KEY (`Linhas_NumLinha`)
    REFERENCES `BD_TCC_GuJo_20`.`Onibus` (`NumOnibus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `BD_TCC_GuJo_20`.`Tipo_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_TCC_GuJo_20`.`Tipo_Usuario` (
  `idTipo_Usuario` INT(11) NOT NULL,
  `Desc` VARCHAR(45) NOT NULL,
  `Usuario_id_Usuario` INT(11) NOT NULL,
  `especialização_idespecialização` INT(11) NOT NULL,
  PRIMARY KEY (`idTipo_Usuario`),
  INDEX `fk_Tipo_Usuario_Usuario1_idx` (`Usuario_id_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Tipo_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `BD_TCC_GuJo_20`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
