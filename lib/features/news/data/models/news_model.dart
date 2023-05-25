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
    var url = json["yoast_head_json"]["og_image"] == null ? "https://cdn.discordapp.com/attachments/1092029772697174047/1098213225453076610/WIN_20221115_18_51_26_Pro.jpg" : json["yoast_head_json"]["og_image"][0]["url"];
    return NewsModel(
      date: json["date"],
      content: json["content"]["rendered"],
      title: json["yoast_head_json"]["title"],
      description: json["yoast_head_json"]["description"],
      type: json["yoast_head_json"]["og_type"],
      image: url,
      author: json["yoast_head_json"]["author"],
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
