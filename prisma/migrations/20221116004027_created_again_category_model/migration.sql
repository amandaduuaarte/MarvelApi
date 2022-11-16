/*
  Warnings:

  - You are about to drop the column `category` on the `characters` table. All the data in the column will be lost.
  - Added the required column `characterId` to the `characters` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL
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
    "biography" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "characters_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_characters" ("age", "avatar", "biography", "fictionname", "height", "id", "planet", "realname", "weight") SELECT "age", "avatar", "biography", "fictionname", "height", "id", "planet", "realname", "weight" FROM "characters";
DROP TABLE "characters";
ALTER TABLE "new_characters" RENAME TO "characters";
CREATE UNIQUE INDEX "characters_realname_key" ON "characters"("realname");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
