DROP DATABASE IF EXISTS passwords;

CREATE DATABASE `passwords` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 512));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS website (
    entry_id        SMALLINT(5)     NOT NULL,
    website_name    VARCHAR(128)    NOT NULL,
    website_url     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (entry_id)
);
CREATE TABLE IF NOT EXISTS user_info (
    entry_id        SMALLINT(5),
    first_name      VARCHAR(32)     NOT NULL,
    last_name       VARCHAR(32)     NOT NULL,
    email           VARCHAR(320)    NOT NULL,
    comment         VARCHAR(256)    NOT NULL,
    PRIMARY KEY (entry_id)
);
CREATE TABLE IF NOT EXISTS login_info (
    entry_id        SMALLINT(5)     NOT NULL,
    username        VARCHAR(32)     NOT NULL,
    password        VARBINARY(512)  NOT NULL,
    creation_time   DATETIME        NOT NULL,
    PRIMARY KEY (entry_id)
);

INSERT INTO website
VALUES
  (1, "Blackboard", "https://blackboard.hartford.edu/"),
  (2, "Hawkmail","https://outlook.office.com/"),
  (3, "Wordpress", "http://wordpress.com/"),
  (4, "GMail", "https://mail.google.com/"),
  (5, "Discord", "http://discord.com/"),
  (6, "Epic Games", "http://store.epicgames.com/"),
  (7, "Instacart", "http://www.instacart.com/"),
  (8, "Uber", "http://www.uber.com/"),
  (9, "The Washington Post", "http://www.washingtonpost.com/"),
  (10, "Khan Academy", "http://www.khanacademy.org/");

INSERT INTO user_info VALUES (1, "Alex", "Cooke-Politikos", "cookepoli@hartford.edu", "Use this for school things.");
INSERT INTO user_info VALUES (2, "Alex", "Cooke-Politikos",  "cookepoli@hartford.edu", "School email.");
INSERT INTO user_info VALUES (3, "John", "Smith",  "johnnys@gmail.com", "Personal website.");
INSERT INTO user_info VALUES (4, "John", "Smith",  "johnnys@gmail.com", "Personal email.");
INSERT INTO user_info VALUES (5, "Dylan", "Falco",  "dylan.falco@msn.net", "Used for gaming.");
INSERT INTO user_info VALUES (6, "Alex", "Cooke-Politikos",  "cookepoli@hartford.edu", "Game library.");
INSERT INTO user_info VALUES (7, "George", "Washington",  "george.washington@uswh.gov", "Deliver groceries to the White House.");
INSERT INTO user_info VALUES (8, "Lewis", "Hamilton",  "7timewdc@gmail.com", "Got to drive fast.");
INSERT INTO user_info VALUES (9, "Will", "Lewis",  "will.lewis@washingtonpost.com", "The only news outlet.");
INSERT INTO user_info VALUES (10, "Timmy", "Smith",  "timmys@gmail.com", "Math help website.");

INSERT INTO login_info VALUES (1,  "cookepoli",AES_ENCRYPT("iloveuhart", @key_str, @init_vector), '2019-09-01 12:00:00');
INSERT INTO login_info VALUES (2, "cookepoli",AES_ENCRYPT("iloveuhart", @key_str, @init_vector), '2019-09-01 12:00:00');
INSERT INTO login_info VALUES (3, "jsmith17",AES_ENCRYPT("password", @key_str, @init_vector), '2020-08-21 13:21:56');
INSERT INTO login_info VALUES (4,"johnnys", AES_ENCRYPT("aBcD1234", @key_str, @init_vector), '2010-02-15 08:52:34');
INSERT INTO login_info VALUES (5,"dfalcon72", AES_ENCRYPT("iL0V3Uh4r7", @key_str, @init_vector), '2017-05-27 18:42:30');
INSERT INTO login_info VALUES (6, "cookiepolitics",AES_ENCRYPT("physics2024", @key_str, @init_vector), '2021-07-17 21:00:17');
INSERT INTO login_info VALUES (7, "gwashington",AES_ENCRYPT("f1rs7pr3s1d3n71776@", @key_str, @init_vector), '1776-07-04 07:00:00');
INSERT INTO login_info VALUES (8, "lh44",AES_ENCRYPT("fastdriver1985", @key_str, @init_vector), '2022-12-11 03:40:21');
INSERT INTO login_info VALUES (9, "willlewisceo",AES_ENCRYPT("wapo2133124", @key_str, @init_vector), '2023-11-05 06:57:00');
INSERT INTO login_info VALUES (10, "tsmith18",AES_ENCRYPT("tsmithm4th", @key_str, @init_vector), '2024-10-01 11:57:56');
