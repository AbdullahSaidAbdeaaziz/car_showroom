-- MySQL Script generated by MySQL Workbench
-- Mon 02 May 2022 08:35:26 PM EET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_showroom
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `car_showroom` ;

-- -----------------------------------------------------
-- Schema car_showroom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_showroom` DEFAULT CHARACTER SET utf8 ;
USE `car_showroom` ;

-- -----------------------------------------------------
-- Table `car_showroom`.`salesperson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_showroom`.`salesperson` ;

CREATE TABLE IF NOT EXISTS `car_showroom`.`salesperson` (
  `id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_showroom`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_showroom`.`car` ;

CREATE TABLE IF NOT EXISTS `car_showroom`.`car` (
  `serial_no` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `price` DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (`serial_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_showroom`.`sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_showroom`.`sale` ;

CREATE TABLE IF NOT EXISTS `car_showroom`.`sale` (
  `salesperson_id` VARCHAR(45) NOT NULL,
  `car_serial_no` INT NOT NULL,
  `date` DATE NOT NULL,
  `sale_price` DOUBLE UNSIGNED NOT NULL,
  INDEX `fk_sale_salesPerson_idx` (`salesperson_id` ASC) VISIBLE,
  INDEX `fk_sale_car1_idx` (`car_serial_no` ASC) VISIBLE,
  PRIMARY KEY (`salesperson_id`, `car_serial_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_showroom`.`option_car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_showroom`.`option_car` ;

CREATE TABLE IF NOT EXISTS `car_showroom`.`option_car` (
  `car_serial_no` VARCHAR(45) NOT NULL,
  `option_name` VARCHAR(45) NOT NULL,
  `Price` DOUBLE UNSIGNED NOT NULL,
  INDEX `fk_optionCar_car1_idx` (`car_serial_no` ASC) VISIBLE,
  PRIMARY KEY (`option_name`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `car_showroom`.`salesperson`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_showroom`;
INSERT INTO `car_showroom`.`salesperson` (`id`, `name`, `phone`) VALUES ('AH8877', 'Sayed Hussein ', 0111234567);
INSERT INTO `car_showroom`.`salesperson` (`id`, `name`, `phone`) VALUES ('VH7766', 'Nader Galal', NULL);
INSERT INTO `car_showroom`.`salesperson` (`id`, `name`, `phone`) VALUES ('MN1212', 'Samir Ayob ', 0100556699);

COMMIT;


-- -----------------------------------------------------
-- Data for table `car_showroom`.`car`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_showroom`;
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('1223344', 'Civic', 'Honda', 250000);
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('11223345', 'City', 'Honda', 150000);
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('44556677', 'Lancer', 'Mitsubishi ', 130000);
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('44556678', 'Shark', 'Mitsubishi', 170000);
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('22113344', 'Corolla', 'Toyota', 200000);
INSERT INTO `car_showroom`.`car` (`serial_no`, `model`, `manufacturer`, `price`) VALUES ('77886655', 'C200', 'Mercedes', 500000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `car_showroom`.`sale`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_showroom`;
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('AH8877', 11223344, '2015-03-14', 250750);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('AH8877 ', 11223345, '2015-10-25', 150000);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('VH7766 ', 44556677, '2015-03-30', 130000);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('MN1212', 44556678, ' 2015-11-02',  200750);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('VH7766', 170000, ' 2015-01-07', 170000);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('AH8877', 77886655, '2015-03-09', 506500);
INSERT INTO `car_showroom`.`sale` (`salesperson_id`, `car_serial_no`, `date`, `sale_price`) VALUES ('MN1212', 77886655, ' 2015-03-09', 506500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `car_showroom`.`option_car`
-- -----------------------------------------------------
START TRANSACTION;
USE `car_showroom`;
INSERT INTO `car_showroom`.`option_car` (`car_serial_no`, `option_name`, `Price`) VALUES ('44556677', ' Smart key', 1000);
INSERT INTO `car_showroom`.`option_car` (`car_serial_no`, `option_name`, `Price`) VALUES ('22113344 ', 'Parking sensor', 750);
INSERT INTO `car_showroom`.`option_car` (`car_serial_no`, `option_name`, `Price`) VALUES ('11223344', 'fog', 300);
INSERT INTO `car_showroom`.`option_car` (`car_serial_no`, `option_name`, `Price`) VALUES ('77886655', 'ferrarie', 4000);
INSERT INTO `car_showroom`.`option_car` (`car_serial_no`, `option_name`, `Price`) VALUES ('77886655', 'toyota', 2500);

COMMIT;

