import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  final String? profileImage;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? emailVerifiedAt;
  @HiveField(6)
  final String? createdAt;
  @HiveField(7)
  final String? updatedAt;
  @HiveField(8)
  final List<Wallet?> wallets;
  @HiveField(9)
  final String? token;
  const User(
      {required this.name,
      required this.phone,
      required this.address,
      required this.profileImage,
      required this.email,
      required this.emailVerifiedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.wallets,
      required this.token});
  @override
  List<Object?> get props => [
        name,
        phone,
        address,
        profileImage,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
        wallets,
        token
      ];
}

@HiveType(typeId: 1)
class Wallet extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? userId;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final int? balance;
  @HiveField(4)
  final int? inUse;
  @HiveField(5)
  final String? status;
  @HiveField(6)
  final String? meta;
  @HiveField(7)
  final String? createdAt;
  @HiveField(8)
  final String? updatedAt;
  @HiveField(9)
  const Wallet({
    required this.id,
    required this.userId,
    required this.type,
    required this.balance,
    required this.inUse,
    required this.status,
    required this.meta,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, userId, type, balance, inUse, status, meta, createdAt, updatedAt];
}
