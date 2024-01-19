import { Injectable } from '@nestjs/common';
import {
  Prisma,
  PrismaClient,
  clientAccount,
  compositTagModel,
} from '@prisma/client';

@Injectable()
export class AppService {
  prisma = new PrismaClient();
  getHello(): string {
    return `Hello`;
  }

  async createAccount(
    data: Prisma.clientAccountCreateInput,
  ): Promise<clientAccount> {
    return this.prisma.clientAccount.create({ data });
  }

  async createCompositTag(
    data: Prisma.compositTagModelCreateInput,
  ): Promise<compositTagModel> {
    return this.prisma.compositTagModel.create({ data });
  }

  async getCompositTagModelByAuthorIdAndComposition(): Promise<
    compositTagModel[]
  > {
    return this.prisma.compositTagModel.findMany({
      where: {
        authorId: 1,
        composition: {
          path: ['cottonBio'],
          gte: 70,
          lte: 80,
        },
      },
    });
  }

  async getCompositTagModelByAuthorIdAndCompositionCount(): Promise<number> {
    return this.prisma.compositTagModel.count({
      where: {
        authorId: 1,
        composition: {
          path: ['cottonBio'],
          gte: 70,
          lte: 80,
        },
      },
    });
  }
}
