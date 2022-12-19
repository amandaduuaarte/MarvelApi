import express from "express";
const character = require("../controllers/character");

const routerCharacter = express.Router();

routerCharacter.get("/characters", character.getCharacter);

module.exports = routerCharacter;
