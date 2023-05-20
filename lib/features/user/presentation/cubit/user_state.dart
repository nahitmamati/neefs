part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

//When page loaded
class UserLoginLoaded extends UserState {}

class UserRegisterLoaded extends UserState {}

//Validation
class UserLoginValidationFailed extends UserState {
  const UserLoginValidationFailed({required this.failure});
  final Failure failure;
}

//Failed
class UserLoginFailed extends UserState {
  const UserLoginFailed({required this.failure});
  final Failure failure;
}

class UserRegisterFailed extends UserState {
  const UserRegisterFailed({required this.failure});
  final Failure failure;
}

//Successful

class UserLoginSuccessfull extends UserState {
  const UserLoginSuccessfull({required this.user});
  final User user;
}

class UserRegisterSuccessfull extends UserState {
  const UserRegisterSuccessfull({required this.user});
  final User user;
}
