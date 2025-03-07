import 'package:com.fahruazzuhd.newsapp/common/network/dio_client.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/repositories/news_repository_impl.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/domain/repositories/news_repository.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/domain/usecases/get_news_usecase.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/presentation/controller/news_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //news controller
  getIt.registerFactory(() => NewsController(
        getNewsUseCase: getIt<GetNewsUseCase>(),
      ));

  //news use cases
  getIt.registerLazySingleton(() => GetNewsUseCase(getIt<NewsRepository>()));

  //news repository
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(remoteDatasource: getIt()),
  );

  // News remote data sources
  getIt.registerLazySingleton<NewsRemoteDatasource>(
    () => NewsRemoteDataSourceImpl(dioClient: getIt<DioClient>()),
  );

  //Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}
