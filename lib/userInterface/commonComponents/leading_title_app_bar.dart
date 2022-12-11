import 'package:flutter/material.dart';
import '../../designExtentions/colors.dart';
import '../../designExtentions/text_styles/text_styles.dart';

class LeadingTitleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showLeading;
  final double? height;
  final Widget? actionsList;
  final Widget? leadingIcon;
  final Function()? leadingOnTap;

  const LeadingTitleAppBar(
      {Key? key,
      required this.title,
      required this.showLeading,
      this.height,
      this.actionsList,
      this.leadingIcon,
      this.leadingOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
          leadingWidth: 50,
          backgroundColor: AppColors.primaryColor,
          titleSpacing: 0,
          centerTitle: false,
          leading: showLeading && leadingIcon == null
              ? Center(
                  child: GestureDetector(
                    onTap: leadingOnTap ??
                        () {
                          Navigator.of(context).pop();
                        },
                    child: SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.keyboard_backspace,
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: leadingIcon ?? const SizedBox()),
          title: Text(
            title,
            style: TextStyles.appBarTitle,
          ),
          actions: [actionsList ?? const SizedBox()]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55);
}
