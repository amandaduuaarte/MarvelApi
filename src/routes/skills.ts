import { Router } from "express";
const skills = require("../controllers/skills");

const routerSkills = Router();

routerSkills.get("/:id", skills.getSkills);

module.exports = routerSkills;
