CREATE TABLE IF NOT EXISTS star (
	star_id SMALLSERIAL PRIMARY KEY,
	galaxy_id INT,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	is_spherical BOOLEAN NOT NULL DEFAULT TRUE,
	age_myr INT,
	temperature_k INT,
	apparent_magnitude NUMERIC(3,2),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

INSERT INTO star (galaxy_id, name, description, age_myr, temperature_k)
	VALUES (2,'Sun', 'The Sun is the star at the center of the Solar System.',
	4600,5772) ON CONFLICT (name) DO NOTHING;

INSERT INTO star (galaxy_id, name, description, age_myr, temperature_k, apparent_magnitude)
	VALUES (2, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun',
	4850, 3042, 11.11) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO star (galaxy_id, name, description, age_myr, temperature_k, apparent_magnitude)
	VALUES (2, 'Barnards Star', 'Barnards Star is a red dwarf about six light-years from Earth in the constellation of Ophiuchus.',
	10000, 3134, 12.50) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO star (galaxy_id, name, temperature_k, apparent_magnitude)
	VALUES (2, 'WISE 0855−0714', 260, 25) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO star (galaxy_id, name, description, age_myr, temperature_k, apparent_magnitude)
	VALUES (2, 'Wolf 359', 'Wolf 359 is a red dwarf star located in the constellation Leo, near the ecliptic.',
	350000, 2749, 7.1) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO star (galaxy_id, name, description, age_myr, temperature_k, apparent_magnitude)
	VALUES (2, 'Epsilon Eridani', 'Epsilon Eridani, formally named Ran, is a star in the southern constellation of Eridanus.',
	800000, 5084, 4.61) ON CONFLICT (name) DO NOTHING;

SELECT * FROM star;

SELECT star.name, galaxy.name, star.description FROM star JOIN galaxy ON star.galaxy_id = galaxy.galaxy_id;
