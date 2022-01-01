import 'package:flutter/material.dart';

import 'package:gain_clone/constants/app_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/models/content.dart';
import 'package:gain_clone/presentation/components/other/content_type_horizontal_list.dart';
import 'package:gain_clone/presentation/components/other/recommended_contents_slider.dart';
import 'package:gain_clone/presentation/components/tabbar/content_types_tabbar.dart';
import 'package:gain_clone/presentation/pages/home/content_page.dart';

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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void pushContentPage(Content content) {
    NavigationService.pushWithModalBottomSheet(
      context,
      ContentPage(content: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _recommendeds(),
          SizedBox(height: 8.sp),
          _tabbarForContentTypes(),
          SizedBox(height: 16.sp),
          ContentTypeHorizontalList(
            headerText: 'Öne Çıkanlar',
            contentList: contentList,
            onTapCallBack: (index) => pushContentPage(contentList[index]),
          ),
          SizedBox(height: 24.sp),
          ContentTypeHorizontalList(
            headerText: 'Ücretsiz Başla',
            contentList: contentList,
            onTapCallBack: (index) => pushContentPage(contentList[index]),
          ),
          SizedBox(height: 24.sp),
          ContentTypeHorizontalList(
            headerText: 'GAİN Orijinal Komediler',
            contentList: contentList,
            onTapCallBack: (index) => pushContentPage(contentList[index]),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 96.h)
        ],
      ),
    );
  }

  RecommendedContentsSlider _recommendeds() {
    return RecommendedContentsSlider(
      contents: contentList,
      onTapCallBack: (index) => pushContentPage(
        contentList[index],
      ),
    );
  }

  Theme _tabbarForContentTypes() {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ContentTypesTabbar(
        context: context,
        controller: tabController,
        tabs: AppConstants.instance.tabs,
      ),
    );
  }
}
