CREATE DATABASE IF NOT EXISTS 2DV514 DEFAULT CHARACTER SET utf8;
USE `2DV514`;

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE recipes
(
  id INTEGER AUTO_INCREMENT,
  name TEXT,
  calories TEXT,
  PRIMARY KEY (id)
);

INSERT INTO recipes VALUES (1, 'goulash', 9000);
