import express from "express";
const category = require("../controllers/category");

const routerCategory = express.Router();

routerCategory.get("/:category", category.getCategory);

module.exports = routerCategory;
