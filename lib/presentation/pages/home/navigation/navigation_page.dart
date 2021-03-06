import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_item_model.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:gain_clone/presentation/components/pages/keep_alive_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation/navigation_view_model.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/dowloads/downloads_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/profile/profile_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_page.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  static const String path = '/navigation';

  NavigationPage({Key? key}) : super(key: key);

  final List<AppBottomNavigationBarItemModel> _tabItems = [
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
      page: KeepAlivePage(
        child: SearchPage(),
      ),
    ),
    const AppBottomNavigationBarItemModel(
      text: '─░ndirilenler',
      icon: PhosphorIcons.download_simple,
      page: DowloadsPage(),
    ),
    const AppBottomNavigationBarItemModel(
      text: 'Profil',
      icon: PhosphorIcons.user,
      page: KeepAlivePage(
        child: ProfilePage(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (context) => NavigationViewModel(),
        child: Consumer<NavigationViewModel>(
          builder: (context, navigationViewModel, child) => Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: navigationViewModel.pageController,
                children: _tabItems.map((e) => e.page).toList(),
              ),
              bottomNavigationBar(context, navigationViewModel.currentTab)
            ],
          ),
        ),
      ),
    );
  }

  AppBottomNavigationBar bottomNavigationBar(
      BuildContext context, int currentTab) {
    return AppBottomNavigationBar(
      items: _tabItems,
      selectedIndex: currentTab,
      tabChanged: context.read<NavigationViewModel>().tabChanged,
    );
  }
}
