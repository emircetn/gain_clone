import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/data/models/content_part/content_part.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/images/network_image_with_shimmer.dart';

class ContentPartMiniItem extends StatelessWidget {
  final ContentPart contentPart;
  final ContentTypes? contentType;
  final VoidCallback onTap;
  const ContentPartMiniItem({
    Key? key,
    required this.contentPart,
    this.contentType,
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
                contentPart.coverUrl,
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
                  '${contentPart.contentName}${contentPart.showPartNoAndName}',
                  style: context.textTheme.subtitle2!,
                ),
                SizedBox(height: 2.sp),
                Text(
                  (contentType != null ? '${contentType!.name} • ' : '') +
                      contentPart.showPartNoAndNameForPlayer,
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
