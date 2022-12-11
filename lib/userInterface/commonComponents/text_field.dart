// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../designExtentions/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final bool? isSecured;
  TextEditingController textEditingController;
  String? hintText;
  int maxLines;
  int minLines;
  TextInputType textType;
  Function()? onTap;
  Function(String)? onChanged;
  List<TextInputFormatter>? textInputFormatter;
  bool? isDense;
  Color? fillColor;
  double? verticalPadding;
  bool? isEnabled;
  double? borderRadius;
  Color? borderColor;
  String? Function(String? value)? validator;
  Widget? suffixIcon;

  TextFieldWidget({
    Key? key,
    required this.textEditingController,
    this.hintText,
    this.isSecured,
    this.suffixIcon,
    this.textInputFormatter,
    required this.maxLines,
    required this.minLines,
    required this.textType,
    this.borderColor,
    this.verticalPadding,
    this.borderRadius,
    this.isEnabled,
    this.validator,
    this.isDense,
    this.fillColor,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isSecured ?? false,
      keyboardType: textType,
      maxLines: maxLines,
      minLines: minLines,
      enabled: isEnabled,
      onTap: onTap,
      inputFormatters: textInputFormatter,
      onChanged: onChanged,
      cursorColor: AppColors.textColor,
      decoration: InputDecoration(
          hintText: hintText,
          isDense: isDense ?? true,
          hintStyle: const TextStyle(
            color: AppColors.hintColor,
            fontWeight: FontWeight.normal,
            fontFamily: "RBTRegular",
            fontSize: 14,
          ),
          filled: true,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 14, horizontal: 20),
          fillColor: fillColor ?? AppColors.whiteColor,
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.fieldBorder),
              borderRadius: BorderRadius.circular(
                borderRadius ?? 5,
              )),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.fieldBorder),
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.hintColor),
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppColors.requiredIndicator),
              borderRadius: BorderRadius.circular(borderRadius ?? 5))),
      validator: validator,
    );
  }
}
