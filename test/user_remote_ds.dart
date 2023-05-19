import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/core/util/constants.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';

void main() {
  test("Login", () async {
    try {
      final userRemoteDataSource = UserRemoteDataSourceImpl(
          dio: Dio(BaseOptions(baseUrl: Constants.baseUrl)));
      final userModel = await userRemoteDataSource.login(
          "nahit.mamati4@gmail.com", "Deneme123@");
      print(userModel.toJson());
    } on ServerException catch (se) {
      print(se.message);
    }
  });
  test("Register", () async {
    try {
      final userRemoteDataSource = UserRemoteDataSourceImpl(
          dio: Dio(BaseOptions(baseUrl: Constants.baseUrl)));
      final userModel = await userRemoteDataSource.register("Nahit Mamati",
          "nahit.mamati15@gmail.com", "Deneme123@", "Deneme123@");
      print(userModel.toJson());
    } on ServerException catch (se) {
      print(se.message);
    }
  });
}
