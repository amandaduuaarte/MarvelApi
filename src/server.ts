const express = require("express");

const app = express();
const port = 3030;

app.get("/characters", (req, res) => {
  res.send("Hello world");
});

app.get("/characters/category", (req, res) => {
  res.send("Hello world");
});

app.get("/characters/category/:id?", (req, res) => {
  res.send("Hello world");
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
