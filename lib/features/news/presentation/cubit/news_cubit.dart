import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:neefs/features/news/data/datasources/news_remote_datasources.dart';
import 'package:neefs/features/news/data/models/news_model.dart';
import 'package:neefs/injection_container.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  List<NewsModel> news = [];
  int sliderIndex = 0;
  int page = 1;
  Future<void> loadNews() async {
    emit(NewsLoading());
    var source = NewsRemoteDataSourceImpl();
    try {
      news.addAll(await source.loadNews(page));
      emit(NewsLoaded());
    } on Exception catch (e) {
      emit(NewsFailed());
    }
  }
}
