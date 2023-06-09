import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import 'package:neefs/core/error/errors.dart';
import 'package:neefs/core/util/validation.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/usecases/login_usecase.dart';
import 'package:neefs/features/user/domain/usecases/register_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.loginUseCase,
    required this.registerUsecase,
  }) : super(UserInitial());
  LoginUsecase loginUseCase;
  RegisterUsecase registerUsecase;
  bool pw = false;
  Future<void> login(String email, String password) async {
    emit(UserLoading());
    if (LoginValidation.isValid) {
      final userOrFailure = await loginUseCase
          .call(LoginParams(email: email, password: password));

      if (userOrFailure is Right) {
        emit(UserLoginSuccessfull(user: userOrFailure.right));
      } else {
        final except = userOrFailure.left;
        print(except.message);

        emit(UserLoginFailed(failure: userOrFailure.left));
      }
    } else {
      emit(UserLoginValidationFailed(failure: ValidationFailure()));
    }
  }

  Future<void> register(String fullName, String email, String password,
      String repeatPassword) async {
    if (RegisterValidation.isValid) {
      emit(UserLoading());
      final userOrFailure = await registerUsecase.call(RegisterParams(
          fullName: fullName,
          email: email,
          password: password,
          repeatPassword: repeatPassword));

      print("printed $userOrFailure");
      if (userOrFailure is User) {
        emit(UserRegisterSuccessfull(user: userOrFailure.right));
      } else {
        emit(UserRegisterFailed(failure: userOrFailure.left));
      }
    } else {
      emit(UserRegisterValidationFailed(failure: ValidationFailure()));
    }
  }

  void showPassword() {
    pw = !pw;
    print(pw);
    emit(state);
  }
}
