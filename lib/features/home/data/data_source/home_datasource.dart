import 'package:weather_app/core/utils/model/main_weather_responce.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/api_services.dart';

class Homedatasource {
  final ApiServices apiServices;
  Homedatasource({required this.apiServices});

  Future<WeatherResponse> getforcastweather({
    required Map<String, dynamic> queries,
  }) async {
    final response = await apiServices.getData(
      urll: ApiConstant.forecast,
      queries: queries,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return WeatherResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
