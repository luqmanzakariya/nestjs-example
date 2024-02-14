import { IsString, IsEmail, IsNotEmpty, Length } from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty({ message: 'username cannot be empty' })
  @Length(5, 20)
  username: string;

  @IsString()
  @Length(5, 20)
  fullName: string;

  @IsEmail()
  email: string;

  @IsString()
  @Length(8, 20)
  password: string;
}
