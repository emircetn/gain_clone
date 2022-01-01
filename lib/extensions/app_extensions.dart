import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppExt {}

extension BorderRadiusExtensionAll on BuildContext {
  BorderRadius get borderRadius1x =>
      BorderRadius.circular(ScreenUtil().setSp(1));
  BorderRadius get borderRadius2x =>
      BorderRadius.circular(ScreenUtil().setSp(2));
  BorderRadius get borderRadius4x =>
      BorderRadius.circular(ScreenUtil().setSp(4));
  BorderRadius get borderRadius8x =>
      BorderRadius.circular(ScreenUtil().setSp(8));
  BorderRadius get borderRadius12x =>
      BorderRadius.circular(ScreenUtil().setSp(12));
  BorderRadius get borderRadius16x =>
      BorderRadius.circular(ScreenUtil().setSp(16));
  BorderRadius get borderRadius32x =>
      BorderRadius.circular(ScreenUtil().setSp(32));
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get padding1x => EdgeInsets.all(ScreenUtil().setSp(1));
  EdgeInsets get padding2x => EdgeInsets.all(ScreenUtil().setSp(2));
  EdgeInsets get padding4x => EdgeInsets.all(ScreenUtil().setSp(4));
  EdgeInsets get padding8x => EdgeInsets.all(ScreenUtil().setSp(8));
  EdgeInsets get padding12x => EdgeInsets.all(ScreenUtil().setSp(12));
  EdgeInsets get padding16x => EdgeInsets.all(ScreenUtil().setSp(16));
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingLeft1x => EdgeInsets.only(left: ScreenUtil().setSp(1));
  EdgeInsets get paddingLeft2x => EdgeInsets.only(left: ScreenUtil().setSp(2));
  EdgeInsets get paddingLeft4x => EdgeInsets.only(left: ScreenUtil().setSp(4));
  EdgeInsets get paddingLeft8x => EdgeInsets.only(left: ScreenUtil().setSp(8));
  EdgeInsets get paddingLeft12x =>
      EdgeInsets.only(left: ScreenUtil().setSp(12));
  EdgeInsets get paddingLeft16x =>
      EdgeInsets.only(left: ScreenUtil().setSp(16));

  EdgeInsets get paddingRight1x =>
      EdgeInsets.only(right: ScreenUtil().setSp(1));
  EdgeInsets get paddingRight2x =>
      EdgeInsets.only(right: ScreenUtil().setSp(2));
  EdgeInsets get paddingRight4x =>
      EdgeInsets.only(right: ScreenUtil().setSp(4));
  EdgeInsets get paddingRight8x =>
      EdgeInsets.only(right: ScreenUtil().setSp(8));
  EdgeInsets get paddingRight12x =>
      EdgeInsets.only(right: ScreenUtil().setSp(12));
  EdgeInsets get paddingRight16x =>
      EdgeInsets.only(right: ScreenUtil().setSp(16));

  EdgeInsets get paddingBottom1x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(1));
  EdgeInsets get paddingBottom2x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(2));
  EdgeInsets get paddingBottom4x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(4));
  EdgeInsets get paddingBottom8x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(8));
  EdgeInsets get paddingBottom12x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(12));
  EdgeInsets get paddingBottom16x =>
      EdgeInsets.only(bottom: ScreenUtil().setSp(16));
}

extension PaddingExtensionHorizontal on BuildContext {
  EdgeInsets get paddingHorizontal1x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(1));
  EdgeInsets get paddingHorizontal2x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(2));
  EdgeInsets get paddingHorizontal4x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(4));
  EdgeInsets get paddingHorizontal8x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(8));
  EdgeInsets get paddingHorizontal12x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(12));
  EdgeInsets get paddingHorizontal16x =>
      EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(16));
}

extension PaddingExtensionVertical on BuildContext {
  EdgeInsets get paddingVertical1x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(1));
  EdgeInsets get paddingVertical2x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(2));
  EdgeInsets get paddingVertical4x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(4));
  EdgeInsets get paddingVertical8x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(8));
  EdgeInsets get paddingVertical12x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(12));
  EdgeInsets get paddingVertical16x =>
      EdgeInsets.symmetric(vertical: ScreenUtil().setSp(16));
}

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get sp => ScreenUtil().setSp(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
