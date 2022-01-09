import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewViewModel extends ChangeNotifier {
  bool isLoadingWebView = true;

  WebViewViewModel() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void updateIsLoading(bool loading) {
    isLoadingWebView = loading;
    notifyListeners();
  }
}
