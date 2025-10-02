import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/network/network_error.dart';
import 'package:weather_app/features/search/data/data_source/search_data_source.dart';
import 'package:weather_app/features/search/data/model/search_model.dart';

class SearchRepo {
  final SearchDatasource searchDatasource;
  final NetworkInfo networkInfo;

  SearchRepo({required this.searchDatasource, required this.networkInfo});

  Future<Either<Failure, List<SearchResult>>> searchCity({
    required Map<String, dynamic> queries,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await searchDatasource.searchCity(queries: queries);
        return Right(remoteData);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
