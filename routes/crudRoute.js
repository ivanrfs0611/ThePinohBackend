const express = require("express");
const router = express.Router();

const authController = require("../controller/auth");
// const crudController = require("../controller/crud");

router.post("/login", authController.login);

module.exports = router;
