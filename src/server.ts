import { PrismaClient } from "@prisma/client";
const express = require("express");

const app = express();
const port = 3030;

const prisma = new PrismaClient({
  log: ["query"],
});

app.get("/v1/characters", async (req: any, res: any) => {
  const characters = await prisma.character.findMany();

  res.send({ characters });
});

app.get("/v1/characters/categories", async (req: any, res: any) => {
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

  const alien = await prisma.character.findMany({
    where: {
      category: {
        category: "alien",
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

  const categories = [{ hero, antiHero, villain, alien, human }];

  res.send({ categories });
});

app.get("/v1/characters/skills/:id", async (req: any, res: any) => {
  const { id } = req.params;

  const skills = await prisma.character.findMany({
    where: {
      id: id,
    },
    select: {
      skills: true,
    },
  });

  res.send({ skills });
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
