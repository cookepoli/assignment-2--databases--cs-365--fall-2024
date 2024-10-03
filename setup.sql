

DROP DATABASE IF EXISTS passwords;

CREATE DATABASE `passwords` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 512));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS website (
    entry_id        SMALLINT(5)
    website_name    VARCHAR(128)    NOT NULL,
    website_url     VARCHAR(128)    NOT NULL,
    PRIMARY KEY (entry_id)
)
CREATE TABLE IF NOT EXISTS user_info (
    entry_id        SMALLINT(5)
    website_url     VARCHAR(128)    NOT NULL,
    first_name      VARCHAR(32)     NOT NULL,
    last_name       VARCHAR(32)     NOT NULL,
    username        VARCHAR(32)     NOT NULL,
    email           VARCHAR(320)    NOT NULL
    PRIMARY KEY (entry_id)
)
CREATE TABLE IF NOT EXISTS login_info (
    entry_id        SMALLINT(5)
    website_url     VARCHAR(128)
    password        VARCHAR(128)
    comment         VARCHAR(256)
    creation_time   TIMESTAMP
    PRIMARY KEY (entry_id)
)

INSERT INTO website(1, )



source commands.sql