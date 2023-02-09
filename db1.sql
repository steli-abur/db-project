-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemon` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemon` ;

-- -----------------------------------------------------
-- Table `LittleLemon`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `ContactNumber` INT NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Table` INT NOT NULL,
  `Slot` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemon`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`MenuItems` (
  `ItemID` INT NOT NULL,
  `ItemPrice` DECIMAL NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`, `ItemID`),
  INDEX `Item_fk_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `Item_fk`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemon`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `EmployeeName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`OrderDelivery` (
  `StatusID` INT NOT NULL,
  `StatusName` VARCHAR(45) NOT NULL,
  `DeliveryDate` DATETIME NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`StatusID`),
  INDEX `emp_fk_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `emp_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemon`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Orders` (
  `OrderID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `BookingID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Status` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Menu_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `booking_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `status_fk_idx` (`Status` ASC) VISIBLE,
  CONSTRAINT `Menu_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemon`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `booking_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemon`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `status_fk`
    FOREIGN KEY (`Status`)
    REFERENCES `LittleLemon`.`OrderDelivery` (`StatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
