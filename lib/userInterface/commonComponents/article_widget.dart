import 'package:flutter/material.dart';
import 'package:nex_gen_task/designExtentions/colors.dart';
import 'package:nex_gen_task/userInterface/commonComponents/image_widget.dart';
import '../../designExtentions/text_styles/text_styles.dart';
import '../../models/md_article.dart';

class ArticleWidget extends StatelessWidget {
  final Doc? mdArticle;

  const ArticleWidget({Key? key,this.mdArticle})
      : super(key: key);

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
                url: "",
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .3,
                fit: BoxFit.cover,
                isAsset: false),

            ///trip name
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mdArticle?.subsectionName ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    mdArticle?.leadParagraph ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    mdArticle?.newsDesk ?? "",
                    style: TextStyles.fieldLabel,
                    maxLines: 2,
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
