'use strict';

const dataMapper = require('../service/dataMapper');

const main = {
    getPets: async (req, res) => {
        try {
            const pets = await dataMapper.getAllPets();

            res.json(pets);
        }
        catch (error) {
            console.error(error);
            res.status(500).send(`An error occured with the database : \n${error.message}`);
        }
    },

    getPetById: async (req, res, next) => {
        try {
            const id = parseInt(req.params.id, 10);
            const pet = await dataMapper.getPetById(id);

            if (!pet) {
                return next();
            }

            res.json(pet);
        }
        catch (error) {
            console.error(error);
            res.status(500).send(`An error occured with the database : \n${error.message}`);
        }
    },
    getPetByName: async (req, res) => {
        try {
            const name = req.params.name;
            const pet = await dataMapper.getPetByName(name);

            res.json(pet);
        }
        catch (error) {
            console.error(error);
            res.status(500).send(`An error occured with the database : \n${error.message}`);
        }
    },
};

module.exports = main;
