-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema catermetonight
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `catermetonight` ;

-- -----------------------------------------------------
-- Schema catermetonight
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `catermetonight` DEFAULT CHARACTER SET utf8 ;
USE `catermetonight` ;

-- -----------------------------------------------------
-- Table `kitchen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kitchen` ;

CREATE TABLE IF NOT EXISTS `kitchen` (
  `kitchen_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`kitchen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `picture` BLOB NULL,
  `last_update` VARCHAR(45) NULL,
  `status` VARCHAR(15) NULL,
  PRIMARY KEY (`user_id`));


-- -----------------------------------------------------
-- Table `appetizer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appetizer` ;

CREATE TABLE IF NOT EXISTS `appetizer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `price` DECIMAL(4,2) NULL,
  `kitchen_id` INT NOT NULL,
  PRIMARY KEY (`id`, `kitchen_id`),
  INDEX `fk_appetizer_kitchen_idx` (`kitchen_id` ASC),
  CONSTRAINT `fk_appetizer_kitchen`
    FOREIGN KEY (`kitchen_id`)
    REFERENCES `kitchen` (`kitchen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course` ;

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order` ;

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `ordered_date` DATE NOT NULL,
  `comment` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `user_id`),
  INDEX `fk_order_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu` ;

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(75) NOT NULL,
  `kitchen_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `quantity` INT NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`menu_id`, `kitchen_id`, `course_id`),
  INDEX `fk_item_course_idx` (`course_id` ASC),
  INDEX `fk_item_order1_idx` (`order_id` ASC),
  CONSTRAINT `fk_item_kitchen1`
    FOREIGN KEY (`kitchen_id`)
    REFERENCES `kitchen` (`kitchen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state` ;

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` INT NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `last_update` VARCHAR(45) NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city` ;

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `last_update` TIMESTAMP NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`city_id`, `state_id`),
  INDEX `fk_city_country1_idx` (`state_id` ASC),
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `postal_code` VARCHAR(10) NULL,
  `phone` VARCHAR(20) NOT NULL,
  `last_update` TIMESTAMP NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_Address_city1_idx` (`city_id` ASC),
  CONSTRAINT `fk_Address_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creditcard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `creditcard` ;

CREATE TABLE IF NOT EXISTS `creditcard` (
  `creditcard_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `expiration_date` DATE NOT NULL,
  `security_code` INT NOT NULL,
  `user_id` INT NOT NULL,
  `billing_address_id` INT NOT NULL,
  PRIMARY KEY (`creditcard_id`, `user_id`),
  INDEX `fk_creditcard_user1_idx` (`user_id` ASC),
  INDEX `fk_creditcard_Address1_idx` (`billing_address_id` ASC),
  CONSTRAINT `fk_creditcard_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_creditcard_Address1`
    FOREIGN KEY (`billing_address_id`)
    REFERENCES `address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kitchen`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `kitchen` (`kitchen_id`, `name`, `description`) VALUES (1, 'French', 'French cuisine consists of the cooking traditions and practices from France.');
