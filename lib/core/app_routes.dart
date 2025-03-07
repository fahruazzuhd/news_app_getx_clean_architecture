import 'package:com.fahruazzuhd.newsapp/features/home/presentation/screen/home_page.dart';
import 'package:com.fahruazzuhd.newsapp/features/news_detail/presentation/screen/article_detail_page.dart';
import 'package:com.fahruazzuhd.newsapp/features/webview/presentation/screen/article_web_view.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String home = '/';
  static const String newsDetail = '/news-detail';
  static const String webView = '/web-view';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: newsDetail, page: () => ArticleDetailPage()),
    GetPage(name: webView, page: () => ArticleWebView()),
  ];
}
