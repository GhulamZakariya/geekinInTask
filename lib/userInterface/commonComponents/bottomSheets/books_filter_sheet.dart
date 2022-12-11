import 'package:flutter/material.dart';
import '../../../designExtentions/colors.dart';
import '../../../designExtentions/text_styles/text_styles.dart';
import '../../commonComponents/fill_button.dart';

class BooksFilterBottomSheet extends StatefulWidget {
  const BooksFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<BooksFilterBottomSheet> createState() => _BooksFilterBottomSheetState();
}

class _BooksFilterBottomSheetState extends State<BooksFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width * .25,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const Text(
              "Book Filers",
              style: TextStyles.fieldLabel,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    ///TODO of books filter
                  },
                  child: const ActionButtons(
                    backgroundColor: AppColors.primaryColor,
                    radius: 100,
                    height: 50,
                    width: double.infinity,
                    text: Text(
                      "Apply",
                      style: TextStyles.buttonText,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
          ],
        ),
      ),
    );
  }
}
