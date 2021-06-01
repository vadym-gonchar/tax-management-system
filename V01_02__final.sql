CREATE TABLE `roles`
(
    `id`   bigint primary key AUTO_INCREMENT,
    `name` varchar(50) NOT NULL UNIQUE
);
INSERT INTO `roles` (name)
VALUES ('ROLE_USER'),
       ('ROLE_ADMIN');



CREATE TABLE `user_types`
(
    `id`   bigint primary key AUTO_INCREMENT,
    `name` varchar(50) NOT NULL UNIQUE
);
INSERT INTO `user_types` (name)
VALUES ('natural_type'),
       ('legal_type');



CREATE TABLE `report_statuses`
(
    `id`   bigint primary key AUTO_INCREMENT,
    `name` varchar(50) NOT NULL UNIQUE
);
INSERT INTO `report_statuses` (name)
VALUES ('pending'),
       ('rejected'),
       ('approved');


CREATE TABLE `users`
(
    `id`            bigint primary key AUTO_INCREMENT,
    `username`      varchar(50) NOT NULL UNIQUE,
    `password`      varchar(80) NOT NULL,
    `first_name`    varchar(50) NOT NULL,
    `last_name`     varchar(50) NOT NULL,
    `email`         varchar(50) NOT NULL,
    `roles_id`      bigint      NOT NULL,
    `user_types_id` bigint      NOT NULL,
    CONSTRAINT `FK_USERS_ROLES` FOREIGN KEY (`roles_id`)
        REFERENCES `roles` (`id`),
    CONSTRAINT `FK_USERS_USER_TYPES` FOREIGN KEY (`user_types_id`)
        REFERENCES `user_types` (`id`)
);

INSERT INTO `users` (username, password, first_name, last_name, email, roles_id, user_types_id)
    VALUE ('admin', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Admin', 'Admin',
           'admin.admin@gmail.com', 2, 2);

INSERT INTO `users` (username, password, first_name, last_name, email, roles_id, user_types_id)
VALUES ('user1', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Richard', 'Hays',
        'richard.hays@gmail.com', 1, 1),
       ('user2', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Tom', 'Wright',
        'tom.wright@gmail.com', 1, 2),
       ('user3', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Yoder',
        'john.yoder@gmail.com', 1, 1),
       ('user4', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Gregory', 'Boyd',
        'greg.boyd@gmail.com', 1, 2),
       ('user5', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ed', 'Sanders',
        'ed.sanders@gmail.com', 1, 1),
       ('user6', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Stanley', 'Hauerwas',
        'stan.hauerwas@gmail.com', 1, 2),
       ('user7', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ronald', 'Sider',
        'ron.sider@gmail.com', 1, 1),
       ('user8', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Guy', 'Hershberger',
        'guy.hershberger@gmail.com', 1, 1),
       ('user9', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Cadoux',
        'john.cadoux@gmail.com', 1, 2),
       ('user10', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Roth', 'john.roth@gmail.com',
        1, 1),
       ('user11', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Martin', 'Hengel',
        'martin.hengel@gmail.com', 1, 1),
       ('user12', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Howard', 'Marshall',
        'howard.marshall@gmail.com', 1, 2),
       ('user13', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Walter', 'Brueggemann',
        'walter.brueggemann@gmail.com', 1, 2),
       ('user14', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Scott', 'McKnight',
        'scott.McKnight@gmail.com', 1, 1),
       ('user15', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Donald', 'Carson',
        'da.carson@gmail.com', 1, 1),
       ('user16', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Stanley', 'Hauerwas',
        'stan.hauerwas@gmail.com', 1, 2),
       ('user17', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ronald', 'Sider',
        'ron.sider@gmail.com', 1, 1),
       ('user18', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Guy', 'Hershberger',
        'guy.hershberger@gmail.com', 1, 1),
       ('user19', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Cadoux',
        'john.cadoux@gmail.com', 1, 1),
       ('user20', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Roth', 'john.roth@gmail.com',
        1, 1),
       ('user21', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Martin', 'Hengel',
        'martin.hengel@gmail.com', 1, 2),
       ('user22', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Howard', 'Marshall',
        'howard.marshall@gmail.com', 1, 1),
       ('user23', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Walter', 'Brueggemann',
        'walter.brueggemann@gmail.com', 1, 2),
       ('user24', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Scott', 'McKnight',
        'scott.McKnight@gmail.com', 1, 2),
       ('user25', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Donald', 'Carson',
        'da.carson@gmail.com', 1, 1),
       ('user26', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Richard', 'Hays',
        'richard.hays@gmail.com', 1, 2),
       ('user27', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Tom', 'Wright',
        'tom.wright@gmail.com', 1, 1),
       ('user28', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Yoder',
        'john.yoder@gmail.com', 1, 2),
       ('user29', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Gregory', 'Boyd',
        'greg.boyd@gmail.com', 1, 1),
       ('user30', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ed', 'Sanders',
        'ed.sanders@gmail.com', 1, 1),
       ('user31', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Stanley', 'Hauerwas',
        'stan.hauerwas@gmail.com', 1, 2),
       ('user32', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ronald', 'Sider',
        'ron.sider@gmail.com', 1, 1),
       ('user33', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Guy', 'Hershberger',
        'guy.hershberger@gmail.com', 1, 2),
       ('user34', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Cadoux',
        'john.cadoux@gmail.com', 1, 1),
       ('user35', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Roth', 'john.roth@gmail.com',
        1, 1),
       ('user36', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Martin', 'Hengel',
        'martin.hengel@gmail.com', 1, 1),
       ('user37', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Howard', 'Marshall',
        'howard.marshall@gmail.com', 1, 2),
       ('user38', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Walter', 'Brueggemann',
        'walter.brueggemann@gmail.com', 1, 1),
       ('user39', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Scott', 'McKnight',
        'scott.McKnight@gmail.com', 1, 2),
       ('user40', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Donald', 'Carson',
        'da.carson@gmail.com', 1, 1),
       ('user41', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Stanley', 'Hauerwas',
        'stan.hauerwas@gmail.com', 1, 1),
       ('user42', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Ronald', 'Sider',
        'ron.sider@gmail.com', 1, 1),
       ('user43', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Guy', 'Hershberger',
        'guy.hershberger@gmail.com', 1, 2),
       ('user44', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Cadoux',
        'john.cadoux@gmail.com', 1, 1),
       ('user45', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'John', 'Roth', 'john.roth@gmail.com',
        1, 1),
       ('user46', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Martin', 'Hengel',
        'martin.hengel@gmail.com', 1, 2),
       ('user47', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Howard', 'Marshall',
        'howard.marshall@gmail.com', 1, 1),
       ('user48', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Walter', 'Brueggemann',
        'walter.brueggemann@gmail.com', 1, 2),
       ('user49', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Scott', 'McKnight',
        'scott.McKnight@gmail.com', 1, 1),
       ('user50', '$2a$10$OoNWi58AteuNodqeUW7Yf.8GhpzeNB3FpbICSCstlejsvEvms7B7S', 'Donald', 'Carson',
        'da.carson@gmail.com', 1, 2);



