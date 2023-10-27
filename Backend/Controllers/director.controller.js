require('dotenv').config();
const { Pool } = require("pg");

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'weben',
    password: '',
    port: 5432,
});

// 1) Menú (Director_inicio) 
//  1.1) Mensajes y anuncios
const createAnuncio = async (req, res) => { 
    const { contenido, fecha } = req.body;
    const response = await pool.query('INSERT INTO public."Anuncio" ("mensaje", "fecha") VALUES ($1, $2)', [contenido, fecha]);
    console.log(response);
    res.send("Anuncio creado");
}

//  1.2) Estado general
/*
    Agregar atributo de asistencia
*/

// 2) Menú (Director_Material)
//  2.1) Documentos ver
    // 

//  2.2) Documentos subir
    // upload.js

// 3) Menú (Director_Profesor)
const getProfesores = async (req, res) => { 
    const response = await pool.query('SELECT "Nombres", "Apellidos" FROM public."Profesores"');
    //console.log(response.rows)
    //res.send("Get Alumnos (profesores)")
    res.status(200).json(response.rows);
}

// 4) Menú (Director_Reporte y registro)



// 5) Menú (Director_Análisis del alumno)
const getAlumnos = async (req, res) => {
    const response = await pool.query('SELECT "Nombres", "Apellido Paterno", "Apellido Materno" FROM public."Alumno"');
    res.status(200).json(response.rows);
}

// 6) Director_Calendario escolar // agregar y ver fechas



module.exports = {
    createAnuncio,
    getProfesores,
    getAlumnos
}