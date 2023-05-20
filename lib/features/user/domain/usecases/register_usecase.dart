import 'package:either_dart/src/either.dart';
import 'package:equatable/equatable.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/core/usecases/use_case.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/repositories/user_repository.dart';

class RegisterUsecase implements UseCase<User, RegisterParams> {
  RegisterUsecase({required this.userRepository});
  final UserRepository userRepository;
  @override
  Future<Either<Failure, User>> call(RegisterParams params) {
    return userRepository.register(
        params.fullName, params.email, params.password, params.repeatPassword);
  }
}

class RegisterParams extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String repeatPassword;
  RegisterParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.repeatPassword,
  });

  @override
  List<Object> get props => [email, password];
}
