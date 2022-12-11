import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final double height;
  final double width;
  final Text text;
  final double? elevation;
  const ActionButtons(
      {Key? key,
      required this.backgroundColor,
      required this.radius,
      required this.height,
      required this.width, required this.text, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    // double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height,
        width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
            borderRadius: BorderRadius.circular(radius)
      ),
      child: Center(
          child: text),
    );
  }
}
