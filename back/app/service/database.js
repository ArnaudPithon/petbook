'use strict';

const { DBNAME } = process.env;

const { Client } = require('pg');
const client = new Client(`postgresql://localhost/${DBNAME}`);

client.connect();

module.exports = client;
