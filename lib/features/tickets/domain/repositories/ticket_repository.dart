import 'package:either_dart/either.dart';
import 'package:neefs/core/error/errors.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';

abstract class TicketRepository {
  Future<Either<Failure, List<TicketModel>>> getTickets(
      {required String token});
  Future<Either<Failure, bool>> addTicket(
      {required String token,
      required String title,
      required String message,
      required String topic});
  Future<Either<Failure, bool>> respondTicket(
      {required String token, required String id, required String message});
  Future<Either<Failure, bool>> closeTicket(
      {required String token, required String id});
}
