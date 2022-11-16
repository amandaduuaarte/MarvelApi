/*
  Warnings:

  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `category` to the `characters` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Category_characterId_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Category";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_characters" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL,
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
CREATE UNIQUE INDEX "characters_realname_key" ON "characters"("realname");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
