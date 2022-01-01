import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/content.dart';
import 'package:gain_clone/presentation/components/buttons/watch_now_button.dart';
import 'package:gain_clone/presentation/components/other/network_image_with_shimmer.dart';

class RecommendedContentsSlider extends StatefulWidget {
  final List<Content> contents;
  const RecommendedContentsSlider({
    Key? key,
    required this.contents,
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
            height: context.height * .5,
            viewportFraction: 1,
          ),
          itemCount: widget.contents.length,
          itemBuilder: (context, index, c) {
            return _RecommendedContentsSliderItem(
                content: widget.contents[index]);
          },
        ),
        SizedBox(height: 12.sp),
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

class _RecommendedContentsSliderItem extends StatelessWidget {
  final Content content;
  const _RecommendedContentsSliderItem({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NetworkImageWithShimmer(content.coverImageUrl,
            height: context.height * .5),
        Container(
          decoration: const BoxDecoration(
            //  border: Border.all(color: Colors.red),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black12,
                Colors.black38,
                Colors.black54,
                Colors.black87,
                Colors.black,
                Colors.black,
              ],
            ),
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
                content.showContentType(),
                style: context.textTheme.caption,
              ),
              SizedBox(height: 8.sp),
              WatchNowButton(
                onTap: () {},
              ),
              SizedBox(height: 8.sp),
            ],
          ),
        )
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
    this.dotHeight = 1.5,
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
