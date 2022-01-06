import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class SecondsDisplayWidget extends StatefulWidget {
  final int seconds;
  final bool isForward;
  final bool isVisible;
  const SecondsDisplayWidget(
      {Key? key,
      required this.seconds,
      required this.isForward,
      required this.isVisible})
      : super(key: key);

  @override
  _SecondsDisplayWidgetState createState() => _SecondsDisplayWidgetState();
}

class _SecondsDisplayWidgetState extends State<SecondsDisplayWidget> {
  ValueNotifier<bool> isDisplayNotifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    isDisplayNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isDisplayNotifier,
        builder: (context, isDisplay, _) {
          return !isDisplay
              ? const SizedBox()
              : Padding(
                  padding: widget.isForward
                      ? context.paddingRight16x
                      : context.paddingLeft16x,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white24,
                    child: Center(
                      child: CircleAvatar(
                        radius: 37.5,
                        backgroundColor: Colors.grey[400]!.withOpacity(0.5),
                        child: Text(
                          (widget.isForward ? '+' : '-') + '${widget.seconds}s',
                          style: context.textTheme.headline5!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
