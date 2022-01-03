import 'package:flutter/material.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/presentation/pages/home/navigation/navigation_page.dart';

class LandingPage extends StatefulWidget {
  static const String path = '/landing';
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => NavigationService.pushReplacementNamed(NavigationPage.path),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: double.maxFinite,
          child: Image.asset('assets/icons/gain_icon.png'),
        ),
      ),
    );
  }
}
