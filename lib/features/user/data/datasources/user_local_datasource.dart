import 'package:neefs/features/user/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUser();
  Future<void> putUser(UserModel userModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel> getUser() async {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> putUser(UserModel userModel) async {
    // TODO: implement putUser
    throw UnimplementedError();
  }
}
