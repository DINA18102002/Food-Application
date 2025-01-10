-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: foodapplcation
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `menuid` int NOT NULL,
  `restrauntid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL,
  `addeddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `menuid` (`menuid`),
  KEY `restrauntid` (`restrauntid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`restrauntid`) REFERENCES `restraunt` (`restrauntid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customerid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `customername` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customerid`),
  KEY `userid` (`userid`),
  CONSTRAINT `customer_details_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (3,24,'John Doe','john@example.com','1234567890','123 Main St, City, Country');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuid` int NOT NULL AUTO_INCREMENT,
  `restrauntid` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `isavailable` tinyint DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuid`),
  KEY `restrauntid_idx` (`restrauntid`),
  CONSTRAINT `restrauntid` FOREIGN KEY (`restrauntid`) REFERENCES `restraunt` (`restrauntid`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (25,1,'Margherita Pizza','Pizza','Classic margherita pizza with cheese and tomato',399,1,'images/menu/Margherita Pizza.jpg'),(26,1,'Pepperoni Pizza','Pizza','Loaded with pepperoni and extra cheese',499,1,'images/menu/pepperoni_pizza.jpg'),(27,1,'Cheese Burger','Burger','Juicy beef patty with melted cheese and fresh lettuce',299,1,'images/menu/cheese_burger.jpg'),(28,1,'Chicken Burger','Burger','Crispy chicken patty with mayo and lettuce',349,1,'images/menu/chicken_burger.jpg'),(29,1,'Caesar Salad','Salad','Crisp romaine lettuce with Caesar dressing and croutons',199,1,'images/menu/caesar_salad.jpg'),(30,1,'Pasta Alfredo','Pasta','Creamy Alfredo sauce with fettuccine pasta',349,1,'images/menu/pasta_alfredo.jpg'),(31,1,'Tandoori Chicken','Indian','Spicy grilled chicken with traditional Indian spices',599,1,'images/menu/tandoori_chicken.jpg'),(32,1,'Butter Naan','Indian','Soft and fluffy bread topped with butter',99,1,'images/menu/butter_naan.jpg'),(33,1,'Chocolate Brownie','Dessert','Rich chocolate brownie served with ice cream',149,1,'images/menu/chocolate_brownie.jpg'),(34,1,'Mango Lassi','Beverage','Refreshing mango yogurt drink',129,1,'images/menu/mango_lassi.jpg'),(35,53,'Chicken Biryani','Biryani','Aromatic basmati rice cooked with chicken and spices',499,1,'images/menu/chicken_biryani.jpg'),(36,53,'Mutton Biryani','Biryani','Rich and flavorful biryani with tender mutton pieces',599,1,'images/menu/mutton_biryani.jpg'),(37,53,'Grilled Chicken','Appetizer','Juicy grilled chicken marinated with herbs and spices',449,1,'images/menu/grilled_chicken.jpg'),(38,53,'Fish Fry','Appetizer','Crispy fried fish seasoned with Indian spices',399,1,'images/menu/fish_fry.jpg'),(39,53,'Prawn Curry','Curry','Fresh prawns cooked in a rich and spicy curry',549,1,'images/menu/prawn_curry.jpg'),(40,53,'Chicken 65','Appetizer','Spicy and crispy fried chicken cubes',349,1,'images/menu/chicken_65.jpg'),(41,53,'Egg Masala','Curry','Boiled eggs cooked in a thick spicy masala',249,1,'images/menu/egg_masala.jpg'),(42,53,'Tandoori Fish','Tandoori','Grilled fish marinated in tandoori spices',499,1,'images/menu/tandoori_fish.jpg'),(43,53,'Mutton Rogan Josh','Curry','Traditional Kashmiri-style mutton curry',649,1,'images/menu/mutton_rogan_josh.jpg'),(44,53,'Chicken Kebab','Appetizer','Skewered chicken kebabs grilled to perfection',399,1,'images/menu/chicken_kebab.jpg'),(45,54,'Original Recipe Chicken','Chicken','KFC’s signature chicken, crispy on the outside, tender on the inside',399,1,'images/menu/original_recipe_chicken.jpg'),(46,54,'Zinger Burger','Burger','Spicy chicken burger with lettuce, mayo, and pickles',299,1,'images/menu/zinger_burger.jpg'),(47,54,'Hot Wings','Appetizer','Spicy and crispy chicken wings, served with dipping sauce',249,1,'images/menu/hot_wings.jpg'),(48,54,'Chicken Popcorn','Appetizer','Bite-sized crispy chicken pieces, perfect for snacking',199,1,'images/menu/chicken_popcorn.jpg'),(49,54,'Chicken Bucket','Combo','A bucket filled with KFC’s famous fried chicken',799,1,'images/menu/chicken_bucket.jpg'),(50,54,'Mashed Potatoes','Side','Creamy mashed potatoes with KFC gravy',149,1,'images/menu/mashed_potatoes.jpg'),(51,54,'Coleslaw','Side','Freshly made coleslaw with a creamy dressing',129,1,'images/menu/coleslaw.jpg'),(52,54,'Biscuits','Side','Soft, flaky biscuits served warm',99,1,'images/menu/biscuits.jpg'),(53,54,'Fried Chicken Tenders','Chicken','Crispy fried chicken tenders served with dipping sauce',299,1,'images/menu/fried_chicken_tenders.jpg'),(54,54,'Pepsi','Beverage','Chilled Pepsi to accompany your meal',79,1,'images/menu/pepsi.jpg'),(55,55,'Whopper Burger','Burger','Signature flame-grilled beef patty with fresh vegetables and mayo',499,1,'images/menu/whopper_burger.jpg'),(56,55,'Chicken Royale','Burger','Crispy chicken fillet with lettuce and mayo in a soft bun',399,1,'images/menu/chicken_royale.jpg'),(57,55,'Cheesy Fries','Side','Crispy fries topped with melted cheese',149,1,'images/menu/cheesy_fries.jpg'),(58,55,'Onion Rings','Side','Golden-fried onion rings with dipping sauce',129,1,'images/menu/onion_rings.jpg'),(59,55,'Classic Fries','Side','Crispy and salty fries, a perfect snack',99,1,'images/menu/classic_fries.jpg'),(60,55,'Chicken Nuggets','Appetizer','Crispy, golden chicken nuggets served with BBQ sauce',249,1,'images/menu/chicken_nuggets.jpg'),(61,55,'Veggie Burger','Burger','A wholesome veggie patty with fresh veggies and sauce',349,1,'images/menu/veggie_burger.jpg'),(62,55,'Crispy Chicken Wrap','Wrap','Crispy chicken with fresh veggies wrapped in a soft tortilla',299,1,'images/menu/crispy_chicken_wrap.jpg'),(63,55,'Milkshake','Beverage','Rich and creamy milkshake available in chocolate, vanilla, and strawberry',179,1,'images/menu/milkshake.jpg'),(64,55,'Soft Drink','Beverage','Chilled soda in various flavors',89,1,'images/menu/soft_drink.jpg'),(65,56,'Hyderabadi Chicken Biryani','Biryani','Fragrant basmati rice with tender chicken cooked in spices',499,1,'images/menu/hyderabadi_chicken_biryani.jpg'),(66,56,'Mutton Biryani','Biryani','Spicy mutton pieces cooked with basmati rice',599,1,'images/menu/mutton_biryani.jpg'),(67,56,'Veg Biryani','Biryani','A flavorful mix of vegetables and basmati rice with aromatic spices',399,1,'images/menu/veg_biryani.jpg'),(68,56,'Prawn Biryani','Biryani','Tender prawns cooked with basmati rice and spices',549,1,'images/menu/prawn_biryani.jpg'),(69,56,'Biryani Combo','Combo','Serves both chicken and mutton biryani with raita',699,1,'images/menu/biryani_combo.jpg'),(70,56,'Mirchi Ka Salan','Side','Spicy and tangy curry with green chilies',179,1,'images/menu/mirchi_ka_salan.jpg'),(71,56,'Raita','Side','Cool yogurt with vegetables to accompany your biryani',99,1,'images/menu/raita.jpg'),(72,56,'Mutton Kebab','Appetizer','Grilled mutton kebabs with spices',349,1,'images/menu/mutton_kebab.jpg'),(73,56,'Gulab Jamun','Dessert','Soft and sweet deep-fried dough balls soaked in syrup',129,1,'images/menu/gulab_jamun.jpg'),(74,56,'Lassi','Beverage','Refreshing yogurt-based drink available in sweet and salty flavors',149,1,'images/menu/lassi.jpg'),(75,57,'Big Mac','Burger','Two beef patties, lettuce, cheese, pickles, and special sauce',399,1,'images/menu/big_mac.jpg'),(76,57,'McChicken','Burger','Crispy chicken fillet with lettuce and mayo',299,1,'images/menu/mcchicken.jpg'),(77,57,'French Fries','Side','Crispy and salted fries',129,1,'images/menu/french_fries.jpg'),(78,57,'Chicken McNuggets','Appetizer','Tender and crispy chicken nuggets served with dipping sauces',249,1,'images/menu/chicken_mcnuggets.jpg'),(79,57,'Filet-O-Fish','Burger','Fish fillet with tartar sauce and cheese',329,1,'images/menu/filet_o_fish.jpg'),(80,57,'Apple Pie','Dessert','Warm apple pie with a crispy crust',99,1,'images/menu/apple_pie.jpg'),(81,57,'McFlurry','Dessert','Ice cream with your choice of topping, blended in a cup',149,1,'images/menu/mcflurry.jpg'),(82,57,'Coke','Beverage','Chilled Coca-Cola',89,1,'images/menu/coke.jpg'),(83,57,'Vanilla Shake','Beverage','Creamy vanilla milkshake',179,1,'images/menu/vanilla_shake.jpg'),(84,57,'Iced Coffee','Beverage','Chilled coffee with a smooth taste',169,1,'images/menu/iced_coffee.jpg'),(85,58,'Caramel Macchiato','Beverage','Espresso, steamed milk, and caramel drizzle',299,1,'images/menu/caramel_macchiato.jpg'),(86,58,'Caffè Latte','Beverage','Espresso with steamed milk and a thin layer of foam',249,1,'images/menu/caffe_latte.jpg'),(87,58,'Cappuccino','Beverage','Espresso with steamed milk and thick foam',259,1,'images/menu/cappuccino.jpg'),(88,58,'Americano','Beverage','Espresso diluted with hot water',199,1,'images/menu/americano.jpg'),(89,58,'Iced Coffee','Beverage','Chilled coffee served over ice',229,1,'images/menu/iced_coffee.jpg'),(90,58,'Pumpkin Spice Latte','Beverage','Seasonal drink with a perfect balance of pumpkin and spice',319,1,'images/menu/pumpkin_spice_latte.jpg'),(91,58,'Blueberry Muffin','Pastry','Moist muffin with fresh blueberries',149,1,'images/menu/blueberry_muffin.jpg'),(92,58,'Chocolate Croissant','Pastry','Flaky croissant with a rich chocolate filling',179,1,'images/menu/chocolate_croissant.jpg'),(93,58,'Bagel','Pastry','Freshly baked bagel served with cream cheese',129,1,'images/menu/bagel.jpg'),(94,58,'Hot Chocolate','Beverage','Rich and creamy hot chocolate',249,1,'images/menu/hot_chocolate.jpg'),(95,59,'Grilled Salmon','Main Course','Freshly grilled salmon served with a side of vegetables',599,1,'images/menu/grilled_salmon.jpg'),(96,59,'Steak','Main Course','Juicy grilled steak served with mashed potatoes',799,1,'images/menu/steak.jpg'),(97,59,'Lamb Chops','Main Course','Tender lamb chops marinated in herbs and grilled to perfection',899,1,'images/menu/lamb_chops.jpg'),(98,59,'Caesar Salad','Appetizer','Crisp romaine lettuce with Caesar dressing and croutons',199,1,'images/menu/caesar_salad.jpg'),(99,59,'Fried Shrimp','Appetizer','Golden-fried shrimp served with dipping sauce',249,1,'images/menu/fried_shrimp.jpg'),(100,59,'Vegetable Stir Fry','Main Course','Mixed vegetables stir-fried in soy sauce and garlic',399,1,'images/menu/vegetable_stir_fry.jpg'),(101,59,'Chocolate Cake','Dessert','Rich and moist chocolate cake with chocolate frosting',149,1,'images/menu/chocolate_cake.jpg'),(102,59,'Ice Cream','Dessert','Assorted ice cream flavors',129,1,'images/menu/ice_cream.jpg'),(103,59,'Fried Rice','Side','Steamed rice stir-fried with vegetables and spices',179,1,'images/menu/fried_rice.jpg'),(104,59,'Garlic Bread','Side','Toasted bread with garlic butter',99,1,'images/menu/garlic_bread.jpg'),(105,60,'Vegetarian Pizza','Pizza','Cheese, tomatoes, olives, and vegetables on a crispy crust',399,1,'images/menu/vegetarian_pizza.jpg'),(106,60,'Margherita Pizza','Pizza','Tomato sauce, mozzarella cheese, and fresh basil',349,1,'images/menu/emargherita_pizza.jpg'),(107,60,'Spaghetti Bolognese','Pasta','Spaghetti served with a rich and meaty tomato sauce',449,1,'images/menu/spaghetti_bolognese.jpg'),(108,60,'Chicken Parmesan','Main Course','Breaded chicken with marinara sauce and melted cheese',499,1,'images/menu/chicken_parmesan.jpg'),(109,60,'Grilled Vegetables','Side','Grilled seasonal vegetables with olive oil',179,1,'images/menu/grilled_vegetables.jpg'),(110,60,'Tiramisu','Dessert','Traditional Italian dessert with layers of coffee-soaked cake',129,1,'images/menu/tiramisu.jpg'),(111,60,'Panna Cotta','Dessert','Creamy Italian custard topped with berry sauce',149,1,'images/menu/panna_cotta.jpg'),(112,60,'Cappuccino','Beverage','Espresso with steamed milk and foam',199,1,'images/menu/cappuccino.jpg'),(113,60,'Iced Tea','Beverage','Refreshing chilled tea with lemon',159,1,'images/menu/iced_tea.jpg'),(114,60,'Lemonade','Beverage','Freshly squeezed lemonade with mint',169,1,'images/menu/lemonade.jpg'),(115,61,'Gulab Jamun','Dessert','Soft and syrupy deep-fried dumplings',129,1,'images/menu/kgulab_jamun.jpg'),(116,61,'Jalebi','Dessert','Sweet and crispy fried dough soaked in sugar syrup',99,1,'images/menu/jalebi.jpg'),(117,61,'Rasgulla','Dessert','Soft and spongy cheese-based sweets soaked in syrup',149,1,'images/menu/rasgulla.jpg'),(118,61,'Kheer','Dessert','Traditional rice pudding with cardamom and saffron',129,1,'images/menu/kheer.jpg'),(119,61,'Ladoo','Dessert','Sweet flour balls with cardamom flavor',99,1,'images/menu/ladoo.jpg'),(120,61,'Barfi','Dessert','Milk-based sweet treat with nuts',149,1,'images/menu/barfi.jpg'),(121,61,'Halwa','Dessert','Carrot halwa made with grated carrots, milk, and sugar',129,1,'images/menu/halwa.jpg'),(122,61,'Mysore Pak','Dessert','Rich and melt-in-the-mouth sweet made with ghee and gram flour',169,1,'images/menu/mysore_pak.jpg'),(123,61,'Peda','Dessert','Sweet made from condensed milk with cardamom and nuts',139,1,'images/menu/peda.jpg'),(124,61,'Samosa','Snack','Crispy pastry filled with spiced potatoes and peas',79,1,'images/menu/samosa.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderhistory` (
  `orderhistoryid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `totalamount` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderhistoryid`),
  KEY `orderid_idx` (`orderid`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
INSERT INTO `orderhistory` VALUES (70,90,27,347,'Pending','2025-01-09 18:33:57'),(71,91,28,1696,'Pending','2025-01-09 19:10:20'),(72,92,27,399,'Pending','2025-01-10 00:13:01');
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `orderitemid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `menuid` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `itemtotal` int DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `fk_menuid_idx` (`menuid`),
  KEY `fk_orderid` (`orderid`),
  CONSTRAINT `fk_menuid` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (105,90,119,2,198),(106,90,120,1,149),(107,91,65,2,998),(108,91,72,2,698),(109,92,25,1,399);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `restrauntid` int DEFAULT NULL,
  `orderdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `totalamount` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `paymentmode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid_idx` (`userid`),
  KEY `restrauntid_idx` (`restrauntid`),
  CONSTRAINT `fk_restrauntid` FOREIGN KEY (`restrauntid`) REFERENCES `restraunt` (`restrauntid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (90,27,61,'2025-01-09 18:33:57',347,'Pending','COD'),(91,28,56,'2025-01-09 19:10:20',1696,'Pending','COD'),(92,27,1,'2025-01-10 00:13:01',399,'Pending','COD');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `reportid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `customerid` int DEFAULT NULL,
  `report` text,
  `reportdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`reportid`),
  KEY `orderid` (`orderid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customer_details` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restraunt`
--

DROP TABLE IF EXISTS `restraunt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restraunt` (
  `restrauntid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cuisinetype` varchar(45) DEFAULT NULL,
  `deliverytime` int DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `isactive` tinyint DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restrauntid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restraunt`
--

LOCK TABLES `restraunt` WRITE;
/*!40000 ALTER TABLE `restraunt` DISABLE KEYS */;
INSERT INTO `restraunt` VALUES (1,'Dominos','nonveg',11,'salem',4.5,1,'images/Dominos.jpg'),(53,'Salem RR Biriyani','Indian',25,'Salem New Bus Stand Oop, Salem',4,1,'images/Salem RR Biriyani.jpg'),(54,'Kfc','Italian',30,'Hsr Layout  ,Bengaluru',5,1,'images/Kfc.jpg'),(55,'Burger King','Mexican',20,'Silk board ,Bengaluru',5,1,'images/Burger King.jpg'),(56,'Biriyani House','Indian',17,'Electronic city ,Bengaluru',4,1,'images/Biriyani House.jpg'),(57,'Mc Donalds','Indian',22,'Sivaji Nagar 2nd cross,Bengaluru',4.5,1,'images/Mc Donalds.jpg'),(58,'Starbucks','Italian',22,'Salem New Bus Stand Oop, Salem',4.5,1,'images/Starbucks.jpg'),(59,'Dinner World','Indian',30,'Anna Nagar, Chennai',5,1,'images/Dinner World.jpg'),(60,'Eden Park Restaurant','Indian',24,'E-city Bengaluru',4,1,'images/Eden Park Restaurant.jpg'),(61,'Karthi sweets','Indian',20,'kovilpatti',4,1,'images/Karthi sweets.jpg');
/*!40000 ALTER TABLE `restraunt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `customerid` int DEFAULT NULL,
  `review` text,
  `rating` int DEFAULT NULL,
  `reviewdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `restrauntid` int DEFAULT NULL,
  `report` text,
  `reportdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewid`),
  UNIQUE KEY `orderid` (`orderid`,`restrauntid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customer_details` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastLoginDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (24,'vjggpc','vjggpc','vjggpcz|Biockn0eqo','Owtcnk\"Mtkujpc\"ri\"*35vj\"etquu\"uvtggv+\"dgpicnwtw','858;698764','2024-12-16 14:00:31','2024-12-16 14:00:31'),(25,'urggf','urggf','urggfBiockn0eqo','Ecnkhqtpkc\"WUC',':36:443498','2024-12-17 16:27:35','2024-12-17 16:27:35'),(26,'tgcnog','tgcnog','tgcnogBiockn0eqo','Owtcnk\"Mtkujpc\"ri\"*35vj\"etquu\"uvtggv+\"dgpicnwtw',':67:67:632','2024-12-23 11:32:54','2024-12-23 11:32:54'),(27,'rkp','rkp','rkpBiockn0eqo','htgghktg\"ejgppck','3467534534','2025-01-03 13:49:50','2025-01-03 13:49:50'),(28,'yqqf','yqqf','yqqfBiockn0eqo','htgghktg\"ejgppck',':;:;:;:;:;','2025-01-09 19:08:40','2025-01-09 19:08:40');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 18:37:47
