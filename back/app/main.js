'use strict';

require('dotenv').config();

const PORT = process.env.PORT || 3000;

const express = require('express');
const app = express();

const routers = require('./routers');

app.use(routers);

app.listen(PORT, () => {
    console.log(`listening at http://localhost:${PORT} …`);
});
