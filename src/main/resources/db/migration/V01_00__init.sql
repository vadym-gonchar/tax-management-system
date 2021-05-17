CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

INSERT INTO `roles` (name) VALUES ('ROLE_USER'),('ROLE_ADMIN');

CREATE TABLE `user_types` (
   `id` bigint primary key AUTO_INCREMENT,
   `name` varchar(50) UNIQUE NOT NULL
);

INSERT INTO `user_types` (name) VALUES ('natural_type'), ('legal_type');

CREATE TABLE `report_statuses` (
   `id` bigint primary key AUTO_INCREMENT,
   `name` varchar(50) UNIQUE NOT NULL
);

INSERT INTO `report_statuses` (name) VALUES ('pending'), ('rejected'), ('approved');

CREATE TABLE `users` (
  `id` bigint primary key AUTO_INCREMENT,
  `username` varchar(50) UNIQUE NOT NULL,
  `password` varchar(80) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `roles_id` bigint NOT NULL,
  `user_types_id` bigint NOT NULL,
   CONSTRAINT `FK_USERS_ROLES` FOREIGN KEY (`roles_id`)
        REFERENCES `roles` (`id`),
   CONSTRAINT `FK_USERS_USER_TYPES` FOREIGN KEY (`user_types_id`)
        REFERENCES `user_types` (`id`)
);

INSERT INTO `users` (username,password,first_name,last_name,email, roles_id, user_types_id)
VALUE ('admin','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Vadym','Gonchar','vadym.gonchar@gmail.com', 2, 2);

INSERT INTO `users` (username,password,first_name,last_name,email, roles_id, user_types_id)
VALUES
('user1','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Richard','Hays','richard.hays@gmail.com', 1, 1),
('user2','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Tom','Wright','tom.wright@gmail.com', 1, 2),
('user3','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Yoder','john.yoder@gmail.com', 1, 1),
('user4','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Gregory','Boyd','greg.boyd@gmail.com', 1, 1),
('user5','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ed','Sanders','ed.sanders@gmail.com', 1, 1),
('user6','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('user7','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('user8','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('user9','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('user10','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('user11','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('user12','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('user13','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('user14','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('user15','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('user16','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('user17','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('user18','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('user19','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('user20','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('user21','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('user22','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('user23','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('user24','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('user25','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('user26','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Richard','Hays','richard.hays@gmail.com', 1, 1),
('user27','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Tom','Wright','tom.wright@gmail.com', 1, 1),
('user28','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Yoder','john.yoder@gmail.com', 1, 1),
('user29','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Gregory','Boyd','greg.boyd@gmail.com', 1, 1),
('user30','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ed','Sanders','ed.sanders@gmail.com', 1, 1),
('user31','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('user32','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('user33','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('user34','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('user35','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('user36','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('user37','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('user38','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('user39','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('user40','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('user41','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('user42','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('user43','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('user44','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('user45','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('user46','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('user47','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('user48','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('user49','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('user50','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1);


CREATE TABLE `reports` (
        `id`           bigint                NOT NULL AUTO_INCREMENT,
        `report_date`  date                  NOT NULL,
        `rate`         NUMERIC (30, 2)       NOT NULL,
        `comment`      varchar(250),
        `users_id`     bigint                NOT NULL,
        `status_id`    bigint                NOT NULL,
        `created_at`   timestamp NOT NULL default current_timestamp,
        `last_modified` timestamp NOT NULL default current_timestamp on update current_timestamp,
            PRIMARY KEY (`id`),
        CONSTRAINT `FK_REPORT_USERS` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
        CONSTRAINT `FK_REPORT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `report_statuses` (`id`)
);
