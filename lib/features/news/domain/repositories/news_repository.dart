import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getNews({
    required String country,
    required String apiKey,
  });
}
