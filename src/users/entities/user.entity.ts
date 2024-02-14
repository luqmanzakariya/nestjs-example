import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

export enum Gender {
  MALE = 'male',
  FEMALE = 'female',
}

export enum Status {
  ACTIVE = 'active',
  BANNED = 'banned',
  SUSPENDED = 'suspended',
}
@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 100,
    nullable: false,
  })
  first_name: string;

  @Column({
    type: 'varchar',
    length: 100,
    nullable: true,
    default: null,
  })
  last_name: string;

  @Column({
    type: 'varchar',
    length: 191,
    nullable: false,
    unique: true,
  })
  username: string;

  @Column({
    type: 'varchar',
    length: 191,
    nullable: false,
    unique: true,
  })
  email: string;

  @Column({
    type: 'varchar',
    length: 5,
    default: '+62',
    nullable: true,
  })
  phone_number_code: string;

  @Column({
    type: 'varchar',
    length: 16,
    default: null,
    nullable: true,
    unique: true,
  })
  phone_number: string;

  @Column({
    type: 'varchar',
    length: 400,
    nullable: false,
  })
  password: string;

  @Column({
    type: 'varchar',
    length: 191,
    nullable: true,
    default: null,
  })
  avatar_id: string;

  @Column({
    type: 'enum',
    enum: Gender,
    nullable: true,
    default: null,
  })
  gender: Gender;

  @Column({
    type: 'date',
    nullable: true,
    default: null,
  })
  birthdate: Date;

  @Column({
    type: 'varchar',
    length: 5,
    default: null,
  })
  country_code: string;

  @Column({
    type: 'smallint',
    default: 3,
  })
  position_id: number;

  @Column({
    type: 'enum',
    enum: Status,
    nullable: false,
    default: 'active',
  })
  status: Status;
}
