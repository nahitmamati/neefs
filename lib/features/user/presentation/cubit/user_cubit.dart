import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/features/user/domain/entities/user.dart';
import 'package:neefs/features/user/domain/usecases/login_usecase.dart' as l;
import 'package:neefs/features/user/domain/usecases/register_usecase.dart' as r;
import 'package:neefs/injection_container.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.loginUseCase,
    required this.registerUsecase,
  }) : super(UserInitial());
  l.LoginUsecase loginUseCase;
  r.RegisterUsecase registerUsecase;

  Future<void> login(String email, String password) async {
    emit(UserLoading());
    final formKey = getIt<GlobalKey<FormState>>(instanceName: "loginFormKey");
    if (formKey.currentState!.validate()) {
      final userOrFailure =
          await loginUseCase.call(l.Params(email: email, password: password));

      if (userOrFailure is Right) {
        emit(UserLoginSuccessfull(user: userOrFailure.right));
      } else {
        final except = userOrFailure.left;
        print(except.message);

        emit(UserLoginFailed(failure: userOrFailure.left));
      }
    } else {
      emit(UserLoginFailed(failure: ValidationFailure()));
    }
  }

  Future<void> register(String fullName, String email, String password,
      String repeatPassword) async {
    emit(UserLoading());
    final userOrFailure = await registerUsecase.call(r.Params(
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
  }
}
