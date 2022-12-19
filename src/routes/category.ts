import { Router } from "express";
const category = require("../controllers/category");

const routerCategory = Router();

routerCategory.get("/:category", category.getCategory);

module.exports = routerCategory;
