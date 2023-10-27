const { Router } = require("express");
const router = Router();

//Controladores
const { verifyLogin } = require("../Controllers/login.controller");

//Login
router.post("/login", verifyLogin);


module.exports = router