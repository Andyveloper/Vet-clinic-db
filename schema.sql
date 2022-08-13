/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(50);

-- DAY 3
-- Delete species column from animals table, create two new tables, one for species and one for owners, then add new columns to animals table called species_id and owners_id and add a foreign key constraint to animals table.

CREATE TABLE owners(
    id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    full_name VARCHAR(50)
    age INT
);

CREATE TABLE species(
    id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(50)
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners(id);

-- DAY 4

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    species_id INT,
    vets_id INT
    );

ALTER TABLE specializations
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE specializations
ADD FOREIGN KEY (vets_id) REFERENCES vets(id);

CREATE TABLE visits (
    animals_id INT,
    vets_id INT
    date_of_visit DATE
    species_id INT
    );

ALTER TABLE visits
ADD FOREIGN KEY (vets_id) REFERENCES vets(id),
ADD FOREIGN KEY (animals_id) REFERENCES animals(id);
ADD FOREIGN KEY (species_id) REFERENCES species(id);