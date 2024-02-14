import { IsString, IsNotEmpty, Length } from 'class-validator';

export class LoginDto {
  @IsNotEmpty()
  @Length(5, 20)
  username: string;

  @IsNotEmpty()
  @IsString()
  @Length(8)
  password: string;
}
