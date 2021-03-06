import 'package:flutter/cupertino.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> pushNamed(String path, {Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  static Future<void> pushReplacementNamed(String path,
      {Object? arguments}) async {
    await navigatorKey.currentState!
        .pushReplacementNamed(path, arguments: arguments);
  }

  static Future<void> pushNamedAndRemoveUntil(String path,
      {Object? arguments, bool Function(Route<dynamic>)? predicate}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        path, predicate ?? ((Route<dynamic> route) => false),
        arguments: arguments);
  }

  static void pushWithModalBottomSheet(
    BuildContext context,
    Widget widget,
  ) async {
    await showMaterialModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: context.height,
              child: widget,
            ));
  }

  static void pop() {
    navigatorKey.currentState!.pop();
  }
}
