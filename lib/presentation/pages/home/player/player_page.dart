import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gain_clone/constants/app_constants.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/buttons/player_icon_button.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:gain_clone/presentation/components/sliders/player_slider.dart';
import 'package:gain_clone/presentation/pages/home/player/player_view_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatelessWidget {
  static const String path = '/player';
  final PlayerPageArguments args;
  const PlayerPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  void closeTapped(BuildContext context) async {
    await context.read<PlayerViewModel>().setDefaultOrientation();

    NavigationService.pop();
  }

  bool isEven(int index) => index % 2 == 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerViewModel>(
      create: (context) => PlayerViewModel(args),
      child: Builder(
        builder: (context) {
          final playerViewModel = context.read<PlayerViewModel>();
          return WillPopScope(
            onWillPop: () async {
              await context.read<PlayerViewModel>().setDefaultOrientation();
              return true;
            },
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: GestureDetector(
                onTap: playerViewModel.openOrCloseMediaDetailsField,
                child: Scaffold(
                  body: PageView.builder(
                    controller: playerViewModel.pageController,
                    onPageChanged: (value) =>
                        playerViewModel.onPageChanged(value),
                    itemCount: args.content.partList!.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        _videoField(context, index), //video alanı
                        _contentDetailsAndButtonsField(context,
                            index), //video detaylar, slider, butonları iceren alan
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _videoField(BuildContext context, int contentPartIndex) {
    final playerViewModel = Provider.of<PlayerViewModel>(context, listen: true);
    VideoPlayerController? videoPlayerController = isEven(
            contentPartIndex) //secili bölümün indexi çift ise videoPlayerController1 değil ise videoPlayerController2 oynatıyor
        ? playerViewModel.videoPlayerController1
        : playerViewModel.videoPlayerController2;
    return SafeArea(
      child: Center(
        child: AspectRatio(
          aspectRatio:
              args.content.partList![contentPartIndex].videoAspectRatio,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: videoPlayerController == null ||
                    playerViewModel
                        .isInitializeWaiting //videoPlayerController null ise veya initialize işlemi bitmediyse video kapğı gösterilir
                ? CachedNetworkImage(
                    imageUrl: args.content.partList![contentPartIndex].coverUrl,
                    fit: BoxFit.cover,
                  )
                : VideoPlayer(
                    videoPlayerController,
                  ),
          ),
        ),
      ),
    );
  }

  AnimatedSwitcher _contentDetailsAndButtonsField(
    BuildContext context,
    int contentPartIndex,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child:
          context.watch<PlayerViewModel>().isContentDetailsAndButtonsFieldShow
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                    gradient: AppConstants.instance
                        .gradiendtForPlayerPage, // detaylar kısmı görünür olduğunda flu bir efekt veriliyor
                  ),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Padding(
                          padding: context.paddingHorizontal16x,
                          child: Column(
                            children: [
                              _appBar(context),
                              const Spacer(),
                              Padding(
                                padding: context.paddingHorizontal12x,
                                child: Column(
                                  children: [
                                    _contentDetailsField(
                                      context,
                                      contentPartIndex,
                                    ),
                                    SizedBox(height: 8.sp),
                                    _slider(contentPartIndex),
                                    SizedBox(height: 8.sp),
                                    _bottomIcons(context),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.sp),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: _playOrPauseButtonField(),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayerIconButton(
          onPressed: null, //TODO:eklenebilir
          iconData: Icons.branding_watermark_outlined,
        ),
        PlayerIconButton(
          onPressed: () => closeTapped(context),
          iconData: Icons.close,
        ),
      ],
    );
  }

  Consumer<PlayerViewModel> _playOrPauseButtonField() {
    return Consumer<PlayerViewModel>(
      //PlayerViewModel dinleniyor
      builder: (context, playerViewModel, _) {
        return playerViewModel
                .isInitializeWaiting //initailize edilmediyse gösterme
            ? const SizedBox()
            : GestureDetector(
                onTap: playerViewModel.playOrPauseVideo,
                child: Icon(
                  playerViewModel.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 96.sp,
                ),
              );
      },
    );
  }

  Widget _contentDetailsField(BuildContext context, int index) {
    final contentPart = args.content.partList![index];
    return Align(
      alignment: context.isPortait ? Alignment.center : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: context.isPortait
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            '${args.content.name} - ${contentPart.showID}', //TODO:TAM DOĞRU DEĞİL
            style: context.textTheme.headline5!.copyWith(
              color: Colors.white,
            ),
            maxLines: 2,
          ),
          SizedBox(height: 2.sp),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${args.content.showContentType}  •  ${contentPart.showID}',
                style: context.textTheme.subtitle2!.copyWith(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          if (context.isPortait) ...[
            SizedBox(height: 12.sp),
            Text(
              contentPart.explanation,
              maxLines: 2,
              style: context.textTheme.subtitle2!.copyWith(
                color: Colors.white.withOpacity(0.75),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.sp),
          ]
        ],
      ),
    );
  }

  SizedBox _slider(int contentPartIndex) {
    return SizedBox(
      height: 30,
      child: Consumer<PlayerViewModel>(
        builder: (context, playerViewModel, _) {
          VideoPlayerController?
              videoPlayerController = //hangi videoPlayerController olduğu belirleniyor
              isEven(contentPartIndex)
                  ? playerViewModel.videoPlayerController1
                  : playerViewModel.videoPlayerController2;
          return videoPlayerController ==
                  null //henüz videoPlayerController null ise slider yerine loading bar gösteriliyor
              ? const Center(child: AppLinearProgressIndicator())
              : ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: videoPlayerController,
                  builder: (context, videoPlayerValue, _) {
                    return playerViewModel
                            .isInitializeWaiting //henüz videoPlayerController inialize edilmediyse slider yerine loading bar gösteriliyor
                        ? const Center(child: AppLinearProgressIndicator())
                        : PlayerSlider(
                            currentDuration: videoPlayerValue.position,
                            totalDuration: videoPlayerValue.duration,
                            onChanged: (newValue) =>
                                playerViewModel.sliderOnChanged(newValue),
                          );
                  },
                );
        },
      ),
    );
  }

  Padding _bottomIcons(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal12x,
      child: Row(
        children: [
          Expanded(
            child: PlayerIconButton(
              onPressed: () {},
              iconData: Icons.add,
            ),
          ),
          Expanded(
            child: PlayerIconButton(
              onPressed: null,
              iconData: PhosphorIcons.closed_captioning,
            ),
          ),
          Expanded(
            child: PlayerIconButton(
              onPressed: () {},
              iconData: Icons.reply_sharp,
            ),
          ),
          Expanded(
            child: PlayerIconButton(
              onPressed: () {},
              iconData: PhosphorIcons.thumbs_up,
            ),
          ),
          Expanded(
            child: PlayerIconButton(
              onPressed: null,
              iconData: PhosphorIcons.screencast,
            ),
          )
        ],
      ),
    );
  }
}
