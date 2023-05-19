import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({required this.message});
  final String? message;
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}
