import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/content.dart';
import 'package:gain_clone/presentation/components/other/big_recommended_content_item.dart';

class RecommendedContentsSlider extends StatefulWidget {
  final List<Content> contents;
  final void Function(int) onTapCallBack;
  const RecommendedContentsSlider({
    Key? key,
    required this.contents,
    required this.onTapCallBack,
  }) : super(key: key);

  @override
  State<RecommendedContentsSlider> createState() =>
      _RecommendedContentsSliderState();
}

class _RecommendedContentsSliderState extends State<RecommendedContentsSlider> {
  ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (index, reason) => pageIndexNotifier.value = index,
            height: context.height * .6,
            viewportFraction: 1,
          ),
          itemCount: widget.contents.length,
          itemBuilder: (context, index, c) {
            return BigecommendedContentItem(
              content: widget.contents[index],
              onTap: () => widget.onTapCallBack(index),
              height: context.height * .6,
            );
          },
        ),
        SizedBox(height: 8.sp),
        ValueListenableBuilder<int>(
          valueListenable: pageIndexNotifier,
          builder: (context, pageIndex, _) {
            return _PageIndicatorWidget(
              dotCount: widget.contents.length,
              index: pageIndex,
            );
          },
        ),
        SizedBox(height: 12.sp),
      ],
    );
  }
}

class _PageIndicatorWidget extends StatefulWidget {
  final int dotCount;
  final int index;
  final Color color;
  final Color selectedColor;

  final double dotHeight;
  final double dotWidth;
  const _PageIndicatorWidget({
    Key? key,
    required this.dotCount,
    required this.index,
    this.color = Colors.white,
    this.selectedColor = Colors.red,
    this.dotHeight = 2,
    this.dotWidth = 12,
  }) : super(key: key);

  @override
  __PageIndicatorWidgetState createState() => __PageIndicatorWidgetState();
}

class __PageIndicatorWidgetState extends State<_PageIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return buildPageIndicator(widget.index);
  }

  Widget buildPageIndicator(int index) {
    var list = <Widget>[];
    for (var i = 0; i < widget.dotCount; i++) {
      list.add(i == index ? _indicator(true) : _indicator(false));
    }
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: list),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: widget.dotHeight,
      width: isActive ? widget.dotWidth * 1.5 : widget.dotWidth,
      margin: context.paddingHorizontal2x,
      decoration: BoxDecoration(
        color: isActive ? widget.selectedColor : widget.color,
        borderRadius: context.borderRadius2x,
      ),
    );
  }
}
