/*
  Warnings:

  - You are about to drop the column `age` on the `characters` table. All the data in the column will be lost.
  - You are about to drop the column `height` on the `characters` table. All the data in the column will be lost.
  - You are about to drop the column `planet` on the `characters` table. All the data in the column will be lost.
  - You are about to drop the column `realname` on the `characters` table. All the data in the column will be lost.
  - You are about to drop the column `weight` on the `characters` table. All the data in the column will be lost.
  - Added the required column `alterEgo` to the `characters` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Caracteristics" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "age" INTEGER NOT NULL,
    "height" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "universe" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "Caracteristics_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_characters" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "alterEgo" TEXT NOT NULL,
    "fictionname" TEXT NOT NULL,
    "avatar" TEXT NOT NULL,
    "biography" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "characters_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_characters" ("avatar", "biography", "characterId", "fictionname", "id") SELECT "avatar", "biography", "characterId", "fictionname", "id" FROM "characters";
DROP TABLE "characters";
ALTER TABLE "new_characters" RENAME TO "characters";
CREATE UNIQUE INDEX "characters_alterEgo_key" ON "characters"("alterEgo");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Caracteristics_characterId_key" ON "Caracteristics"("characterId");
