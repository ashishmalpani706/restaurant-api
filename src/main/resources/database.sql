-- create a database if it doesn't exist

DROP DATABASE IF EXISTS restaurant_db;

CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;


-- Create a Restaurant table based on the attributes mentioned below:

CREATE TABLE IF NOT EXISTS restaurant(
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    pin_code VARCHAR(10) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    yelp_reviews FLOAT(3, 2) UNSIGNED NOT NULL
);


-- Create a Menu table

CREATE TABLE IF NOT EXISTS menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    menu_type ENUM('BREAKFAST', 'LUNCH', 'DINNER', 'SNACKS', 'DESSERTS') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id) ON DELETE CASCADE,
    UNIQUE KEY(restaurant_id, menu_type)
);


-- Create a Menu Item table

CREATE TABLE IF NOT EXISTS menu_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    menu_id INT NOT NULL,
    item_name VARCHAR(200) NOT NULL,
    price FLOAT UNSIGNED NOT NULL,
    FOREIGN KEY(menu_id) REFERENCES menu(menu_id) ON DELETE CASCADE
);


-- Inserting Random records into the Restaurant Table (20 records)

INSERT IGNORE INTO `restaurant` VALUES (1, 'Pfannerstill-Dibbert', '493 Koss Bridge\nSouth Estelle, NM 81180', '03632', 'Kertzmann-Rice', '4.83');
INSERT IGNORE INTO `restaurant` VALUES (2, 'Bauch-Funk', '468 Green Green\nEast Eunicebury, SC 21670', '39615', 'Rosenbaum and Sons', '3.22');
INSERT IGNORE INTO `restaurant` VALUES (3, 'Gerhold-Rolfson', '4548 Alysson Club Suite 245\nStevieshire, RI 69707', '72009', 'Bailey, Ruecker and Bruen', '3.88');
INSERT IGNORE INTO `restaurant` VALUES (4, 'Jacobs LLC', '02930 Emile View\nRitaton, WV 62768', '09758', 'Ebert Ltd', '4.39');
INSERT IGNORE INTO `restaurant` VALUES (5, 'Bashirian-Halvorson', '00122 Gerald Junction Apt. 356\nEast Hesterbury, NM 38747', '26113', 'Zulauf and Sons', '4.74');
INSERT IGNORE INTO `restaurant` VALUES (6, 'Kohler Ltd', '7321 Champlin Port Apt. 841\nLake Clevelandfurt, NE 93485', '27119', 'Hammes Inc', '4.20');
INSERT IGNORE INTO `restaurant` VALUES (7, 'Muller Ltd', '32350 Carroll Island\nNorth Breanaland, IL 22106', '14712', 'McCullough-Kautzer', '4.88');
INSERT IGNORE INTO `restaurant` VALUES (8, 'Kassulke-Lind', '0494 Caroline Mission\nHalvorsonville, MT 07068', '62650', 'Rogahn-Moen', '3.00');
INSERT IGNORE INTO `restaurant` VALUES (9, 'Bradtke Group', '27727 Geoffrey Parkways\nNew Brigittechester, MS 24782', '46947', 'Hansen-Tremblay', '3.75');
INSERT IGNORE INTO `restaurant` VALUES (10, 'Luettgen-Swift', '4559 Otha Run\nEast Jairo, MS 66079', '02585', 'Sporer-Gleichner', '3.06');
INSERT IGNORE INTO `restaurant` VALUES (11, 'Hodkiewicz, Mante and Hessel', '6701 Brandt Lake Apt. 555\nWest Charles, AR 87039', '50479', 'McKenzie, Hyatt and Keeling', '4.44');
INSERT IGNORE INTO `restaurant` VALUES (12, 'Goodwin-Berge', '621 Kiehn Divide\nNorth Jasper, MO 36838', '72036', 'Lowe-McGlynn', '4.59');
INSERT IGNORE INTO `restaurant` VALUES (13, 'Ebert Ltd', '615 Denesik Trace\nLake Kathryn, MA 13578', '15793', 'Corkery Ltd', '3.29');
INSERT IGNORE INTO `restaurant` VALUES (14, 'Stark-Ratke', '3432 Pinkie Pine Suite 875\nBashirianside, NH 84913', '80258', 'Little-Hoppe', '3.89');
INSERT IGNORE INTO `restaurant` VALUES (15, 'Batz, Kuvalis and Ondricka', '8473 Dylan Passage Suite 437\nSouth Kenna, TN 86955', '37710', 'Huel Inc', '3.41');
INSERT IGNORE INTO `restaurant` VALUES (16, 'O\'Keefe and Sons', '8836 Zoey Light\nKrisshire, IN 57295', '17417', 'Wisoky LLC', '4.05');
INSERT IGNORE INTO `restaurant` VALUES (17, 'Jacobi-Klein', '74690 Faye Port\nCasperberg, AL 74393', '44887', 'Stroman, Walker and Runte', '4.88');
INSERT IGNORE INTO `restaurant` VALUES (18, 'Lebsack, Robel and Legros', '561 Connelly Village\nLake Chaddport, WI 76474', '91525', 'Langosh PLC', '4.76');
INSERT IGNORE INTO `restaurant` VALUES (19, 'Marks and Sons', '9605 Wolff Isle\nNew Nanniehaven, NJ 25600', '33134 ', 'Greenfelder LLC', '4.02');
INSERT IGNORE INTO `restaurant` VALUES (20, 'Rippin, Schmitt and Predovic', '79765 Waylon Lodge\nEast Malachi, NY 49940', '83851', 'Schiller-Farrell', '4.95');



