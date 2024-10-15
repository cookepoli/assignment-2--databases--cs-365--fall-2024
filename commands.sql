--cmd 1
INSERT INTO user_info VALUES (11, "James", "Smith", "jsmith@hotmail.com", "Online shopping.");
INSERT INTO website VALUES (11, "Amazon", "https://www.amazon.com/");
INSERT INTO login_info VALUES (11,  "jsmith19", AES_ENCRYPT("l0v32sh0p", @key_str, @init_vector), '10-10-21 14:05:24');

--cmd 2
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) FROM login_info WHERE entry_id = (SELECT entry_id FROM website WHERE website_url = "http://www.uber.com/");
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) FROM login_info JOIN website USING (entry_id) WHERE website_url = "http://www.uber.com/";

--cmd 3
SELECT username,password,creation_time FROM login_info JOIN website USING (entry_id) WHERE website_url LIKE "https%";

--cmd 4
UPDATE website INNER JOIN login_info ON (website.entry_id = login_info.entry_id) SET website_url = "https://www.doordash.com/" WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "fastdriver1985";

--cmd 5
UPDATE login_info SET password = AES_ENCRYPT("howi3theh4wk", @key_str, @init_vector) WHERE entry_id = 1;
UPDATE login_info SET password = AES_ENCRYPT("howi3theh4wk", @key_str, @init_vector) WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "physics2024";

--cmd 6
DELETE FROM user_info, login_info, website USING user_info, login_info, website WHERE website.entry_id = (SELECT * FROM (SELECT entry_id FROM website WHERE website_url = "http://uber.com/")temp) AND user_info.entry_id = login_info.entry_id AND login_info.entry_id = website.entry_id AND user_info.entry_id = website.entry_id;

--cmd 7
DELETE FROM user_info, login_info, website USING user_info, login_info, website WHERE login_info.entry_id = (SELECT * FROM (SELECT entry_id FROM website WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "wapo2133124")temp) AND user_info.entry_id = login_info.entry_id AND login_info.entry_id = website.entry_id AND user_info.entry_id = website.entry_id;
