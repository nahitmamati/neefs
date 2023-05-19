part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

//When page loaded
class UserLoginLoaded extends UserState {}

class UserRegisterLoaded extends UserState {}

//Failed
class UserLoginFailed extends UserState {}

class UserRegisterFailed extends UserState {}

//Successful

class UserLoginSuccessfull extends UserState {}

class UserRegisterSuccessfull extends UserState {}