-- Inserting Random records into Menu Table (16 records)

INSERT IGNORE INTO `menu` VALUES (1, 3, 'DINNER', '23:22:57', '11:14:30');
INSERT IGNORE INTO `menu` VALUES (2, 4, 'BREAKFAST', '04:45:56', '17:00:12');
INSERT IGNORE INTO `menu` VALUES (3, 14, 'LUNCH', '22:08:29', '17:55:57');
INSERT IGNORE INTO `menu` VALUES (4, 16, 'BREAKFAST', '20:40:26', '05:43:01');
INSERT IGNORE INTO `menu` VALUES (5, 12, 'LUNCH', '06:39:29', '06:08:46');
INSERT IGNORE INTO `menu` VALUES (6, 5, 'DESSERTS', '10:14:34', '10:24:45');
INSERT IGNORE INTO `menu` VALUES (7, 13, 'DESSERTS', '07:09:25', '05:09:03');
INSERT IGNORE INTO `menu` VALUES (8, 19, 'LUNCH', '05:23:50', '20:57:46');
INSERT IGNORE INTO `menu` VALUES (9, 20, 'BREAKFAST', '15:49:20', '11:14:23');
INSERT IGNORE INTO `menu` VALUES (10, 16, 'LUNCH', '16:46:32', '12:54:14');
INSERT IGNORE INTO `menu` VALUES (11, 7, 'BREAKFAST', '15:01:20', '17:27:00');
INSERT IGNORE INTO `menu` VALUES (13, 14, 'SNACKS', '15:07:06', '14:31:08');
INSERT IGNORE INTO `menu` VALUES (14, 13, 'DINNER', '08:48:09', '23:36:29');
INSERT IGNORE INTO `menu` VALUES (16, 2, 'LUNCH', '11:23:59', '21:55:09');
INSERT IGNORE INTO `menu` VALUES (17, 17, 'BREAKFAST', '09:20:30', '05:32:27');
INSERT IGNORE INTO `menu` VALUES (19, 18, 'DINNER', '23:20:13', '23:23:00');



-- Inserting Random records into Menu Items table (100 records)

