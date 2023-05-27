import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:neefs/core/network/network_info.dart';
import 'package:neefs/features/tickets/data/datasources/tickets_remote_datasource.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';
import 'package:neefs/features/tickets/data/repositories/ticket_repository_impl.dart';
import 'package:neefs/features/tickets/domain/repositories/ticket_repository.dart';
import 'package:neefs/injection_container.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());

  List<TicketModel> tickets = [];

  Future<void> loadTickets({required String token}) async {
    emit(TicketsLoading());
    TicketRepository repository = getIt<TicketRepository>();
    try {
      var result = await repository.getTickets(token: token);

      if (result.isRight) {
        tickets = result.right;
        print("tickets length: ${tickets.length}");
        emit(TicketsLoaded());
      } else {
        emit(TicketsFailed());
        throw Exception("Fail olduk arkadaş - <TicketCubit>");
      }
    } catch (e) {
      emit(TicketsFailed());
      print(e);
    }
  }

  Future<bool> addTicket({
    required String token,
    required String title,
    required String message,
    required String topic,
    bool refresh = false,
  }) async {
    emit(TicketsLoading());
    TicketRepository repository = getIt<TicketRepository>();
    try {
      var result = await repository.addTicket(
          token: token, title: title, message: message, topic: topic);

      if (result.isRight) {
        emit(TicketsLoaded());
        if (result.right && refresh) {
          await loadTickets(token: token);
        }
        return result.right;
      } else {
        emit(TicketsFailed());
        throw Exception("Fail olduk arkadaş - <TicketCubit>");
      }
    } catch (e) {
      emit(TicketsFailed());
      return false;
    }
  }

  Future<bool> respondTicket({
    required String token,
    required String id,
    required String message,
  }) async {
    emit(TicketsLoading());
    TicketRepository repository = getIt<TicketRepository>();
    try {
      var result = await repository.respondTicket(
          token: token, id: id, message: message);

      if (result.isRight) {
        emit(TicketsLoaded());
        return result.right;
      } else {
        emit(TicketsFailed());
        throw Exception("Fail olduk arkadaş - <TicketCubit>");
      }
    } catch (e) {
      emit(TicketsFailed());
      return false;
    }
  }

  Future<bool> closeTicket(
      {required String token, required String id, bool refresh = false}) async {
    emit(TicketsLoading());
    TicketRepository repository = getIt<TicketRepository>();
    try {
      var result = await repository.closeTicket(token: token, id: id);

      if (result.isRight) {
        emit(TicketsLoaded());
        if (result.right && refresh) {
          await loadTickets(token: token);
        }
        return result.right;
      } else {
        emit(TicketsFailed());
        throw Exception("Fail olduk arkadaş - <TicketCubit>");
      }
    } catch (e) {
      emit(TicketsFailed());
      return false;
    }
  }
}
