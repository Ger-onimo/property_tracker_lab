DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
id SERIAL4 PRIMARY KEY,
address VARCHAR(255),
value VARCHAR(255),
build VARCHAR(255),
rooms INT2);
