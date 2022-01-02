import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/arguments/web_view_page_arguments.dart';
import 'package:gain_clone/presentation/components/buttons/appbar_leading_button.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static const String path = '/webview';
  final WebViewPageArguments args;
  const WebViewPage({Key? key, required this.args}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  void updateIsLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.header),
        leading: AppBarLeadingButton(),
      ),
      body: Stack(
        children: [
          WebView(
            backgroundColor: Colors.black,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) => updateIsLoading(false),
            initialUrl: widget.args.url,
          ),
          if (isLoading) const AppLinearProgressIndicator()
        ],
      ),
    );
  }
}
