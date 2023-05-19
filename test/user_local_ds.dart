import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/core/util/constants.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';
import 'package:neefs/features/user/domain/entities/user.dart';

void main() {
  test("Put & Get", () async {
    try {
      Hive.init("test/db");
      final userRemoteDataSource = UserRemoteDataSourceImpl(
          dio: Dio(BaseOptions(baseUrl: Constants.baseUrl)));
      final userLocalDataSource = UserLocalDataSourceImpl(
          userAdaptor: UserAdapter(), walletAdapter: WalletAdapter());
      final userModel = await userRemoteDataSource.login(
          "nahit.mamati4@gmail.com", "Deneme123@");
      userLocalDataSource.putUser(userModel);
      print("Data recived and cached.");
      final cachedUser = await userLocalDataSource.getUser();
      print(cachedUser!.toJson());
      print("Cached user successfully goted.");
    } on ServerException catch (se) {}
  });
  test("Get", () async {
    try {
      Hive.init("test/db");

      final userLocalDataSource = UserLocalDataSourceImpl(
          userAdaptor: UserAdapter(), walletAdapter: WalletAdapter());
      final cachedUser = await userLocalDataSource.getUser();
      print(cachedUser!.toJson());
      print("Cached user successfully goted.");
    } on ServerException catch (se) {}
  });
}
