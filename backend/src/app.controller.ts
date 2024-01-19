import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { compositTagInstruction } from '@prisma/client';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  getComposition(index: number): any {
    if (index % 10 === 0) {
      return {
        cotton: 100,
      };
    }
    if (index % 5 === 1) {
      return {
        polyester: 75,
        variable: 25,
      };
    }
    if (index % 4 === 0) {
      return {
        toto: 10,
        titi: 10,
        tutu: 5,
        tyty: 1,
        toitoi: 5,
        patapouf: 5,
        patapon: 2,
        poufpouf: 1,
        inconnu: 11,
        cottonBio: 70,
      };
    }
    return {
      cottonBio: 80,
      inconnu: 10,
      polyester: 10,
    };
  }

  instructions = [
    compositTagInstruction.Bleaching,
    compositTagInstruction.Drying,
    compositTagInstruction.Hashing,
    compositTagInstruction.Ironing,
    compositTagInstruction.ProfessionalCare,
  ];
  len = this.instructions.length;

  @Get('init')
  async initDb(): Promise<string> {
    const clientAccount1 = await this.appService.createAccount({
      clientName: 'client1',
    });
    const compoTags = [];
    for (let index = 0; index < 10000; index++) {
      compoTags.push(
        this.appService.createCompositTag({
          barcodeCode: index.toString(),
          composition: this.getComposition(index),
          size: 'S',
          instructions: [this.instructions[index % this.len]],
          price: index / 1000,
          currency: 'USD',
          origin: 'china',
          author: {
            connect: { id: 1 },
          },
        }),
      );
    }
    await Promise.all(compoTags);
    return 'Created : ' + compoTags.length.toString() + ' composit tags';
  }

  @Get('compositionQuery')
  async getCompositionQuery(): Promise<any> {
    const res =
      await this.appService.getCompositTagModelByAuthorIdAndComposition();
    return {
      len: res.length,
    };
  }
}
