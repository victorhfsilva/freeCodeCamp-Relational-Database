CREATE TABLE IF NOT EXISTS moon (
	moon_id SMALLSERIAL PRIMARY KEY,
	planet_id INT,
	star_id INT,
	galaxy_id INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	has_life BOOLEAN,
	is_spherical BOOLEAN NOT NULL,
	diameter INT,
	mass INT,
	orbital_period NUMERIC(7,3),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
	FOREIGN KEY (star_id) REFERENCES star(star_id),
	FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (3,1,2,'Moon', FALSE, TRUE, 5460, 7342000, 1) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Metis', FALSE, FALSE, 43, 4, 0.295) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Amalthea', FALSE, FALSE, 167, 208, 0.5) ON CONFLICT (name) DO NOTHING;

INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Thebe', FALSE, FALSE, 99, 43, 0.676) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Io', FALSE, TRUE, 3643, 8931900, 1.763) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Europa', FALSE, TRUE, 3122, 4799800, 3.525) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Ganymede', FALSE, TRUE, 5268, 14819000, 7.156) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Callisto', FALSE, TRUE, 4821, 10759000, 16.690) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Himalia', FALSE, FALSE, 140, 420, 250.56) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Lysithea', FALSE, FALSE, 42, 4, 259.20) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (5,1,2,'Elara', FALSE, FALSE, 79.9, 27, 259.64) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Cordelia', FALSE, FALSE, 40, 4, 0.335) ON CONFLICT (name) DO NOTHING;	
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Ophelia', FALSE, FALSE, 43, 5, 0.376) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Bianca', FALSE, FALSE, 51, 9, 0.434) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Cressida', FALSE, FALSE, 80, 34, 0.463) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Desdemona', FALSE, FALSE, 64, 18, 0.473) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Juliet', FALSE, FALSE, 94, 56, 0.493) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Portia', FALSE, FALSE, 135, 170, 0.513) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Rosalind', FALSE, FALSE, 72, 25, 0.558) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Belinda', FALSE, FALSE, 90, 49, 0.623) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Miranda', FALSE, TRUE, 472, 6400, 1.413) ON CONFLICT (name) DO NOTHING;

INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Ariel', FALSE, TRUE, 1158, 125100, 2.520) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO moon (planet_id, star_id, galaxy_id, name, has_life, is_spherical, diameter, mass, orbital_period)
	VALUES (7,1,2,'Umbriel', FALSE, TRUE, 1169, 127500, 4.144) ON CONFLICT (name) DO NOTHING;		
		
SELECT * FROM moon;

SELECT galaxy.name, star.name, planet.name, moon.name FROM moon 
JOIN planet ON planet.planet_id = moon.planet_id
JOIN star ON moon.star_id = star.star_id
JOIN galaxy ON galaxy.galaxy_id = moon.galaxy_id;
		
				

