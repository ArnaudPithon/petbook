'use strict';

const database = require('./database');

const dataMapper = {
    async getAllPets() {
        const query = `
        SELECT
            pet.name, nickname,
            birthday, sex,
            color.description as robe,
            race.name as race, species,
            breeder.name as breeder
        FROM pet
        JOIN color ON color_id = color.id
        JOIN race ON race_id = race.id
        JOIN breeder ON breeder_id = breeder.id
        ;`;
        const result = await database.query(query);

        return result.rows;
    },

    async getPetById(id) {
        const query = `
        SELECT
            pet.name, nickname,
            birthday, sex,
            color.description as robe,
            race.name as race, species,
            breeder.name as breeder
        FROM pet
        JOIN color ON color_id = color.id
        JOIN race ON race_id = race.id
        JOIN breeder ON breeder_id = breeder.id
        WHERE pet.id = $1
        ;`;
        const value = [id];
        const result = await database.query(query, value);

        return result.rows[0];
    },

    async getPetByName(name) {
        const query = `
        SELECT
            pet.name, nickname,
            birthday, sex,
            color.description as robe,
            race.name as race, species,
            breeder.name as breeder
        FROM pet
        JOIN color ON color_id = color.id
        JOIN race ON race_id = race.id
        JOIN breeder ON breeder_id = breeder.id
        WHERE pet.name ILIKE $1
        OR nickname ILIKE $1
        ;`;
        const value = [name];
        const result = await database.query(query, value);

        return result.rows[0];
    },
};

module.exports = dataMapper;
