//Importaciones
require('dotenv').config();
const express = require('express');
const session = require('express-session');
const pgSession = require('connect-pg-simple')(session);
const pg = require('pg');

//Inicializaciones
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const PORT = process.env.PORT || 3000;

// Permite todos las peticiones CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:61719'); // Cambiar esta dirección de ser necesario
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.listen(PORT, () =>{
  console.log(`La aplicación está escuchando en el puerto ${PORT}`);
});

// Cookies, no supe como trasladarlo a otro archivo :(
const pgPool = new pg.Pool({
  user: 'postgres',
  host: process.env.HOST,
  database: 'weben', // weben
  password: process.env.PASSWORD,
  port: 5432,
});

pgStoreConfig = {
  pgPool: pgPool,
};

app.use(session({
    store: new pgSession({
      pool : pgPool,
      tableName : 'user_sessions'
    }),
    secret: 'pizza',
    resave: false,
    cookie: { maxAge: 10*60*1000 },
    saveUninitialized: false,
    secure: true,
}));

// Middleware de autenticación
app.use(require("./Routes/login"));

app.use(require("./Routes/cooky"));


// app.use(require("./Routes/usuario")); //Middleware de usuario