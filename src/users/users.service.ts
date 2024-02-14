import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  // # Get all users
  async findAll(): Promise<User[]> {
    return await this.usersRepository.find();
  }

  // # Get user by id
  async findById(id: number): Promise<User> {
    return await this.usersRepository.findOne({ where: { id } });
  }

  // # Get user by username
  async findByUsername(username: string): Promise<User | undefined> {
    return await this.usersRepository.findOne({ where: { username } });
  }

  // # Create user
  async create(user: CreateUserDto): Promise<User> {
    const newUser = this.usersRepository.create(user);
    return await this.usersRepository.save(newUser);
  }

  // # Update user
  async update(id: number, user: UpdateUserDto): Promise<User> {
    await this.usersRepository.update(id, user);
    return await this.usersRepository.findOne({ where: { id } });
  }

  // # delete user
  async delete(id: number): Promise<void> {
    await this.usersRepository.delete(id);
  }
}
