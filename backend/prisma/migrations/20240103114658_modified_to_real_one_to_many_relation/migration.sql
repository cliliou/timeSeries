/*
  Warnings:

  - You are about to drop the `command` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `authorId` to the `compositTagModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `authorId` to the `stickerModel` table without a default value. This is not possible if the table is not empty.
  - Added the required column `authorId` to the `tagModel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "compositTagModel" ADD COLUMN     "authorId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "stickerModel" ADD COLUMN     "authorId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "tagModel" ADD COLUMN     "authorId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "command";

-- CreateTable
CREATE TABLE "clientAccount" (
    "id" SERIAL NOT NULL,
    "clientName" TEXT NOT NULL,

    CONSTRAINT "clientAccount_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "stickerModel" ADD CONSTRAINT "stickerModel_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "clientAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tagModel" ADD CONSTRAINT "tagModel_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "clientAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "compositTagModel" ADD CONSTRAINT "compositTagModel_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "clientAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
