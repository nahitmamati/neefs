import 'package:hive/hive.dart';
import 'package:neefs/features/user/data/models/user_model.dart';
import 'package:neefs/features/user/domain/entities/user.dart';

////////////////////////////////////////////////////////////////////////////
abstract class UserLocalDataSource {
  Future<UserModel?> getUser();
  Future<void> putUser(UserModel userModel);
}
////////////////////////////////////////////////////////////////////////////

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel?> getUser() async {
    final box = await _getBox();
    return box.get("user");
  }

  @override
  Future<void> putUser(UserModel userModel) async {
    final box = await _getBox();
    box.put("user", userModel);
  }

  Future<Box<UserModel>> _getBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(WalletAdapter());
    }
    if (Hive.isBoxOpen('user')) {
      return Hive.box('user');
    } else {
      return await Hive.openBox('user');
    }
  }
}
