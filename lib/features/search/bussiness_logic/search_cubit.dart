import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/search/bussiness_logic/search_state.dart';
import 'package:weather_app/features/search/data/repo/search_repo.dart';

import '../../../core/network/api_constant.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo repo;

  SearchCubit(this.repo) : super(SearchInitial());

  Future<void> searchCity(String cityName) async {
    emit(SearchLoading());

    final result = await repo.searchCity(
      queries: {"q": cityName, "key": ApiConstant.apiKey},
    );

    result.fold(
      (failure) {
        emit(SearchFailure(failure.toString()));
      },
      (results) {
        emit(SearchSuccess(results));
      },
    );
  }
}
