import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient({
  log: ["query"],
});

const getCharacter = async function (req: Request, res: Response) {
  const characters = await prisma.character.findMany();

  if (!characters || characters.length === 0) {
    return res.status(404).json({
      status: "error",
      message: "Invalid id",
    });
  }

  res.status(200).json({
    status: "success",
    characters,
  });
};

module.exports = { getCharacter };
