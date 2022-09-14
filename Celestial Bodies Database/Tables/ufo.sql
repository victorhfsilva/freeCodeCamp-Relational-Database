CREATE TABLE IF NOT EXISTS ufo (
	ufo_id SMALLSERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	can_destroy_a_planet BOOLEAN,
	has_anti_gravity BOOLEAN,
	diameter INT,
	mass INT,
	gravity NUMERIC(3,2),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ufo (name,description, can_destroy_a_planet, has_anti_gravity, diameter, mass, gravity)
VALUES ('DS1', 'Death Star - 1',TRUE, FALSE, 4000, 8000, 6.5) ON CONFLICT (name) DO NOTHING;

INSERT INTO ufo (name,description, can_destroy_a_planet, has_anti_gravity, diameter, mass, gravity)
VALUES ('DS2', 'Death Star - 2',TRUE, FALSE, 6000, 12000, 8.2) ON CONFLICT (name) DO NOTHING;

INSERT INTO ufo (name, can_destroy_a_planet, has_anti_gravity, gravity)
VALUES ('Pentago UFO', FALSE, TRUE, 0) ON CONFLICT (name) DO NOTHING;

INSERT INTO ufo (name, can_destroy_a_planet, has_anti_gravity, gravity)
VALUES ('Roswell Flying Saucer', FALSE, TRUE, 0) ON CONFLICT (name) DO NOTHING;

SELECT * FROM ufo;
