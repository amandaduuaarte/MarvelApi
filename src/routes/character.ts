import { Router } from "express";
const character = require("../controllers/character");

const routerCharacter = Router();

routerCharacter.get("/characters", character.getCharacter);

module.exports = routerCharacter;
