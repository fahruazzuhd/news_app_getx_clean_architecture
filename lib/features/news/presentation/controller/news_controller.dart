import 'package:com.fahruazzuhd.newsapp/common/controller/base_controller.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/domain/usecases/get_news_usecase.dart';
import 'package:get/get.dart';

class NewsController extends GetxController
    with StateMixin<List<Article>>, BaseController {
  final GetNewsUseCase getNewsUseCase;

  // @visibleForTesting
  // String? errorMessage;
  // @visibleForTesting
  // List<Article>? users;

  NewsController({
    required this.getNewsUseCase,
  });

  Future<void> getNews(
      {required String country, required String apiKey}) async {
    print("🔍 getNews() DIPANGGIL dengan country: $country, apiKey: $apiKey");

    change(null, status: RxStatus.loading());
    try {
      final result = await getNewsUseCase.call(
        country: country,
        apiKey: apiKey,
      );

      print("✅ Data berhasil diambil: ${result.length} artikel");
      change(result, status: RxStatus.success());
    } catch (e) {
      print("❌ Error mengambil data: $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
