import 'package:dio/dio.dart';
import 'package:neefs/core/error/exceptions.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';
import 'package:neefs/features/user/domain/entities/user.dart';

abstract class TicketRemoteDataSource {
  late String baseUrl;
  Future<List<TicketModel>> getTickets({required String token});
  Future<bool> addTicket(
      {required String token,
      required String title,
      required String message,
      required String topic});
  Future<bool> respondTicket(
      {required String token, required String id, required String message});
  Future<bool> closeTicket({required String token, required String id});
  //Future<User> getUser();
}

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  @override
  String baseUrl = "https://api.qline.app/api";

  @override
  Future<List<TicketModel>> getTickets({required String token}) async {
    try {
      var response = await Dio().get("$baseUrl/tickets",
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((item) => TicketModel.fromJson(item))
            .toList();
      } else {
        throw ServerException(message: "ServerError on getting the tickets");
      }
    } on DioError catch (ex) {
      throw ServerException(message: "Server Error: ${ex.message}");
    }
  }

  @override
  Future<bool> addTicket({
    required String token,
    required String title,
    required String message,
    required String topic,
  }) async {
    try {
      var response = await Dio().post("$baseUrl/tickets",
          data: {"title": title, "message": message, "topic": topic},
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        if (response.data['success']) {
          return true;
        }
        return false;
      } else {
        throw ServerException(message: "ServerError on adding the ticket");
      }
    } on DioError catch (ex) {
      throw ServerException(message: "Server Error: ${ex.message}");
    }
  }

  @override
  Future<bool> respondTicket({
    required String token,
    required String id,
    required String message,
  }) async {
    try {
      var response = await Dio().post("$baseUrl/tickets/respond",
          data: {"id": id, "message": message},
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        if (response.data['success']) {
          return true;
        }
        return false;
      } else {
        throw ServerException(message: "ServerError on responding the ticket");
      }
    } on DioError catch (ex) {
      throw ServerException(message: "Server Error: ${ex.message}");
    }
  }

  @override
  Future<bool> closeTicket({required String token, required String id}) async {
    try {
      var response = await Dio().post("$baseUrl/tickets/close",
          data: {"id": id},
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        if (response.data['success']) {
          return true;
        }
        return false;
      } else {
        throw ServerException(message: "ServerError on closing the ticket");
      }
    } on DioError catch (ex) {
      throw ServerException(message: "Server Error: ${ex.message}");
    }
  }

  // @override
  // Future<User> getUser() {
  //   return User
  // }
}
