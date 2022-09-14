CREATE TABLE IF NOT EXISTS galaxy (
	galaxy_id SMALLSERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	has_life BOOLEAN,
	is_spherical BOOLEAN NOT NULL DEFAULT FALSE,
	distance_kpc INT,
	distance_kly INT,
	apparent_magnitude NUMERIC(3,2),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	insertion_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO galaxy (name,description, distance_kpc, distance_kly, apparent_magnitude)
VALUES ('Andromeda', 
	'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.',
	770, 2500, 3.44) ON CONFLICT (name) DO NOTHING;
		
INSERT INTO galaxy (name,description, distance_kpc, distance_kly, has_life)
VALUES ('Milk Way', 
		'The galaxy containing the Sun and its Solar System, and therefore Earth.',
		0, 0, TRUE) ON CONFLICT (name) DO NOTHING;
		
INSERT INTO galaxy (name,description, distance_kpc, distance_kly, apparent_magnitude)
VALUES ('Centaurus A', 
	'Centaurus A has been spotted with the naked eye by Stephen James OMeara.',
	4200, 13700, 6.84) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO galaxy (name,description, distance_kpc, distance_kly, apparent_magnitude)
VALUES ('Small Magellanic Cloud',
	'Visible only from the southern hemisphere.',
	61, 200, 2.7) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO galaxy (name,description, distance_kpc, distance_kly, apparent_magnitude)
VALUES ('Triangulum Galaxy',
	'Its visibility is strongly affected by even small amounts of light pollution.',
	890, 2900, 5.7) ON CONFLICT (name) DO NOTHING;
	
INSERT INTO galaxy (name,description, distance_kpc, distance_kly, apparent_magnitude)
VALUES ('Large Magellanic Cloud',
	'Visible only from the southern hemisphere.',
	49, 160, 0.9) ON CONFLICT (name) DO NOTHING;
	
SELECT * FROM galaxy;
