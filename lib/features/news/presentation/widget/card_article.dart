import 'package:com.fahruazzuhd.newsapp/core/styles.dart';
import 'package:com.fahruazzuhd.newsapp/features/news/data/models/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: SizedBox(
            width: 100,
            height: 80,
            child: Image.network(
              article.urlToImage!,
              width: 100,
            ),
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author ?? ''),
        onTap: () {
          Get.toNamed('/news-detail', arguments: article);
        },
      ),
    );
  }
}
