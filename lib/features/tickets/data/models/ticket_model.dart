import 'package:neefs/features/tickets/domain/entities/ticket.dart';

class TicketModel extends Ticket {
  TicketModel(
      {required int? id,
      required String? title,
      required String? status,
      required String? topic,
      required String? createdAt,
      required String? updatedAt})
      : super(
          id: id,
          title: title,
          status: status,
          topic: topic,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
        id: json['id'],
        title: json['title'],
        status: json['status'],
        topic: json['topic'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['topic'] = topic;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
