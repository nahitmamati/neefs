import 'package:either_dart/either.dart';
import 'package:neefs/core/error/errors.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
      String fullName, String email, String password, String repeatPassword);
}
