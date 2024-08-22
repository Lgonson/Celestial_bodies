--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
galaxy_id integer NOT NULL,
name character varying(30) NOT NULL,
age_in_million_of_years integer,
description text,
type text
);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
moon_id integer NOT NULL,
name character varying(30),
age_in_million_of_years integer,
description text,
planet_id integer NOT NULL,
star_id integer,
galaxy_id integer,
is_spherical boolean
);

ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
planet_id integer NOT NULL,
name character varying(30),
age_in_million_of_years integer,
mass numeric,
description text,
has_life boolean,
is_spherical boolean,
star_id integer NOT NULL,
galaxy_id integer
);

ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
star_id integer NOT NULL,
name character varying(30) NOT NULL,
age_in_million_of_years integer,
description text,
galaxy_id integer
);

ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_systems (
star_systems_id integer NOT NULL,
name character varying(30) NOT NULL,
galaxy_id integer,
star_id integer
);

ALTER TABLE public.star_systems OWNER TO freecodecamp;

--
-- Name: star_systems_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_systems_system_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

ALTER TABLE public.star_systems_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_systems_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_systems_system_id_seq OWNED BY public.star_systems.star_systems_id;

--
-- Name: star_systems star_systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_systems ALTER COLUMN star_systems_id SET DEFAULT nextval('public.star_systems_system_id_seq'::regclass);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 500, 'The nearest major galaxy to the Milky Way', NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier 82', 750, 'starbust galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 650, 'relatively isolated spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 500, 'None', NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 80', 450, 'None', NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 79', 350, 'None', NULL);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 13, 'Earth', 1, 1, 1, true);
INSERT INTO public.moon VALUES (2, 'moon_mercury', 15, 'Mercury', 2, 1, 1, true);
INSERT INTO public.moon VALUES (3, 'moon_mercury_2', 15, 'Mercury', 2, 1, 1, false);
INSERT INTO public.moon VALUES (4, 'moon_mercury_2', 15, 'Mercury', 2, 1, 1, false);
INSERT INTO public.moon VALUES (5, 'moon_mars_1', 10, 'Mars', 3, 1, 1, false);
INSERT INTO public.moon VALUES (6, 'moon_mars_2', 12, 'Mars', 3, 1, 1, false);
INSERT INTO public.moon VALUES (7, 'moon_mars_3', 14, 'Mars', 3, 1, 1, true);
INSERT INTO public.moon VALUES (8, 'moon_mars_4', 14, 'Mars', 3, 1, 1, false);
INSERT INTO public.moon VALUES (9, 'moon_jupiter_1', 9, 'Jupiter', 4, 1, 1, false);
INSERT INTO public.moon VALUES (10, 'moon_jupiter_2', 9, 'Jupiter', 4, 1, 1, false);
INSERT INTO public.moon VALUES (11, 'moon_jupiter_3', 9, 'Jupiter', 4, 1, 1, false);
INSERT INTO public.moon VALUES (12, 'moon_saturn_1', 2, 'Saturn', 5, 1, 1, true);
INSERT INTO public.moon VALUES (13, 'moon_saturn_2', 4, 'Saturn', 5, 1, 1, false);
INSERT INTO public.moon VALUES (14, 'moon_saturn_3', 5, 'Saturn', 5, 1, 1, true);
INSERT INTO public.moon VALUES (15, 'moon_venus_1', 2, 'Venus', 6, 1, 1, true);
INSERT INTO public.moon VALUES (16, 'moon_venus_2', 25, 'Venus', 6, 1, 1, true);
INSERT INTO public.moon VALUES (17, 'moon_venus_3', 7, 'Venus', 6, 1, 1, true);
INSERT INTO public.moon VALUES (18, 'moon_venus_4', 2, 'Venus', 6, 1, 1, true);
INSERT INTO public.moon VALUES (19, 'moon_uranus_1', 44, 'Uranus', 7, 1, 1, true);
INSERT INTO public.moon VALUES (20, 'moon_neptune_1', 1, 'Neptune', 8, 1, 1, true);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 42, 350000, 'Planet Earth', true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 700, 150000, 'Mercury', false, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 50, 375000, 'Mars', false, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 75, 85000, 'Jupiter', false, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 88, 1125000, 'Saturn', false, true, 1, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 88, 115000, 'Venus', false, true, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 15, 116000, 'Uranus', false, true, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 18, 11800, 'Neptune', false, true, 1, 1);
INSERT INTO public.planet VALUES (9, 'XYX', 15, 55000, 'XYX', false, true, 2, 2);
INSERT INTO public.planet VALUES (10, 'XXX', 18, 55000, 'XXX', false, true, 2, 2);
INSERT INTO public.planet VALUES (11, 'ZKL', 18, 55000, 'ZKL', false, true, 2, 2);
INSERT INTO public.planet VALUES (12, 'OPK', 14, 25000, 'OPK', false, true, 2, 2);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star_1', 20, 'None', 1);
INSERT INTO public.star VALUES (2, 'Star_2', 35, 'None', 2);
INSERT INTO public.star VALUES (3, 'Star_3', 15, 'None', 3);
INSERT INTO public.star VALUES (4, 'Star_4', 24, 'None', 4);
INSERT INTO public.star VALUES (5, 'Star_5', 10, 'None', 5);
INSERT INTO public.star VALUES (6, 'Star_6', 2, 'None', 6);

--
-- Data for Name: star_systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_systems VALUES (1, 'system_1', 1, 1);
INSERT INTO public.star_systems VALUES (2, 'system_2', 2, 2);
INSERT INTO public.star_systems VALUES (3, 'system_3', 3, 3);

--
-- Name: star_systems_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_systems_system_id_seq', 1, false);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: star_systems star_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_systems
ADD CONSTRAINT star_systems_pkey PRIMARY KEY (star_systems_id);

--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);

--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);

--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);

--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ADD CONSTRAINT unique_star_id UNIQUE (star_id);

--
-- Name: star_systems unique_star_systems_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_systems
ADD CONSTRAINT unique_star_systems_id UNIQUE (star_systems_id);

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
-- Name: star_systems star_systems_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_systems
ADD CONSTRAINT star_systems_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- Name: star_systems star_systems_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_systems
ADD CONSTRAINT star_systems_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- PostgreSQL database dump complete
--
