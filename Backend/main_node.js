//Importaciones
require('dotenv').config();
const { Client } = require('pg');
const express = require('express');
const { getUserFromDatabase, generateAuthToken } = require('./auth');

//Inicializaciones
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const PORT = process.env.PORT || 3000;

// Permite todos las peticiones CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:51318'); // Cambiar esta dirección de ser necesario
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

//Rutas
app.get("/",(req, res) => {
  res.send("Hello");
});

app.listen(PORT, () =>{
  console.log(`La aplicación está escuchando en el puerto ${PORT}`);
});

app.post("/login", async (req, res) => {
  const { username, password } = req.body;
  const client = new Client({
    user: 'postgres',
    host: process.env.HOST,
    database: 'postgres',
    password: process.env.PASSWORD,
    port: 5432,
  });

  try {
    await client.connect();
    const user = await getUserFromDatabase(username, password, client);
    if (user) {
      const token = generateAuthToken(user);
      res.status(200).json({ token });
    } else {
      res.status(401).json({ message: "Credenciales incorrectas" });
    }
  } catch (error) {
    console.error('Error al manejar la solicitud:', error);
    res.status(500).json({ message: "Error en el servidor" });
  } finally {
    await client.end();
  }
});
/*
Para hacerlo con una sesión: (En caso ya no te salga el Call Stack)

require('dotenv').config();
const express = require('express')
const app = express()
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const PORT = process.env.PORT || 3000
const { getUserFromDatabase, generateAuthToken } = require('./auth');
const { Client } = require('pg')

const client = new Client({
    user: 'postgres',
    host: process.env.HOST,
    database: 'postgres',
    password: process.env.PASSWORD,
    port: 5432,
  });

app.get("/",(req, res) => {
  res.send("Hello");
});

app.listen(PORT, () =>{
  console.log(`La aplicación está escuchando en el puerto ${PORT}`)
})

app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  const user = await getUserFromDatabase(username, password, client);

  if (user) {
    const token = generateAuthToken(user);
    res.status(200).json({ token });
  } else {
    res.status(401).json({ message: "Credenciales incorrectas" });
  }
});*/