import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({
  log: ["query"],
});

const getCharacter = async function (req: any, res: any) {
  const characters = await prisma.character.findMany();

  res.send({ characters });
};

module.exports = { getCharacter };
