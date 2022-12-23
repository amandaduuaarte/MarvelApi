import express, { Express } from "express";

const app: Express = express();
const port = 3030;
const cors = require("cors");

const categoryRouter = require("./routes/category");
const characterRouter = require("./routes/character");
const skillsRouter = require("./routes/skills");
const caracteristicsRouter = require("./routes/caracteristics");

const corsOptions = {
  origin: "http://localhost",
};

app.use(cors());

app.use("/v1", characterRouter);
app.use("/v1/characters/categories", categoryRouter);
app.use("/v1/characters/skills", skillsRouter);
app.use("/v1/characters/caracters", caracteristicsRouter);

app.listen(port, () => {
  console.log("Servidor rodando", port);
});
