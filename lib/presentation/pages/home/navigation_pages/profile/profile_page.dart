import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/data/models/arguments/user_information_update_page_arguments.dart';
import 'package:gain_clone/data/models/arguments/web_view_page_arguments.dart';
import 'package:gain_clone/data/models/user.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:gain_clone/presentation/components/divider/app_divider.dart';
import 'package:gain_clone/presentation/components/list_tile/app_list_tile.dart';
import 'package:gain_clone/products/widgets/user_avatar.dart';
import 'package:gain_clone/presentation/components/user/user_info_tile.dart';
import 'package:gain_clone/presentation/pages/home/user_information_update.dart';
import 'package:gain_clone/presentation/pages/home/webview_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  void updateUserNameAndSurname() {
    NavigationService.pushNamed(
      UserInformationUpdatePage.path,
      arguments: UserInformationUpdatePageArguments(
        text: 'Ad soyad güncelle',
        buttonCallBack: () async {
          await Future.delayed(const Duration(seconds: 1));
          return true;
        },
      ),
    );
  }

  void updateBirtday() {
    NavigationService.pushNamed(
      UserInformationUpdatePage.path,
      arguments: UserInformationUpdatePageArguments(
        text: 'Doğum tarihini güncelle',
        buttonCallBack: () async {
          await Future.delayed(const Duration(seconds: 1));
          return true;
        },
      ),
    );
  }

  void kvkkAndPrivacyTapped() {
    NavigationService.pushNamed(
      WebViewPage.path,
      arguments: const WebViewPageArguments(
        header: 'KVKK ve Gizlilik Sözleşmesi',
        url: 'https://www.gain.tv/gizlilik-politikasi',
      ),
    );
  }

  void faqTapped() {
    NavigationService.pushNamed(
      WebViewPage.path,
      arguments: const WebViewPageArguments(
        header: 'Sıkça Sorulan Sorular',
        url: 'https://www.gain.tv/sikca-sorulan-sorular',
      ),
    );
  }

  void supportTapped() {
    NavigationService.pushNamed(
      WebViewPage.path,
      arguments: const WebViewPageArguments(
        header: 'Destek',
        url: 'https://www.gain.tv/nasil-izlerim',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: context.paddingHorizontal16x,
          children: [
            SizedBox(height: 36.sp),
            const UserAvatar(),
            SizedBox(height: 18.sp),
            _profileInfoField(context),
            listsField(context),
            AppDivider(),
            _passwordField(context),
            AppDivider(),
            SizedBox(height: 16.sp),
            ..._notificationSettingsField(context),
            SizedBox(height: 24.sp),
            ..._generalSettingsField(context),
            SizedBox(height: 96.h)
          ],
        ),
      ),
    );
  }

  Consumer _profileInfoField(BuildContext context) {
    return Consumer<UserManager>(
      builder: (context, userManager, _) => Column(
        children: [
          Text(
            'Profil',
            style: context.textTheme.bodyText1,
          ),
          SizedBox(height: 4.sp),
          UserInfoTile(
            context: context,
            header: 'Ad Soyad',
            text: userManager.user!.nameAndSurname,
            onTap: updateUserNameAndSurname,
          ),
          UserInfoTile(
            context: context,
            header: 'Email',
            text: userManager.user!.email,
          ),
          UserInfoTile(
            context: context,
            header: 'Doğum Tarihi',
            text: userManager.user!.showBrithday,
            onTap: updateBirtday,
          ),
        ],
      ),
    );
  }

  AppListTile listsField(BuildContext context) {
    return AppListTile(
      onTap: () {}, //TODO: listelerim sayfası açılakacak
      leading: Text(
        'Listelerim',
        style: context.textTheme.caption!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
      ),
    );
  }

  AppListTile _passwordField(BuildContext context) {
    return AppListTile(
      dense: false,
      onTap: () {}, //TODO: şifre güncelleme sayfası açılacak
      leading: Text('Şifre', style: context.textTheme.headline6!),
      trailing: Text(
        'Düzenle',
        style: context.textTheme.caption,
      ),
    );
  }

  List<Widget> _notificationSettingsField(BuildContext context) {
    return [
      Text(
        'Bildirim Ayarları',
        style: context.textTheme.bodyText1,
      ),
      SizedBox(height: 12.sp),
      AppListTile(
        leading: Text(
          'Elektronik ileti izinleri',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Switch(
          value: true,
          onChanged: (value) {}, //TODO:swich ayarlanacak
        ),
      ),
    ];
  }

  List<Widget> _generalSettingsField(BuildContext context) {
    return [
      Text(
        'Genel Ayarlar ve destek',
        style: context.textTheme.bodyText1,
      ),
      SizedBox(height: 12.sp),
      AppListTile(
        leading: Text(
          'Veri Tasarrufu Modu',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Switch(
          value: true,
          onChanged: (value) {}, //TODO:swich ayarlanacak
        ),
      ),
      AppDivider(),
      AppListTile(
        onTap: kvkkAndPrivacyTapped,
        leading: Text(
          'KVKK ve Gizlilik Sözleşmesi',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
      AppDivider(),
      AppListTile(
        onTap: supportTapped,
        leading: Text(
          'Destek',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
      AppDivider(),
      AppListTile(
        onTap: faqTapped,
        leading: Text(
          'Sıkça Sorulan Sorular',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
      AppDivider(),
      AppListTile(
        onTap: () {}, //TODO: Çıkış yapacak
        leading: Text(
          'Çıkış Yap',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ),
      AppDivider(),
      AppListTile(
        onTap: () {}, //TODO: Hesabını silecek
        leading: Text(
          'Hesabını Sil',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ),
      SizedBox(height: 8.sp),
      AppListTile(
        onTap: () {}, //TODO: Üyelik  İptali Hakkında sayfasını açacak
        leading: Text(
          'Üyelik İptali Hakkında',
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ),
      SizedBox(height: 16.sp),
      Text(
        'v3.0.0(149)', //TODO:gerçek sürüm çekilecek
        style: context.textTheme.caption!.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.white38,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }
}
/*   final String _profileText = 'Profil';
  final String _nameAndSurnameText = 'Ad Soyad';
  final String _emailText = 'Email';
  final String _birtdayText = 'Doğum Tarihi';
  final String _myListsText = 'Listelerim';
  final String _passwordText = 'Şifre';
  final String _editText = 'Düzenle';
  final String _notificationSettingsText = 'Bildirim Ayarları';
  final String _eMessagePermisionText = 'Elektronik ileti izinleri';
  final String _generalSettingsAndSupportText = 'Genel Ayarlar ve destek';
  final String _dataSavingModeText = 'Veri Tasarrufu Modu';
  final String _kvkkAndPrivacyText = 'KVKK ve Gizlilik Sözleşmesi';
  final String _supportText = 'Destek';
  final String _faqText = 'Sıkça Sorulan Sorular';
 *///TODO:silinecek