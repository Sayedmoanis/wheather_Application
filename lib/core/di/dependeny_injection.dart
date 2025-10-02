import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/features/search/data/data_source/search_data_source.dart';
import 'package:weather_app/features/search/data/repo/search_repo.dart';

import '../../features/home/bussiness_logic/home_cubit.dart';
import '../../features/home/data/data_source/home_datasource.dart';
import '../../features/home/data/repository/home_repo.dart';
import '../../features/search/bussiness_logic/search_cubit.dart';
import '../network/api_factory.dart';
import '../network/api_services.dart';
import '../network/network_error.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: InternetConnectionChecker.createInstance(),
    ),
  );

  /* forcast */
  getIt.registerLazySingleton<Homedatasource>(
    () => Homedatasource(apiServices: getIt()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(homedatasource: getIt(), networkInfo: getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  /* search */
  getIt.registerLazySingleton<SearchDatasource>(
    () => SearchDatasource(apiServices: getIt()),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepo(searchDatasource: getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));
}