INSERT INTO `kitchen` (`kitchen_id`, `name`, `description`) VALUES (2, 'Indian', 'Indian cuisine encompasses a wide variety of regional and traditional cuisines native to India.');
INSERT INTO `kitchen` (`kitchen_id`, `name`, `description`) VALUES (3, 'Mexican', 'Mexican cuisine is primarily a fusion of indigenous Mesoamerican cooking with European.');
INSERT INTO `kitchen` (`kitchen_id`, `name`, `description`) VALUES (4, 'Japanese', 'Japanese cuisine encompasses the regional and traditional foods of Japan.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `user` (`user_id`, `email`, `username`, `password`, `picture`, `last_update`, `status`) VALUES (1, 'vichandan@gmail.com', 'Kumar72', 'admin', NULL, NULL, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `course`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `course` (`course_id`, `name`) VALUES (1, 'Appetizer');
INSERT INTO `course` (`course_id`, `name`) VALUES (2, 'Entre');
INSERT INTO `course` (`course_id`, `name`) VALUES (3, 'Dessert');
INSERT INTO `course` (`course_id`, `name`) VALUES (4, 'Drink');

COMMIT;


-- -----------------------------------------------------
-- Data for table `order`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `order` (`order_id`, `ordered_date`, `comment`, `user_id`) VALUES (1, '2017-3-31', 'Testing SQL', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (1, 'Soup du Jour', DEFAULT, 1, 1, 7, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (2, 'Grand Marnier Beignets', DEFAULT, 1, 1, 5, 5, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (3, 'Samosa', DEFAULT,  2, 1, 4.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (4, 'Tawa Chicken', DEFAULT, 2, 2, 9.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (5, 'Chicken Quesadilla', DEFAULT, 3, 1, 9.29, 3, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (6, 'Mild and Spicy Queso', DEFAULT, 3, 1, 6.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (6, 'Rasgulla', DEFAULT, 2, 3, 5.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (7, 'Chicken Fajitas', DEFAULT, 3, 2, 27.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (8, 'California Roll', DEFAULT, 4, 2, 6.99, 3, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (9, 'Yaki Udon', DEFAULT, 4, 2, 8.50, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (10, 'Chevre Cheesecake', DEFAULT, 1, 3, 10.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (11, 'Dosa', DEFAULT, 2, 2, 11.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (12, 'Cinnabon', DEFAULT, 3, 3, 4.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (13, 'Cinnamental', DEFAULT, 1, 4, 11.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (14, 'Sockeye Salmon', DEFAULT, 1, 2, 16.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (15, 'Mango Lasi', DEFAULT, 2, 4, 4.99, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (16, 'Porto Jalisco', DEFAULT, 1, 4, 12.00, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (17, 'Chicken Ticca Masala', DEFAULT, 2, 2, 14.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (18, 'Camarones Baja', DEFAULT, 3, 1, 12.99, 3, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (19, 'Chicken Teriyaki', DEFAULT, 4, 2, 9.45, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (20, 'Edamame', DEFAULT, 4, 1, 2.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (21, 'Kimchi', DEFAULT, 4, 1, 1.00, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (22, 'Chicken Beef Enchiladas', DEFAULT, 3, 2, 13.29, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (23, 'Lamb Madras', DEFAULT, 2, 2, 15.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (24, 'Ras Malai', DEFAULT, 2, 3, 4.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (25, 'Eggnog Creme Brulee', DEFAULT, 1, 3, 8.00, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (26, '& Everything Nice', DEFAULT, 1, 4, 12.00, 3, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (27, 'Lamb Boti Kabab', DEFAULT, 2, 2, 7.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (28, 'Chicken Biryani', DEFAULT, 2, 2, 14.95, NULL, NULL);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (29, 'Chimichangas', DEFAULT, 3, 2, 11.99, 2, 1);
INSERT INTO `menu` (`menu_id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `quantity`, `order_id`) VALUES (30, 'Dango', DEFAULT, 4, 3, 4.00, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `state`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `state` (`state_id`, `state`, `last_update`) VALUES (1, 'Colorado', NULL);
INSERT INTO `state` (`state_id`, `state`, `last_update`) VALUES (2, 'North Carolina', NULL);
INSERT INTO `state` (`state_id`, `state`, `last_update`) VALUES (3, 'Texas', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `city`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (1, 'Denver', DEFAULT, 1);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (2, 'Greensboro', DEFAULT, 2);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (3, 'Boulder', DEFAULT, 1);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (4, 'Aurora', DEFAULT, 1);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (5, 'Dallas', DEFAULT, 3);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (6, 'Austin', DEFAULT, 3);
INSERT INTO `city` (`city_id`, `city`, `last_update`, `state_id`) VALUES (7, 'Waco', DEFAULT, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `address` (`address_id`, `address`, `address2`, `postal_code`, `phone`, `last_update`, `city_id`) VALUES (1, '7400 E. Orchard Rd', NULL, '80301', '303-330-5730', DEFAULT, 1);
INSERT INTO `address` (`address_id`, `address`, `address2`, `postal_code`, `phone`, `last_update`, `city_id`) VALUES (2, '7300 E. Orchard Rd', NULL, '80301', '303-338-3212', DEFAULT, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `creditcard`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `creditcard` (`creditcard_id`, `first_name`, `last_name`, `expiration_date`, `security_code`, `user_id`, `billing_address_id`) VALUES (1, 'Chandan', 'Thakur', DEFAULT, 321, 1, 1);
INSERT INTO `creditcard` (`creditcard_id`, `first_name`, `last_name`, `expiration_date`, `security_code`, `user_id`, `billing_address_id`) VALUES (2, 'Chandan', 'Thakur', DEFAULT, 123, 1, 1);

COMMIT;

