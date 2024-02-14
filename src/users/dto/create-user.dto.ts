import { IsString, IsEmail, IsNotEmpty, Length } from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty()
  @Length(5, 20)
  username: string;

  @IsEmail()
  email: string;

  @IsString()
  @Length(8)
  password: string;
}
