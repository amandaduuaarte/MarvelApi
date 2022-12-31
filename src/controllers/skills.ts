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

  if (!skills) {
    return res.status(404).json({
      status: "error",
      message: "Invalid id",
    });
  }

  res.status(200).json({
    status: "success",
    skills,
  });
};

module.exports = { getSkills };
