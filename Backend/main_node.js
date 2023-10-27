//Importaciones
require('dotenv').config();
const express = require('express');
// const session = require('express-session');

//Inicializaciones
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
const PORT = process.env.PORT || 3000;

// Permite todos las peticiones CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:57123'); // Cambiar esta dirección de ser necesario
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

app.use(require("./Routes/login")); //Middleware de login
// app.use(require("./Routes/usuario")); //Middleware de usuario