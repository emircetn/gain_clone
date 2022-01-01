import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_route.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/presentation/pages/home/navigation_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  static const String path = '/';
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationRoute.generateRoute,
        theme: ThemeData(
          fontFamily: 'BeVietnamPro',
          primaryColor: ColorConstants.primaryColor,
          scaffoldBackgroundColor: ColorConstants.primaryColor,
          textTheme: const TextTheme(
            headline5: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            headline6: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            subtitle1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            subtitle2: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            bodyText1: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            bodyText2: TextStyle(fontSize: 14),
            overline: TextStyle(fontSize: 10),
            caption: TextStyle(fontSize: 11, color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            brightness: Brightness.dark,
            primary: ColorConstants.primaryColor,
            secondary: ColorConstants.secondaryColor,
          ),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Colors.green[800]),
            trackColor: MaterialStateProperty.all(Colors.greenAccent[400]),
          ),
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: ColorConstants.primaryColor,
            elevation: 0,
            centerTitle: false,
            titleTextStyle: context.textTheme.bodyText1!
                .copyWith(color: Colors.white, fontSize: 16),
            toolbarHeight: kToolbarHeight * 0.8,
          ),
        ),
        home: const NavigationPage(),
      );
    });
  }
}
