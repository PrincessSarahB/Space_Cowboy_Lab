DROP TABLE space_cowboys_bounty;

CREATE TABLE space_cowboys_bounty(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
danger_level VARCHAR(255),
bounty_value INT,
homeworld VARCHAR(255)
);
