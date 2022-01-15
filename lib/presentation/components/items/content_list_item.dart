import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/images/network_image_with_shimmer.dart';

class ContentListItem extends StatelessWidget {
  final Content content;
  final VoidCallback onTap;
  const ContentListItem({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.width * 0.4,
            child: ClipRRect(
              borderRadius: context.borderRadius8x,
              child: NetworkImageWithShimmer(
                content.coverImageUrl,
              ),
            ),
          ),
          SizedBox(width: 12.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 12.sp),
                Text(
                  content.name,
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(height: 2.sp),
                Text(
                  content.showContentType,
                  style: context.textTheme.caption!.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
