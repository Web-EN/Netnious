const { Router } = require("express");
const router = Router();

//Controladores
const { verifyLogin } = require("../controllers/login.controller");

//Login
router.post("/login", verifyLogin);

//Alumno
/* 
    CRUD por definir
*/

module.exports = router