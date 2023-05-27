import 'package:either_dart/src/either.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/core/network/network_info.dart';
import 'package:neefs/features/tickets/data/datasources/tickets_remote_datasource.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';
import 'package:neefs/features/tickets/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl extends TicketRepository {
  TicketRepositoryImpl(
      {required this.ticketRemoteDataSource, required this.networkInfo});

  TicketRemoteDataSource ticketRemoteDataSource;
  NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<TicketModel>>> getTickets(
      {required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await ticketRemoteDataSource.getTickets(token: token);
        return Right(result);
      } on ServerException catch (ex) {
        return Left(ServerFailure(message: ex.message));
      }
    } else {
      return const Left(ServerFailure(message: "No support for local storage"));
    }
  }

  @override
  Future<Either<Failure, bool>> addTicket(
      {required String token,
      required String title,
      required String message,
      required String topic}) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await ticketRemoteDataSource.addTicket(
            token: token, title: title, message: message, topic: topic);
        return Right(result);
      } on ServerException catch (ex) {
        return Left(ServerFailure(message: ex.message));
      }
    } else {
      return const Left(ServerFailure(message: "No support for local storage"));
    }
  }

  @override
  Future<Either<Failure, bool>> respondTicket(
      {required String token,
      required String id,
      required String message}) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await ticketRemoteDataSource.respondTicket(
            token: token, id: id, message: message);
        return Right(result);
      } on ServerException catch (ex) {
        return Left(ServerFailure(message: ex.message));
      }
    } else {
      return const Left(ServerFailure(message: "No support for local storage"));
    }
  }

  @override
  Future<Either<Failure, bool>> closeTicket(
      {required String token, required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await ticketRemoteDataSource.closeTicket(token: token, id: id);
        return Right(result);
      } on ServerException catch (ex) {
        return Left(ServerFailure(message: ex.message));
      }
    } else {
      return const Left(ServerFailure(message: "No support for local storage"));
    }
  }
}
