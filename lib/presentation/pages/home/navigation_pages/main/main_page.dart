import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/enums/content_type.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:gain_clone/presentation/components/other/content_type_horizontal_list.dart';
import 'package:gain_clone/presentation/components/other/recommended_contents_slider.dart';
import 'package:gain_clone/presentation/components/tabbar/content_types_tabbar.dart';
import 'package:gain_clone/presentation/pages/home/content/content_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  void pushContentPage(BuildContext context, {required Content content}) {
    NavigationService.pushWithModalBottomSheet(
      context,
      ContentPage(content: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainViewModel(),
      builder: (context, _) {
        return DefaultTabController(
          length: getContentTypes.length,
          child: Scaffold(
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                _recommendeds(context),
                SizedBox(height: 8.sp),
                _tabbarForContentTypes(context),
                SizedBox(height: 16.sp),
                if (context.read<MainViewModel>().isLoadingBody)
                  const AppLinearProgressIndicator()
                else
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 24.sp),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context
                            .read<MainViewModel>()
                            .contentHeaderList
                            ?.length ??
                        0,
                    itemBuilder: (context, index) {
                      final oneContentHeader = context
                          .read<MainViewModel>()
                          .contentHeaderList![index];
                      return ContentTypeHorizontalList(
                        headerText: oneContentHeader.name,
                        contentList: oneContentHeader.contentList!,
                        onTapCallBack: (index) => pushContentPage(
                          context,
                          content: oneContentHeader.contentList![index],
                        ),
                      );
                    },
                  ),
                SizedBox(height: context.bottomPadding + 96.h)
              ],
            ),
          ),
        );
      },
    );
  }

  RecommendedContentsSlider _recommendeds(BuildContext context) {
    final contentList =
        context.watch<MainViewModel>().contentHeaderList?[0].contentList;
    return RecommendedContentsSlider(
      contents: contentList,
      onTapCallBack: (index) => pushContentPage(
        context,
        content: contentList![index],
      ),
    );
  }

  Theme _tabbarForContentTypes(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ContentTypesTabbar(
        context: context,
        tabs: getContentTypes,
        onTap: context.read<MainViewModel>().onTap,
      ),
    );
  }
}
