import 'package:com.fahruazzuhd.newsapp/common/network/api_config.dart';
import 'package:com.fahruazzuhd.newsapp/di.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/presentation/controller/news_controller.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/presentation/widget/card_article.dart';
import 'package:com.fahruazzuhd.newsapp/common/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  final NewsController controller = getIt<NewsController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getNews(
          country: ApiConfig.country,
          apiKey: ApiConfig.apiKey); // Panggil getNews()
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: _buildList(controller),
      ),
      iosBuilder: (context) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('News App'),
          transitionBetweenRoutes: false,
        ),
        child: _buildList(controller),
      ),
    );
  }

  Widget _buildList(NewsController controller) {
    return controller.obx(
      (articles) {
        print("📌 Data berhasil diambil: ${articles?.length ?? 0} artikel");
        return ListView.builder(
          shrinkWrap: true,
          itemCount: articles?.length ?? 0,
          itemBuilder: (context, index) {
            var article = articles![index];
            return CardArticle(article: article);
          },
        );
      },
      onLoading: const Center(child: CircularProgressIndicator()),
      onError: (error) => Center(child: Text("Terjadi kesalahan: $error")),
    );
  }
}
