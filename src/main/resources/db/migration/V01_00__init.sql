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
('student1','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Richard','Hays','richard.hays@gmail.com', 1, 1),
('student2','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Tom','Wright','tom.wright@gmail.com', 1, 2),
('student3','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Yoder','john.yoder@gmail.com', 1, 1),
('student4','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Gregory','Boyd','greg.boyd@gmail.com', 1, 1),
('student5','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ed','Sanders','ed.sanders@gmail.com', 1, 1),
('student6','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('student7','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('student8','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('student9','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('student10','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('student11','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('student12','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('student13','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('student14','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('student15','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('student16','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('student17','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('student18','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('student19','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('student20','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('student21','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('student22','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('student23','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('student24','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('student25','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('student26','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Richard','Hays','richard.hays@gmail.com', 1, 1),
('student27','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Tom','Wright','tom.wright@gmail.com', 1, 1),
('student28','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Yoder','john.yoder@gmail.com', 1, 1),
('student29','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Gregory','Boyd','greg.boyd@gmail.com', 1, 1),
('student30','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ed','Sanders','ed.sanders@gmail.com', 1, 1),
('student31','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('student32','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('student33','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('student34','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('student35','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('student36','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('student37','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('student38','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('student39','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('student40','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1),
('student41','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Stanley','Hauerwas','stan.hauerwas@gmail.com', 1, 1),
('student42','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Ronald','Sider','ron.sider@gmail.com', 1, 1),
('student43','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Guy','Hershberger','guy.hershberger@gmail.com', 1, 1),
('student44','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Cadoux','john.cadoux@gmail.com', 1, 1),
('student45','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','John','Roth','john.roth@gmail.com', 1, 1),
('student46','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Martin','Hengel','martin.hengel@gmail.com', 1, 1),
('student47','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Howard','Marshall','howard.marshall@gmail.com', 1, 1),
('student48','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Walter','Brueggemann','walter.brueggemann@gmail.com', 1, 1),
('student49','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Scott','McKnight','scott.McKnight@gmail.com', 1, 1),
('student50','$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S','Donald','Carson','da.carson@gmail.com', 1, 1);


CREATE TABLE `reports` (
        `id`           bigint                NOT NULL AUTO_INCREMENT,
        `report_date`  date                  NOT NULL,
        `rate`         NUMERIC (30, 2)       NOT NULL,
        `comment`      varchar(250),
        `users_id`     bigint                NOT NULL,
        `status_id`    bigint                NOT NULL,
        `created_at`   timestamp default current_timestamp,
        PRIMARY KEY (`id`),
        CONSTRAINT `FK_REPORT_USERS` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
        CONSTRAINT `FK_REPORT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `report_statuses` (`id`)
);
