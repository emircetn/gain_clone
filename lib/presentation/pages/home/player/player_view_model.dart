import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:video_player/video_player.dart';

class PlayerViewModel extends ChangeNotifier {
  VideoPlayerController? videoPlayerController1;
  VideoPlayerController? videoPlayerController2;

  late PageController pageController;

  late int _currentPartIndex;

  bool isPlaying = false;
  bool isLoadingInitialize = true;
  bool isContentDetailsAndButtonsFieldShow = false;

  final PlayerPageArguments args;

  Map<int, Duration?> tempPartAndLastDuration = {};

  ContentPart get currentContentPart =>
      args.content.partList![_currentPartIndex];

  VideoPlayerController? get videoPlayerController => isEven(_currentPartIndex)
      ? videoPlayerController1
      : videoPlayerController2;

  PlayerViewModel(this.args) {
    _currentPartIndex = args.selectedContentIndex;
    pageController = PageController(initialPage: _currentPartIndex);
    initAndListenTheVideo(_currentPartIndex);
  }

  bool isEven(int index) => index % 2 == 0;

  void initAndListenTheVideo(int index) async {
    isLoadingInitialize = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));

    if (isEven(index)) {
      videoPlayerController2?.pause();
      videoPlayerController1 = VideoPlayerController.network(
        args.content.partList![index].videoUrl,
        videoPlayerOptions: VideoPlayerOptions(),
      )..initialize().then(
          (value) async {
            try {
              if (tempPartAndLastDuration[_currentPartIndex] != null) {
                await videoPlayerController1!
                    .seekTo(tempPartAndLastDuration[_currentPartIndex]!);
              }
              await videoPlayerController1!.play();

              isPlaying = true;
              isLoadingInitialize = false;
              notifyListeners();
              videoPlayerController1!.addListener(() {
                final vdeoPlayerValue = videoPlayerController1!.value;
                if (vdeoPlayerValue.isInitialized &&
                    vdeoPlayerValue.position == vdeoPlayerValue.duration) {
                  isPlaying = false;
                  notifyListeners();
                }
              });
            } catch (e) {
              debugPrint(e.toString());
            }
          },
        );
    } else {
      videoPlayerController1?.pause();
      videoPlayerController2 = VideoPlayerController.network(
        args.content.partList![index].videoUrl,
        videoPlayerOptions: VideoPlayerOptions(),
      )..initialize().then(
          (value) async {
            try {
              if (tempPartAndLastDuration[_currentPartIndex] != null) {
                await videoPlayerController2!
                    .seekTo(tempPartAndLastDuration[_currentPartIndex]!);
              }
              await videoPlayerController2!.play();

              isPlaying = true;
              isLoadingInitialize = false;
              notifyListeners();
              videoPlayerController2!.addListener(() {
                final vdeoPlayerValue = videoPlayerController2!.value;
                if (vdeoPlayerValue.isInitialized &&
                    vdeoPlayerValue.position == vdeoPlayerValue.duration) {
                  isPlaying = false;
                  notifyListeners();
                }
              });
            } catch (e) {
              debugPrint(e.toString());
            }
          },
        );
    }
  }

  @override
  void dispose() {
    videoPlayerController1?.dispose();
    videoPlayerController2?.dispose();
    pageController.dispose();
    super.dispose();
  }

  void openOrCloseMediaDetailsField() {
    isContentDetailsAndButtonsFieldShow = !isContentDetailsAndButtonsFieldShow;
    notifyListeners();
  }

  Future playOrPauseVideo() async {
    if (videoPlayerController!.value.isInitialized == true) {
      if (videoPlayerController!.value.isPlaying == true) {
        await videoPlayerController!.pause();
        isPlaying = false;
        notifyListeners();
      } else {
        await videoPlayerController!.play();
        isPlaying = true;
        notifyListeners();
      }
    }
  }

  void sliderOnChanged(double newValue) {
    videoPlayerController!.seekTo(Duration(milliseconds: newValue.toInt()));
  }

  void onPageChanged(int value) {
    tempPartAndLastDuration[_currentPartIndex] =
        videoPlayerController?.value.position;
    _currentPartIndex = value;
    initAndListenTheVideo(value);
  }
}
