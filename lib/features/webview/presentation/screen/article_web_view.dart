import 'package:com.fahruazzuhd.newsapp/common/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ArticleWebView extends StatefulWidget {
  const ArticleWebView({super.key});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late WebViewController controller;

  final String url = Get.arguments;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