CREATE TABLE `reports`
(
    `id`            bigint         NOT NULL AUTO_INCREMENT,
    `report_date`   date           NOT NULL,
    `rate`          NUMERIC(30, 2) NOT NULL,
    `comment`       varchar(250),
    `users_id`      bigint         NOT NULL,
    `status_id`     bigint         NOT NULL,
    `created_at`    timestamp      NOT NULL default current_timestamp,
    `last_modified` timestamp      NOT NULL default current_timestamp on update current_timestamp,
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_REPORT_USERS` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
    CONSTRAINT `FK_REPORT_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `report_statuses` (`id`)
);

INSERT INTO reports (report_date, rate, users_id, status_id)
VALUES ('2021-09-07 13:03:02', 8241, 50, 3),
       ('2020-05-11 09:02:15', 1815, 19, 1),
       ('2021-01-03 16:04:16', 1262, 24, 1),
       ('2022-02-18 16:48:38', 4817, 12, 3),
       ('2021-10-02 23:59:52', 1875, 21, 1),
       ('2021-07-16 05:20:20', 8662, 34, 1),
       ('2020-08-18 23:50:58', 3728, 10, 2),
       ('2020-12-04 21:46:52', 7683, 16, 1),
       ('2022-04-25 12:33:19', 6797, 13, 3),
       ('2021-09-11 14:53:35', 6487, 46, 2),
       ('2021-02-18 05:57:53', 7813, 7, 1),
       ('2021-06-10 19:22:24', 2340, 37, 1),
       ('2021-05-20 22:31:42', 7710, 26, 3),
       ('2020-05-30 16:36:38', 315, 50, 1),
       ('2022-04-14 11:09:46', 9464, 7, 3),
       ('2021-04-30 06:15:27', 341, 23, 2),
       ('2020-12-10 02:52:38', 2757, 13, 3),
       ('2021-11-12 01:54:36', 8710, 41, 1),
       ('2021-06-29 18:37:28', 4334, 26, 2),
       ('2021-03-11 11:01:44', 7254, 31, 2),
       ('2020-10-24 10:18:21', 694, 51, 1),
       ('2021-06-11 09:15:58', 1192, 21, 1),
       ('2021-03-17 02:08:58', 4689, 37, 1),
       ('2022-02-06 21:14:57', 2928, 16, 1),
       ('2022-02-25 11:33:12', 7204, 39, 1),
       ('2020-07-24 13:35:10', 9142, 13, 2),
       ('2021-12-26 21:00:09', 7888, 14, 1),
       ('2020-12-14 12:03:50', 2179, 2, 3),
       ('2020-10-19 17:03:15', 6684, 29, 1),
       ('2020-10-25 00:49:18', 3490, 16, 2),
       ('2021-09-02 07:25:58', 6130, 12, 3),
       ('2022-03-31 09:53:53', 6302, 38, 3),
       ('2021-09-29 19:24:06', 8357, 43, 1),
       ('2022-02-04 03:16:22', 2828, 16, 3),
       ('2021-02-03 10:01:03', 1817, 18, 3),
       ('2022-04-08 13:37:32', 1454, 51, 2),
       ('2020-06-08 01:52:44', 3983, 38, 2),
       ('2021-11-10 19:06:54', 5403, 45, 1),
       ('2020-10-09 12:13:10', 4519, 23, 2),
       ('2020-06-18 10:53:47', 9761, 49, 3),
       ('2022-01-07 22:09:12', 1199, 12, 3),
       ('2022-01-31 16:56:39', 4264, 39, 3),
       ('2021-02-06 08:42:17', 4376, 43, 2),
       ('2020-11-03 00:51:39', 2703, 35, 3),
       ('2020-11-01 09:11:19', 3488, 4, 1),
       ('2021-05-25 05:39:22', 6626, 33, 1),
       ('2021-12-11 15:19:29', 1384, 46, 1),
       ('2021-02-28 18:03:40', 7681, 29, 2),
       ('2021-07-15 14:04:05', 552, 8, 1),
       ('2021-01-17 19:19:59', 3847, 25, 2),
       ('2021-04-25 23:43:40', 57, 39, 2),
       ('2021-02-11 21:20:54', 7983, 41, 1),
       ('2020-12-01 17:48:50', 9434, 32, 3),
       ('2022-03-19 04:39:37', 6428, 20, 2),
       ('2022-01-14 15:52:48', 8632, 28, 1),
       ('2021-02-18 12:11:22', 8287, 39, 1),
       ('2020-07-25 09:03:51', 896, 14, 2),
       ('2021-09-05 22:55:48', 8481, 19, 1),
       ('2021-12-31 23:04:43', 2671, 31, 3),
       ('2021-04-17 22:31:55', 2715, 16, 1),
       ('2020-08-07 17:50:03', 4658, 46, 1),
       ('2021-03-20 03:38:58', 2815, 50, 2),
       ('2021-10-20 23:36:05', 4601, 12, 2),
       ('2022-04-03 02:26:40', 2454, 7, 2),
       ('2020-11-29 09:03:28', 3851, 45, 1),
       ('2020-10-04 16:45:33', 2383, 46, 1),
       ('2020-08-14 09:17:10', 8875, 25, 2),
       ('2021-04-11 16:42:27', 6414, 43, 3),
       ('2021-05-05 20:00:53', 9179, 47, 3),
       ('2021-08-10 05:47:05', 6064, 24, 2),
       ('2020-07-17 02:21:27', 6084, 46, 3),
       ('2020-06-12 11:27:38', 7744, 34, 2),
       ('2021-10-06 10:11:13', 2562, 12, 1),
       ('2021-07-30 21:31:26', 7335, 29, 1),
       ('2021-02-18 09:20:36', 8917, 17, 1),
       ('2021-10-16 14:07:11', 6730, 48, 1),
       ('2021-06-29 01:37:41', 4104, 30, 2),
       ('2021-01-10 05:41:42', 2871, 26, 3),
       ('2022-03-11 14:42:53', 9601, 38, 3),
       ('2021-03-16 12:48:40', 7282, 46, 3),
       ('2020-07-31 22:43:58', 6599, 5, 2),
       ('2022-01-22 15:11:37', 7209, 17, 3),
       ('2020-07-03 07:58:30', 5450, 11, 2),
       ('2021-08-08 03:48:58', 7129, 4, 2),
       ('2020-11-24 15:42:25', 7340, 18, 3),
       ('2021-01-28 16:51:17', 8097, 51, 1),
       ('2020-09-08 04:46:21', 3411, 34, 1),
       ('2022-04-18 09:17:09', 6295, 44, 1),
       ('2021-03-27 22:01:15', 9035, 51, 2),
       ('2020-08-29 00:40:25', 2138, 16, 2),
       ('2022-04-09 06:01:23', 5828, 29, 3),
       ('2021-07-20 13:00:00', 6792, 47, 2),
       ('2021-09-09 07:27:04', 4049, 11, 3),
       ('2020-06-15 10:25:37', 8521, 27, 2),
       ('2022-03-31 13:09:57', 7727, 42, 2),
       ('2021-12-13 06:22:00', 9237, 6, 1),
       ('2021-09-04 03:44:55', 4372, 12, 2),
       ('2022-02-12 10:23:02', 4747, 11, 2),
       ('2021-06-10 12:31:44', 3809, 19, 1),
       ('2021-07-09 09:18:25', 8691, 21, 1);