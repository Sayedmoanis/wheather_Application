import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/network/network_error.dart';
import 'package:weather_app/features/home/data/data_source/home_datasource.dart';

import '../../../../core/utils/model/main_weather_responce.dart';

class HomeRepo {
  final Homedatasource homedatasource;
  final NetworkInfo networkInfo;

  HomeRepo({required this.homedatasource, required this.networkInfo});

  Future<Either<Failure, WeatherResponse>> getforcast({
    required Map<String, dynamic> queries,
  }) async {
    try {
      final remoteData = await homedatasource.getforcastweather(
        queries: queries,
      );

      return Right(remoteData);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
