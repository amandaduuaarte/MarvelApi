const express = require("express");

const app = express();
const port = 3030;
const cors = require("cors");

const categoryRouter = require("./routes/category");
const characterRouter = require("./routes/character");
const skillsRouter = require("./routes/skills");

const corsOptions = {
  origin: "https://localhost",
};

app.use(cors(corsOptions));

app.use("/v1", characterRouter);
app.use("/v1/characters/categories", categoryRouter);
app.use("/v1/characters/skills", skillsRouter);

app.listen(port, () => {
  console.log("Servidor rodando");
});
