import 'package:flutter/material.dart';
import '../colors.dart';

class TextStyles {
  TextStyles._();
  static const TextStyle requiredIndicator = TextStyle(
      overflow: TextOverflow.visible,
      fontFamily: "RBTRegular",
      fontSize: 14,
      color: AppColors.requiredIndicator);
  static const TextStyle fieldLabel = TextStyle(
      fontFamily: "RBTRegular", color: AppColors.textColor, fontSize: 14);
  static const TextStyle appBarTitle = TextStyle(
      fontSize: 22, fontFamily: "FFRegular", color: AppColors.whiteColor);
  static const TextStyle buttonText = TextStyle(
      fontSize: 16, fontFamily: "FFBold", color: AppColors.whiteColor);
  static const TextStyle defaultButtonText = TextStyle(
      fontSize: 14, fontFamily: "FFBold", color: AppColors.whiteColor);
  static const TextStyle outlineButtonText = TextStyle(
      fontSize: 16, fontFamily: "FFBold", color: AppColors.primaryColor);
  static const TextStyle featurePackButton = TextStyle(
      fontSize: 10, fontFamily: "FFBold", color: AppColors.whiteColor);

}