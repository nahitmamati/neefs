import 'package:neefs/features/user/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required bool? success,
    required int? userId,
    required String? name,
    required String? phone,
    required String? address,
    required String? profileImage,
    required String? email,
    required String? emailVerifiedAt,
    required String? createdAt,
    required String? updatedAt,
    required String? token,
    required List<WalletModel?> wallets,
  }) : super(
          success: success,
          userId: userId,
          name: name,
          phone: phone,
          address: address,
          profileImage: profileImage,
          email: email,
          emailVerifiedAt: emailVerifiedAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
          token: token,
          wallets: wallets,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? walletsJson = json['wallets'];
    final List<WalletModel> wallets = walletsJson != null
        ? walletsJson
            .map((dynamic walletJson) => WalletModel.fromJson(walletJson))
            .toList()
        : [];

    return UserModel(
      success: json['success'],
      userId: json['user_id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      profileImage: json['profile_image'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: json['token'],
      wallets: wallets,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'success': success,
      'user_id': userId,
      'name': name,
      'phone': phone,
      'address': address,
      'profile_image': profileImage,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
      'wallets': wallets.map((e) => (e as WalletModel).toJson()).toList()
    };

    return data;
  }
}

class WalletModel extends Wallet {
  const WalletModel(
      {required int? id,
      required int? userId,
      required String? type,
      required int? balance,
      required int? inUse,
      required String? status,
      required String? meta,
      required String? createdAt,
      required String? updatedAt})
      : super(
            id: id,
            userId: userId,
            type: type,
            balance: balance,
            inUse: inUse,
            status: status,
            meta: meta,
            createdAt: createdAt,
            updatedAt: updatedAt);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'balance': balance,
      'inUse': inUse,
      'status': status,
      'meta': meta,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  static WalletModel fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      userId: json['userId'],
      type: json['type'],
      balance: json['balance'],
      inUse: json['inUse'],
      status: json['status'],
      meta: json['meta'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  List<Object?> get props =>
      [id, userId, type, balance, inUse, status, meta, createdAt, updatedAt];
}
