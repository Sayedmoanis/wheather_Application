import 'package:weather_app/features/search/data/model/search_model.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/api_services.dart';

class SearchDatasource {
  final ApiServices apiServices;
  SearchDatasource({required this.apiServices});

  Future<List<SearchResult>> searchCity({
    required Map<String, dynamic> queries,
  }) async {
    final response = await apiServices.getData(
      urll: ApiConstant.search,
      queries: queries,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List data = response.data;
      return data.map((e) => SearchResult.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
