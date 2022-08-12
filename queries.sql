/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Write queries to answer the following questions:
-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT SUM(escape_attempts) FROM animals WHERE neutered = true;
SELECT SUM(escape_attempts) FROM animals WHERE neutered = false;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg) FROM animals WHERE species = 'Digimon';
SELECT MAX(weight_kg) FROM animals WHERE species = 'Digimon';
SELECT MIN(weight_kg) FROM animals WHERE species = 'Pokemon';
SELECT MAX(weight_kg) FROM animals WHERE species = 'Pokemon';

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';


-- DAY 3
-- What animals belong to Melody Pond?
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT * FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;
-- How many animals are there per species?
SELECT COUNT(species.name) FROM species
JOIN animals ON species.id = animals.species_id;
WHERE species.name = 'Digimon';

SELECT COUNT(species.name) FROM species
JOIN animals ON species.id = animals.species_id;
WHERE species.name = 'Pokemon';

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
-- Who owns the most animals and show their name and number of animals.
SELECT owners.full_name, COUNT(*) FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(*) DESC;

-- DAY 4
-- Who was the last animal seen by William Tatcher?

-- How many different animals did Stephanie Mendez see?
-- List all vets and their specialties, including vets with no specialties.
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
-- What animal has the most visits to vets?
-- Who was Maisy Smith's first visit?
-- Details for most recent visit: animal information, vet information, and date of visit.
-- How many visits were with a vet that did not specialize in that animal's species?
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.



