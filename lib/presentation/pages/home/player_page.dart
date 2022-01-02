import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/data/models/content.dart';

class PlayerPage extends StatefulWidget {
  static const String path = '/player';
  final PlayerPageArguments args;
  const PlayerPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.circle),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  widget.args.contentPart.name ?? '',
                  maxLines: 2,
                ),
                Text(
                  widget.args.contentPart.explanation,
                  maxLines: 2,
                ),
                SizedBox(height: 8.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.subtitles),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.leak_remove_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share_location_outlined),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
