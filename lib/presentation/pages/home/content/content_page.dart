import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/constants/app_constants.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';

import 'package:gain_clone/presentation/components/buttons/circle_icon_button.dart';
import 'package:gain_clone/presentation/components/buttons/watch_now_button.dart';
import 'package:gain_clone/presentation/components/divider/app_divider.dart';
import 'package:gain_clone/presentation/components/items/content_part_item.dart';
import 'package:gain_clone/presentation/components/other/dot.dart';
import 'package:gain_clone/presentation/components/other/network_image_with_shimmer.dart';
import 'package:gain_clone/presentation/components/other/smart_sign.dart';
import 'package:gain_clone/presentation/components/tabbar/content_page_tabbar.dart';
import 'package:gain_clone/presentation/pages/home/player/player_page.dart';

class ContentPage extends StatefulWidget {
  final Content content;
  const ContentPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          coverAndCloseField(context),
          Padding(
            padding: context.paddingHorizontal16x + context.paddingHorizontal2x,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...contentDetails(context),
                SizedBox(height: 12.sp),
                buttonsField(),
                SizedBox(height: 32.sp),
                AppDivider(),
                SizedBox(height: 12.sp),
                ContentPageTabbar(
                  context: context,
                  controller: tabController,
                  tabs: const ['Bölümler', 'Benzer İçerikler'],
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 32.sp),
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ContentPartItem(
                      content: widget.content,
                      contentPart: ContentPart.temp(),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox coverAndCloseField(BuildContext context) {
    return SizedBox(
      height: context.height * .28,
      child: Stack(
        children: [
          NetworkImageWithShimmer(
            widget.content.coverImageUrl,
            height: context.height * .28,
          ),
          Container(
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.red),
              gradient: AppConstants.instance.contentCoverSmallGradient,
            ),
          ),
          Positioned(
            right: 10.sp,
            top: 10.sp,
            child: SafeArea(
              child: CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.black12,
                child: IconButton(
                  onPressed: () => NavigationService.pop(),
                  icon: Icon(
                    Icons.close,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> contentDetails(BuildContext context) {
    return [
      Text(
        widget.content.name,
        style: context.textTheme.headline5!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 8.sp),
      Row(
        children: [
          Text(
            widget.content.showContentType,
            style: context.textTheme.subtitle2,
          ),
          SizedBox(width: 12.sp),
          Dot(),
          SizedBox(width: 12.sp),
          const SmartSign(),
          SizedBox(width: 8.sp),
          const SmartSign(),
          SizedBox(width: 8.sp),
          const SmartSign(),
          SizedBox(width: 8.sp),
          if (widget.content.imdbScore != null) ...[
            Dot(),
            SizedBox(width: 12.sp),
            Text(
              widget.content.imdbScore!.toString(),
            ),
          ],
        ],
      ),
      SizedBox(height: 24.sp),
      WatchNowButton(
        onPressed: () {
          Content content = Content.temp();
          content.addParts([
            ContentPart.temp(),
          ]);
          NavigationService.pushNamed(
            PlayerPage.path,
            arguments: PlayerPageArguments(
              content: content,
              selectedContentIndex: 1,
            ),
          );
        },
      ), //TODO:yönlendirme eklenecek
      SizedBox(height: 20.sp),
      Text(
        widget.content.explanation,
        style: context.textTheme.caption!.copyWith(
          color: Colors.white54,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      SizedBox(height: 16.sp),
      Text(
        widget.content.showContentType,
        style: context.textTheme.caption!.copyWith(
          color: Colors.white54,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      SizedBox(height: 2.sp),
      Text(
        'Tür:', //TODO:tür eklenecek
        style: context.textTheme.caption!.copyWith(
          color: Colors.white54,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    ];
  }

  Widget buttonsField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleIconButton(
          iconData: Icons.reply_sharp,
          text: 'Paylaş',
          onTap: () {}, //TODO:eklenecek
        ),
        CircleIconButton(
          iconData: PhosphorIcons.thumbs_up,
          text: 'Puanla',
          onTap: () {}, //TODO:eklenecek
        ),
      ],
    );
  }
}
