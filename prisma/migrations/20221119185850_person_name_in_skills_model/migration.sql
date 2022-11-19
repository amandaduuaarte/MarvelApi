/*
  Warnings:

  - Added the required column `personname` to the `skills` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_skills" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "personname" TEXT NOT NULL,
    "force" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "agility" INTEGER NOT NULL,
    "resistance" INTEGER NOT NULL,
    "velocity" INTEGER NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "skills_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_skills" ("agility", "characterId", "force", "id", "intelligence", "resistance", "velocity") SELECT "agility", "characterId", "force", "id", "intelligence", "resistance", "velocity" FROM "skills";
DROP TABLE "skills";
ALTER TABLE "new_skills" RENAME TO "skills";
CREATE UNIQUE INDEX "skills_personname_key" ON "skills"("personname");
CREATE UNIQUE INDEX "skills_characterId_key" ON "skills"("characterId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
