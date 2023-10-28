const bcrypt = require('bcryptjs');
// No es necesario crear una instancia de cliente aquí

// Para consulta
async function getUserFromDatabase(username, password, client) {
  try {
    // Realizar una consulta SQL para verificar las credenciales
    const query_sal = {
      text: 'SELECT sal FROM public."Usuarios" WHERE usuario = $1',
      values: [username],
    }
    let sal = await client.query(query_sal);
    let hashed = await bcrypt.hash(password, sal.rows[0]['sal']);

    const query = {
      text: 'SELECT usuario, Rol_id FROM public."Usuarios" WHERE usuario = $1 AND hashed_pass = $2',
      values: [username, hashed],
    }

    const result = await client.query(query);

    if (result.rows.length === 1) {
      const user = result.rows[0];
      return {
        id: user,
      };
    } else {
      return null;
    }
  } catch (error) {
    console.error('Error al consultar la base de datos:', error);
    throw error;
  }
}

module.exports = { getUserFromDatabase };