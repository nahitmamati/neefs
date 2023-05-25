import 'package:dio/dio.dart';

void main() async{
  var response = await Dio().get("https://www.nginx.com/wp-json/wp/v2/posts?page=1");
  print(response);
}