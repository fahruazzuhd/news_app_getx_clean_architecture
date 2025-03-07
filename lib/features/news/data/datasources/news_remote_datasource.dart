import 'package:com.fahruazzuhd.newsapp/common/network/api_base.dart';
import 'package:com.fahruazzuhd.newsapp/common/network/api_config.dart';
import 'package:com.fahruazzuhd.newsapp/common/network/dio_client.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';

abstract class NewsRemoteDatasource {
  Future<List<Article>> getNews(
      {required String country, required String apiKey});
}

class NewsRemoteDataSourceImpl with ApiBase implements NewsRemoteDatasource {
  final DioClient dioClient;

  const NewsRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<Article>> getNews(
      {required String country, required String apiKey}) async {
    try {
      Map<String, String> queryParameters = {
        "country": country,
        "apiKey": apiKey,
      };

      return await makeGetRequest(
        dioClient.get(ApiConfig.topHeadlines, queryParameters: queryParameters),
        (json) => Article.fromJson(json),
      );
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}
