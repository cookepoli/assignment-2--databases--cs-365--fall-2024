--cmd 1
INSERT INTO user_info VALUES (11, "James", "Smith", "jsmith19", "jsmith@hotmail.com", "Online shopping.");
INSERT INTO website VALUES (11, "Amazon", "https://www.amazon.com/");
INSERT INTO login_info VALUES (11, AES_ENCRYPT("l0v32sh0p", @key_str, @init_vector), '10-10-21 14:05:24');

--cmd 2
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) FROM login_info WHERE entry_id = (SELECT entry_id FROM website WHERE website_url = "http://www.uber.com/");

--cmd 3
