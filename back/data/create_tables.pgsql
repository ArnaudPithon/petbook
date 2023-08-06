BEGIN;

    DROP TABLE IF EXISTS "parent";
    --DROP TABLE IF EXISTS "ancestor";
    DROP TABLE IF EXISTS "animal";
    DROP TABLE IF EXISTS "breeder";
    DROP TABLE IF EXISTS "color";
    DROP TABLE IF EXISTS "gender";
    DROP TABLE IF EXISTS "race";

    CREATE TABLE "breeder" (
        "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        "name" TEXT UNIQUE NOT NULL,
        "adress" TEXT NULL,
        "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updated_at" TIMESTAMP
    );

    CREATE TABLE "color" (
        "id" SMALLINT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        "description" TEXT UNIQUE NOT NULL,
        "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updated_at" TIMESTAMP
    );

    CREATE TABLE "gender" (
        "sex" CHAR(1) UNIQUE NOT NULL CHECK (sex IN ('0', '1', '2')) -- Http://en.wikipedia.org/wiki/ISO_5218
    );

    CREATE TABLE "race" (
        "id" SMALLINT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        "description" TEXT NOT NULL,
        "species" TEXT NOT NULL
    );

    CREATE TABLE "animal" (
        "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        "name" TEXT NOT NULL,
        "birthday" DATE NOT NULL,
        "size" SMALLINT NULL,
        "weight" SMALLINT NULL,
        "color_id" SMALLINT REFERENCES color(id),
        "gender_sex" CHAR(1) REFERENCES gender(sex),
        "race_id" SMALLINT REFERENCES race(id),
        "breeder" INT REFERENCES breeder(id),
        "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updated_at" TIMESTAMP
    );

    -- CREATE TABLE "ancestor" (
    --     "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    --     "animal_id" INT REFERENCES animal(id)
    -- );

    CREATE TABLE "parent" (
        "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
        "tie" CHAR(1) NOT NULL CHECK (tie IN ('0', '1', '2')),  -- unknown, father, mother
        -- Est-il vraiment utile de passer par une table intermédiaire ?
        --"ancestor_id" INT NOT NULL REFERENCES ancestor(id),
        -- Je dois pouvoir indiquer plus simplement :
        "ancestor_id" INT NOT NULL REFERENCES animal(id),
        "animal_id" INT NOT NULL REFERENCES animal(id)
    );

    COMMIT;
