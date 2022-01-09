import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/images/network_image_with_shimmer.dart';

class ContentPartMiniItem extends StatelessWidget {
  final Content content;
  final ContentPart contentPart;
  final VoidCallback onTap;
  const ContentPartMiniItem({
    Key? key,
    required this.content,
    required this.contentPart,
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
            width: context.width * 0.35,
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
                  '${content.name}${contentPart.showPartNoAndName}',
                  style: context.textTheme.subtitle2!,
                ),
                SizedBox(height: 2.sp),
                Text(
                  '${content.showContentType}  •  ${contentPart.showPartNoAndNameForPlayer}',
                  style: context.textTheme.subtitle2!.copyWith(
                    color: Colors.white54,
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
