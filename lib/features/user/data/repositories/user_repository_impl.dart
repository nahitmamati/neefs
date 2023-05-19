import 'package:either_dart/src/either.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/core/network/network_info.dart';
import 'package:neefs/features/user/data/datasources/user_local_datasource.dart';
import 'package:neefs/features/user/data/datasources/user_remote_datasource.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
      {required this.userRemoteDataSource,
      required this.userLocalDataSource,
      required this.networkInfo});

  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;
  NetworkInfo networkInfo;
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await userRemoteDataSource.login(email, password);
        await userLocalDataSource.putUser(userModel);
        return Right(userModel);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      try {
        final userModel = await userLocalDataSource.getUser();
        return Right(userModel!);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> register(String fullName, String email,
      String password, String repeatPassword) async {
    try {
      final userModel = await userRemoteDataSource.register(
          fullName, email, password, repeatPassword);
      await userLocalDataSource.putUser(userModel);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
