-- On travaille en tant que petbook
SET ROLE petbook;

BEGIN;

    -- Nettoyage

    DROP TABLE IF EXISTS parent;
    DROP TABLE IF EXISTS metering;
    DROP TABLE IF EXISTS picture;
    DROP TABLE IF EXISTS pet;
    DROP TABLE IF EXISTS breeder;
    DROP TABLE IF EXISTS color;
    DROP TABLE IF EXISTS gender;
    DROP TABLE IF EXISTS race;

    DROP TYPE IF EXISTS SEX;
    DROP TYPE IF EXISTS TIE;

    -- création de types

    CREATE TYPE SEX AS ENUM ('0', '1', '2'); -- unknown, mâle, femelle - Http://en.wikipedia.org/wiki/ISO_5218
    CREATE TYPE TIE AS ENUM ('0', '1', '2'); -- unknown, father, mother
    -- La création de types ENUM est une alternative à ce type d'écriture :
    --tie CHAR(1) NOT NULL CHECK (tie IN ('0', '1', '2')),

    -- création des tables

    CREATE TABLE breeder (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        name TEXT UNIQUE NOT NULL,
        adress TEXT NULL,
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    CREATE TABLE color (
        id SMALLINT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        description TEXT UNIQUE NOT NULL,
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    CREATE TABLE gender (
        sex SEX UNIQUE NOT NULL
    );

    CREATE TABLE race (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        name TEXT NOT NULL,
        species TEXT NOT NULL,
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    CREATE TABLE pet (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        name TEXT NOT NULL,
        nickname TEXT NULL,
        birthday DATE NULL,
        color_id SMALLINT REFERENCES color(id),
        gender_sex SEX REFERENCES gender(sex),
        race_id INT REFERENCES race(id),
        breeder_id INT REFERENCES breeder(id),
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    CREATE TABLE parent (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        tie TIE NOT NULL,
        ancestor_id INT REFERENCES pet(id),
        pet_id INT REFERENCES pet(id),
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    create table metering (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        date TIMESTAMPTZ NOT NULL,
        weight SMALLINT NULL,
        size SMALLINT NULL,
        pet_id INT REFERENCES pet(id),
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    create table picture (
        id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        file TEXT NOT NULL,
        description TEXT,
        pet_id INT REFERENCES pet(id),
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ
    );

    COMMIT;

RESET ROLE;
