import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient({
  log: ["query"],
});

const getSkills = async function (req: Request, res: Response) {
  const { id } = req.params;

  const skills = await prisma.skills.findUnique({
    where: {
      characterSkillsId: id,
    },
  });

  res.send({ skills });
};

module.exports = { getSkills };
