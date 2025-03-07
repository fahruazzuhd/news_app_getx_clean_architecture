import 'package:com.fahruazzuhd.newsapp/common/repository/repository_helper.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository with RepositoryHelper<Article> {
  final NewsRemoteDatasource remoteDatasource;

  NewsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Article>> getNews(
      {required String country, required String apiKey}) async {
    try {
      return await remoteDatasource.getNews(
          country: country,
          apiKey: apiKey); // ✅ Gunakan parameter yang diterima
    } catch (e) {
      throw Exception("Failed to fetch news: $e"); // ✅ Perbaiki pesan error
    }
  }
}
