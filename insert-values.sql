INSERT INTO website
VALUES
  (0, "Blackboard", "https://blackboard.hartford.edu/"),
  (0, "Hawkmail","https://outlook.office.com/"),
  (0, "Wordpress", "http://wordpress.com/"),
  (0, "GMail", "https://mail.google.com/"),
  (0, "Discord", "http://discord.com/"),
  (0, "Epic Games", "http://store.epicgames.com/"),
  (0, "Instacart", "http://www.instacart.com/"),
  (0, "Uber", "http://www.uber.com/"),
  (0, "The Washington Post", "http://www.washingtonpost.com/"),
  (0, "Khan Academy", "http://www.khanacademy.org/");

INSERT INTO user_info
VALUES
  (0, "Alex", "Cooke-Politikos", "cookepoli@hartford.edu", "Use this for school things."),
  (0, "Alex", "Cooke-Politikos",  "cookepoli@hartford.edu", "School email."),
  (0, "John", "Smith",  "johnnys@gmail.com", "Personal website."),
  (0, "John", "Smith",  "johnnys@gmail.com", "Personal email."),
  (0, "Dylan", "Falco",  "dylan.falco@msn.net", "Used for gaming."),
  (0, "Alex", "Cooke-Politikos",  "cookepoli@hartford.edu", "Game library."),
  (0, "George", "Washington",  "george.washington@uswh.gov", "Deliver groceries to the White House."),
  (0, "Lewis", "Hamilton",  "7timewdc@gmail.com", "Got to drive fast."),
  (0, "Will", "Lewis",  "will.lewis@washingtonpost.com", "The only news outlet."),
  (0, "Timmy", "Smith",  "timmys@gmail.com", "Math help website.");

INSERT INTO login_info
VALUES
  (0,  "cookepoli",AES_ENCRYPT("iloveuhart", @key_str, @init_vector), '2019-09-01 12:00:00'),
  (0, "cookepoli",AES_ENCRYPT("iloveuhart", @key_str, @init_vector), '2019-09-01 12:00:00'),
  (0, "jsmith17",AES_ENCRYPT("password", @key_str, @init_vector), '2020-08-21 13:21:56'),
  (0,"johnnys", AES_ENCRYPT("aBcD1234", @key_str, @init_vector), '2010-02-15 08:52:34'),
  (0,"dfalcon72", AES_ENCRYPT("iL0V3Uh4r7", @key_str, @init_vector), '2017-05-27 18:42:30'),
  (0, "cookiepolitics",AES_ENCRYPT("physics2024", @key_str, @init_vector), '2021-07-17 21:00:17'),
  (0, "gwashington",AES_ENCRYPT("f1rs7pr3s1d3n71776@", @key_str, @init_vector), '1776-07-04 07:00:00'),
  (0, "lh44",AES_ENCRYPT("fastdriver1985", @key_str, @init_vector), '2022-12-11 03:40:21'),
  (0, "willlewisceo",AES_ENCRYPT("wapo2133124", @key_str, @init_vector), '2023-11-05 06:57:00'),
  (0, "tsmith18",AES_ENCRYPT("tsmithm4th", @key_str, @init_vector), '2024-10-01 11:57:56');
