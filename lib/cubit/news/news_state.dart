part of 'news_cubit.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final NewsList newsList;
  const NewsLoaded(this.newsList);
}

class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);
}
