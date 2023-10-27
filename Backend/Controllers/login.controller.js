require('dotenv').config();
const { Client } = require("pg");
const bcrypt = require('bcryptjs');
const { getUserFromDatabase, generateAuthToken } = require('../auth');


const verifyLogin = async (req, res) => {
    const client = new Client({
        user: 'postgres',
        host: process.env.HOST,
        database: 'weben', // weben
        password: process.env.PASSWORD,
        port: 5432,
        //Test local
        // host: 'localhost',
        // password: '',
    });
    const { username, password } = req.body;
    try {
        await client.connect();
        const user = await getUserFromDatabase(username, password, client);
        if (user) {
        const token = generateAuthToken(user);
        res.status(200).json({
            'token': token,
            user,
        });
        } else {
        res.status(401).json({ message: "Credenciales incorrectas" });
        }
    } catch (error) {
        console.error('Error al manejar la solicitud:', error);
        res.status(500).json({ message: "Error en el servidor" });
    } finally {
        if (client._connected) {
            await client.end();
            console.log('Cliente desconectado');
        }
    }
};

module.exports = {
    verifyLogin
}