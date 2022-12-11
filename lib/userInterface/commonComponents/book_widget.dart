import 'package:flutter/material.dart';
import 'package:nex_gen_task/designExtentions/colors.dart';
import 'package:nex_gen_task/userInterface/commonComponents/image_widget.dart';
import '../../designExtentions/text_styles/text_styles.dart';
import '../../models/md_book.dart';

class BookWidget extends StatelessWidget {
  final ListElement? book;

  const BookWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.hintColor, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///trip image
            ImageWidget(
                url: book?.listImage ?? "",
                height: MediaQuery.of(context).size.height * .18,
                width: MediaQuery.of(context).size.width * .4,
                fit: BoxFit.cover,
                isAsset: false),

            ///trip name
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book?.listName ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book?.displayName ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book?.books?[0].description ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
