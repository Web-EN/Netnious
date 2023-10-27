const { Router } = require("express");
const router = Router();

const { createAnuncio, getDocumentos, getProfesores, getAlumnos } = require("../Controllers/director.controller");

router.post("/director/inicio", createAnuncio);
router.get("/director/documentos", getDocumentos);
router.get("/director/profesores", getProfesores);
router.get("/director/alumnos", getAlumnos);

module.exports = router;