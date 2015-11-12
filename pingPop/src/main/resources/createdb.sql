-- MySQL Workbench Forward Engineering
CREATE SCHEMA IF NOT EXISTS `Pingpop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Pingpop` ;

CREATE TABLE IF NOT EXISTS `Pingpop`.`User` (
  `UserId` CHAR(5) NOT NULL,
  `UserEmail` VARCHAR(45) NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Pingpop`.`EventType` (
  `EventTypeId` INT NOT NULL AUTO_INCREMENT,
  `EventType` VARCHAR(45) NULL,
  PRIMARY KEY (`EventTypeId`),
  UNIQUE INDEX `EventType_UNIQUE` (`EventType` ASC))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Pingpop`.`Event` (
  `EventId` INT NOT NULL AUTO_INCREMENT,
  `EventTime` DATETIME NOT NULL,
  `EventPlace` VARCHAR(45) NOT NULL,
  `EventSpot` INT NULL,
  `EventTypeId` INT NOT NULL,
  `User_UserId` CHAR(5) NOT NULL,
  PRIMARY KEY (`EventId`),
  INDEX `fk_Event_EventType1_idx` (`EventTypeId` ASC),
  INDEX `fk_Event_User1_idx` (`User_UserId` ASC),
  CONSTRAINT `fk_Event_EventType1`
    FOREIGN KEY (`EventTypeId`)
    REFERENCES `Pingpop`.`EventType` (`EventTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_User1`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `Pingpop`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;

CREATE TABLE IF NOT EXISTS `Pingpop`.`Group` (
  `GroupId` INT NOT NULL AUTO_INCREMENT,
  `Groupcol` VARCHAR(45) NULL,
  PRIMARY KEY (`GroupId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pingpop`.`Friend` (
  `Friend_UserId` CHAR(5) NOT NULL,
  `UserId` CHAR(5) NOT NULL,
  `FriendId` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Friend_User_idx` (`UserId` ASC, `Friend_UserId` ASC),
  PRIMARY KEY (`FriendId`),
  CONSTRAINT `fk_Friend_User`
    FOREIGN KEY (`UserId` , `Friend_UserId`)
    REFERENCES `Pingpop`.`User` (`UserId` , `UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pingpop`.`Participant` (
  `idParticipantId` INT NOT NULL,
  `ParticipanSpot` INT NULL,
  `User_UserId` CHAR(5) NOT NULL,
  `Event_EventId` INT NOT NULL,
  PRIMARY KEY (`idParticipantId`),
  INDEX `fk_Participant_User1_idx` (`User_UserId` ASC),
  INDEX `fk_Participant_Event1_idx` (`Event_EventId` ASC),
  CONSTRAINT `fk_Participant_User1`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `Pingpop`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participant_Event1`
    FOREIGN KEY (`Event_EventId`)
    REFERENCES `Pingpop`.`Event` (`EventId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pingpop`.`Friend_has_Group` (
  `Friend_FriendId` INT NOT NULL,
  `Group_GroupId` INT NOT NULL,
  PRIMARY KEY (`Friend_FriendId`, `Group_GroupId`),
  INDEX `fk_Friend_has_Group_Group1_idx` (`Group_GroupId` ASC),
  INDEX `fk_Friend_has_Group_Friend1_idx` (`Friend_FriendId` ASC),
  CONSTRAINT `fk_Friend_has_Group_Friend1`
    FOREIGN KEY (`Friend_FriendId`)
    REFERENCES `Pingpop`.`Friend` (`FriendId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Friend_has_Group_Group1`
    FOREIGN KEY (`Group_GroupId`)
    REFERENCES `Pingpop`.`Group` (`GroupId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Pingpop`.`Group_has_Participant` (
  `Participant_idParticipantId` INT NOT NULL,
  `Group_GroupId` INT NOT NULL,
  PRIMARY KEY (`Participant_idParticipantId`),
  INDEX `fk_Group_has_Participant_Participant1_idx` (`Participant_idParticipantId` ASC),
  INDEX `fk_Group_has_Participant_Group1_idx` (`Group_GroupId` ASC),
  CONSTRAINT `fk_Group_has_Participant_Participant1`
    FOREIGN KEY (`Participant_idParticipantId`)
    REFERENCES `Pingpop`.`Participant` (`idParticipantId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Participant_Group1`
    FOREIGN KEY (`Group_GroupId`)
    REFERENCES `Pingpop`.`Group` (`GroupId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
