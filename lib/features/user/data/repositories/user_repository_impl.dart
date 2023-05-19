import 'package:either_dart/src/either.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';

typedef Future<User> _loginOrRegister();

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required this.userRemoteDataSource, required this.userLocalDataSource});

  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;

  @override
  Future<Either<Failure, User>> login(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> register(
      String fullName, String email, String password, String repeatPassword) {
    throw UnimplementedError();
  }
}
