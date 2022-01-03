import 'package:flutter/material.dart';
import 'package:gain_clone/constants/color_constants.dart';

class AppConstants {
  static AppConstants? _instace;
  static AppConstants get instance {
    _instace ??= AppConstants._init();
    return _instace!;
  }

  AppConstants._init();
  List<String> tabs = [
    //TODO:Dbden çekilebilir
    'Güncel',
    'Haber',
    'Dizi',
    'Film',
    'Program',
    'Belgesel',
    'Müzik',
    'Spor'
  ];

  final List<String> monthList = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık',
  ];

  LinearGradient contentCoverSmallGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      ColorConstants.primaryColor.withOpacity(0.27),
      ColorConstants.primaryColor.withOpacity(0.54),
      ColorConstants.primaryColor,
      ColorConstants.primaryColor,
    ],
  );

  LinearGradient contentCoverBigGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      ColorConstants.primaryColor.withOpacity(0.27),
      ColorConstants.primaryColor.withOpacity(0.54),
      ColorConstants.primaryColor,
      ColorConstants.primaryColor,
    ],
  );

  LinearGradient gradiendtForPlayerPage = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      ColorConstants.primaryColor.withOpacity(0.12),
      ColorConstants.primaryColor.withOpacity(0.37),
      ColorConstants.primaryColor.withOpacity(0.54),
      ColorConstants.primaryColor.withOpacity(0.74),
      ColorConstants.primaryColor.withOpacity(0.87),
      ColorConstants.primaryColor.withOpacity(0.87),
      ColorConstants.primaryColor.withOpacity(0.87),
    ],
  );
}
