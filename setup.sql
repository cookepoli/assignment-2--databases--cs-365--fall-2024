

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
    entry_id        SMALLINT(5)
    first_name      VARCHAR(32)     NOT NULL,
    last_name       VARCHAR(32)     NOT NULL,
    username        VARCHAR(32)     NOT NULL,
    email           VARCHAR(320)    NOT NULL,
    PRIMARY KEY (entry_id)
);
CREATE TABLE IF NOT EXISTS login_info (
    entry_id        SMALLINT(5)     NOT NULL,
    password        VARCHAR(128)    NOT NULL,
    comment         VARCHAR(256)    NOT NULL,
    creation_time   TIMESTAMP       NOT NULL,
    PRIMARY KEY (entry_id)
);

--Setting up the website table.
INSERT INTO website VALUES (1, "Blackboard", "https://blackboard.hartford.edu/");
INSERT INTO website VALUES (2, "Hawkmail","https://outlook.office.com/");
INSERT INTO website VALUES (3, "Wordpress", "http://wordpress.com/");
INSERT INTO website VALUES (4, "GMail", "https://mail.google.com/");
INSERT INTO website VALUES (5, "Discord", "http://discord.com/");
INSERT INTO website VALUES (6, "Epic Games", "http://store.epicgames.com/");
INSERT INTO website VALUES (7, "Instacart", "http://www.instacart.com/");
INSERT INTO website VALUES (8, "Uber", "http://www.uber.com/");
INSERT INTO website VALUES (9, "New York Times", "http://www.nytimes.com/");
INSERT INTO website VALUES (10, "Khan Academy", "http://www.khanacademy.org/")


--source commands.sql