import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part "ticket.g.dart";

@HiveType(typeId: 0)
class Ticket extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? status;
  @HiveField(3)
  final String? topic;
  @HiveField(4)
  final String? createdAt;
  @HiveField(5)
  final String? updatedAt;

  const Ticket(
      {required this.id,
      required this.title,
      required this.status,
      required this.topic,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [id, title, status, topic, createdAt, updatedAt];
}
