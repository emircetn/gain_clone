import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

typedef ScoreButtonsCallBack = void Function(bool);

class ScoreButtons extends StatelessWidget {
  final IconData iconData;
  final VoidCallback closeButtonTapped;
  final Rect centerItemRect;
  final ScoreButtonsCallBack likeOrDisLikeTapped;

  const ScoreButtons({
    Key? key,
    required this.iconData,
    required this.closeButtonTapped,
    required this.centerItemRect,
    required this.likeOrDisLikeTapped,
  }) : super(key: key);

  void scoreButtonTapped(BuildContext context, bool isLike) {
    Navigator.of(context).pop();
    likeOrDisLikeTapped(isLike);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: centerItemRect.top,
          left: centerItemRect.left,
          child: ClipOval(
            child: Material(
              color: Colors.black.withOpacity(0.6),
              child: InkWell(
                onTap: closeButtonTapped,
                customBorder: const CircleBorder(),
                child: Padding(
                  padding: context.padding12x,
                  child: SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: Icon(
                      iconData,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        likeDislikeCirle(context, true),
        likeDislikeCirle(context, false),
      ],
    );
  }

  Positioned likeDislikeCirle(BuildContext context, bool isLike) {
    return Positioned(
      top: centerItemRect.top - 60.sp,
      left: centerItemRect.left + (isLike ? -40.sp : 40.sp),
      child: CircleAvatar(
        radius: 32.sp,
        backgroundColor: Colors.white,
        child: GestureDetector(
          onTap: () => scoreButtonTapped(context, isLike),
          child: Icon(
            isLike ? PhosphorIcons.thumbs_up : PhosphorIcons.thumbs_down,
            size: 32.sp,
          ),
        ),
      ),
    );
  }
}
