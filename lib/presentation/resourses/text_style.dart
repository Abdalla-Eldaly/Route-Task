import 'package:flutter/material.dart';
import 'package:route_task/presentation/resourses/style_manger.dart';
import 'color_manager.dart';
import 'font_manger.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base States
  static TextStyle baseStatesMessageTextStyle(BuildContext? context) => getBoldStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f20,
  );

  // Headline1
  static TextStyle headline1(BuildContext? context) => getBoldStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f24,
  );

  // Headline2
  static TextStyle headline2(BuildContext? context) => getSemiBoldStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f22,
  );

  // Headline3
  static TextStyle headline3(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f20,
  );

  // Subhead1
  static TextStyle subhead1(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f18,
  );

  // Subhead2
  static TextStyle subhead2(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f16,
  );

  static TextStyle subhead(BuildContext? context) => getMediumStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f16,
  );
  // BodyText1
  static TextStyle bodyText1(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f14,
  );

  // BodyText2
  static TextStyle bodyText2(BuildContext? context) => getLightStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f12,
  );

  // Caption
  static TextStyle caption(BuildContext? context) => getLightStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f10,
  );

  // Button
  static TextStyle button(BuildContext? context) => getBoldStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f16,
  );

  // Overline
  static TextStyle overLine(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary,
    fontSize: FontSize.f10,
  );

  // hintTextStyle
  static TextStyle hintTextStyle(BuildContext? context) => getRegularStyle(
    fontFamily: FontConstants.english,
    color: ColorManager.primary.withOpacity(.5),
    fontSize: FontSize.f17,
  );


  static TextStyle smallText(BuildContext? context) => getSemiBoldStyle(
    fontFamily: FontConstants.arabic,
    color: ColorManager.primary,
    fontSize: FontSize.f14,

  );

}
