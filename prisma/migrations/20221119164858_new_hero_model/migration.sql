/*
  Warnings:

  - Added the required column `heroCategoryId` to the `category` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "HeroCategory" (
    "id" TEXT NOT NULL PRIMARY KEY
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "category" TEXT NOT NULL,
    "heroCategoryId" TEXT NOT NULL,
    CONSTRAINT "category_heroCategoryId_fkey" FOREIGN KEY ("heroCategoryId") REFERENCES "HeroCategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_category" ("category", "id") SELECT "category", "id" FROM "category";
DROP TABLE "category";
ALTER TABLE "new_category" RENAME TO "category";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
