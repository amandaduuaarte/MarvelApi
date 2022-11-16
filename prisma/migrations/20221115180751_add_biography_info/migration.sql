/*
  Warnings:

  - Added the required column `biography` to the `characters` table without a default value. This is not possible if the table is not empty.

*/
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
INSERT INTO "new_characters" ("age", "avatar", "category", "fictionname", "height", "id", "planet", "realname", "weight") SELECT "age", "avatar", "category", "fictionname", "height", "id", "planet", "realname", "weight" FROM "characters";
DROP TABLE "characters";
ALTER TABLE "new_characters" RENAME TO "characters";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
