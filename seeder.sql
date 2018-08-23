use adlister_db;

CREATE TABLE IF NOT EXISTS users (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  password VARCHAR(24) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS ads (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INTEGER UNSIGNED NOT NULL,
  title VARCHAR(50),
  description VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

insert into users (username, email, password) values
  ('tenglishjr', 'tj@gmail.com', 'codeup');