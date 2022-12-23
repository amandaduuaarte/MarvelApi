/*
  Warnings:

  - You are about to drop the `Caracteristics` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Caracteristics";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "caracteristics" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "age" INTEGER NOT NULL,
    "height" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "universe" TEXT NOT NULL,
    "characterCaracteristicsId" TEXT NOT NULL,
    CONSTRAINT "caracteristics_characterCaracteristicsId_fkey" FOREIGN KEY ("characterCaracteristicsId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "caracteristics_characterCaracteristicsId_key" ON "caracteristics"("characterCaracteristicsId");
