import 'package:dio/dio.dart';

import '../models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> loadNews(int page);
  Future<NewsModel> getNewsSliderItems();
  Future<NewsModel> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl();

  @override
  Future<NewsModel> getNews() async {
    return const NewsModel(
        date: "",
        content: "",
        title: "",
        description: "",
        type: "",
        image: "",
        author: "");
  }

  @override
  Future<NewsModel> getNewsSliderItems() {
    throw UnimplementedError();
  }

  @override
  Future<List<NewsModel>> loadNews(int page) async {
    List<NewsModel> news = [];
    print("DİODAN ÖNCE");
    var dio = Dio();
    print("DİODAN SONRA");
    var response =
        await dio.get("https://www.nginx.com/wp-json/wp/v2/posts?page=$page");
    print("RESPONSEDAN SONRA");
    if (response.statusCode == 200) {
      List<dynamic> temp = response.data;
      for (var item in temp) {
        news.add(NewsModel.fromJson(item));
      }
    } else {
      throw Exception("Server ERROR");
    }
    return news;
  }
}
