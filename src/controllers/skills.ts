import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({
  log: ["query"],
});

const getSkills = async function (req: any, res: any) {
  const { id } = req.params;

  const skills = await prisma.skills.findMany({
    where: {
      characterSkillsId: id,
    },
  });

  res.send({ skills });
};

module.exports = { getSkills };
