import { PrismaClient } from "@prisma/client";
const express = require("express");

const app = express();
const port = 3030;

const prisma = new PrismaClient({
  log: ["query"],
});

app.get("/characters", async (req: any, res: any) => {
  const characters = await prisma.character.findMany();

  res.send({ characters });
});

app.get("/characters/category", async (req: any, res: any) => {
  //Listagem por categoria
  const category = await prisma.character.findMany({
    where: {
      category: {
        category: "Heróis",
      },
    },
  });

  res.send({ category });
});

app.get("/characters/category/:id?/movies", (req: any, res: any) => {
  res.send("Hello personagem dentro de category");
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
