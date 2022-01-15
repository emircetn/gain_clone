import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/presentation/components/images/network_image_with_shimmer.dart';

class ContentBucketListview extends StatelessWidget {
  final String headerText;
  final List<Content> contentList;
  final void Function(int) onTapCallBack;

  const ContentBucketListview({
    Key? key,
    required this.headerText,
    required this.contentList,
    required this.onTapCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingHorizontal16x,
          child: Text(
            headerText,
            style: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12.sp),
        SizedBox(
          height: 120.sp,
          child: ListView.separated(
              padding: context.paddingHorizontal16x,
              separatorBuilder: (context, index) => SizedBox(width: 16.sp),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTapCallBack(index),
                  child: ClipRRect(
                    borderRadius: context.borderRadius8x,
                    child: NetworkImageWithShimmer(
                      contentList[index].coverImageUrl,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
