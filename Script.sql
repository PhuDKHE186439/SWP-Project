-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema trainproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trainproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trainproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `trainproject` ;

-- -----------------------------------------------------
-- Table `trainproject`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`role` (
  `RoleID` INT NOT NULL,
  `RoleName` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`account` (
  `AccountID` INT NOT NULL AUTO_INCREMENT,
  `PhoneNumber` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Username` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Password` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Email` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `RoleID` INT NULL DEFAULT NULL,
  `PassengerID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  INDEX `RoleID` (`RoleID` ASC) VISIBLE,
  CONSTRAINT `account_ibfk_1`
    FOREIGN KEY (`RoleID`)
    REFERENCES `trainproject`.`role` (`RoleID`),
  CONSTRAINT `account_ibfk_2`
    FOREIGN KEY (`PassengerID`)
    REFERENCES `trainproject`.`Passenger` (`PassengerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`location` (
  `LocationID` INT NOT NULL,
  `LocationName` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`train` (
  `TrainID` INT NOT NULL,
  `TrainScheduleTime` DATE NULL DEFAULT NULL,
  `TrainName` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `NumberOfSeat` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `StartLocationID` INT NULL DEFAULT NULL,
  `ArrivalLocationID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`TrainID`),
  INDEX `StartLocationID` (`StartLocationID` ASC) VISIBLE,
  INDEX `ArrivalLocationID` (`ArrivalLocationID` ASC) VISIBLE,
  CONSTRAINT `train_ibfk_1`
    FOREIGN KEY (`StartLocationID`)
    REFERENCES `trainproject`.`location` (`LocationID`),
  CONSTRAINT `train_ibfk_2`
    FOREIGN KEY (`ArrivalLocationID`)
    REFERENCES `trainproject`.`location` (`LocationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`compartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`compartment` (
  `CompartmentID` INT NOT NULL,
  `CompartmentNumber` INT NULL DEFAULT NULL,
  `TrainID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CompartmentID`),
  INDEX `fk_train_idx` (`TrainID` ASC) VISIBLE,
  CONSTRAINT `fk_train`
    FOREIGN KEY (`TrainID`)
    REFERENCES `trainproject`.`train` (`TrainID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`passenger` (
  `PassengerID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Email` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `Age` INT NULL DEFAULT NULL,
  `Address` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`PassengerID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`feedback` (
  `FeedbackID` INT NOT NULL,
  `Message` TEXT NULL DEFAULT NULL,
  `PassengerID` INT NULL DEFAULT NULL,
  `SubmissionDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  INDEX `PassengerID` (`PassengerID` ASC) VISIBLE,
  CONSTRAINT `feedback_ibfk_1`
    FOREIGN KEY (`PassengerID`)
    REFERENCES `trainproject`.`passenger` (`PassengerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`ticketclass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`ticketclass` (
  `TicketClassID` INT NOT NULL,
  `CategoryName` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`TicketClassID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `trainproject`.`otpquestion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`otpquestion` (
  `AccountID` INT null Default	NULL,
  `OtpQuestion` TEXT NULL DEFAULT NULL,
  `OtpAnswer` INT NULL DEFAULT NULL,
  INDEX `AccountID` (`AccountID` ASC) VISIBLE,
  CONSTRAINT `otpquestion_ibfk_1`
    FOREIGN KEY (`AccountID`)
    REFERENCES `trainproject`.`account` (`AccountID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`seat` (
  `SeatID` INT NOT NULL,
  `CompartmentID` INT NULL DEFAULT NULL,
  `SeatNumber` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `AvailabilityStatus` TINYINT(1) NULL DEFAULT NULL,
  `SeatType` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  INDEX `fk_compartment` (`CompartmentID` ASC) VISIBLE,
  CONSTRAINT `fk_compartment`
    FOREIGN KEY (`CompartmentID`)
    REFERENCES `trainproject`.`compartment` (`CompartmentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`ticket` (
  `TicketID` INT NOT NULL,
  `PassengerID` INT NULL DEFAULT NULL,
  `TicketClassID` INT NULL DEFAULT NULL,
  `PurchaseDate` DATE NULL DEFAULT NULL,
  `TicketPrice` DOUBLE NULL DEFAULT NULL,
  `CompartmentID` INT NULL DEFAULT NULL,
  `SeatID` INT NULL DEFAULT NULL,
  `CompartmentNumber` INT NULL DEFAULT NULL,
  `TimeArrive` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  INDEX `PassengerID` (`PassengerID` ASC) VISIBLE,
  INDEX `TicketClassID` (`TicketClassID` ASC) VISIBLE,
  INDEX `CompartmentID` (`CompartmentID` ASC) VISIBLE,
  INDEX `SeatID` (`SeatID` ASC) VISIBLE,
  CONSTRAINT `ticket_ibfk_1`
    FOREIGN KEY (`PassengerID`)
    REFERENCES `trainproject`.`passenger` (`PassengerID`),
  CONSTRAINT `ticket_ibfk_2`
    FOREIGN KEY (`TicketClassID`)
    REFERENCES `trainproject`.`ticketclass` (`TicketClassID`),
  CONSTRAINT `ticket_ibfk_3`
    FOREIGN KEY (`CompartmentID`)
    REFERENCES `trainproject`.`compartment` (`CompartmentID`),
  CONSTRAINT `ticket_ibfk_4`
    FOREIGN KEY (`SeatID`)
    REFERENCES `trainproject`.`seat` (`SeatID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainproject`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainproject`.`payment` (
  `PaymentID` INT NOT NULL,
  `TicketID` INT NULL DEFAULT NULL,
  `PassengerID` INT NULL DEFAULT NULL,
  `PaymentMethod` ENUM('Bank', 'Digital Wallet') NULL DEFAULT NULL,
  `PaymentDate` DATE NULL DEFAULT NULL,
  `Amount` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `TicketID` (`TicketID` ASC) VISIBLE,
  INDEX `PassengerID` (`PassengerID` ASC) VISIBLE,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`TicketID`)
    REFERENCES `trainproject`.`ticket` (`TicketID`),
  CONSTRAINT `payment_ibfk_2`
    FOREIGN KEY (`PassengerID`)
    REFERENCES `trainproject`.`passenger` (`PassengerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Insert data into Passenger
INSERT INTO Passenger (PassengerID, Name, Password, Email, Age, Address, PhoneNumber) VALUES
(1, 'Himmel', 'Frieren123', 'himmel@gmail.com', 28, 'British', '555-1234-4321'),
(2, 'John Smith', 'moviestar', 'johnsmith@gmail.com', 34, 'America', '555-5678-4321'),
(3, 'Rin Tohsaka', 'holygrail', 'emiya@gmail.com', 22, ' Japan', '555-9876-4321'),
(4, 'Dang Khac Phu', 'phudk123', 'Phudk@gmail.com', 26, 'Viet Nam', '555-6543-4321');

-- Insert data into Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1,'Admin'),
(2,'TicketManager'),
(3,'Passenger');

-- Insert data into Account
INSERT INTO Account (AccountID, PhoneNumber, Username, Password, Email, RoleID) VALUES
(1, '555-1234', 'johnd', 'password123', 'himmel@gmail.com',3),
(2, '555-5678', 'janes', 'janeSecure', 'johnsmith@gmail.com',3),
(3, '555-9876', 'robj', 'robJ2023', 'emiya@gmail.com',3),
(4, '555-6543', 'emilyd', 'emilyPass456', 'Phudk@gmail.com',3),

(5, '096-258-2004','admin1', 'admin1', 'DungPVHE180060@gmail.com',1 ),
(6, '555-3344-6352','admin2', 'admin2', 'admin2@system.com',1 ),

(7, '555-6543', 'Mana', 'ManagerTicket', 'Manager@gmail.com',2);


INSERT INTO Location (LocationID, LocationName, Description) VALUES
(1, 'Ha Noi', 'Main station in Ha Noi'),
(2, 'Hai Phong', 'Main station in Hai Phong'),
(3, 'Da Nang', 'Main station in Da Nang'),
(4, 'Ho Chi Minh', 'Main station in Ho Chi Minh');
-- Insert data into Train
INSERT INTO Train (TrainID, TrainScheduleTime, TrainName, NumberOfSeat, StartLocationID, ArrivalLocationID) VALUES
(1, '2024-09-17 08:00:00', 'Express 101', 100, 1, 2),
(2, '2024-09-17 10:30:00', 'Local 202', 120, 2, 3);

-- Insert data into Location


-- Insert data into Compartment
INSERT INTO Compartment (CompartmentID, CompartmentNumber, TrainID) VALUES
(1, 101, 1),
(2, 102, 2);

-- Insert data into Seat
INSERT INTO Seat (SeatID, SeatNumber, SeatType, AvailabilityStatus, CompartmentID) VALUES
(1, '1A', 'First Class', TRUE, 1),
(2, '2B', 'Economy', TRUE, 2);

-- Insert data into TicketClass
INSERT INTO TicketClass (TicketClassID, CategoryName) VALUES
(1, 'First Class'),
(2, 'Business Class');

-- Insert data into Ticket
INSERT INTO Ticket (TicketID, PassengerID, SeatID, CompartmentNumber, TicketClassID, PurchaseDate, TicketPrice, CompartmentID, TimeArrive) VALUES
(1, 1, 1,1, 1, '2024-09-01', 150.00, 1, '2024-09-17 08:45:00'),
(2, 2, 2,1, 2, '2024-09-01', 50.00, 2, '2024-09-17 11:00:00');

-- Insert data into Payment
INSERT INTO Payment (PaymentID, TicketID, PassengerID, PaymentMethod, PaymentDate, Amount) VALUES
(1, 1, 1, 'Bank', '2024-09-01', 150.00),
(2, 2, 2, 'Digital Wallet', '2024-09-01', 50.00);

-- Insert data into Feedback
INSERT INTO Feedback (FeedbackID, Message, PassengerID, SubmissionDate) VALUES
(1, 'Great service, smooth ride.', 1, '2024-09-17 08:45:00'),
(2, 'The seat was uncomfortable.', 2, '2024-09-18 11:00:00');


