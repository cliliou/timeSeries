-- CreateEnum
CREATE TYPE "stickerType" AS ENUM ('permanent', 'detachable');

-- CreateEnum
CREATE TYPE "stickerFormat" AS ENUM ('roll', 'sheet');

-- CreateEnum
CREATE TYPE "stickerColors" AS ENUM ('black', 'white', 'blue', 'red', 'green', 'purple', 'orange', 'yellow', 'brown', 'cyan', 'magenta');

-- CreateEnum
CREATE TYPE "compositTagInstruction" AS ENUM ('Hashing', 'Bleaching', 'Drying', 'Ironing', 'ProfessionalCare');

-- CreateTable
CREATE TABLE "command" (
    "id" SERIAL NOT NULL,
    "clientName" TEXT NOT NULL,

    CONSTRAINT "command_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stickerModel" (
    "id" SERIAL NOT NULL,
    "type" "stickerType" NOT NULL,
    "format" "stickerFormat" NOT NULL,
    "colors" "stickerColors"[],
    "quantity" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "stickerModel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tagModel" (
    "id" SERIAL NOT NULL,
    "size" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "design" TEXT NOT NULL,

    CONSTRAINT "tagModel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "compositTagModel" (
    "id" SERIAL NOT NULL,
    "barcodeCode" TEXT NOT NULL,
    "composition" JSONB NOT NULL,
    "size" TEXT NOT NULL,
    "instructions" "compositTagInstruction"[],
    "price" DOUBLE PRECISION NOT NULL,
    "currency" TEXT NOT NULL,
    "origin" TEXT NOT NULL,

    CONSTRAINT "compositTagModel_pkey" PRIMARY KEY ("id")
);
