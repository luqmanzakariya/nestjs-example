import { Controller, Request, Body, Post, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LocalAuthGuard } from './local-auth.guard';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
import { User } from 'src/users/entities/user.entity';
import { hash } from 'bcryptjs';
import { UsersService } from 'src/users/users.service';

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly usersService: UsersService,
  ) {}

  // POST /register
  @Post('register')
  async create(@Body() user: CreateUserDto): Promise<User> {
    const newUser = {
      ...user,
      first_name: user.fullName.split(' ')[0],
      last_name: user?.fullName?.split(' ')[1] || null,
      password: await hash(user.password + process.env.PASSWORD_SECRET, 10),
    };
    return await this.usersService.create(newUser);
  }

  // POST /login
  @UseGuards(LocalAuthGuard)
  @Post('login')
  login(@Request() req): any {
    return this.authService.login(req.user);
  }
}
