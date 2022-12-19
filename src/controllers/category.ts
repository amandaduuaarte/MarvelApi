import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({
  log: ["query"],
});

const getCategory = async function (req: any, res: any) {
  const { category } = req.params;

  const characters = await prisma.character.findMany({
    where: {
      category: {
        category: category,
      },
    },
  });

  res.json(characters);
};

module.exports = { getCategory };
