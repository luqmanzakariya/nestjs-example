import { IsString, IsNotEmpty, Length } from 'class-validator';

export class LoginDto {
  @IsNotEmpty({ message: 'Username cannot be empty' })
  @Length(5, 20)
  username: string;

  @IsNotEmpty({ message: 'password cannot be empty' })
  @IsString()
  @Length(8, 20)
  password: string;
}
