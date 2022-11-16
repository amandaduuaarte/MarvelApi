/*
  Warnings:

  - You are about to drop the column `category` on the `characters` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "Category_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_characters" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "realname" TEXT NOT NULL,
    "fictionname" TEXT NOT NULL,
    "avatar" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "height" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "planet" TEXT NOT NULL,
    "biography" TEXT NOT NULL
);
INSERT INTO "new_characters" ("age", "avatar", "biography", "fictionname", "height", "id", "planet", "realname", "weight") SELECT "age", "avatar", "biography", "fictionname", "height", "id", "planet", "realname", "weight" FROM "characters";
DROP TABLE "characters";
ALTER TABLE "new_characters" RENAME TO "characters";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Category_characterId_key" ON "Category"("characterId");
