'use strict';

require('dotenv').config();
const database = require('../app/service/database.js');
const dataMapper = require('../app/service/dataMapper.js');

const results = {};

describe('Database', () => {

    test('Connection à la base de données', () => {
        expect( database && typeof database === 'object' ).toBe(true);
    });

    test('All pets query should return an array', async () => {
        const data = await dataMapper.getAllPets();
        expect( data && Array.isArray(data) ).toBe(true);
    });

    test('Pet by id query should return an object', async () => {
        const data = await dataMapper.getPetById(3);
        expect( data && typeof data === 'object' ).toBe(true);
    });

    test('Pet by name query should return an object', async () => {
        const data = await dataMapper.getPetByName('archi');
        expect( data && typeof data === 'object' ).toBe(true);
        database.end();
    });


});
