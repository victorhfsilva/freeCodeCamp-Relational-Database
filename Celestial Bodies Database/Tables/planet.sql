CREATE TABLE IF NOT EXISTS planet (
	planet_id SMALLSERIAL PRIMARY KEY,
	star_id INT,
	galaxy_id INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	has_life BOOLEAN,
	is_spherical BOOLEAN NOT NULL DEFAULT TRUE,
	is_dwarf_planet BOOLEAN NOT NULL,
	surface_temperature INT,
	number_moons INT,
	gravity NUMERIC(4,2),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (star_id) REFERENCES star(star_id),
	FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Mercury', FALSE, FALSE, 440, 0, 3.7) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Venus', FALSE, FALSE, 730, 0, 8.87) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Earth', TRUE, FALSE, 287, 1, 9.8) ON CONFLICT (name) DO NOTHING;

INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Mars', FALSE, FALSE, 227, 2, 3.71) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Jupiter', FALSE, FALSE, 152, 80, 24.79) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Saturn', FALSE, FALSE, 134, 83, 10.44) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Uranus', FALSE, FALSE, 76, 27, 8.87) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Neptune', FALSE, FALSE, 73, 14, 11.15) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Ceres', FALSE, TRUE, 167, 0, 0.27) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Pluto', FALSE, TRUE, 40, 5, 0.62) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Haumea', FALSE, TRUE, 50, 2, 0.63) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO planet (star_id, galaxy_id, name, has_life, is_dwarf_planet, surface_temperature, number_moons, gravity)
	VALUES (1,2,'Makemake', FALSE, TRUE, 30, 1, 0.4) ON CONFLICT (name) DO NOTHING;
	
SELECT * FROM planet;

SELECT galaxy.name, star.name, planet.name, planet.number_moons FROM planet 
JOIN star ON planet.star_id = star.star_id
JOIN galaxy ON galaxy.galaxy_id = planet.galaxy_id;
