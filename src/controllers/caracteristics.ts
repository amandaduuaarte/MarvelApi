import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient({
  log: ["query"],
});

const getCaracteristics = async function (req: Request, res: Response) {
  const { id } = req.params;

  const caracteristics = await prisma.caracteristics.findMany({
    where: {
      characterCaracteristicsId: id,
    },
  });

  if (!caracteristics) {
    return res.status(404).json({
      status: "error",
      message: "Invalid id",
    });
  }

  res.status(200).json({
    status: "success",
    data: {
      caracteristics,
    },
  });
};

module.exports = { getCaracteristics };
