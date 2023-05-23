import 'package:dio/dio.dart';
import 'package:neefs/core/error/exceptions.dart';

import 'package:neefs/features/user/data/models/user_model.dart';

////////////////////////////////////////////////////////////////////////////
abstract class UserRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(
      String fullName, String email, String password, String repeatPassword);
}
////////////////////////////////////////////////////////////////////////////

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});
  @override
  Future<UserModel> login(String email, String password) {
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    return _getUser("/login", formData);
  }

  @override
  Future<UserModel> register(
      String fullName, String email, String password, String repeatPassword) {
    var formData = FormData.fromMap({
      'name': fullName,
      'email': email,
      'password': password,
      'confirm_password': repeatPassword,
    });
    return _getUser("/register", formData);
  }

  Future<UserModel> _getUser(String endpoint, FormData formData) async {
    try {
      final response = await dio.post(endpoint, data: formData);
      if (response.statusCode == 200 && response.data['success'] == true) {
        print("response if : $response");
        return UserModel.fromJson(response.data);
      } else {
        print("response else : $response");
        throw ServerException(
            message: response.statusCode != 200
                ? "Server Error : ${response.statusCode.toString()}"
                : response.data['msg']);
      }
    } on DioError catch (ex) {
      throw ServerException(message: "Server Error : ${ex.message}");
    }
  }
}
