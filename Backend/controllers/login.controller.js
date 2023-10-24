require('dotenv').config();
const { Client } = require("pg");
const { getUserFromDatabase, generateAuthToken } = require('../auth');

const client = new Client({ 
    user: 'postgres',
    // host: process.env.HOST,
    database: 'testapi', // weben
    // password: process.env.PASSWORD,
    port: 5432,

    //Test local
    host: 'localhost', 
    password: '', 
});

const verifyLogin = async (req, res) => {
    const { username, password } = req.body;
    // const client = new Client({
    //     user: 'postgres',
    //     // host: process.env.HOST,
    //     host: 'localhost', // Test
    //     database: 'testapi', // postgres
    //     // password: process.env.PASSWORD,
    //     password: 'memoria', // Test
    //     port: 5432,
    // }); Se crea un nuevo client en cada peticion POST a login

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
};

module.exports = {
    verifyLogin
}