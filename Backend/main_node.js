//Importaciones
require('dotenv').config();
//const { Client } = require('pg');
const express = require('express');
require("multer");
//const { getUserFromDatabase, generateAuthToken } = require('./auth');

//Inicializaciones
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const PORT = process.env.PORT || 3000;

// Permite todos las peticiones CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:50035'); // Cambiar esta dirección de ser necesario
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

//Rutas

app.use(require("./Routes/login"));
app.use(require("./Routes/director"));
app.use(require("./Routes/upload"));

app.listen(PORT, () =>{
  console.log(`La aplicación está escuchando en el puerto ${PORT}`);
});