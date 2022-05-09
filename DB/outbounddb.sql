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
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hunt_trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hunt_trip` ;

CREATE TABLE IF NOT EXISTS `hunt_trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  `hunter_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hunt_trip_hunter_idx` (`hunter_id` ASC),
  CONSTRAINT `fk_hunt_trip_hunter`
    FOREIGN KEY (`hunter_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gear_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gear_list` ;

CREATE TABLE IF NOT EXISTS `gear_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothing` ;

CREATE TABLE IF NOT EXISTS `clothing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clothing_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_clothing_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `permits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permits` ;

CREATE TABLE IF NOT EXISTS `permits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license_number` INT NULL,
  `tag_number` INT NULL,
  `items` VARCHAR(45) NULL,
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permits_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_permits_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weapon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weapon` ;

CREATE TABLE IF NOT EXISTS `weapon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` INT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weapon_gear1_idx` (`type` ASC),
  CONSTRAINT `fk_weapon_gear1`
    FOREIGN KEY (`type`)
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
  `items` VARCHAR(45) NULL,
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_first_aid_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_first_aid_gear1`
    FOREIGN KEY (`gear_id`)
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
  `description` VARCHAR(45) NULL,
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
  `top` VARCHAR(45) NULL,
  `bottoms` VARCHAR(45) NULL,
  `socks` VARCHAR(45) NULL,
  `hat` VARCHAR(45) NULL,
  `belt` VARCHAR(45) NULL,
  `gloves` VARCHAR(45) NULL,
  `watch` VARCHAR(45) NULL,
  `underwear` VARCHAR(45) NULL,
  `clothing_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_worn_clothing1_idx` (`clothing_id` ASC),
  CONSTRAINT `fk_items_worn_clothing1`
    FOREIGN KEY (`clothing_id`)
    REFERENCES `clothing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes_packed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothes_packed` ;

CREATE TABLE IF NOT EXISTS `clothes_packed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `top` VARCHAR(45) NULL,
  `bottoms` VARCHAR(45) NULL,
  `socks` VARCHAR(45) NULL,
  `hat` VARCHAR(45) NULL,
  `belt` VARCHAR(45) NULL,
  `gloves` VARCHAR(45) NULL,
  `rain_top` VARCHAR(45) NULL,
  `rain_bottom` VARCHAR(45) NULL,
  `leg_gaiters` VARCHAR(45) NULL,
  `underwear` VARCHAR(45) NULL,
  `clothing_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clothes_packed_clothing1_idx` (`clothing_id` ASC),
  CONSTRAINT `fk_clothes_packed_clothing1`
    FOREIGN KEY (`clothing_id`)
    REFERENCES `clothing` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `description` VARCHAR(45) NULL,
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
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
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
  `trekking_poles` VARCHAR(45) NULL,
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
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
  `description` VARCHAR(45) NULL,
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
  `string` VARCHAR(45) NULL,
  `stablizer` VARCHAR(45) NULL,
  `arrows` VARCHAR(45) NULL,
  `quiver` VARCHAR(45) NULL,
  `rest` VARCHAR(45) NULL,
  `sight` VARCHAR(45) NULL,
  `broadheads` VARCHAR(45) NULL,
  `release` VARCHAR(45) NULL,
  `bow_sleeve` VARCHAR(45) NULL,
  `weapon_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bow_weapon1_idx` (`weapon_id` ASC),
  CONSTRAINT `fk_bow_weapon1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `weapon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
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
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
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
  `gear_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_food_gear1_idx` (`gear_id` ASC),
  CONSTRAINT `fk_food_gear1`
    FOREIGN KEY (`gear_id`)
    REFERENCES `gear_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_category_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `post_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `role`, `description`) VALUES (1, 'lpaladini', 'password', 'lucas', 'paladini', 'lpaladini@me.com', 'ADMIN', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hunt_trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `hunt_trip` (`id`, `species`, `sex`, `type`, `start_date`, `end_date`, `hunter_id`, `description`) VALUES (1, 'elk', 'bull', 'Bow', NULL, NULL, 1, NULL);
INSERT INTO `hunt_trip` (`id`, `species`, `sex`, `type`, `start_date`, `end_date`, `hunter_id`, `description`) VALUES (2, 'antelope', 'buck or doe', 'Bow', NULL, NULL, 1, NULL);
INSERT INTO `hunt_trip` (`id`, `species`, `sex`, `type`, `start_date`, `end_date`, `hunter_id`, `description`) VALUES (3, 'mule deer', 'buck or doe', 'Bow', NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `gear_list`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `gear_list` (`id`, `description`) VALUES (1, 'Elk Hunt Gear List');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothing`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `clothing` (`id`, `gear_id`, `description`) VALUES (1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `weapon` (`id`, `type`, `description`) VALUES (1, NULL, NULL);
INSERT INTO `weapon` (`id`, `type`, `description`) VALUES (2, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `first_aid`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `first_aid` (`id`, `items`, `gear_id`, `description`) VALUES (1, NULL, 1, NULL);

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
INSERT INTO `items_worn` (`id`, `top`, `bottoms`, `socks`, `hat`, `belt`, `gloves`, `watch`, `underwear`, `clothing_id`, `description`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothes_packed`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `clothes_packed` (`id`, `top`, `bottoms`, `socks`, `hat`, `belt`, `gloves`, `rain_top`, `rain_bottom`, `leg_gaiters`, `underwear`, `clothing_id`, `description`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `backpack`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `backpack` (`id`, `pack`, `rain_cover`, `gear_id`, `description`) VALUES (1, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `misc_gear`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `misc_gear` (`id`, `trekking_poles`, `gear_id`, `description`) VALUES (1, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rifle`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `rifle` (`id`, `caliber`, `name`, `type`, `weapon_id`, `description`) VALUES (1, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bow`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `bow` (`id`, `name`, `bow_harness`, `string`, `stablizer`, `arrows`, `quiver`, `rest`, `sight`, `broadheads`, `release`, `bow_sleeve`, `weapon_id`, `description`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `season`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `season` (`id`, `name`, `description`) VALUES (1, NULL, NULL);

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
INSERT INTO `cook_kit` (`id`, `gear_id`, `description`) VALUES (1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `food`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `food` (`id`, `gear_id`, `description`) VALUES (1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `post` (`id`, `name`, `description`, `title`) VALUES (1, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `category` (`id`, `name`, `description`, `post_id`) VALUES (1, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `outbounddb`;
INSERT INTO `comment` (`id`, `description`, `name`, `post_id`, `comment_id`) VALUES (1, NULL, NULL, 1, 1);

COMMIT;

