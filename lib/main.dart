import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_route.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/managers/app_manager.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:device_preview/device_preview.dart';
import 'package:gain_clone/presentation/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(), // Wrap your app
    ),
  );
}

class App extends StatelessWidget {
  static const String path = '/';
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserManager>(
          create: (_) => UserManager(),
        ),
        ChangeNotifierProvider<AppManager>(
          create: (_) => AppManager(),
          lazy: false,
        ),
      ],
      child: ScreenUtilInit(
        builder: () {
          return MaterialApp(
            title: 'GAİN Clone',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: NavigationRoute.generateRoute,
            theme: ThemeData(
              fontFamily: 'BeVietnamPro',
              primaryColor: ColorConstants.primaryColor,
              scaffoldBackgroundColor: ColorConstants.primaryColor,
              textTheme: const TextTheme(
                headline3: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
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
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: ColorConstants.secondaryColor,
                elevation: 0,
                centerTitle: false,
                titleTextStyle: context.textTheme.bodyText1!
                    .copyWith(color: Colors.white, fontSize: 16),
                toolbarHeight: kToolbarHeight * 0.8,
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
            ),
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}
