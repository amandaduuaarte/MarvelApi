import { PrismaClient } from "@prisma/client";
const express = require("express");

const app = express();
const port = 3030;
const cors = require("cors");

const corsOptions = {
  origin: "https://localhost",
};

app.use(cors(corsOptions));

const prisma = new PrismaClient({
  log: ["query"],
});

app.get("/v1/characters", async (req: any, res: any) => {
  const characters = await prisma.character.findMany();

  res.send({ characters });
});

/**
 * Categorias:
 */
app.get("/v1/characters/categories/:category", async (req: any, res: any) => {
  const { category } = req.params;

  const characters = await prisma.character.findMany({
    where: {
      category: {
        category: category,
      },
    },
  });

  res.json(characters);
});

app.get("/v1/characters/skills/:id", async (req: any, res: any) => {
  const { id } = req.params;

  const skills = await prisma.skills.findMany({
    where: {
      characterSkillsId: id,
    },
  });

  res.send({ skills });
});

app.listen(port, () => {
  console.log("Servidor rodando");
});
