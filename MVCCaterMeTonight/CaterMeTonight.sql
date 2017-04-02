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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `picture_url` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `status` VARCHAR(15) NULL,
  `picture_url` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course` ;

CREATE TABLE IF NOT EXISTS `course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu_item` ;

CREATE TABLE IF NOT EXISTS `menu_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(75) NOT NULL,
  `kitchen_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `picture_url` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_course_idx` (`course_id` ASC),
  CONSTRAINT `fk_item_kitchen1`
    FOREIGN KEY (`kitchen_id`)
    REFERENCES `kitchen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `postal_code` VARCHAR(10) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creditcard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `creditcard` ;

CREATE TABLE IF NOT EXISTS `creditcard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(75) NOT NULL,
  `expiration_date` VARCHAR(45) NOT NULL,
  `security_code` INT NOT NULL,
  `user_id` INT NOT NULL,
  `billing_address_id` INT NOT NULL,
  `creditcard_number` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_creditcard_user1_idx` (`user_id` ASC),
  INDEX `fk_creditcard_address1_idx` (`billing_address_id` ASC),
  CONSTRAINT `fk_creditcard_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_creditcard_address1`
    FOREIGN KEY (`billing_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placed_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placed_order` ;

CREATE TABLE IF NOT EXISTS `placed_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_created` DATETIME NULL,
  `user_id` INT NOT NULL,
  `delivery_address_id` INT NOT NULL,
  `creditcard_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_place_order_user1_idx` (`user_id` ASC),
  INDEX `fk_place_order_address1_idx` (`delivery_address_id` ASC),
  INDEX `fk_place_order_creditcard1_idx` (`creditcard_id` ASC),
  CONSTRAINT `fk_place_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_order_address1`
    FOREIGN KEY (`delivery_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_order_creditcard1`
    FOREIGN KEY (`creditcard_id`)
    REFERENCES `creditcard` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `order_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `order_item` ;

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `quantity` INT NOT NULL,
  `placed_order_id` INT NOT NULL,
  `menu_item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_item_place_order1_idx` (`placed_order_id` ASC),
  INDEX `fk_order_item_menu_item1_idx` (`menu_item_id` ASC),
  CONSTRAINT `fk_order_item_place_order1`
    FOREIGN KEY (`placed_order_id`)
    REFERENCES `placed_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_menu_item1`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `menu_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kitchen`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`) VALUES (1, 'French', 'French cuisine consists of the cooking traditions and practices from France.', DEFAULT);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`) VALUES (2, 'Indian', 'Indian cuisine encompasses a wide variety of regional and traditional cuisines native to India.', DEFAULT);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`) VALUES (3, 'Mexican', 'Mexican cuisine is primarily a fusion of indigenous Mesoamerican cooking with European.', DEFAULT);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`) VALUES (4, 'Japanese', 'Japanese cuisine encompasses the regional and traditional foods of Japan.', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `picture_url`, `phone`) VALUES (1, 'vichandan@gmail.com', 'Kumar72', 'admin', 'Chandan', 'Thakur', 'admin', NULL, '123-332-3333');
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `picture_url`, `phone`) VALUES (2, 'email4chandan@yahoo.com', 'Crank72', 'client', 'Aryan', 'Kumar', 'client', NULL, '2222222222');
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `picture_url`, `phone`) VALUES (3, 'student@sd9.com', 'student', 'student', 'Event', 'Planner', 'client', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `picture_url`, `phone`) VALUES (4, 'admin@sd9.com', 'admin', 'admin', 'Admin', 'Test', 'admin', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `course`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `course` (`id`, `name`) VALUES (1, 'Appetizer');
INSERT INTO `course` (`id`, `name`) VALUES (2, 'Entre');
INSERT INTO `course` (`id`, `name`) VALUES (3, 'Dessert');
INSERT INTO `course` (`id`, `name`) VALUES (4, 'Drink');

COMMIT;


-- -----------------------------------------------------
-- Data for table `menu_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (1, 'Soup du Jour', DEFAULT, 1, 1, 7, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (2, 'Grand Marnier Beignets', DEFAULT, 1, 1, 5, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (3, 'Samosa', DEFAULT,  2, 1, 4.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (4, 'Tawa Chicken', DEFAULT, 2, 2, 9.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (5, 'Chicken Quesadilla', DEFAULT, 3, 1, 9.29, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (6, 'Mild and Spicy Queso', DEFAULT, 3, 1, 6.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (7, 'Chicken Fajitas', DEFAULT, 3, 2, 27.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (8, 'California Roll', DEFAULT, 4, 2, 6.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (9, 'Yaki Udon', DEFAULT, 4, 2, 8.50, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (10, 'Chevre Cheesecake', DEFAULT, 1, 3, 10.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (11, 'Dosa', DEFAULT, 2, 2, 11.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (12, 'Cinnabon', DEFAULT, 3, 3, 4.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (13, 'Cinnamental', DEFAULT, 1, 4, 11.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (14, 'Sockeye Salmon', DEFAULT, 1, 2, 16.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (15, 'Mango Lasi', DEFAULT, 2, 4, 4.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (16, 'Porto Jalisco', DEFAULT, 1, 4, 12.00, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (17, 'Chicken Ticca Masala', DEFAULT, 2, 2, 14.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (18, 'Camarones Baja', DEFAULT, 3, 1, 12.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (19, 'Chicken Teriyaki', DEFAULT, 4, 2, 9.45, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (20, 'Edamame', DEFAULT, 4, 1, 2.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (21, 'Kimchi', DEFAULT, 4, 1, 1.00, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (22, 'Chicken Beef Enchiladas', DEFAULT, 3, 2, 13.29, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (23, 'Lamb Madras', DEFAULT, 2, 2, 15.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (24, 'Ras Malai', DEFAULT, 2, 3, 4.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (25, 'Eggnog Creme Brulee', DEFAULT, 1, 3, 8.00, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (26, '& Everything Nice', DEFAULT, 1, 4, 12.00, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (27, 'Lamb Boti Kabab', DEFAULT, 2, 2, 7.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (28, 'Chicken Biryani', DEFAULT, 2, 2, 14.95, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (29, 'Chimichangas', DEFAULT, 3, 2, 11.99, NULL);
INSERT INTO `menu_item` (`id`, `name`, `description`, `kitchen_id`, `course_id`, `price`, `picture_url`) VALUES (30, 'Dango', DEFAULT, 4, 3, 4.00, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `address` (`id`, `address`, `address2`, `postal_code`, `city`, `state`, `country`, `user_id`) VALUES (1, '7400 E. Orchard Rd', NULL, '80301', 'Denver', 'CO', 'US', 1);
INSERT INTO `address` (`id`, `address`, `address2`, `postal_code`, `city`, `state`, `country`, `user_id`) VALUES (2, '7300 E. Orchard Rd', NULL, '80301', 'Denver', 'CO', 'US', 2);
INSERT INTO `address` (`id`, `address`, `address2`, `postal_code`, `city`, `state`, `country`, `user_id`) VALUES (3, '1st St Merlin Dr. ', NULL, '76706', 'Waco', 'TX', 'US', 3);
INSERT INTO `address` (`id`, `address`, `address2`, `postal_code`, `city`, `state`, `country`, `user_id`) VALUES (4, 'Main St', NULL, '80301', 'Boulder', 'CO', 'US', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `creditcard`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `creditcard` (`id`, `full_name`, `expiration_date`, `security_code`, `user_id`, `billing_address_id`, `creditcard_number`) VALUES (1, 'Chandan K Thakur', '2017-20', 321, 1, 1, '1232122222233456');
INSERT INTO `creditcard` (`id`, `full_name`, `expiration_date`, `security_code`, `user_id`, `billing_address_id`, `creditcard_number`) VALUES (2, 'Chandan K Thakur', '2018-20', 123, 1, 2, '1123457689076567');

COMMIT;


-- -----------------------------------------------------
-- Data for table `placed_order`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `placed_order` (`id`, `date_created`, `user_id`, `delivery_address_id`, `creditcard_id`) VALUES (1, '2017-4-2', 1, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `order_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`) VALUES (1, 'Order 1', 21, 1, 1);
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`) VALUES (2, 'Order 2', 2, 1, 2);

COMMIT;

