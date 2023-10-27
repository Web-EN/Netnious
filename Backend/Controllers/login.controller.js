require('dotenv').config();
const { Client } = require("pg");
const { getUserFromDatabase, generateAuthToken } = require('../auth');

/* Comentado porque me di cuenta que no se puede reusar un Cliente, cosa que un Pool si se puede 
const client = new Client({
    user: 'postgres',
    // host: process.env.HOST,
    // database: "weben",
    // password: process.env.PASSWORD,
    port: 5432,

    //Test local mio
    database: 'testapi', 
    host: 'localhost',
    password: 'memoria',
});*/

const verifyLogin = async (req, res) => {
    const { username, password } = req.body;
    const client = new Client({
        user: 'postgres',
        // host: process.env.HOST, // Test
        // database: 'weben', // postgres
        // password: process.env.PASSWORD, // Test
        port: 5432,
        database: 'weben', 
        host: 'localhost',
        password: 'memoria',
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
};

module.exports = {
    verifyLogin
}