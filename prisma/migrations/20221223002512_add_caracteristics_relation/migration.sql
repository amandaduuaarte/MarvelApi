/*
  Warnings:

  - You are about to drop the column `characterCaracteristicsId` on the `caracteristics` table. All the data in the column will be lost.
  - Added the required column `characterId` to the `caracteristics` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_caracteristics" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "age" INTEGER NOT NULL,
    "height" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "universe" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "caracteristics_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_caracteristics" ("age", "height", "id", "universe", "weight") SELECT "age", "height", "id", "universe", "weight" FROM "caracteristics";
DROP TABLE "caracteristics";
ALTER TABLE "new_caracteristics" RENAME TO "caracteristics";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
