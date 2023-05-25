part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

//NEWS
class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
}

class NewsFailed extends NewsState {}

//NEWS PAGE
class NewsPageLoading extends NewsState {}

class NewsPageLoaded extends NewsState {}

class NewsPageFailed extends NewsState {}


