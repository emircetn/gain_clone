import 'package:flutter/material.dart';
import 'package:gain_clone/presentation/pages/home/webview/web_view_page_arguments.dart';
import 'package:gain_clone/presentation/components/buttons/appbar_leading_button.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:gain_clone/presentation/pages/home/webview/webview_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const String path = '/webview';
  final WebViewPageArguments args;
  const WebViewPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WebViewViewModel(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(args.header),
          leading: AppBarLeadingButton(),
        ),
        body: Stack(
          children: [
            WebView(
              backgroundColor: Colors.black,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) =>
                  context.read<WebViewViewModel>().updateIsLoading(false),
              initialUrl: args.url,
            ),
            if (context.watch<WebViewViewModel>().isLoadingWebView)
              const AppLinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
