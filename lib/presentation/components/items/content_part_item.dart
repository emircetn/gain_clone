import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/data/models/content_part/content_part.dart';
import 'package:gain_clone/presentation/components/images/network_image_with_shimmer.dart';

class ContentPartItem extends StatelessWidget {
  final Content content;
  final ContentPart contentPart;
  final VoidCallback onTap;
  const ContentPartItem({
    Key? key,
    required this.content,
    required this.contentPart,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: context.width * 0.25,
          width: context.width * 0.3,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: context.borderRadius8x,
                child: NetworkImageWithShimmer(
                  contentPart.coverUrl,
                  height: context.width * 0.25,
                  width: context.width * 0.3,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900]!,
                    borderRadius: context.borderRadiusOnlyBottom8x,
                  ),
                  width: context.width * 0.3,
                  child: Text(
                    contentPart.showPartNoAndNameForCover,
                    style: context.textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        title: Text(
          '${content.name}${contentPart.showPartNoAndName}',
          style: context.textTheme.subtitle2!,
        ),
        subtitle: Text(
          contentPart.explanation,
          maxLines: 3,
          style: context.textTheme.caption!.copyWith(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
