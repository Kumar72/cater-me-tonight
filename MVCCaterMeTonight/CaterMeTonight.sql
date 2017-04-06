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
  `status` TINYINT(1) NOT NULL,
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
  `status` VARCHAR(15) NOT NULL DEFAULT 'client',
  `phone` VARCHAR(20) NULL,
  `picture_url` VARCHAR(1000) NULL,
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
  `description` VARCHAR(500) NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `picture_url` VARCHAR(100) NULL,
  `kitchen_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `status` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_course_idx` (`course_id` ASC),
  CONSTRAINT `fk_item_kitchen`
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
  `creditcard_number` VARCHAR(16) NOT NULL,
  `security_code` INT NOT NULL,
  `user_id` INT NOT NULL,
  `billing_address_id` INT NOT NULL,
  `expiration_month` VARCHAR(2) NOT NULL,
  `expiration_year` VARCHAR(4) NOT NULL,
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
  `kitchen_id` INT NOT NULL,
  `appetizer` TINYINT(1) NULL,
  `entree` TINYINT(1) NULL,
  `dessert` TINYINT(1) NULL,
  `drink` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_place_order_user1_idx` (`user_id` ASC),
  INDEX `fk_place_order_address1_idx` (`delivery_address_id` ASC),
  INDEX `fk_place_order_creditcard1_idx` (`creditcard_id` ASC),
  INDEX `fk_placed_order_kitchen1_idx` (`kitchen_id` ASC),
  CONSTRAINT `fk_place_order_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_order_address`
    FOREIGN KEY (`delivery_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_order_creditcard`
    FOREIGN KEY (`creditcard_id`)
    REFERENCES `creditcard` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_placed_order_kitchen`
    FOREIGN KEY (`kitchen_id`)
    REFERENCES `kitchen` (`id`)
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
  `total` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_item_place_order1_idx` (`placed_order_id` ASC),
  INDEX `fk_order_item_menu_item1_idx` (`menu_item_id` ASC),
  CONSTRAINT `fk_order_item_place_order`
    FOREIGN KEY (`placed_order_id`)
    REFERENCES `placed_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_menu_item`
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
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`, `status`) VALUES (1, 'French', 'French cuisine consists of the cooking traditions and practices from France.', DEFAULT, true);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`, `status`) VALUES (2, 'Indian', 'Indian cuisine encompasses a wide variety of regional and traditional cuisines native to India.', DEFAULT, true);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`, `status`) VALUES (3, 'Mexican', 'Mexican cuisine is primarily a fusion of indigenous Mesoamerican cooking with European.', DEFAULT, true);
INSERT INTO `kitchen` (`id`, `name`, `description`, `picture_url`, `status`) VALUES (4, 'Japanese', 'Japanese cuisine encompasses the regional and traditional foods of Japan.', DEFAULT, true);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (1, 'vichandan@gmail.com', 'Kumar72', 'admin', 'Chandan', 'Thakur', 'admin', '123-332-3333', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (2, 'email4chandan@yahoo.com', 'Crank72', 'client', 'Aryan', 'Kumar', 'client', '2222222222', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (3, 'student@sd9.com', 'student', 'student', 'Event', 'Planner', 'client', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (4, 'admin@sd9.com', 'admin', 'admin', 'Admin', 'Test', 'admin', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (DEFAULT, 'shaundashjian@yahoo.com', 'shaun', 'shaun', 'Shaun', 'Dashjian', 'client', '970-310-8780', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `status`, `phone`, `picture_url`) VALUES (DEFAULT, 'sfullersywn@gmail.com', 'sfuller', 'stefan', 'Stefan', 'Fuller', 'client', '303 333-3333', NULL);

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
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (1, 'Soup du Jour', 'A soup offered by a restaurant on a particular day.', 7, 'http://www.wildfowlmag.com/files/2015/03/duck_soup_du_jour_f.jpg', 1, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (2, 'Grand Marnier Beignets', 'Pastries made from deep-fried dough with fruit or vegetable filling.', 5, 'http://www.zencancook.com/wp-content/uploads/2009/12/quince-beignet-8.jpg', 1, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (3, 'Samosa', 'a triangular savory pastry fried in ghee or oil, containing spiced vegetables or meat.', 4.99, 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Samosachutney.jpg',  2, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (4, 'Tawa Chicken', 'Chicken Tawa Masala Recipe is the famous Indian Chicken Dish of Punjabi Cuisine. Marinated and roasted Tandoori Chicken Pieces are cooked in Spicy Gravy and homemade Garam Masala Powder. ', 9.99, 'http://4.bp.blogspot.com/-qdXxP5qjDQc/VYROuXV22II/AAAAAAADBEI/FrsKn02WLIs/s1600/1.JPG', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (5, 'Chicken Quesadilla', 'A grilled tortilla, usually a corn tortilla or a wheat tortilla, which is filled with cheese and chicken.', 9.29, 'http://assets3.sparkpeople.com/blog_photos/content/appquesadilla.jpg', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (6, 'Mild and Spicy Queso', 'You know what we like? Cheese. You know how we like it? Melted. Well, fine, we like cheese every way we can get it, but melted cheese is an especially intense passion of ours. And though none of us are particularly attached to what happens during the NFL season/postseason, it usually means queso — and, friends, queso season is upon us.', 6.99, 'http://3.bp.blogspot.com/-gFEJXMkuKB8/U1083ehu80I/AAAAAAAAXcY/dIfYxqgIy18/s1600/spicy+queso+dip+(1).jpg', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (7, 'Chicken Fajitas', 'A dish of Mexican origin consisting of strips of spiced beef or chicken, chopped vegetables, and grated cheese, wrapped in a soft tortilla and often served with sour cream.', 27.99, 'http://assets.simplyrecipes.com/wp-content/uploads/2015/04/chicken-fajitas-horiz-b-1200.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (8, 'California Roll', 'A California roll or California maki is a makizushi sushi roll, usually made inside-out, containing cucumber, crab meat or imitation crab, and avocado. Sometimes crab salad is substituted for the crab stick, and often the outer layer of rice in an inside-out roll (uramaki ) is sprinkled with toasted sesame seeds, tobiko or masago (capelin roe).', 6.99, 'http://www.japanesecooking101.com/wp-content/uploads/2012/02/IMG_6318-1024x682.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (9, 'Yaki Udon', 'Yaki Udon (焼きうどん) is stir fried udon noodles with meat and vegetables, very similar to another Japanese stir fried noodle dish called Yakisoba (焼きそば) as they uses almost same ingredients besides noodles.', 8.50, 'https://www.bbcgoodfood.com/sites/default/files/recipe_images/yaki-udon.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (10, 'Chevre Cheesecake', 'Chèvre, or goat cheese, flavors this savory appetizer, baked to resemble a dessert cheesecake. Topped with strips of sun-dried tomatoes, Chèvre Cheesecake makes an eye-catching centerpiece for any hors d\'oeuvres table.', 10.99, 'http://www.janssushibar.com/wp-content/uploads/2011/07/Chevre-Cheesecake.jpg', 1, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (11, 'Dosa', 'Dosa is a type of pancake made from a fermented batter. ... Dosa is a typical part of the South Indian diet and popular all over the Indian subcontinent. Traditionally, Dosa is served hot along with sambar, stuffing of potatoes or paneer and chutney.', 11.99, 'https://static01.nyt.com/images/2015/01/28/dining/28KITCHEN1/28KITCHEN1-superJumbo.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (12, 'Cinnabon', 'A cinnimon bun the size of a beanbag chair. ', 4.99, 'https://s3.amazonaws.com/offer-engine/cinnabon-x067925/merchant_profile_%22hero%22_image_slide.4_(retina).png', 3, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (13, 'Cinnamental', 'A zesty cinnamony drink! Like drinking cinnamon', 11.99, 'http://files.shandymedia.com/images/body/thesavory/4_-_Tumblr.png', 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (14, 'Sockeye Salmon', 'Salmon oven baked to perfection. Garnished with a tart lemon butter sauce. ', 16.99, 'https://s-media-cache-ak0.pinimg.com/736x/d5/db/d6/d5dbd6c8c72a5d571761dd265f78875d.jpg', 1, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (15, 'Mango Lasi', 'Mango Lassi is a cold drink consisting of sweetened kesar mango pulp mixed with yogurt, cream, or ice cream.', 4.99, 'http://farm5.static.flickr.com/4083/5005619856_56fc670f06.jpg', 2, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (16, 'Porto Jalisco', 'A fruity blend of delightfulness ', 12.00, 'http://cocktaildudes.com/wp-content/uploads/2013/04/KO7A1814.jpg', 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (17, 'Chicken Tikka Masala', 'A tomato and coriander sauce is common, but no recipe for chicken tikka masala is standard; a survey found that of 48 different recipes, the only common ingredient was chicken. The sauce usually includes tomatoes (frequently as purée), cream, coconut cream, and various spices.', 14.95, 'http://assets.epicurious.com/photos/54af56b3c4a891cc44cceb29/master/pass/51171400_chicken-tikka-masala_1x1.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (18, 'Camarones Baja', 'There are several traditional ways that tacos are cooked in Mexico and filling a \"pre-manufactured store bought crunchy taco shell\" with greasy ground beef is not one of them!  Today\'s Baja style Shrimp Taco recipe is a grilled taco.  The flour tortilla is first placed on a hot flat top grill.  The ingredients placed on the tortilla, then the tortilla is grilled crisp.  Grilled flour tortilla tacos like this are often sold to tourists in Baja California.  For the most part, flour tortillas are tourist food.', 12.99, 'https://1.bp.blogspot.com/-Q5gF3EHmG9Q/VUJj9o9uPTI/AAAAAAACXAs/3SGSTrCHxk8/s1600/DSCN8773.JPG', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (19, 'Chicken Teriyaki', 'Teriyaki is derived from the Japanese root words teri, to shine, and yaki, to broil or grill. That’s the way traditional teriyaki looks: shiny and incised with grill marks. In Japan, teriyaki is a mix of soy sauce, sake and the rice wine mirin, which imparts a subtle sweetness. The teriyaki found throughout Seattle, of which this is an adaptation, is a bit more showy. Cooks sweeten with white sugar and pineapple juice. They thicken with cornstarch. Ginger and garlic go into the mix because of the Korean ancestry of many cooks. It is not at all traditional, but it is simple to prepare and addictive to eat.', 9.45, 'http://rasamalaysia.com/wp-content/uploads/2016/03/chicken-teriyaki-thumb.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (20, 'Edamame', 'Edamame is a delightful \"little bite,\" easy to prepare and fun to eat. The edamame (edible soybean) is high in protein and has a nutty flavor. There are many other edamame recipes you can enjoy, which include side dishes, salads, and snacks.', 2.95, 'http://files.recipetips.com/images/recipe/appetizers_and_snacks/edamame.jpg', 4, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (21, 'Kimchi', 'Kimchi is a traditional Korean dish made of seasoned vegetables and salt. Koreans eat it at nearly every meal. It can be fresh, like a salad, or it can be fermented. While the most popular variety is spicy kimchi made of cabbage, there are hundreds of different types of kimchi made of different vegetables, and not all of them spicy. Kimchi is also a main ingredient in many other Korean dishes.', 1.00, 'https://www.maangchi.com/wp-content/uploads/2011/08/1plate.jpg', 4, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (22, 'Chicken Beef Enchiladas', 'An enchilada is a corn tortilla rolled around a filling and covered with a chili pepper sauce. Enchiladas can be filled with a variety of ingredients, including meat, cheese, beans, potatoes, vegetables or combinations.', 13.29, 'http://recipegreat.com/images/beef-or-chicken-enchiladas-03.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (23, 'Lamb Madras', 'A Madras curry in the UK has a reputation of being somewhat of a one trick pony, a real fiery beast and not a lot else… However my lamb Madras curry has a little more about it but it certainly retains a fierce heat from both our own dried chili (cayenne) and lots of black pepper and all of it tempered with coconut milk.', 15.95, 'http://www.krumpli.co.uk/wp-content/uploads/2016/02/Lamb-Madras-Curry-Sq-1.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (24, 'Ras Malai', 'Ras Malai is a Bengali delicacy made with spongy cottage cheese balls dunked into aromatic milk syupr known as \'Ras\'. It is one of the best Indian sweet desserts.', 4.95, 'http://www.rachnas-kitchen.com/wp-content/uploads/2016/02/image-4.jpeg', 2, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (25, 'Eggnog Creme Brulee', 'Crème brûlée enriched with a little homemade eggnog is a surprisingly easy dessert, and a festively sweet way to celebrate the holidays.', 8.00,'https://www.chowstatic.com/assets/recipe_photos/10785_eggnog_creme_brulee.jpg', 1, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (26, '& Everything Nice', 'A super awesome nice drink! ', 12.00, 'http://www.austinmonthly.com/images/cache/cache_a/cache_2/cache_f/Pour3040-1fa02f2a.jpeg?ver=1486425925&aspectratio=0.6677796327212', 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (27, 'Lamb Boti Kabab', 'Cubes of lamb marinated in yogurt, garlic, flavoured with freshly ground and blended spice. Baked to perfection in tandoor', 7.95, 'http://www.my5thelements.com/cart/wp-content/uploads/2016/02/LAMB-BOTI-KABAB.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (28, 'Chicken Biryani', 'Chicken Biryani is the most ordered and liked rice preparation in India. Here is an easy chicken biryani recipe. North or south Indian chicken biryani has its own regional recipes.', 14.95, 'http://www.indianfoodforever.com/images/chicken-biryani.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (29, 'Chimichangas', 'Forget about tasteless fillings. We simmer the chicken and rice for our chimichangas in a chipotle broth, infusing smoky bite through and through. As for construction, we noticed that the standard burrito-style wrapping method left us with doughy tortilla ends and filling that fell out. ', 11.99, 'http://cookdiary.net/wp-content/uploads/images/Chimichangas_14087.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (30, 'Dango', 'Dango (団子?) is a Japanese dumpling and sweet made from mochiko (rice flour),[1] related to mochi. It is often served with green tea. Dango is eaten year-round, but the different varieties are traditionally eaten in given seasons. Three to four dango are often served on a skewer.', 4.00, 'http://www.japanesecooking101.com/wp-content/uploads/2016/11/IMG_9331.jpg', 4, 3, true);

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
INSERT INTO `creditcard` (`id`, `full_name`, `creditcard_number`, `security_code`, `user_id`, `billing_address_id`, `expiration_month`, `expiration_year`) VALUES (1, 'Chandan K Thakur', '1232122222233456', 321, 1, 1, '02', '2019');
INSERT INTO `creditcard` (`id`, `full_name`, `creditcard_number`, `security_code`, `user_id`, `billing_address_id`, `expiration_month`, `expiration_year`) VALUES (2, 'Chandan K Thakur', '1123457689076567', 123, 1, 2, '07', '2020');
INSERT INTO `creditcard` (`id`, `full_name`, `creditcard_number`, `security_code`, `user_id`, `billing_address_id`, `expiration_month`, `expiration_year`) VALUES (3, 'Student Studentson', '1111222233334444', 123, 3, 3, '09', '2021');
INSERT INTO `creditcard` (`id`, `full_name`, `creditcard_number`, `security_code`, `user_id`, `billing_address_id`, `expiration_month`, `expiration_year`) VALUES (4, 'Student Studentson', '1122334455667788', 123, 3, 4, '01', '2022');

COMMIT;


-- -----------------------------------------------------
-- Data for table `placed_order`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `placed_order` (`id`, `date_created`, `user_id`, `delivery_address_id`, `creditcard_id`, `kitchen_id`, `appetizer`, `entree`, `dessert`, `drink`) VALUES (1, '2017-4-5', 1, 1, 1, 1, true, true, false, false);
INSERT INTO `placed_order` (`id`, `date_created`, `user_id`, `delivery_address_id`, `creditcard_id`, `kitchen_id`, `appetizer`, `entree`, `dessert`, `drink`) VALUES (2, '2017-4-5', 2, 2, 2, 3, true, true, true, false);

COMMIT;


-- -----------------------------------------------------
-- Data for table `order_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `catermetonight`;
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`, `total`) VALUES (1, 'First Item', 2, 1, 1, 14);
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`, `total`) VALUES (2, 'Second Item', 3, 2, 2, 15);
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`, `total`) VALUES (3, 'Third Item', 2, 1, 3, 9.98);
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`, `total`) VALUES (4, 'Fourth Item', 3, 1, 4, 29.97);
INSERT INTO `order_item` (`id`, `comment`, `quantity`, `placed_order_id`, `menu_item_id`, `total`) VALUES (5, 'Fifth Item', 3, 2, 6, 20.97);

COMMIT;
