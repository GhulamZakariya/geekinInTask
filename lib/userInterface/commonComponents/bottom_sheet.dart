import 'package:flutter/material.dart';

class BottomSheetWidget {
  BottomSheetWidget();

  static Future showBottomSheet(context, String type, Widget content) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      builder: (context) {
        return ClipRect(
          clipBehavior: Clip.antiAlias,
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: content),
        );
      },
    );
  }
}
