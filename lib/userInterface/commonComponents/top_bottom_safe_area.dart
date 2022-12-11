import 'package:flutter/material.dart';

import '../../designExtentions/colors.dart';

class TopBottomPaddings extends StatelessWidget {
  final BuildContext context;
  final bool isUpper;
  final bool? showBorder;

  const TopBottomPaddings(
      {Key? key, required this.context, required this.isUpper, this.showBorder})
      : super(key: key);

  ///top safe area
  Widget upperSafeArea() {
    return Positioned(
      top: 0,
      child: Container(
        height: MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: showBorder ?? false
                ? const Border(
                    bottom: BorderSide(color: AppColors.whiteColor, width: 0.8))
                : Border.all(color: Colors.transparent, width: 0)),
      ),
    );
  }

  ///bottom safe area
  Widget bottomSafeArea() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).padding.bottom,
        width: MediaQuery.of(context).size.width,
        color: AppColors.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isUpper ? upperSafeArea() : bottomSafeArea();
  }
}
