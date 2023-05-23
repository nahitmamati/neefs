import '../../domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    required String? date,
    required String? content,
    required String? title,
    required String? description,
    required String? type,
    required String? image,
    required String? author,
  }) : super(
          date: date,
          content: content,
          title: title,
          description: description,
          type: type,
          image: image,
          author: author,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      date: json["name"],
      content: json["content"],
      title: json["title"],
      description: json["description"],
      type: json["type"],
      image: json["image"],
      author: json["author"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['content'] = content;
    data['title'] = title;
    data['description'] = description;
    data['og_type'] = type;
    data['og_image'] = image;
    data['author'] = author;
    return data;
  }
}
