-- AlterTable
ALTER TABLE "command" ADD COLUMN     "compositeTagModelCommandIds" INTEGER[],
ADD COLUMN     "stickerModelCommandIds" INTEGER[],
ADD COLUMN     "tagModelCommandIds" INTEGER[];
