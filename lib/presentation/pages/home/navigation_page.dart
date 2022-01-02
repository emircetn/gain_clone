import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_item_model.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:gain_clone/presentation/components/other/keep_alive_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/downloads_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/profile_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search_page.dart';

class NavigationPage extends StatefulWidget {
  static const String path = '/navigation';

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final ValueNotifier<int> currentTabNotifier = ValueNotifier<int>(0);
  late final List<AppBottomNavigationBarItemModel> _tabItems;
  @override
  void initState() {
    _tabItems = [
      const AppBottomNavigationBarItemModel(
        text: 'AnaSayfa',
        icon: PhosphorIcons.house_line,
        page: KeepAlivePage(
          child: MainPage(),
        ),
      ),
      const AppBottomNavigationBarItemModel(
        text: 'Arama',
        icon: PhosphorIcons.magnifying_glass,
        page: SearchPage(),
      ),
      const AppBottomNavigationBarItemModel(
        text: 'İndirilenler',
        icon: PhosphorIcons.download_simple,
        page: DowloadsPage(),
      ),
      AppBottomNavigationBarItemModel(
        text: 'Profil',
        icon: PhosphorIcons.user,
        page: ProfilePage(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder<int>(
        valueListenable: currentTabNotifier,
        builder: (context, currentTab, _) {
          return Stack(
            children: [
              _tabItems[currentTab].page,
              bottomNavigationBar(currentTab)
            ],
          );
        },
      ),
    );
  }

  AppBottomNavigationBar bottomNavigationBar(int currentTab) {
    return AppBottomNavigationBar(
      items: _tabItems,
      selectedIndex: currentTab,
      tabChanged: (index) {
        currentTabNotifier.value = index;
      },
    );
  }
}
