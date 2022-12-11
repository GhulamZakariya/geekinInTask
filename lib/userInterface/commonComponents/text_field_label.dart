import 'package:flutter/material.dart';
import 'package:nex_gen_task/designExtentions/text_styles/text_styles.dart';

class TextFieldLabel extends StatelessWidget {
  final bool isRequired;
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  const TextFieldLabel(
      {Key? key,
      required this.isRequired,
      required this.text,
      this.color,
      this.maxLines,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyles.fieldLabel,
        ),
        isRequired
            ? const Text(" *",
                maxLines: 1, style: TextStyles.requiredIndicator)
            : const Text("")
      ],
    );
  }
}
