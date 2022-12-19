import express from "express";
const skills = require("../controllers/skills");

const routerSkills = express.Router();

routerSkills.get("/:id", skills.getSkills);

module.exports = routerSkills;
