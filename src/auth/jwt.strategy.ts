import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { User } from 'src/users/user.entity';
import appConfig from 'src/config/app.config';

@Injectable()
export class JwtStragegy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: appConfig().jwtSecret,
    });
  }

  async validate(payload: User) {
    return {
      id: payload.id,
      username: payload.username,
      email: payload.email,
    };
  }
}
