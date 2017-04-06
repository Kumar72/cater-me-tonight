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
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (4, 'Tawa Chicken', 'Chicken Tawa Masala Recipe is the famous Indian Chicken Dish of Punjabi Cuisine. Marinated and roasted Tandoori Chicken Pieces are cooked in Spicy Gravy and homemade Garam Masala Powder. ', 9.99, 'http://cdn.mytaste.org/i?u=http%3A%2F%2Fwww.faskitchen.com%2Fwp-content%2Fuploads%2F2016%2F03%2FTawa-Chicken-recipe-Tawa-Murgh.jpg&w=330&h=270&c=1', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (5, 'Chicken Quesadilla', 'A grilled tortilla, usually a corn tortilla or a wheat tortilla, which is filled with cheese and chicken.', 9.29, 'http://assets3.sparkpeople.com/blog_photos/content/appquesadilla.jpg', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (6, 'Mild and Spicy Queso', 'You know what we like? Cheese. You know how we like it? Melted. Well, fine, we like cheese every way we can get it, but melted cheese is an especially intense passion of ours. And though none of us are particularly attached to what happens during the NFL season/postseason, it usually means queso — and, friends, queso season is upon us.', 6.99, 'http://3.bp.blogspot.com/-gFEJXMkuKB8/U1083ehu80I/AAAAAAAAXcY/dIfYxqgIy18/s1600/spicy+queso+dip+(1).jpg', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (7, 'Chicken Fajitas', 'A dish of Mexican origin consisting of strips of spiced beef or chicken, chopped vegetables, and grated cheese, wrapped in a soft tortilla and often served with sour cream.', 27.99, 'http://assets.simplyrecipes.com/wp-content/uploads/2015/04/chicken-fajitas-horiz-b-1200.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (8, 'California Roll', 'A California roll or California maki is a makizushi sushi roll, usually made inside-out, containing cucumber, crab meat or imitation crab, and avocado. Sometimes crab salad is substituted for the crab stick, and often the outer layer of rice in an inside-out roll (uramaki ) is sprinkled with toasted sesame seeds, tobiko or masago (capelin roe).', 6.99, 'http://www.japanesecooking101.com/wp-content/uploads/2012/02/IMG_6318-1024x682.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (9, 'Yaki Udon', 'Yaki Udon (焼きうどん) is stir fried udon noodles with meat and vegetables, very similar to another Japanese stir fried noodle dish called Yakisoba (焼きそば) as they uses almost same ingredients besides noodles.', 8.50, 'https://www.bbcgoodfood.com/sites/default/files/recipe_images/yaki-udon.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (10, 'Chevre Cheesecake', 'Chèvre, or goat cheese, flavors this savory appetizer, baked to resemble a dessert cheesecake. Topped with strips of sun-dried tomatoes, Chèvre Cheesecake makes an eye-catching centerpiece for any hors d\'oeuvres table.', 10.99, 'http://www.janssushibar.com/wp-content/uploads/2011/07/Chevre-Cheesecake.jpg', 1, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (11, 'Dosa', 'Dosa is a type of pancake made from a fermented batter. ... Dosa is a typical part of the South Indian diet and popular all over the Indian subcontinent. Traditionally, Dosa is served hot along with sambar, stuffing of potatoes or paneer and chutney.', 11.99, 'https://static01.nyt.com/images/2015/01/28/dining/28KITCHEN1/28KITCHEN1-superJumbo.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (12, 'Cinnabon', 'A cinnimon bun the size of a beanbag chair. ', 4.99, 'data:image/jpeg;base64,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', 3, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (13, 'Cinnamental', 'A zesty cinnamony drink! Like drinking cinnamon', 11.99, 'http://files.shandymedia.com/images/body/thesavory/4_-_Tumblr.png', 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (14, 'Sockeye Salmon', 'Salmon oven baked to perfection. Garnished with a tart lemon butter sauce. ', 16.99, 'https://s-media-cache-ak0.pinimg.com/736x/d5/db/d6/d5dbd6c8c72a5d571761dd265f78875d.jpg', 1, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (15, 'Mango Lasi', 'Mango Lassi is a cold drink consisting of sweetened kesar mango pulp mixed with yogurt, cream, or ice cream.', 4.99, 'http://farm5.static.flickr.com/4083/5005619856_56fc670f06.jpg', 2, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (16, 'Porto Jalisco', 'Your guess is as good as ours! ', 12.00, NULL, 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (17, 'Chicken Tikka Masala', 'A tomato and coriander sauce is common, but no recipe for chicken tikka masala is standard; a survey found that of 48 different recipes, the only common ingredient was chicken. The sauce usually includes tomatoes (frequently as purée), cream, coconut cream, and various spices.', 14.95, 'http://assets.epicurious.com/photos/54af56b3c4a891cc44cceb29/master/pass/51171400_chicken-tikka-masala_1x1.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (18, 'Camarones Baja', 'There are several traditional ways that tacos are cooked in Mexico and filling a \"pre-manufactured store bought crunchy taco shell\" with greasy ground beef is not one of them!  Today\'s Baja style Shrimp Taco recipe is a grilled taco.  The flour tortilla is first placed on a hot flat top grill.  The ingredients placed on the tortilla, then the tortilla is grilled crisp.  Grilled flour tortilla tacos like this are often sold to tourists in Baja California.  For the most part, flour tortillas are tourist food.', 12.99, 'https://1.bp.blogspot.com/-Q5gF3EHmG9Q/VUJj9o9uPTI/AAAAAAACXAs/3SGSTrCHxk8/s1600/DSCN8773.JPG', 3, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (19, 'Chicken Teriyaki', 'Teriyaki is derived from the Japanese root words teri, to shine, and yaki, to broil or grill. That’s the way traditional teriyaki looks: shiny and incised with grill marks. In Japan, teriyaki is a mix of soy sauce, sake and the rice wine mirin, which imparts a subtle sweetness. The teriyaki found throughout Seattle, of which this is an adaptation, is a bit more showy. Cooks sweeten with white sugar and pineapple juice. They thicken with cornstarch. Ginger and garlic go into the mix because of the Korean ancestry of many cooks. It is not at all traditional, but it is simple to prepare and addictive to eat.', 9.45, 'https://static01.nyt.com/images/2016/05/28/dining/28COOKING-CHICKEN-TERIYAKI1/28COOKING-CHICKEN-TERIYAKI1-articleLarge.jpg', 4, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (20, 'Edamame', 'Edamame is a delightful \"little bite,\" easy to prepare and fun to eat. The edamame (edible soybean) is high in protein and has a nutty flavor. There are many other edamame recipes you can enjoy, which include side dishes, salads, and snacks.', 2.95, 'http://files.recipetips.com/images/recipe/appetizers_and_snacks/edamame.jpg', 4, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (21, 'Kimchi', 'Kimchi is a traditional Korean dish made of seasoned vegetables and salt. Koreans eat it at nearly every meal. It can be fresh, like a salad, or it can be fermented. While the most popular variety is spicy kimchi made of cabbage, there are hundreds of different types of kimchi made of different vegetables, and not all of them spicy. Kimchi is also a main ingredient in many other Korean dishes.', 1.00, 'https://www.maangchi.com/wp-content/uploads/2011/08/1plate.jpg', 4, 1, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (22, 'Chicken Beef Enchiladas', 'An enchilada is a corn tortilla rolled around a filling and covered with a chili pepper sauce. Enchiladas can be filled with a variety of ingredients, including meat, cheese, beans, potatoes, vegetables or combinations.', 13.29, 'http://recipegreat.com/images/beef-or-chicken-enchiladas-03.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (23, 'Lamb Madras', 'A Madras curry in the UK has a reputation of being somewhat of a one trick pony, a real fiery beast and not a lot else… However my lamb Madras curry has a little more about it but it certainly retains a fierce heat from both our own dried chili (cayenne) and lots of black pepper and all of it tempered with coconut milk.', 15.95, 'http://www.krumpli.co.uk/wp-content/uploads/2016/02/Lamb-Madras-Curry-Sq-1.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (24, 'Ras Malai', 'Ras Malai is a Bengali delicacy made with spongy cottage cheese balls dunked into aromatic milk syupr known as \'Ras\'. It is one of the best Indian sweet desserts.', 4.95, 'http://www.rachnas-kitchen.com/wp-content/uploads/2016/02/image-4.jpeg', 2, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (25, 'Eggnog Creme Brulee', 'Crème brûlée enriched with a little homemade eggnog is a surprisingly easy dessert, and a festively sweet way to celebrate the holidays.', 8.00, 'data:image/jpeg;base64,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', 1, 3, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (26, '& Everything Nice', 'A super awesome nice drink! ', 12.00, 'http://www.austinmonthly.com/images/cache/cache_a/cache_2/cache_f/Pour3040-1fa02f2a.jpeg?ver=1486425925&aspectratio=0.6677796327212', 1, 4, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (27, 'Lamb Boti Kabab', 'Cubes of lamb marinated in yogurt, garlic, flavoured with freshly ground and blended spice. Baked to perfection in tandoor', 7.95, 'http://www.my5thelements.com/cart/wp-content/uploads/2016/02/LAMB-BOTI-KABAB.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (28, 'Chicken Biryani', 'Chicken Biryani is the most ordered and liked rice preparation in India. Here is an easy chicken biryani recipe. North or south Indian chicken biryani has its own regional recipes.', 14.95, 'http://www.indianfoodforever.com/images/chicken-biryani.jpg', 2, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (29, 'Chimichangas', 'Forget about tasteless fillings. We simmer the chicken and rice for our chimichangas in a chipotle broth, infusing smoky bite through and through. As for construction, we noticed that the standard burrito-style wrapping method left us with doughy tortilla ends and filling that fell out. ', 11.99, 'http://cookdiary.net/wp-content/uploads/images/Chimichangas_14087.jpg', 3, 2, true);
INSERT INTO `menu_item` (`id`, `name`, `description`, `price`, `picture_url`, `kitchen_id`, `course_id`, `status`) VALUES (30, 'Dango', 'Dango (団子?) is a Japanese dumpling and sweet made from mochiko (rice flour),[1] related to mochi. It is often served with green tea. Dango is eaten year-round, but the different varieties are traditionally eaten in given seasons. Three to four dango are often served on a skewer.', 4.00, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Mitarashi_dango_by_denver935.jpg/300px-Mitarashi_dango_by_denver935.jpg', 4, 3, true);

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

