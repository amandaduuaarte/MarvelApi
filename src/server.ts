const express = require("express");

const app = express();
const port = 3030;

app.get("/characters/category", (req, res) => {
  res.send("Hello category");
});

app.get("/characters/category/:id?", (req, res) => {
  res.send("Hello personagem dentro de category");
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
