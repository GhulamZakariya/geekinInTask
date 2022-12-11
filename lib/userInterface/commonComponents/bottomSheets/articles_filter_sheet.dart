import 'package:flutter/material.dart';
import 'package:nex_gen_task/providers/search_provider.dart';
import 'package:provider/provider.dart';
import '../../../designExtentions/colors.dart';
import '../../../designExtentions/text_styles/text_styles.dart';
import '../../commonComponents/fill_button.dart';
import '../text_field.dart';
import '../text_field_label.dart';

class ArticlesFilterBottomSheet extends StatefulWidget {
  const ArticlesFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<ArticlesFilterBottomSheet> createState() =>
      _ArticlesFilterBottomSheetState();
}

class _ArticlesFilterBottomSheetState extends State<ArticlesFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    Widget newsDeskField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: false,
                text: "News Desk",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: searchProvider.newsDesk,
            hintText: "News Desk",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          )
        ],
      );
    }

    Widget firstSourceField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: false,
                text: "First Source",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: searchProvider.firstSource,
            hintText: "First Source",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          )
        ],
      );
    }

    Widget secondSourceField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: false,
                text: "Second Source",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: searchProvider.secondSource,
            hintText: "Second Source",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          )
        ],
      );
    }

    Widget firstOrganizationField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: false,
                text: "First Organization Name",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: searchProvider.firstOrganization,
            hintText: "First Organization Name",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          )
        ],
      );
    }

    Widget secondOrganizationField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: false,
                text: "Second Organization Name",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: searchProvider.secondOrganization,
            hintText: "Second Organization Name",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: (String? value) {
              return null;
            },
          )
        ],
      );
    }

    return Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
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
                "Article Filers",
                style: TextStyles.outlineButtonText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              newsDeskField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              firstSourceField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              secondSourceField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              firstOrganizationField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              secondOrganizationField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      searchProvider.getArticles(showLoading: true);
                      Navigator.of(context).pop();
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
                height: MediaQuery.of(context).size.height * .04 +
                    MediaQuery.of(context).padding.bottom +
                    MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
