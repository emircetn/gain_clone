import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:video_player/video_player.dart';

class PlayerViewModel extends ChangeNotifier {
  VideoPlayerController? videoPlayerController1;
  VideoPlayerController? videoPlayerController2;

  late PageController pageController;
  late int _currentPartIndex;

  bool isPlaying = false;
  bool isInitializeWaiting = true;
  bool isContentDetailsAndButtonsFieldShow = false;

  final PlayerPageArguments args;

  Map<int, Duration?> tempPartAndLastDuration = {}; //TODO:dbye eklenebilir

  ContentPart get currentContentPart =>
      args.content.partList![_currentPartIndex]; //o anki seçili bölümü getirir

  VideoPlayerController? get videoPlayerController => isEven(_currentPartIndex)
      ? videoPlayerController1
      : videoPlayerController2;

  bool isEven(int index) => index % 2 == 0;

  PlayerViewModel(this.args) {
    setAllOrientation();
    _currentPartIndex = args.selectedContentIndex;
    pageController = PageController(initialPage: _currentPartIndex);
    initAndListenTheVideo(_currentPartIndex);
  }

  void initAndListenTheVideo(int index) async {
    isInitializeWaiting = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));

    if (isEven(index)) {
      //index çift ise video videoPlayerController1'e tek ise videoPlayerController2'ye atanır
      videoPlayerController2?.pause();
      videoPlayerController1 = VideoPlayerController.network(
        args.content.partList![index].videoUrl,
      )..initialize().then(
          (_) async {
            if (tempPartAndLastDuration[_currentPartIndex] != null) {
              // video daha önce oynatıldıysa tekrar oynatılacakken en sonra kaldığı yerden oynaması için gerekli ayarlamalar

              await videoPlayerController1!
                  .seekTo(tempPartAndLastDuration[_currentPartIndex]!);
            }
            await videoPlayerController1!.play();

            isPlaying = true;
            isInitializeWaiting = false;
            notifyListeners();
            videoPlayerController1!.addListener(() {
              // video bittiğinde isPlaying'e false atanıp ekran güncelleniyor
              final vdeoPlayerValue = videoPlayerController1!.value;
              if (vdeoPlayerValue.isInitialized &&
                  vdeoPlayerValue.position == vdeoPlayerValue.duration) {
                isPlaying = false;
                notifyListeners();
              }
            });
          },
        );
    } else {
      videoPlayerController1?.pause();
      videoPlayerController2 = VideoPlayerController.network(
        args.content.partList![index].videoUrl,
      )..initialize().then(
          (_) async {
            if (tempPartAndLastDuration[_currentPartIndex] != null) {
              await videoPlayerController2!
                  .seekTo(tempPartAndLastDuration[_currentPartIndex]!);
            }
            await videoPlayerController2!.play();

            isPlaying = true;
            isInitializeWaiting = false;
            notifyListeners();
            videoPlayerController2!.addListener(() {
              final vdeoPlayerValue = videoPlayerController2!.value;
              if (vdeoPlayerValue.isInitialized &&
                  vdeoPlayerValue.position == vdeoPlayerValue.duration) {
                isPlaying = false;
                notifyListeners();
              }
            });
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
      //videoPlayerController getter ilgili videoPlayerController'ı çağırır ve işlem o controller ile yapılır
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

  void setAllOrientation() {
    //TODO:Daha düzgün çalışacak şekilde güncellenebilir
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

  Future<void> setDefaultOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
