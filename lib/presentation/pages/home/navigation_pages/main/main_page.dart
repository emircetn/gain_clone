import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:gain_clone/presentation/components/other/content_bucket_listview.dart';
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
          length: Content.getContentTypeNames.length,
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
                  _contentBucketListField(context),
                SizedBox(height: context.bottomPadding + 96.h)
              ],
            ),
          ),
        );
      },
    );
  }

  RecommendedContentsSlider _recommendeds(BuildContext context) {
    final bannerContents = context.watch<MainViewModel>().bannerContents;
    return RecommendedContentsSlider(
      contents: bannerContents,
      onTapCallBack: (index) => pushContentPage(
        context,
        content: bannerContents![index],
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
        tabs: Content.getContentTypeNames,
        onTap: context.read<MainViewModel>().onTap,
      ),
    );
  }

  ListView _contentBucketListField(BuildContext context) {
    final contentBucketList =
        context.read<MainViewModel>().contentBuckets?.contentBucketList;
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => SizedBox(height: 24.sp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contentBucketList?.length ?? 0,
      itemBuilder: (context, index) {
        final oneBucket = contentBucketList![index];
        return ContentBucketListview(
          headerText: oneBucket.name,
          contentList: oneBucket.contentList!,
          onTapCallBack: (index) => pushContentPage(
            context,
            content: oneBucket.contentList![index],
          ),
        );
      },
    );
  }
}
