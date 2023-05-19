import 'package:equatable/equatable.dart';

class User extends Equatable {
  final bool success;
  final String userId;
  final String name;
  final String phone;
  final String address;
  final String profileImage;
  final String email;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String token;
  final List<Wallet> wallets;
  const User(
      {required this.success,
      required this.userId,
      required this.name,
      required this.phone,
      required this.address,
      required this.profileImage,
      required this.email,
      required this.emailVerifiedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.token,
      required this.wallets});
  @override
  List<Object?> get props => [
        success,
        userId,
        name,
        phone,
        address,
        profileImage,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
        token,
        wallets
      ];
}

class Wallet extends Equatable {
  final String id;
  final String userId;
  final String type;
  final String balance;
  final String inUse;
  final String status;
  final String meta;
  final String createdAt;
  final String updatedAt;
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
