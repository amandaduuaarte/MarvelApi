import { Router } from "express";
const caracteristics = require("../controllers/caracteristics");

const routerCategory = Router();

routerCategory.get("/:id", caracteristics.getCaracteristics);

module.exports = routerCategory;
