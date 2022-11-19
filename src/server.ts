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

app.get("/characters/categories", async (req: any, res: any) => {
  //Listagem por categoria

  const hero = await prisma.character.findMany({
    where: {
      category: {
        category: "hero",
      },
    },
  });

  const antiHero = await prisma.character.findMany({
    where: {
      category: {
        category: "antihero",
      },
    },
  });

  const villain = await prisma.character.findMany({
    where: {
      category: {
        category: "villain",
      },
    },
  });

  const aliens = await prisma.character.findMany({
    where: {
      category: {
        category: "aliens",
      },
    },
  });

  const human = await prisma.character.findMany({
    where: {
      category: {
        category: "human",
      },
    },
  });

  const categories = [{ hero, antiHero, villain, aliens, human }];

  res.send({ categories });
});

app.get("/characters/category/:id?/movies", (req: any, res: any) => {
  res.send("Hello personagem dentro de category");
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
