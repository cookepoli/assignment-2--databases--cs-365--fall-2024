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
