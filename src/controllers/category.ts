import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient({
  log: ["query"],
});

const getCategory = async function (req: Request, res: Response) {
  const { category } = req.params;

  const characters = await prisma.character.findMany({
    where: {
      category: {
        category: category,
      },
    },
  });

  if (!characters || characters.length === 0) {
    return res.status(404).send({
      status: "error",
      message: "Invalid id",
    });
  }

  res.status(200).send({
    status: "success",
    characters,
  });
};

module.exports = { getCategory };
