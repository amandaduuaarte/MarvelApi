/*
  Warnings:

  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Category";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "category" (
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
    CONSTRAINT "characters_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_characters" ("age", "avatar", "biography", "characterId", "fictionname", "height", "id", "planet", "realname", "weight") SELECT "age", "avatar", "biography", "characterId", "fictionname", "height", "id", "planet", "realname", "weight" FROM "characters";
DROP TABLE "characters";
ALTER TABLE "new_characters" RENAME TO "characters";
CREATE UNIQUE INDEX "characters_realname_key" ON "characters"("realname");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
