CREATE DATABASE ptappdb;

USE ptappdb;

CREATE TABLE `Users` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Type` INT NOT NULL,
	`Username` VARCHAR(255) NOT NULL UNIQUE,
	`Password (encrypted SHA256)` varchar(255) NOT NULL,
	`Firstname` VARCHAR(255) NOT NULL,
	`Lastname` VARCHAR(255) NOT NULL,
	`Gender` INT NOT NULL,
	`Email` VARCHAR(255) NOT NULL,
	`Newsletter_subscription` BOOLEAN NOT NULL,
	`Registration_date` TIMESTAMP NOT NULL,
	`Birthday` DATETIME NOT NULL,
	`Age` INT NOT NULL,
	`Phone_Number` TEXT NOT NULL,
	`Measurement_System` BOOLEAN NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Client` (
	`Client_ID` INT NOT NULL AUTO_INCREMENT,
	`User_ID` INT NOT NULL,
	`Height` FLOAT NOT NULL,
	PRIMARY KEY (`Client_ID`)
);

CREATE TABLE `Measurements` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Client_ID` INT NOT NULL,
	`Shoulders` INT NOT NULL,
	`Arms` INT NOT NULL,
	`Core` INT NOT NULL,
	`Waist` INT NOT NULL,
	`Quads` INT NOT NULL,
	`Calves` INT NOT NULL,
	`Weight` FLOAT NOT NULL,
	`Date` DATE NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Goals` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Client_ID` INT NOT NULL,
	`Trainer_ID` INT NOT NULL,
	`Name` VARCHAR(255) NOT NULL,
	`Description` VARCHAR(255) NOT NULL,
	`Progress` FLOAT NOT NULL,
	`ETA` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Trainer` (
	`Trainer_ID` INT NOT NULL AUTO_INCREMENT,
	`User_ID` INT NOT NULL,
	`Description` VARCHAR(255) NOT NULL,
	`Venue` FLOAT NOT NULL,
	`Contact Details` VARCHAR(255) NOT NULL,
	`Status` VARCHAR(255) NOT NULL,
	`Social_Media_Profiles` VARCHAR(255) NOT NULL,
	`available_online` BOOLEAN NOT NULL,
	PRIMARY KEY (`Trainer_ID`)
);

CREATE TABLE `Reviews` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Trainer_ID` INT NOT NULL,
	`Client_Name` varchar(255) NOT NULL,
	`Review_Description` varchar(255),
	`Stars` INT(5) NOT NULL,
	`Verified` BOOLEAN NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Appointments` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Client_ID` INT NOT NULL,
	`Trainer_ID` INT NOT NULL,
	`Date` DATETIME NOT NULL,
	`Type` BOOLEAN NOT NULL,
	`Venue` FLOAT NOT NULL,
	`Location` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Workout` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Trainer_ID` INT NOT NULL,
	`Client_ID` INT NOT NULL,
	`Workout_Name` VARCHAR(255) NOT NULL,
	`Accomplished` BOOLEAN NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Diet` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Trainer_ID` INT NOT NULL,
	`Client_ID` INT NOT NULL,
	`Meal` VARCHAR(255) NOT NULL,
	`Accomplished` BOOLEAN NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Blog` (
	`ID` INT NOT NULL,
	`Trainer_ID` INT NOT NULL,
	`Title` VARCHAR(255) NOT NULL,
	`Post` VARCHAR(255) NOT NULL,
	`Link_to_photo_host` VARCHAR(255) NOT NULL,
	`Link_to_video_host` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Food` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Diet_Plan_ID` INT NOT NULL,
	`Food_name` VARCHAR(255) NOT NULL,
	`Food_measurement` INT NOT NULL,
	`Food_energy` FLOAT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Exercise` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Workout_ID` INT NOT NULL,
	`Exercise_Name` VARCHAR(255) NOT NULL,
	`Sets` INT NOT NULL,
	`Reps` INT NOT NULL,
	`Link_to_video` VARCHAR(255) NOT NULL,
	`Intensity` FLOAT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Trainer_location` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Trainer_id` INT NOT NULL,
	`Gym` VARCHAR(255) NOT NULL,
	`day_of_week` VARCHAR(255),
	PRIMARY KEY (`id`)
);

ALTER TABLE `Client` ADD CONSTRAINT `Client_fk0` FOREIGN KEY (`User_ID`) REFERENCES `Users`(`ID`);

ALTER TABLE `Measurements` ADD CONSTRAINT `Measurements_fk0` FOREIGN KEY (`Client_ID`) REFERENCES `Client`(`Client_ID`);

ALTER TABLE `Goals` ADD CONSTRAINT `Goals_fk0` FOREIGN KEY (`Client_ID`) REFERENCES `Client`(`Client_ID`);

ALTER TABLE `Goals` ADD CONSTRAINT `Goals_fk1` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Trainer` ADD CONSTRAINT `Trainer_fk0` FOREIGN KEY (`User_ID`) REFERENCES `Users`(`ID`);

ALTER TABLE `Reviews` ADD CONSTRAINT `Reviews_fk0` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Appointments` ADD CONSTRAINT `Appointments_fk0` FOREIGN KEY (`Client_ID`) REFERENCES `Client`(`Client_ID`);

ALTER TABLE `Appointments` ADD CONSTRAINT `Appointments_fk1` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Workout` ADD CONSTRAINT `Workout_fk0` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Workout` ADD CONSTRAINT `Workout_fk1` FOREIGN KEY (`Client_ID`) REFERENCES `Client`(`Client_ID`);

ALTER TABLE `Diet` ADD CONSTRAINT `Diet_fk0` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Diet` ADD CONSTRAINT `Diet_fk1` FOREIGN KEY (`Client_ID`) REFERENCES `Client`(`Client_ID`);

ALTER TABLE `Blog` ADD CONSTRAINT `Blog_fk0` FOREIGN KEY (`Trainer_ID`) REFERENCES `Trainer`(`Trainer_ID`);

ALTER TABLE `Food` ADD CONSTRAINT `Food_fk0` FOREIGN KEY (`Diet_Plan_ID`) REFERENCES `Diet`(`ID`);

ALTER TABLE `Exercise` ADD CONSTRAINT `Exercise_fk0` FOREIGN KEY (`Workout_ID`) REFERENCES `Workout`(`ID`);

ALTER TABLE `Trainer_location` ADD CONSTRAINT `Trainer_location_fk0` FOREIGN KEY (`Trainer_id`) REFERENCES `Trainer`(`Trainer_ID`);