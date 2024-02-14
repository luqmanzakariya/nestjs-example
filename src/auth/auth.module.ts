import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { UsersModule } from 'src/users/users.module';
import { LocalStrategy } from './local.strategy';
import { JwtStragegy } from './jwt.strategy';
import { AuthController } from './auth.controller';
import { jwtConfig } from 'src/config/jwt.config';

@Module({
  imports: [UsersModule, PassportModule, JwtModule.registerAsync(jwtConfig)],
  providers: [AuthService, LocalStrategy, JwtStragegy],
  exports: [AuthService],
  controllers: [AuthController],
})
export class AuthModule {}
