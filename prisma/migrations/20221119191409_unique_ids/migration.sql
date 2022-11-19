/*
  Warnings:

  - You are about to drop the column `characterId` on the `Caracteristics` table. All the data in the column will be lost.
  - You are about to drop the column `characterId` on the `skills` table. All the data in the column will be lost.
  - Added the required column `characterCaracteristicsId` to the `Caracteristics` table without a default value. This is not possible if the table is not empty.
  - Added the required column `characterSkillsId` to the `skills` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Caracteristics" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "age" INTEGER NOT NULL,
    "height" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "universe" TEXT NOT NULL,
    "characterCaracteristicsId" TEXT NOT NULL,
    CONSTRAINT "Caracteristics_characterCaracteristicsId_fkey" FOREIGN KEY ("characterCaracteristicsId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Caracteristics" ("age", "height", "id", "universe", "weight") SELECT "age", "height", "id", "universe", "weight" FROM "Caracteristics";
DROP TABLE "Caracteristics";
ALTER TABLE "new_Caracteristics" RENAME TO "Caracteristics";
CREATE UNIQUE INDEX "Caracteristics_characterCaracteristicsId_key" ON "Caracteristics"("characterCaracteristicsId");
CREATE TABLE "new_skills" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "force" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "agility" INTEGER NOT NULL,
    "resistance" INTEGER NOT NULL,
    "velocity" INTEGER NOT NULL,
    "characterSkillsId" TEXT NOT NULL,
    CONSTRAINT "skills_characterSkillsId_fkey" FOREIGN KEY ("characterSkillsId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_skills" ("agility", "force", "id", "intelligence", "resistance", "velocity") SELECT "agility", "force", "id", "intelligence", "resistance", "velocity" FROM "skills";
DROP TABLE "skills";
ALTER TABLE "new_skills" RENAME TO "skills";
CREATE UNIQUE INDEX "skills_characterSkillsId_key" ON "skills"("characterSkillsId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
