/* Populate database with sample data. */


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, 'yes', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, 'yes', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, 'no', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devilmon', '2017-05-12', 5, 'yes', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, 'no', -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', '2021-11-15', 2, 'yes', -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, 'no', -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, 'yes' -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '2005-06-07', 7, 'yes', 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '1998-10-13', 3, 'yes', 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '2022-05-14', 4, 'yes', 22);

-- TRANSACTION COMPLETE
BEGIN;

UPDATE animals
SET species = 'Digimon' WHERE name LIKE '%mon%';

UPDATE animals
SET species = 'Pokemon' WHERE name NOT LIKE '%mon%';

COMMIT;

-- DELETE EVERYTHING FROM TABLE AND ROLLBACK
BEGIN;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

-- REMOVE ALL ANIMALS BORN AFTER 2022-01-01, CREATE SAVEPOINT AND UPDATE ALL ANIMALS WEIGHT TO THEIR WEIGHT MULTIPLIED BY -1
BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT no2022;
UPDATE animals SET weight_kg = weight_kg * -1;
-- ROLLBACK TO SAVEPOINT AND UPDATE ALL ANIMALS' NEGATIVE WEIGHT TO THEIR WEIGHT MULTIPLIED BY -1
ROLLBACK TO SAVEPOINT no2022;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

-- ADD OWNERS AND SPECIES IDS TO ANIMALS TABLE

BEGIN;
UPDATE animals
SET species_id = 2 WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = 1 WHERE name NOT LIKE '%mon%';

SAVEPOINT speciesWorking;

UPDATE animals
SET owner_id = (CASE WHEN name = 'Agumon' THEN 1
WHEN name = 'Gabumon' THEN 2
WHEN name = 'Gabumon' THEN 2
WHEN name = 'Pikachu' THEN 2
WHEN name = 'Devilmon' THEN 3
WHEN name = 'Plantmon' THEN 3
WHEN name = 'Charmander' THEN 4
WHEN name = 'Squirtle' THEN 4
WHEN name = 'Blossom' THEN 4
WHEN name = 'Angemon' THEN 5
WHEN name = 'Boarmon' THEN 5
end);

SAVEPOINT ownerWorking;

SELECT * FROM animals;

COMMIT;

-- DAY 4

INSERT INTO vets (name, age, date_of_graduation)
  VALUES( 'Vet. William Thatcher', 45, '2000-04-23'),
  ('Vet. Maisy Smith', 26, '2019, 01-17'),
  ('Vet. Stephanie Mendez', 64, '1981-05-04'),
  ('Vet. Jack Harkness', 38, '2008-06-08')
;

INSERT INTO specializations (species_id, vets_id)
  VALUES(1, 1),
  (2, NULL),
  (3, 1),
  (3, 2),
  (4, 2);

INSERT INTO visits (animals_id, vets_id, date_of_visit)
  VALUES(1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (3, 4, '2021-02-02'),
  (4, 2, '2020-01-05'),
  (4, 2, '2020-03-08'),
  (4, 2, '2020-05-14'),
  (5, 3, '2021-05-04'),
  (6, 4, '2021-02-24'),
  (7, 2, '2019-12-21'),
  (7, 1, '2020-08-10'),
  (7, 2, '2021-04-07'),
  (8, 3, '2019-09-29'),
  (9, 4, '2020-10-03'),
  (9, 4, '2020-11-04'),
  (10, 2, '2019-01-24'),
  (10, 2, '2019-05-15'),
  (10, 2, '2020-02-27'),
  (10, 2, '2020-08-03'),
  (11, 3, '2020-02-27'),
  (11, 1, '2021-01-11')
;
