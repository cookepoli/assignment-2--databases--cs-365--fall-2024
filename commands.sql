--cmd 1
INSERT INTO user_info
VALUES
  (0, "James", "Smith", "jsmith@hotmail.com", "Online shopping.");
INSERT INTO website
VALUES
  (0, "Amazon", "https://www.amazon.com/");
INSERT INTO login_info
VALUES
  (0,  "jsmith19", AES_ENCRYPT("l0v32sh0p", @key_str, @init_vector), '10-10-21 14:05:24');

--cmd 2
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR)
FROM login_info
WHERE entry_id = (
  SELECT entry_id
  FROM website
  WHERE website_url = "http://www.uber.com/"
);

SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR)
FROM login_info
JOIN website
USING (entry_id)
WHERE website_url = "http://www.uber.com/";

--cmd 3
SELECT username,password,creation_time
FROM login_info
JOIN website
USING (entry_id)
WHERE website_url
LIKE "https%";

--cmd 4
UPDATE website
INNER JOIN login_info
ON (website.entry_id = login_info.entry_id)
SET website_url = "https://www.doordash.com/"
WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "fastdriver1985";


--cmd 5.1 Update password given an entry id.
UPDATE login_info
SET password = AES_ENCRYPT("howi3theh4wk", @key_str, @init_vector)
WHERE entry_id = 1;

--cmd 5.2 Update a password given the password to be changed.

UPDATE login_info
SET password = AES_ENCRYPT("howi3theh4wk", @key_str, @init_vector)
WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "physics2024";

--cmd 6

DELETE user_info, login_info, website
FROM user_info
JOIN login_info
ON (user_info.entry_id = login_info.entry_id)
JOIN website
ON (login_info.entry_id = website.entry_id)
WHERE website_url = "http://www.uber.com/";

--cmd 7

DELETE user_info, login_info, website
FROM user_info
JOIN login_info
ON (user_info.entry_id = login_info.entry_id)
JOIN website
ON (login_info.entry_id = website.entry_id)
WHERE CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) = "f1rs7pr3s1d3n71776@";
