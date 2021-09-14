const express = require("express");
const router = express.Router();

const authController = require("../controller/auth");
const crudController = require("../controller/crud");

router.post("/login", authController.login);
router.post("/addmenu", crudController.insertMenu);

module.exports = router;
