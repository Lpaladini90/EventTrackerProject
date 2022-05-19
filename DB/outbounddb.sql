-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema outbounddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `outbounddb` ;

-- -----------------------------------------------------
-- Schema outbounddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `outbounddb` DEFAULT CHARACTER SET utf8 ;
USE `outbounddb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_trip` ;

CREATE TABLE IF NOT EXISTS `hunt_trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `description` VARCHAR(2000) NULL,
  `success` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gear_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gear_list` ;

CREATE TABLE IF NOT EXISTS `gear_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothing` ;

CREATE TABLE IF NOT EXISTS `clothing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `items_worn` TINYINT NULL,
  `items_packed` TINYINT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state` ;

CREATE TABLE IF NOT EXISTS `state` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `abbr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `license`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `license` ;

CREATE TABLE IF NOT EXISTS `license` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license_number` VARCHAR(200) NULL,
  `year` INT NULL,
  `type` VARCHAR(45) NULL,
  `from_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `purchase_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `sportsmans_number` INT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_license_user1_idx` (`user_id` ASC),
  INDEX `fk_license_state_info1_idx` (`state_id` ASC),
  CONSTRAINT `fk_license_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_license_state_info1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weapon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weapon` ;

CREATE TABLE IF NOT EXISTS `weapon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  `gear_list_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weapon_gear_list1_idx` (`gear_list_id` ASC),
  CONSTRAINT `fk_weapon_gear_list1`
    FOREIGN KEY (`gear_list_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `first_aid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `first_aid` ;

CREATE TABLE IF NOT EXISTS `first_aid` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `gear_list_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_first_aid_gear_list1_idx` (`gear_list_id` ASC),
  CONSTRAINT `fk_first_aid_gear_list1`
    FOREIGN KEY (`gear_list_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sleeping_gear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sleeping_gear` ;

CREATE TABLE IF NOT EXISTS `sleeping_gear` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sleeping_bag` VARCHAR(45) NULL,
  `shelter` VARCHAR(45) NULL,
  `ground_sheet` VARCHAR(45) NULL,
  `sleeping_pad` VARCHAR(45) NULL,
  `tent_pole` VARCHAR(45) NULL,
  `tent_stakes` VARCHAR(45) NULL,
  `stuff_sack` VARCHAR(45) NULL,
  `gear_id` INT NOT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sleeping_gear_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_sleeping_gear_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `items_worn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `items_worn` ;

CREATE TABLE IF NOT EXISTS `items_worn` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes_packed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothes_packed` ;

CREATE TABLE IF NOT EXISTS `clothes_packed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optics` ;

CREATE TABLE IF NOT EXISTS `optics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `spotting_scope` VARCHAR(45) NULL,
  `binoculars` VARCHAR(45) NULL,
  `range_finder` VARCHAR(45) NULL,
  `bino_adapter` VARCHAR(45) NULL,
  `lens_cloth` VARCHAR(45) NULL,
  `tripod` VARCHAR(45) NULL,
  `phone_adapater` VARCHAR(45) NULL,
  `bino_harness` VARCHAR(45) NULL,
  `gear_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_optics_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_optics_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backpack`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `backpack` ;

CREATE TABLE IF NOT EXISTS `backpack` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pack` VARCHAR(45) NULL,
  `rain_cover` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `gear_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_backpack_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_backpack_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `misc_gear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `misc_gear` ;

CREATE TABLE IF NOT EXISTS `misc_gear` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `gear_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_misc_gear_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_misc_gear_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rifle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rifle` ;

CREATE TABLE IF NOT EXISTS `rifle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `caliber` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `weapon_id` INT NOT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rifle_weapon1_idx` (`weapon_id` ASC),
  CONSTRAINT `fk_rifle_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bow` ;

CREATE TABLE IF NOT EXISTS `bow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `bow_harness` VARCHAR(45) NULL,
  `arrows` VARCHAR(45) NULL,
  `broadheads` VARCHAR(45) NULL,
  `weapon_id` INT NOT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bow_weapon1_idx` (`weapon_id` ASC),
  CONSTRAINT `fk_bow_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather` ;

CREATE TABLE IF NOT EXISTS `weather` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cook_kit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cook_kit` ;

CREATE TABLE IF NOT EXISTS `cook_kit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `amount` INT NULL,
  `gear_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cook_kit_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_cook_kit_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `food`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `food` ;

CREATE TABLE IF NOT EXISTS `food` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `amount` INT NULL,
  `gear_list_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_food_gear_list1_idx` (`gear_list_id` ASC),
  CONSTRAINT `fk_food_gear_list1`
    FOREIGN KEY (`gear_list_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_gear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_gear` ;

CREATE TABLE IF NOT EXISTS `user_has_gear` (
  `user_id` INT NOT NULL,
  `gear_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `gear_id`),
  INDEX `fk_user_has_gear_gear1_idx` (`gear_id` ASC),
  INDEX `fk_user_has_gear_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_gear_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_gear_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `license_id` INT NOT NULL,
  `tag_number` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tag_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_tag_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_address_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `draw_odds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `draw_odds` ;

CREATE TABLE IF NOT EXISTS `draw_odds` (
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `state_id` INT NOT NULL,
  INDEX `fk_draw_odds_state_info1_idx` (`state_id` ASC),
  PRIMARY KEY (`state_id`),
  CONSTRAINT `fk_draw_odds_state_info1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunting_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunting_information` ;

CREATE TABLE IF NOT EXISTS `hunting_information` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `species` ;

CREATE TABLE IF NOT EXISTS `species` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_user` ;

CREATE TABLE IF NOT EXISTS `hunt_user` (
  `hunt_trip_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`hunt_trip_id`, `user_id`),
  INDEX `fk_hunt_trip_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_hunt_trip_has_user_hunt_trip1_idx` (`hunt_trip_id` ASC),
  CONSTRAINT `fk_hunt_trip_has_user_hunt_trip1`
    FOREIGN KEY (`hunt_trip_id`)
    REFERENCES `hunt_trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunt_trip_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_method_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_method_type` ;

CREATE TABLE IF NOT EXISTS `hunt_method_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `hunting_information_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_season_hunting_information1_idx` (`hunting_information_id` ASC),
  CONSTRAINT `fk_season_hunting_information1`
    FOREIGN KEY (`hunting_information_id`)
    REFERENCES `hunting_information` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `region` ;

CREATE TABLE IF NOT EXISTS `region` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `season_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_region_season1_idx` (`season_id` ASC),
  CONSTRAINT `fk_region_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unit` ;

CREATE TABLE IF NOT EXISTS `unit` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `season_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_unit_season1_idx` (`season_id` ASC),
  CONSTRAINT `fk_unit_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_method_type_has_hunt_trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_method_type_has_hunt_trip` ;

CREATE TABLE IF NOT EXISTS `hunt_method_type_has_hunt_trip` (
  `hunt_method_type_id` INT NOT NULL,
  `hunt_trip_id` INT NOT NULL,
  PRIMARY KEY (`hunt_method_type_id`, `hunt_trip_id`),
  INDEX `fk_hunt_method_type_has_hunt_trip_hunt_trip1_idx` (`hunt_trip_id` ASC),
  INDEX `fk_hunt_method_type_has_hunt_trip_hunt_method_type1_idx` (`hunt_method_type_id` ASC),
  CONSTRAINT `fk_hunt_method_type_has_hunt_trip_hunt_method_type1`
    FOREIGN KEY (`hunt_method_type_id`)
    REFERENCES `hunt_method_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunt_method_type_has_hunt_trip_hunt_trip1`
    FOREIGN KEY (`hunt_trip_id`)
    REFERENCES `hunt_trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_trip_has_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_trip_has_state` ;

CREATE TABLE IF NOT EXISTS `hunt_trip_has_state` (
  `hunt_trip_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`hunt_trip_id`, `state_id`),
  INDEX `fk_hunt_trip_has_state_state1_idx` (`state_id` ASC),
  INDEX `fk_hunt_trip_has_state_hunt_trip1_idx` (`hunt_trip_id` ASC),
  CONSTRAINT `fk_hunt_trip_has_state_hunt_trip1`
    FOREIGN KEY (`hunt_trip_id`)
    REFERENCES `hunt_trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunt_trip_has_state_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `abbr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_has_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address_has_country` ;

CREATE TABLE IF NOT EXISTS `address_has_country` (
  `address_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`address_id`, `country_id`),
  INDEX `fk_address_has_country_country1_idx` (`country_id` ASC),
  INDEX `fk_address_has_country_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_address_has_country_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_has_country_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state_has_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state_has_country` ;

CREATE TABLE IF NOT EXISTS `state_has_country` (
  `state_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`state_id`, `country_id`),
  INDEX `fk_state_has_country_country1_idx` (`country_id` ASC),
  INDEX `fk_state_has_country_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_state_has_country_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_has_country_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `residency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `residency` ;

CREATE TABLE IF NOT EXISTS `residency` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `draw_odds_has_residency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `draw_odds_has_residency` ;

CREATE TABLE IF NOT EXISTS `draw_odds_has_residency` (
  `draw_odds_state_id` INT NOT NULL,
  `residency_id` INT NOT NULL,
  PRIMARY KEY (`draw_odds_state_id`, `residency_id`),
  INDEX `fk_draw_odds_has_residency_residency1_idx` (`residency_id` ASC),
  INDEX `fk_draw_odds_has_residency_draw_odds1_idx` (`draw_odds_state_id` ASC),
  CONSTRAINT `fk_draw_odds_has_residency_draw_odds1`
    FOREIGN KEY (`draw_odds_state_id`)
    REFERENCES `draw_odds` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_draw_odds_has_residency_residency1`
    FOREIGN KEY (`residency_id`)
    REFERENCES `residency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `species_has_draw_odds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `species_has_draw_odds` ;

CREATE TABLE IF NOT EXISTS `species_has_draw_odds` (
  `species_id` INT NOT NULL,
  `draw_odds_state_id` INT NOT NULL,
  PRIMARY KEY (`species_id`, `draw_odds_state_id`),
  INDEX `fk_species_has_draw_odds_draw_odds1_idx` (`draw_odds_state_id` ASC),
  INDEX `fk_species_has_draw_odds_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_species_has_draw_odds_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_species_has_draw_odds_draw_odds1`
    FOREIGN KEY (`draw_odds_state_id`)
    REFERENCES `draw_odds` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag_has_species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_has_species` ;

CREATE TABLE IF NOT EXISTS `tag_has_species` (
  `tag_id` INT NOT NULL,
  `species_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `species_id`),
  INDEX `fk_tag_has_species_species1_idx` (`species_id` ASC),
  INDEX `fk_tag_has_species_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_species_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_species_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_trip_has_species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_trip_has_species` ;

CREATE TABLE IF NOT EXISTS `hunt_trip_has_species` (
  `hunt_trip_id` INT NOT NULL,
  `species_id` INT NOT NULL,
  PRIMARY KEY (`hunt_trip_id`, `species_id`),
  INDEX `fk_hunt_trip_has_species_species1_idx` (`species_id` ASC),
  INDEX `fk_hunt_trip_has_species_hunt_trip1_idx` (`hunt_trip_id` ASC),
  CONSTRAINT `fk_hunt_trip_has_species_hunt_trip1`
    FOREIGN KEY (`hunt_trip_id`)
    REFERENCES `hunt_trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunt_trip_has_species_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `license_has_residency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `license_has_residency` ;

CREATE TABLE IF NOT EXISTS `license_has_residency` (
  `license_id` INT NOT NULL,
  `residency_id` INT NOT NULL,
  PRIMARY KEY (`license_id`, `residency_id`),
  INDEX `fk_license_has_residency_residency1_idx` (`residency_id` ASC),
  INDEX `fk_license_has_residency_license1_idx` (`license_id` ASC),
  CONSTRAINT `fk_license_has_residency_license1`
    FOREIGN KEY (`license_id`)
    REFERENCES `license` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_license_has_residency_residency1`
    FOREIGN KEY (`residency_id`)
    REFERENCES `residency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag_has_hunt_method_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_has_hunt_method_type` ;

CREATE TABLE IF NOT EXISTS `tag_has_hunt_method_type` (
  `tag_id` INT NOT NULL,
  `hunt_method_type_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `hunt_method_type_id`),
  INDEX `fk_tag_has_hunt_method_type_hunt_method_type1_idx` (`hunt_method_type_id` ASC),
  INDEX `fk_tag_has_hunt_method_type_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_hunt_method_type_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_hunt_method_type_hunt_method_type1`
    FOREIGN KEY (`hunt_method_type_id`)
    REFERENCES `hunt_method_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state_has_hunting_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state_has_hunting_information` ;

CREATE TABLE IF NOT EXISTS `state_has_hunting_information` (
  `state_id` INT NOT NULL,
  `hunting_information_id` INT NOT NULL,
  PRIMARY KEY (`state_id`, `hunting_information_id`),
  INDEX `fk_state_has_hunting_information_hunting_information1_idx` (`hunting_information_id` ASC),
  INDEX `fk_state_has_hunting_information_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_state_has_hunting_information_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_has_hunting_information_hunting_information1`
    FOREIGN KEY (`hunting_information_id`)
    REFERENCES `hunting_information` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season_has_hunt_method_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season_has_hunt_method_type` ;

CREATE TABLE IF NOT EXISTS `season_has_hunt_method_type` (
  `season_id` INT NOT NULL,
  `hunt_method_type_id` INT NOT NULL,
  PRIMARY KEY (`season_id`, `hunt_method_type_id`),
  INDEX `fk_season_has_hunt_method_type_hunt_method_type1_idx` (`hunt_method_type_id` ASC),
  INDEX `fk_season_has_hunt_method_type_season1_idx` (`season_id` ASC),
  CONSTRAINT `fk_season_has_hunt_method_type_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_season_has_hunt_method_type_hunt_method_type1`
    FOREIGN KEY (`hunt_method_type_id`)
    REFERENCES `hunt_method_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag_has_region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_has_region` ;

CREATE TABLE IF NOT EXISTS `tag_has_region` (
  `tag_id` INT NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `region_id`),
  INDEX `fk_tag_has_region_region1_idx` (`region_id` ASC),
  INDEX `fk_tag_has_region_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_region_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_region_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag_has_unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_has_unit` ;

CREATE TABLE IF NOT EXISTS `tag_has_unit` (
  `tag_id` INT NOT NULL,
  `unit_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `unit_id`),
  INDEX `fk_tag_has_unit_unit1_idx` (`unit_id` ASC),
  INDEX `fk_tag_has_unit_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_tag_has_unit_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_unit_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `unit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_trip_has_gear_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_trip_has_gear_list` ;

CREATE TABLE IF NOT EXISTS `hunt_trip_has_gear_list` (
  `hunt_trip_id` INT NOT NULL,
  `gear_list_id` INT NOT NULL,
  PRIMARY KEY (`hunt_trip_id`, `gear_list_id`),
  INDEX `fk_hunt_trip_has_gear_list_gear_list1_idx` (`gear_list_id` ASC),
  INDEX `fk_hunt_trip_has_gear_list_hunt_trip1_idx` (`hunt_trip_id` ASC),
  CONSTRAINT `fk_hunt_trip_has_gear_list_hunt_trip1`
    FOREIGN KEY (`hunt_trip_id`)
    REFERENCES `hunt_trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hunt_trip_has_gear_list_gear_list1`
    FOREIGN KEY (`gear_list_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `preference_points`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `preference_points` ;

CREATE TABLE IF NOT EXISTS `preference_points` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `amount` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_preference_points`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_preference_points` ;

CREATE TABLE IF NOT EXISTS `user_has_preference_points` (
  `user_id` INT NOT NULL,
  `preference_points_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `preference_points_id`),
  INDEX `fk_user_has_preference_points_preference_points1_idx` (`preference_points_id` ASC),
  INDEX `fk_user_has_preference_points_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_preference_points_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_preference_points_preference_points1`
    FOREIGN KEY (`preference_points_id`)
    REFERENCES `preference_points` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state_has_preference_points`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state_has_preference_points` ;

CREATE TABLE IF NOT EXISTS `state_has_preference_points` (
  `state_id` INT NOT NULL,
  `preference_points_id` INT NOT NULL,
  PRIMARY KEY (`state_id`, `preference_points_id`),
  INDEX `fk_state_has_preference_points_preference_points1_idx` (`preference_points_id` ASC),
  INDEX `fk_state_has_preference_points_state1_idx` (`state_id` ASC),
  CONSTRAINT `fk_state_has_preference_points_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_has_preference_points_preference_points1`
    FOREIGN KEY (`preference_points_id`)
    REFERENCES `preference_points` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pistol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pistol` ;

CREATE TABLE IF NOT EXISTS `Pistol` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `caliber` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `weapon_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pistol_weapon1_idx` (`weapon_id` ASC),
  CONSTRAINT `fk_Pistol_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `layer_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `layer_category` ;

CREATE TABLE IF NOT EXISTS `layer_category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `clothing_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_layer_category_clothing1_idx` (`clothing_id` ASC),
  CONSTRAINT `fk_layer_category_clothing1`
    FOREIGN KEY (`clothing_id`)
    REFERENCES `clothing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `top`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `top` ;

CREATE TABLE IF NOT EXISTS `top` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_top_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_top_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bottom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bottom` ;

CREATE TABLE IF NOT EXISTS `bottom` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bottom_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_bottom_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `underwear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `underwear` ;

CREATE TABLE IF NOT EXISTS `underwear` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_underwear_layer_category1_idx` (`amount` ASC),
  CONSTRAINT `fk_underwear_layer_category1`
    FOREIGN KEY (`amount`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rain_bottom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rain_bottom` ;

CREATE TABLE IF NOT EXISTS `rain_bottom` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rain_bottom_layer_category2_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_rain_bottom_layer_category2`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rain_top`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rain_top` ;

CREATE TABLE IF NOT EXISTS `rain_top` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rain_bottom_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_rain_bottom_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `socks` ;

CREATE TABLE IF NOT EXISTS `socks` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `amount` INT NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_socks_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_socks_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `headwear`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `headwear` ;

CREATE TABLE IF NOT EXISTS `headwear` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_headwear_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_headwear_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `leg_gaiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `leg_gaiter` ;

CREATE TABLE IF NOT EXISTS `leg_gaiter` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_leg_gaiter_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_leg_gaiter_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `top_copy2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `top_copy2` ;

CREATE TABLE IF NOT EXISTS `top_copy2` (
  `1` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `watch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `watch` ;

CREATE TABLE IF NOT EXISTS `watch` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `layer_category_1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_watch_layer_category1_idx` (`layer_category_1` ASC),
  CONSTRAINT `fk_watch_layer_category1`
    FOREIGN KEY (`layer_category_1`)
    REFERENCES `layer_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `items_worn_has_clothing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `items_worn_has_clothing` ;

CREATE TABLE IF NOT EXISTS `items_worn_has_clothing` (
  `items_worn_id` INT NOT NULL,
  `clothing_id` INT NOT NULL,
  PRIMARY KEY (`items_worn_id`, `clothing_id`),
  INDEX `fk_items_worn_has_clothing_clothing1_idx` (`clothing_id` ASC),
  INDEX `fk_items_worn_has_clothing_items_worn1_idx` (`items_worn_id` ASC),
  CONSTRAINT `fk_items_worn_has_clothing_items_worn1`
    FOREIGN KEY (`items_worn_id`)
    REFERENCES `items_worn` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_worn_has_clothing_clothing1`
    FOREIGN KEY (`clothing_id`)
    REFERENCES `clothing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes_packed_has_clothing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothes_packed_has_clothing` ;

CREATE TABLE IF NOT EXISTS `clothes_packed_has_clothing` (
  `clothes_packed_id` INT NOT NULL,
  `clothing_id` INT NOT NULL,
  PRIMARY KEY (`clothes_packed_id`, `clothing_id`),
  INDEX `fk_clothes_packed_has_clothing_clothing1_idx` (`clothing_id` ASC),
  INDEX `fk_clothes_packed_has_clothing_clothes_packed1_idx` (`clothes_packed_id` ASC),
  CONSTRAINT `fk_clothes_packed_has_clothing_clothes_packed1`
    FOREIGN KEY (`clothes_packed_id`)
    REFERENCES `clothes_packed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clothes_packed_has_clothing_clothing1`
    FOREIGN KEY (`clothing_id`)
    REFERENCES `clothing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS outboundadmin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'outboundadmin'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'outboundadmin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `role`, `description`, `phone`) VALUES (1, 'lpaladini', 'password', 'lucas', 'paladini', 'lpaladini@me.com', 'ADMIN', 'I like to hunt', '(509) 993-8866');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_trip` (`id`, `name`, `start_date`, `end_date`, `description`, `success`) VALUES (1, 'Fall Antelope Hunt', NULL, NULL, 'Wyoming Hunt in the fall for antelope and mule deer', 1);
INSERT INTO `hunt_trip` (`id`, `name`, `start_date`, `end_date`, `description`, `success`) VALUES (2, 'Mule Deer Fall Hunt', NULL, NULL, 'Hunting Mule Deer in Colorado', 0);
INSERT INTO `hunt_trip` (`id`, `name`, `start_date`, `end_date`, `description`, `success`) VALUES (3, 'Black Bear Spring Hunt ', NULL, NULL, 'Alaskan Black bear hunt in the spring', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `gear_list`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `gear_list` (`id`, `description`) VALUES (1, 'Antelope Hunt Gear List');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothing`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `clothing` (`id`, `items_worn`, `items_packed`, `description`) VALUES (1, 0, 1, 'List of clothes for antelope hunt packed');
INSERT INTO `clothing` (`id`, `items_worn`, `items_packed`, `description`) VALUES (2, 1, 0, 'List of clothes for antelope hunt worn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `state`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `state` (`id`, `name`, `abbr`) VALUES (1, 'Alaska', 'AK');
INSERT INTO `state` (`id`, `name`, `abbr`) VALUES (2, 'Colorado', 'CO');
INSERT INTO `state` (`id`, `name`, `abbr`) VALUES (3, 'Washington', 'WA');
INSERT INTO `state` (`id`, `name`, `abbr`) VALUES (4, 'Wyoming', 'WY');
INSERT INTO `state` (`id`, `name`, `abbr`) VALUES (5, 'Nebraska', 'NE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `license`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `license` (`id`, `license_number`, `year`, `type`, `from_date`, `end_date`, `purchase_date`, `user_id`, `sportsmans_number`, `state_id`) VALUES (1, 'LN 21162119583', 2021, 'general', NULL, NULL, NULL, 1, 2064906149, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `weapon` (`id`, `description`, `gear_list_id`) VALUES (1, 'Rifle', 1);
INSERT INTO `weapon` (`id`, `description`, `gear_list_id`) VALUES (2, 'Bow', 1);
INSERT INTO `weapon` (`id`, `description`, `gear_list_id`) VALUES (3, 'Pistol', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `first_aid`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `first_aid` (`id`, `item_name`, `description`, `gear_list_id`) VALUES (1, 'Basic First Aid Kit', 'First Aid Essentials', 1);
INSERT INTO `first_aid` (`id`, `item_name`, `description`, `gear_list_id`) VALUES (2, 'Tourniquet', 'To stop blood flow', 1);
INSERT INTO `first_aid` (`id`, `item_name`, `description`, `gear_list_id`) VALUES (3, 'Blood Clot Powder', 'to clot blood on open wounds', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sleeping_gear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `sleeping_gear` (`id`, `sleeping_bag`, `shelter`, `ground_sheet`, `sleeping_pad`, `tent_pole`, `tent_stakes`, `stuff_sack`, `gear_id`, `description`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `items_worn`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `items_worn` (`id`, `description`) VALUES (1, 'Clothes worn');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothes_packed`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `clothes_packed` (`id`, `description`) VALUES (1, 'Clothes in pack');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optics`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `optics` (`id`, `spotting_scope`, `binoculars`, `range_finder`, `bino_adapter`, `lens_cloth`, `tripod`, `phone_adapater`, `bino_harness`, `gear_id`) VALUES (1, 'vortex', 'vortex', 'vortex', 'vortex', 'random', 'vortex carbon', 'random', 'kuiu', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `backpack`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `backpack` (`id`, `pack`, `rain_cover`, `description`, `gear_id`) VALUES (1, 'Striker Kifaru', 'Striker Kifaru', 'short day pack', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `misc_gear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `misc_gear` (`id`, `item`, `description`, `gear_id`) VALUES (1, 'Black Diamond', 'light weight black dimond trekking poles', 1);
INSERT INTO `misc_gear` (`id`, `item`, `description`, `gear_id`) VALUES (2, 'Spot Locator', 'gps locating deviced for emergencies', 1);
INSERT INTO `misc_gear` (`id`, `item`, `description`, `gear_id`) VALUES (3, 'Bear Spray', 'Bear protection', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rifle`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `rifle` (`id`, `caliber`, `name`, `type`, `weapon_id`, `description`) VALUES (1, '.308', 'Savage Axis 2', 'bolt action', 1, 'Hunting rifle');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bow`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `bow` (`id`, `name`, `bow_harness`, `arrows`, `broadheads`, `weapon_id`, `description`) VALUES (1, 'Matthew Vertix', 'Kuiu', 'Easton', 'G2', 2, 'My overall hunting bow for all hunts');

COMMIT;


-- -----------------------------------------------------
-- Data for table `weather`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `weather` (`id`, `name`, `description`) VALUES (1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cook_kit`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `cook_kit` (`id`, `item`, `description`, `amount`, `gear_id`) VALUES (1, 'Jetboil', 'jetboil kit for cooking', 1, 1);
INSERT INTO `cook_kit` (`id`, `item`, `description`, `amount`, `gear_id`) VALUES (2, 'fuel', 'jet boil fuel', 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `food`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `food` (`id`, `item_name`, `description`, `amount`, `gear_list_id`) VALUES (1, 'freeze dried meals', 'breakfast, lunch and dinner meals- freeze dried', 10, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_gear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `user_has_gear` (`user_id`, `gear_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `tag` (`id`, `name`, `description`, `license_id`, `tag_number`) VALUES (1, 'Antelope/ Pronghorn', 'antelope for bow season in fall in wyoming', 1, 028810);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `address` (`id`, `address`, `address2`, `city`, `state`, `postal_code`, `user_id`) VALUES (1, '28818 N Hardesty Rd', NULL, 'Chattaroy', 'Washington', '99003', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `draw_odds`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `draw_odds` (`id`, `name`, `description`, `state_id`) VALUES ('1', 'Black Bear', 'Black Bear Draw Odds for non residents', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunting_information`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunting_information` (`id`, `name`, `description`) VALUES (1, 'Hunt Information', 'General');

COMMIT;


-- -----------------------------------------------------
-- Data for table `species`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `species` (`id`, `name`, `description`) VALUES (1, 'Black Bear', 'black bear ');
INSERT INTO `species` (`id`, `name`, `description`) VALUES (2, 'Brown Bear', 'brown bear');
INSERT INTO `species` (`id`, `name`, `description`) VALUES (3, 'Moose', 'moose');
INSERT INTO `species` (`id`, `name`, `description`) VALUES (4, 'Mule Deer', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (5, 'White Tail Deer', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (6, 'Black Tail Deer', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (7, 'Dall Sheep', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (8, 'Rocky Mountain Goat', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (9, 'Roosevelt Elk', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (10, 'Rock Mountain Elk', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (11, 'Caribou', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (12, 'Bison', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (13, 'Pronghorn', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (14, 'Auodad', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (15, 'Muskox', NULL);
INSERT INTO `species` (`id`, `name`, `description`) VALUES (16, 'Bighorn Sheep', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_user` (`hunt_trip_id`, `user_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_method_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_method_type` (`id`, `name`, `description`) VALUES (1, 'Archery', 'The use of a compound, recurve, or cross bow while hunting.');
INSERT INTO `hunt_method_type` (`id`, `name`, `description`) VALUES (2, 'Modern Firearm', 'The use of a modern firearm while hunting.');
INSERT INTO `hunt_method_type` (`id`, `name`, `description`) VALUES (3, 'Muzzle Loader', 'The use of a muzzle loader while hunting');

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (1, 'Youth General', 'youth general hunt', 1);
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (2, 'Youth Late', 'youth late hunt', 1);
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (3, 'General', 'general hunt', 1);
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (4, 'Late General', 'late general hunt', 1);
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (5, 'Hunters Over 65 or Disabled', 'general hunt', 1);
INSERT INTO `season` (`id`, `name`, `description`, `hunting_information_id`) VALUES (6, 'Early General', 'early general season hunt', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `region`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `region` (`id`, `name`, `description`, `season_id`) VALUES (1, 'Hunt Region', 'hunt region if applicable', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `unit`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `unit` (`id`, `name`, `description`, `season_id`) VALUES (1, 'Hunt Unit 22', 'Hunt Area 22', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_method_type_has_hunt_trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (1, 1);
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (1, 2);
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (1, 3);
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (2, 1);
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (2, 2);
INSERT INTO `hunt_method_type_has_hunt_trip` (`hunt_method_type_id`, `hunt_trip_id`) VALUES (2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `country` (`id`, `name`, `abbr`) VALUES (1, 'United States of America', 'US');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address_has_country`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `address_has_country` (`address_id`, `country_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `state_has_country`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `state_has_country` (`state_id`, `country_id`) VALUES (1, 1);
INSERT INTO `state_has_country` (`state_id`, `country_id`) VALUES (2, 1);
INSERT INTO `state_has_country` (`state_id`, `country_id`) VALUES (3, 1);
INSERT INTO `state_has_country` (`state_id`, `country_id`) VALUES (4, 1);
INSERT INTO `state_has_country` (`state_id`, `country_id`) VALUES (5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `residency`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `residency` (`id`, `title`) VALUES (1, 'Resident');
INSERT INTO `residency` (`id`, `title`) VALUES (2, 'Non-Resident');

COMMIT;


-- -----------------------------------------------------
-- Data for table `draw_odds_has_residency`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `draw_odds_has_residency` (`draw_odds_state_id`, `residency_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `species_has_draw_odds`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `species_has_draw_odds` (`species_id`, `draw_odds_state_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag_has_species`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `tag_has_species` (`tag_id`, `species_id`) VALUES (1, 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_trip_has_species`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_trip_has_species` (`hunt_trip_id`, `species_id`) VALUES (1, 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `license_has_residency`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `license_has_residency` (`license_id`, `residency_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag_has_hunt_method_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `tag_has_hunt_method_type` (`tag_id`, `hunt_method_type_id`) VALUES (1, 1);
INSERT INTO `tag_has_hunt_method_type` (`tag_id`, `hunt_method_type_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `state_has_hunting_information`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `state_has_hunting_information` (`state_id`, `hunting_information_id`) VALUES (4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `season_has_hunt_method_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `season_has_hunt_method_type` (`season_id`, `hunt_method_type_id`) VALUES (1, 1);
INSERT INTO `season_has_hunt_method_type` (`season_id`, `hunt_method_type_id`) VALUES (1, 2);
INSERT INTO `season_has_hunt_method_type` (`season_id`, `hunt_method_type_id`) VALUES (1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag_has_region`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `tag_has_region` (`tag_id`, `region_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag_has_unit`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `tag_has_unit` (`tag_id`, `unit_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_trip_has_gear_list`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_trip_has_gear_list` (`hunt_trip_id`, `gear_list_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `preference_points`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `preference_points` (`id`, `name`, `description`, `amount`) VALUES (1, 'Mule Deer', 'preference points', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_preference_points`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `user_has_preference_points` (`user_id`, `preference_points_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `state_has_preference_points`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `state_has_preference_points` (`state_id`, `preference_points_id`) VALUES (4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pistol`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `Pistol` (`id`, `name`, `caliber`, `type`, `description`, `weapon_id`) VALUES (1, NULL, NULL, NULL, NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `layer_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (1, 'Under Layer', 'Under layer packed', 1);
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (2, 'Mid Layer', 'Mid layer packed', 1);
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (3, 'Outer Layer', 'Outer layer packed', 1);
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (4, 'Under Layer', 'Under layer worn', 2);
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (5, 'Mid Layer', 'Mid layer worn', 2);
INSERT INTO `layer_category` (`id`, `name`, `description`, `clothing_id`) VALUES (6, 'Outer Layer', 'Outer layer worn', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `top`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `top` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First Lite henley', 'underlayer', 1);
INSERT INTO `top` (`id`, `name`, `description`, `layer_category_1`) VALUES (2, 'First Lite  sweater', 'mid layer sweater for warmth', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bottom`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `bottom` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First Lite zip off long johns', 'under layer long jobs for zip off quickly', 1);
INSERT INTO `bottom` (`id`, `name`, `description`, `layer_category_1`) VALUES (2, 'First Lite pants', 'water resistant pants', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `underwear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `underwear` (`id`, `name`, `description`, `amount`) VALUES (1, 'First Lite underwear', 'lightweight moisture wicking underwear', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rain_bottom`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `rain_bottom` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First Lite Rain pants', 'water proof rain pants', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rain_top`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `rain_top` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First lite thunder storm rain jacket', 'water proof rain jacket', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `socks`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `socks` (`id`, `name`, `description`, `amount`, `layer_category_1`) VALUES (1, 'Smart Wool', 'mositure wicking socks', 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `headwear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `headwear` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First Lite Hat', 'First Lite hat- brown', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `leg_gaiter`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `leg_gaiter` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'First Lite  leg gatiers', 'gaiters to keep boots, socks and bottoms of pants dry and dirt free', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `watch`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `watch` (`id`, `name`, `description`, `layer_category_1`) VALUES (1, 'Garmin Felix 9', 'GPS garmin watch', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `items_worn_has_clothing`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `items_worn_has_clothing` (`items_worn_id`, `clothing_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothes_packed_has_clothing`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `clothes_packed_has_clothing` (`clothes_packed_id`, `clothing_id`) VALUES (1, 1);

COMMIT;

