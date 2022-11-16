/*
  Warnings:

  - Added the required column `category` to the `Category` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    CONSTRAINT "Category_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Category" ("characterId", "id") SELECT "characterId", "id" FROM "Category";
DROP TABLE "Category";
ALTER TABLE "new_Category" RENAME TO "Category";
CREATE UNIQUE INDEX "Category_characterId_key" ON "Category"("characterId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
