import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class PlayerSlider extends StatelessWidget {
  final Duration currentDuration;
  final Duration totalDuration;
  final void Function(double)? onChanged;

  const PlayerSlider({
    Key? key,
    required this.currentDuration,
    required this.totalDuration,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String durationToHHmmSS(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      final twoDigitHours = twoDigits(duration.inHours);
      return "${twoDigitHours == "00" ? "" : "$twoDigitHours:"}$twoDigitMinutes:$twoDigitSeconds";
    }

    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            durationToHHmmSS(currentDuration),
            style: context.textTheme.caption,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Center(
            child: SliderTheme(
              data: SliderThemeData(
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 5,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                thumbColor: Colors.red,
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.white38,
                showValueIndicator: ShowValueIndicator.never,
                trackShape: const RectangularSliderTrackShape(),
              ),
              child: Slider(
                value: currentDuration.inMilliseconds.toDouble(),
                max: totalDuration.inMilliseconds.toDouble(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(
            durationToHHmmSS(totalDuration),
            style: context.textTheme.caption,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
