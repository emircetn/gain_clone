import 'package:flutter/material.dart';

import 'package:gain_clone/constants/app_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/content.dart';
import 'package:gain_clone/presentation/components/other/content_type_horizontal_list.dart';
import 'package:gain_clone/presentation/components/other/recommended_contents_slider.dart';
import 'package:gain_clone/presentation/components/tabbar/app_tabbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final List<Content> contentList = [
    Content.temp(),
    Content.temp(),
    Content.temp(),
  ];
  @override
  void initState() {
    tabController =
        TabController(length: AppConstants.instance.tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _recommendeds(),
          _tabbarForContentTypes(),
          SizedBox(height: 8.sp),
          ContentTypeHorizontalList(
            headerText: 'Öne Çıkanlar',
            contentList: contentList,
          ),
          SizedBox(height: 16.sp),
          ContentTypeHorizontalList(
            headerText: 'Ücretsiz Başla',
            contentList: contentList,
          ),
          SizedBox(height: 16.sp),
          ContentTypeHorizontalList(
            headerText: 'GAİN Orijinal Komediler',
            contentList: contentList,
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 96.h)
        ],
      ),
    );
  }

  RecommendedContentsSlider _recommendeds() {
    return RecommendedContentsSlider(
      contents: contentList,
    );
  }

  Theme _tabbarForContentTypes() {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: AppTabbar(
        context: context,
        controller: tabController,
        tabs: AppConstants.instance.tabs,
      ),
    );
  }
}
