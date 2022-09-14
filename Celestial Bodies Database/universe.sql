--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean DEFAULT false NOT NULL,
    distance_kpc integer,
    distance_kly integer,
    apparent_magnitude numeric(3,2),
    active boolean DEFAULT true NOT NULL,
    insertion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id smallint NOT NULL,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    diameter integer,
    mass integer,
    orbital_period numeric(7,3),
    active boolean DEFAULT true NOT NULL,
    insertion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id smallint NOT NULL,
    star_id integer,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean DEFAULT true NOT NULL,
    is_dwarf_planet boolean NOT NULL,
    surface_temperature integer,
    number_moons integer,
    gravity numeric(4,2),
    active boolean DEFAULT true NOT NULL,
    insertion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id smallint NOT NULL,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean DEFAULT true NOT NULL,
    age_myr integer,
    temperature_k integer,
    apparent_magnitude numeric(4,2),
    active boolean DEFAULT true NOT NULL,
    insertion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: ufo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ufo (
    ufo_id smallint NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    can_destroy_a_planet boolean,
    has_anti_gravity boolean,
    diameter integer,
    mass integer,
    gravity numeric(3,2),
    active boolean DEFAULT true NOT NULL,
    insertion_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.ufo OWNER TO freecodecamp;

--
-- Name: ufo_ufo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ufo_ufo_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ufo_ufo_id_seq OWNER TO freecodecamp;

--
-- Name: ufo_ufo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ufo_ufo_id_seq OWNED BY public.ufo.ufo_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: ufo ufo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ufo ALTER COLUMN ufo_id SET DEFAULT nextval('public.ufo_ufo_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.', NULL, false, 770, 2500, 3.44, true, '2022-09-14 20:39:18.636249');
INSERT INTO public.galaxy VALUES (2, 'Milk Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', true, false, 0, 0, NULL, true, '2022-09-14 20:39:30.0031');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Centaurus A has been spotted with the naked eye by Stephen James OMeara.', NULL, false, 4200, 13700, 6.84, true, '2022-09-14 20:39:39.440894');
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Visible only from the southern hemisphere.', NULL, false, 61, 200, 2.70, true, '2022-09-14 20:39:48.993274');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Its visibility is strongly affected by even small amounts of light pollution.', NULL, false, 890, 2900, 5.70, true, '2022-09-14 20:39:58.731447');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Visible only from the southern hemisphere.', NULL, false, 49, 160, 0.90, true, '2022-09-14 20:40:07.776544');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 1, 2, 'Moon', NULL, false, true, 5460, 7342000, 1.000, true, '2022-09-14 20:54:00.602273');
INSERT INTO public.moon VALUES (2, 5, 1, 2, 'Metis', NULL, false, false, 43, 4, 0.295, true, '2022-09-14 20:54:08.834098');
INSERT INTO public.moon VALUES (3, 5, 1, 2, 'Amalthea', NULL, false, false, 167, 208, 0.500, true, '2022-09-14 20:54:16.091899');
INSERT INTO public.moon VALUES (4, 5, 1, 2, 'Thebe', NULL, false, false, 99, 43, 0.676, true, '2022-09-14 20:54:23.884994');
INSERT INTO public.moon VALUES (5, 5, 1, 2, 'Io', NULL, false, true, 3643, 8931900, 1.763, true, '2022-09-14 20:54:31.442215');
INSERT INTO public.moon VALUES (6, 5, 1, 2, 'Europa', NULL, false, true, 3122, 4799800, 3.525, true, '2022-09-14 20:54:40.031717');
INSERT INTO public.moon VALUES (7, 5, 1, 2, 'Ganymede', NULL, false, true, 5268, 14819000, 7.156, true, '2022-09-14 20:54:46.982893');
INSERT INTO public.moon VALUES (8, 5, 1, 2, 'Callisto', NULL, false, true, 4821, 10759000, 16.690, true, '2022-09-14 20:54:54.424625');
INSERT INTO public.moon VALUES (9, 5, 1, 2, 'Himalia', NULL, false, false, 140, 420, 250.560, true, '2022-09-14 20:55:01.561588');
INSERT INTO public.moon VALUES (10, 5, 1, 2, 'Lysithea', NULL, false, false, 42, 4, 259.200, true, '2022-09-14 20:55:09.435776');
INSERT INTO public.moon VALUES (11, 5, 1, 2, 'Elara', NULL, false, false, 80, 27, 259.640, true, '2022-09-14 20:55:17.161396');
INSERT INTO public.moon VALUES (12, 7, 1, 2, 'Cordelia', NULL, false, false, 40, 4, 0.335, true, '2022-09-14 20:55:23.432958');
INSERT INTO public.moon VALUES (13, 7, 1, 2, 'Ophelia', NULL, false, false, 43, 5, 0.376, true, '2022-09-14 20:55:31.364526');
INSERT INTO public.moon VALUES (14, 7, 1, 2, 'Bianca', NULL, false, false, 51, 9, 0.434, true, '2022-09-14 20:55:37.357849');
INSERT INTO public.moon VALUES (15, 7, 1, 2, 'Cressida', NULL, false, false, 80, 34, 0.463, true, '2022-09-14 20:55:43.79824');
INSERT INTO public.moon VALUES (16, 7, 1, 2, 'Desdemona', NULL, false, false, 64, 18, 0.473, true, '2022-09-14 20:55:50.244796');
INSERT INTO public.moon VALUES (17, 7, 1, 2, 'Juliet', NULL, false, false, 94, 56, 0.493, true, '2022-09-14 20:55:57.461245');
INSERT INTO public.moon VALUES (18, 7, 1, 2, 'Portia', NULL, false, false, 135, 170, 0.513, true, '2022-09-14 20:56:03.977595');
INSERT INTO public.moon VALUES (19, 7, 1, 2, 'Rosalind', NULL, false, false, 72, 25, 0.558, true, '2022-09-14 20:56:10.790076');
INSERT INTO public.moon VALUES (20, 7, 1, 2, 'Belinda', NULL, false, false, 90, 49, 0.623, true, '2022-09-14 20:56:17.25251');
INSERT INTO public.moon VALUES (21, 7, 1, 2, 'Miranda', NULL, false, true, 472, 6400, 1.413, true, '2022-09-14 20:56:23.687205');
INSERT INTO public.moon VALUES (22, 7, 1, 2, 'Ariel', NULL, false, true, 1158, 125100, 2.520, true, '2022-09-14 20:56:29.314417');
INSERT INTO public.moon VALUES (23, 7, 1, 2, 'Umbriel', NULL, false, true, 1169, 127500, 4.144, true, '2022-09-14 20:56:35.856531');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 2, 'Mercury', NULL, false, true, false, 440, 0, 3.70, true, '2022-09-14 20:52:16.151711');
INSERT INTO public.planet VALUES (2, 1, 2, 'Venus', NULL, false, true, false, 730, 0, 8.87, true, '2022-09-14 20:52:23.771813');
INSERT INTO public.planet VALUES (3, 1, 2, 'Earth', NULL, true, true, false, 287, 1, 9.80, true, '2022-09-14 20:52:30.404886');
INSERT INTO public.planet VALUES (4, 1, 2, 'Mars', NULL, false, true, false, 227, 2, 3.71, true, '2022-09-14 20:52:37.033433');
INSERT INTO public.planet VALUES (5, 1, 2, 'Jupiter', NULL, false, true, false, 152, 80, 24.79, true, '2022-09-14 20:52:44.139122');
INSERT INTO public.planet VALUES (6, 1, 2, 'Saturn', NULL, false, true, false, 134, 83, 10.44, true, '2022-09-14 20:52:50.452155');
INSERT INTO public.planet VALUES (7, 1, 2, 'Uranus', NULL, false, true, false, 76, 27, 8.87, true, '2022-09-14 20:52:57.304287');
INSERT INTO public.planet VALUES (8, 1, 2, 'Neptune', NULL, false, true, false, 73, 14, 11.15, true, '2022-09-14 20:53:03.961351');
INSERT INTO public.planet VALUES (9, 1, 2, 'Ceres', NULL, false, true, true, 167, 0, 0.27, true, '2022-09-14 20:53:11.065995');
INSERT INTO public.planet VALUES (10, 1, 2, 'Pluto', NULL, false, true, true, 40, 5, 0.62, true, '2022-09-14 20:53:18.739146');
INSERT INTO public.planet VALUES (11, 1, 2, 'Haumea', NULL, false, true, true, 50, 2, 0.63, true, '2022-09-14 20:53:26.265637');
INSERT INTO public.planet VALUES (12, 1, 2, 'Makemake', NULL, false, true, true, 30, 1, 0.40, true, '2022-09-14 20:53:33.427996');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'Sun', 'The Sun is the star at the center of the Solar System.', true, 4600, 5772, NULL, true, '2022-09-14 20:50:45.588834');
INSERT INTO public.star VALUES (2, 2, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun', true, 4850, 3042, 11.11, true, '2022-09-14 20:50:52.41391');
INSERT INTO public.star VALUES (3, 2, 'Barnards Star', 'Barnards Star is a red dwarf about six light-years from Earth in the constellation of Ophiuchus.', true, 10000, 3134, 12.50, true, '2022-09-14 20:51:01.373545');
INSERT INTO public.star VALUES (4, 2, 'WISE 0855−0714', NULL, true, NULL, 260, 25.00, true, '2022-09-14 20:51:15.194757');
INSERT INTO public.star VALUES (5, 2, 'Wolf 359', 'Wolf 359 is a red dwarf star located in the constellation Leo, near the ecliptic.', true, 350000, 2749, 7.10, true, '2022-09-14 20:51:23.928926');
INSERT INTO public.star VALUES (6, 2, 'Epsilon Eridani', 'Epsilon Eridani, formally named Ran, is a star in the southern constellation of Eridanus.', true, 800000, 5084, 4.61, true, '2022-09-14 20:51:33.095993');


--
-- Data for Name: ufo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ufo VALUES (1, 'DS1', 'Death Star - 1', true, false, 4000, 8000, 6.50, true, '2022-09-14 20:57:04.299921');
INSERT INTO public.ufo VALUES (2, 'DS2', 'Death Star - 2', true, false, 6000, 12000, 8.20, true, '2022-09-14 20:57:10.597503');
INSERT INTO public.ufo VALUES (3, 'Pentago UFO', NULL, false, true, NULL, NULL, 0.00, true, '2022-09-14 20:57:18.590348');
INSERT INTO public.ufo VALUES (4, 'Roswell Flying Saucer', NULL, false, true, NULL, NULL, 0.00, true, '2022-09-14 20:57:25.049177');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: ufo_ufo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ufo_ufo_id_seq', 4, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: ufo ufo_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ufo
    ADD CONSTRAINT ufo_name_key UNIQUE (name);


--
-- Name: ufo ufo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ufo
    ADD CONSTRAINT ufo_pkey PRIMARY KEY (ufo_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

