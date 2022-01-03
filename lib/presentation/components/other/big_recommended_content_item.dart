import 'package:flutter/material.dart';
import 'package:gain_clone/constants/app_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/presentation/components/buttons/mini_watch_now_button.dart';
import 'package:gain_clone/presentation/components/other/network_image_with_shimmer.dart';

class BigecommendedContentItem extends StatelessWidget {
  final Content content;
  final void Function() onTap;
  final double? height;
  const BigecommendedContentItem({
    Key? key,
    required this.content,
    required this.onTap,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          NetworkImageWithShimmer(content.coverImageUrl,
              height: height ?? context.height * .5),
          Container(
            decoration: BoxDecoration(
              //  border: Border.all(color: Colors.red),
              gradient: AppConstants.instance.contentCoverBigGradient,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  content.name,
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(height: 8.sp),
                Text(
                  content.showContentType,
                  style: context.textTheme.bodyText2!.copyWith(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 12.sp),
                MiniWatchNowButton(context: context, onTap: onTap),
                SizedBox(height: 12.sp),
              ],
            ),
          )
        ],
      ),
    );
  }
}
