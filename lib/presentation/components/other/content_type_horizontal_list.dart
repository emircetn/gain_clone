import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/content.dart';
import 'package:gain_clone/presentation/components/network_image_with_shimmer.dart';

class ContentTypeHorizontalList extends StatelessWidget {
  final String headerText;
  final List<Content> contentList;

  const ContentTypeHorizontalList({
    Key? key,
    required this.headerText,
    required this.contentList,
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
            style: context.textTheme.bodyText1,
          ),
        ),
        SizedBox(height: 8.sp),
        SizedBox(
          height: 100.sp,
          child: ListView.separated(
              padding: context.paddingHorizontal16x,
              separatorBuilder: (context, index) => SizedBox(width: 12.sp),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: context.borderRadius8x,
                  child: NetworkImageWithShimmer(
                    contentList[index].coverImageUrl,
                  ),
                );
              }),
        )
      ],
    );
  }
}
