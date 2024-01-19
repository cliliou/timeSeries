-- AlterTable
ALTER TABLE "compositTagModel" ADD COLUMN     "quantity" INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "tagModel" ALTER COLUMN "quantity" SET DEFAULT 0;