INSERT IGNORE INTO `menu_item` VALUES (1, 9, 'ipsum', '44.26');
INSERT IGNORE INTO `menu_item` VALUES (2, 1, 'quas', '31.69');
INSERT IGNORE INTO `menu_item` VALUES (3, 4, 'dolorum', '11.62');
INSERT IGNORE INTO `menu_item` VALUES (4, 10, 'itaque', '17.31');
INSERT IGNORE INTO `menu_item` VALUES (5, 6, 'aut', '18.01');
INSERT IGNORE INTO `menu_item` VALUES (6, 7, 'occaecati', '42.8');
INSERT IGNORE INTO `menu_item` VALUES (7, 13, 'cupiditate', '42.75');
INSERT IGNORE INTO `menu_item` VALUES (8, 11, 'est', '46.92');
INSERT IGNORE INTO `menu_item` VALUES (9, 13, 'quia', '14.5');
INSERT IGNORE INTO `menu_item` VALUES (10, 8, 'ducimus', '40.72');
INSERT IGNORE INTO `menu_item` VALUES (11, 7, 'consequuntur', '43.88');
INSERT IGNORE INTO `menu_item` VALUES (12, 7, 'et', '38.12');
INSERT IGNORE INTO `menu_item` VALUES (13, 9, 'et', '42.84');
INSERT IGNORE INTO `menu_item` VALUES (14, 7, 'asperiores', '17.38');
INSERT IGNORE INTO `menu_item` VALUES (15, 19, 'nemo', '47.58');
INSERT IGNORE INTO `menu_item` VALUES (16, 14, 'et', '21.55');
INSERT IGNORE INTO `menu_item` VALUES (17, 19, 'laboriosam', '20.88');
INSERT IGNORE INTO `menu_item` VALUES (18, 7, 'magnam', '26.19');
INSERT IGNORE INTO `menu_item` VALUES (19, 8, 'qui', '20.12');
INSERT IGNORE INTO `menu_item` VALUES (20, 1, 'aspernatur', '5.93');
INSERT IGNORE INTO `menu_item` VALUES (21, 9, 'debitis', '19.59');
INSERT IGNORE INTO `menu_item` VALUES (22, 7, 'ipsam', '7.4');
INSERT IGNORE INTO `menu_item` VALUES (23, 17, 'voluptatem', '41.95');
INSERT IGNORE INTO `menu_item` VALUES (24, 6, 'nihil', '32.57');
INSERT IGNORE INTO `menu_item` VALUES (25, 9, 'vero', '33.33');
INSERT IGNORE INTO `menu_item` VALUES (26, 11, 'ut', '40.3');
INSERT IGNORE INTO `menu_item` VALUES (27, 8, 'asperiores', '34.43');
INSERT IGNORE INTO `menu_item` VALUES (28, 11, 'officia', '43.2');
INSERT IGNORE INTO `menu_item` VALUES (29, 14, 'et', '27.01');
INSERT IGNORE INTO `menu_item` VALUES (30, 17, 'laboriosam', '9.69');
INSERT IGNORE INTO `menu_item` VALUES (31, 2, 'quibusdam', '32.08');
INSERT IGNORE INTO `menu_item` VALUES (32, 14, 'ratione', '48.07');
INSERT IGNORE INTO `menu_item` VALUES (33, 19, 'minus', '48.52');
INSERT IGNORE INTO `menu_item` VALUES (34, 19, 'ea', '13.63');
INSERT IGNORE INTO `menu_item` VALUES (35, 1, 'voluptas', '10.33');
INSERT IGNORE INTO `menu_item` VALUES (36, 1, 'dolore', '8.08');
INSERT IGNORE INTO `menu_item` VALUES (37, 11, 'nam', '49.98');
INSERT IGNORE INTO `menu_item` VALUES (38, 4, 'perspiciatis', '48.23');
INSERT IGNORE INTO `menu_item` VALUES (39, 5, 'commodi', '25.32');
INSERT IGNORE INTO `menu_item` VALUES (40, 8, 'voluptatem', '6.76');
INSERT IGNORE INTO `menu_item` VALUES (41, 3, 'natus', '33.64');
INSERT IGNORE INTO `menu_item` VALUES (42, 19, 'earum', '38.87');
INSERT IGNORE INTO `menu_item` VALUES (43, 14, 'quis', '15.07');
INSERT IGNORE INTO `menu_item` VALUES (44, 3, 'corporis', '14.2');
INSERT IGNORE INTO `menu_item` VALUES (45, 11, 'enim', '20.29');
INSERT IGNORE INTO `menu_item` VALUES (46, 6, 'voluptates', '38.61');
INSERT IGNORE INTO `menu_item` VALUES (47, 9, 'voluptates', '14.73');
INSERT IGNORE INTO `menu_item` VALUES (48, 2, 'at', '23.13');
INSERT IGNORE INTO `menu_item` VALUES (49, 10, 'ut', '43.66');
INSERT IGNORE INTO `menu_item` VALUES (50, 19, 'ab', '44.59');
INSERT IGNORE INTO `menu_item` VALUES (51, 11, 'nemo', '27.76');
INSERT IGNORE INTO `menu_item` VALUES (52, 4, 'eius', '5.94');
INSERT IGNORE INTO `menu_item` VALUES (53, 5, 'ut', '35.48');
INSERT IGNORE INTO `menu_item` VALUES (54, 16, 'omnis', '33.49');
INSERT IGNORE INTO `menu_item` VALUES (55, 8, 'non', '25.8');
INSERT IGNORE INTO `menu_item` VALUES (56, 11, 'ipsa', '49.03');
INSERT IGNORE INTO `menu_item` VALUES (57, 11, 'repellat', '38.66');
INSERT IGNORE INTO `menu_item` VALUES (58, 19, 'earum', '44.51');
INSERT IGNORE INTO `menu_item` VALUES (59, 3, 'animi', '31.94');
INSERT IGNORE INTO `menu_item` VALUES (60, 10, 'maiores', '8.73');
INSERT IGNORE INTO `menu_item` VALUES (61, 13, 'assumenda', '34.31');
INSERT IGNORE INTO `menu_item` VALUES (62, 10, 'voluptas', '43.05');
INSERT IGNORE INTO `menu_item` VALUES (63, 1, 'nisi', '22.13');
INSERT IGNORE INTO `menu_item` VALUES (64, 14, 'ut', '33.03');
INSERT IGNORE INTO `menu_item` VALUES (65, 3, 'est', '11.89');
INSERT IGNORE INTO `menu_item` VALUES (66, 6, 'voluptatem', '36.04');
INSERT IGNORE INTO `menu_item` VALUES (67, 7, 'non', '48.49');
INSERT IGNORE INTO `menu_item` VALUES (68, 19, 'ex', '16.04');
INSERT IGNORE INTO `menu_item` VALUES (69, 19, 'maxime', '15.79');
INSERT IGNORE INTO `menu_item` VALUES (70, 19, 'reiciendis', '6');
INSERT IGNORE INTO `menu_item` VALUES (71, 10, 'sit', '30.42');
INSERT IGNORE INTO `menu_item` VALUES (72, 14, 'molestiae', '31.85');
INSERT IGNORE INTO `menu_item` VALUES (73, 4, 'molestiae', '25.98');
INSERT IGNORE INTO `menu_item` VALUES (74, 2, 'nulla', '13.89');
INSERT IGNORE INTO `menu_item` VALUES (75, 8, 'voluptatibus', '7.49');
INSERT IGNORE INTO `menu_item` VALUES (76, 9, 'tempore', '36.23');
INSERT IGNORE INTO `menu_item` VALUES (77, 5, 'ratione', '28.85');
INSERT IGNORE INTO `menu_item` VALUES (78, 19, 'nobis', '6.74');
INSERT IGNORE INTO `menu_item` VALUES (79, 1, 'doloribus', '34.16');
INSERT IGNORE INTO `menu_item` VALUES (80, 16, 'in', '36.45');
INSERT IGNORE INTO `menu_item` VALUES (81, 10, 'perspiciatis', '49.47');
INSERT IGNORE INTO `menu_item` VALUES (82, 5, 'voluptatem', '8.05');
INSERT IGNORE INTO `menu_item` VALUES (83, 10, 'omnis', '35.6');
INSERT IGNORE INTO `menu_item` VALUES (84, 16, 'quae', '47.92');
INSERT IGNORE INTO `menu_item` VALUES (85, 14, 'ut', '6.55');
INSERT IGNORE INTO `menu_item` VALUES (86, 4, 'voluptas', '16.89');
INSERT IGNORE INTO `menu_item` VALUES (87, 5, 'atque', '35.51');
INSERT IGNORE INTO `menu_item` VALUES (88, 10, 'qui', '30.58');
INSERT IGNORE INTO `menu_item` VALUES (89, 7, 'quo', '36.99');
INSERT IGNORE INTO `menu_item` VALUES (90, 8, 'quae', '40.04');
INSERT IGNORE INTO `menu_item` VALUES (91, 14, 'libero', '47.29');
INSERT IGNORE INTO `menu_item` VALUES (92, 16, 'eos', '42.27');
INSERT IGNORE INTO `menu_item` VALUES (93, 13, 'occaecati', '33.59');
INSERT IGNORE INTO `menu_item` VALUES (94, 3, 'vitae', '47.22');
INSERT IGNORE INTO `menu_item` VALUES (95, 7, 'non', '25.55');
INSERT IGNORE INTO `menu_item` VALUES (96, 1, 'pariatur', '9.01');
INSERT IGNORE INTO `menu_item` VALUES (97, 10, 'voluptatem', '14.05');
INSERT IGNORE INTO `menu_item` VALUES (98, 9, 'aut', '42.82');
INSERT IGNORE INTO `menu_item` VALUES (99, 8, 'sit', '36.22');
INSERT IGNORE INTO `menu_item` VALUES (100, 13, 'iste', '49.96');