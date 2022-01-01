import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:gain_clone/models/arguments/user_information_update_page_arguments.dart';
import 'package:gain_clone/models/arguments/web_view_page_arguments.dart';
import 'package:gain_clone/presentation/pages/home/navigation_page.dart';
import 'package:gain_clone/presentation/pages/home/user_information_update.dart';
import 'package:gain_clone/presentation/pages/home/webview_page.dart';
import 'package:gain_clone/presentation/pages/landing_page.dart';

import '../../../main.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments; //argumanlar

    switch (settings.name) {
      case App.path:
        return CupertinoPageRoute(builder: (_) => const App());
      case LandingPage.path:
        return CupertinoPageRoute(builder: (_) => const LandingPage());
      case NavigationPage.path:
        return CupertinoPageRoute(builder: (_) => const NavigationPage());
      case UserInformationUpdatePage.path:
        return CupertinoPageRoute(
          builder: (_) => UserInformationUpdatePage(
            args: arguments as UserInformationUpdatePageArguments,
          ),
        );
      case WebViewPage.path:
        return CupertinoPageRoute(
          builder: (_) => WebViewPage(
            args: arguments as WebViewPageArguments,
          ),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Not Found'))),
        );
    }
  }
}
