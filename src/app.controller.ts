import { Controller, Get, UseGuards } from '@nestjs/common';
import { AuthService } from './auth/auth.service';
import { JwtAuthGuard } from './auth/jwt-auth.guard';

@Controller()
export class AppController {
  constructor(private readonly authService: AuthService) {}

  // GET /protected
  @UseGuards(JwtAuthGuard)
  @Get('protected')
  getHello(): string {
    return 'can loggin';
  }
}
