import 'package:bloc/bloc.dart';
import 'package:gabut/data/repository.dart';
import 'package:gabut/models/news/news.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final Repository _repository;

  NewsCubit(this._repository) : super(NewsInitial());

  Future<void> getTopHeadline() async {
    try {
      emit(NewsLoading());
      final newsList = await _repository.getTopHeadlines();
      emit(NewsLoaded(newsList));
    } catch (error) {
      print(error.toString());
      emit(NewsError(error));
    }
  }
}
