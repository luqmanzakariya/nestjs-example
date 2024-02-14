import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';
import { User } from 'src/users/user.entity';
import { compare } from 'bcryptjs';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService,
  ) {}

  async validateUser(username: string, password: string): Promise<any> {
    try {
      const user = await this.usersService.findByUsername(username);
      const comparePassword = await compare(
        password + process.env.PASSWORD_SECRET,
        user.password,
      );

      if (user && comparePassword) {
        return user;
      }

      return null;
    } catch (err) {
      return null;
    }
  }

  async login(user: User) {
    const payload = { username: user.username, id: user.id, email: user.email };

    return {
      access_token: this.jwtService.sign(payload),
    };
  }
}
