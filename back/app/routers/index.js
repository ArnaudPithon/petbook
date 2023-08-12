'use strict';

const router = require('express').Router();

// Controllers
const controller = require('../controllers/main');

// Routes
router.get('/pets', controller.getPets);
router.get('/pets/id/:id', controller.getPetById);
router.get('/pets/name/:name', controller.getPetByName);

module.exports = router;
