import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';

void main() {
  test("Put", () async {
    try {
      Hive.init("core/db");
      final userRemoteDataSource = UserRemoteDataSourceImpl();
      final userLocalDataSource = UserLocalDataSourceImpl();
      final userModel = await userRemoteDataSource.login(
          "nahit.mamati4@gmail.com", "Deneme123@");
      userLocalDataSource.putUser(userModel);
      print("Data recived and cached.");
      final cachedUser = await userLocalDataSource.getUser();
      print(cachedUser!.toJson());
      print("Cached user successfully goted.");
    } on ServerException catch (se) {
      print(se.message);
    }
  });
}
