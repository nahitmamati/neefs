import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News extends Equatable {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? date;
  @HiveField(2)
  final String? content;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final String? author;

  const News(
      {required this.title,
      required this.date,
      required this.content,
      required this.description,
      required this.type,
      required this.image,
      required this.author});

  @override
  List<Object?> get props => [
        title,
        date,
        content,
        description,
        type,
        image,
        author,
      ];
}
