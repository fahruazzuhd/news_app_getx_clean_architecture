import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<Article>> call(
      {required String country, required String apiKey}) async {
    print("📡 GetNewsUseCase: Memanggil repository...");
    return await repository.getNews(country: country, apiKey: apiKey);
  }
}
