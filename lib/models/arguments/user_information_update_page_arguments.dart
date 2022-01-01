typedef UserInformationUpdateCallBack = Future<bool> Function();

class UserInformationUpdatePageArguments {
  final String text;
  final UserInformationUpdateCallBack buttonCallBack;

  UserInformationUpdatePageArguments({
    required this.text,
    required this.buttonCallBack,
  });
}
