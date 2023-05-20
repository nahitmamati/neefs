import 'package:either_dart/src/either.dart';
import 'package:equatable/equatable.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/core/usecases/use_case.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';

class LoginUsecase implements UseCase<User, LoginParams> {
  LoginUsecase({required this.userRepository});
  final UserRepository userRepository;
  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return userRepository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
