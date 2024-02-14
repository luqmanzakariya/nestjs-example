import { Controller, Get, Body, Param, Delete, Put } from '@nestjs/common';
import { UsersService } from './users.service';
import { User } from './user.entity';
import { UpdateUserDto } from './dto/update-user.dto';
import { hash } from 'bcryptjs';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  // # Get all users
  @Get()
  async findAll(): Promise<User[]> {
    return await this.usersService.findAll();
  }

  // # Get user by id
  @Get(':id')
  async findOne(@Param('id') id: number): Promise<User> {
    const user = await this.usersService.findById(id);
    if (!user) {
      throw new Error('User not found');
    } else {
      return user;
    }
  }

  // # Update user
  @Put(':id')
  async update(
    @Param('id') id: number,
    @Body() user: UpdateUserDto,
  ): Promise<User> {
    if (user.password) {
      const updatedPassword = {
        ...user,
        password: await hash(user.password + process.env.PASSWORD_SECRET, 10),
      };
      return this.usersService.update(id, updatedPassword);
    }

    return this.usersService.update(id, user);
  }

  // # Delete user
  @Delete(':id')
  async delete(@Param('id') id: number): Promise<void> {
    const user = await this.usersService.findById(id);
    if (!user) {
      throw new Error('User not found');
    }

    return this.usersService.delete(id);
  }
}
