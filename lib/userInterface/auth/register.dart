import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nex_gen_task/providers/auth_provider.dart';
import 'package:nex_gen_task/remoteServices/local_storage.dart';
import 'package:nex_gen_task/userInterface/auth/login_screen.dart';
import 'package:nex_gen_task/userInterface/commonComponents/leading_title_app_bar.dart';
import 'package:provider/provider.dart';
import '../../designExtentions/colors.dart';
import '../../designExtentions/text_styles/text_styles.dart';
import '../../utils/input_validators.dart';
import '../commonComponents/fill_button.dart';
import '../commonComponents/text_field.dart';
import '../commonComponents/text_field_label.dart';
import '../commonComponents/top_bottom_safe_area.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Widget fullName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: true,
                text: "Full Name",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: authProvider.nameController,
            hintText: "Full Name",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.name,
            validator: fieldsValidator,
          )
        ],
      );
    }

    Widget emailField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: true,
                text: "Email",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: authProvider.emailController,
            hintText: "Email",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.emailAddress,
            validator: emailValidator,
          )
        ],
      );
    }

    Widget phone() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: true,
                text: "Phone",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: authProvider.phoneController,
            hintText: "Phone",
            maxLines: 1,
            minLines: 1,
            borderRadius: 100,
            textType: TextInputType.phone,
            validator: phoneValidation,
          )
        ],
      );
    }

    Widget passwordField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TextFieldLabel(
                isRequired: true,
                text: "Password",
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          TextFieldWidget(
            textEditingController: authProvider.passController,
            hintText: "Password",
            maxLines: 1,
            minLines: 1,
            textType: TextInputType.visiblePassword,
            borderRadius: 100,
            isSecured: !authProvider.showPassword,
            validator: passValidator,
            suffixIcon: IconButton(
              onPressed: () {
                authProvider.changePassVisibility(!authProvider.showPassword);
              },
              splashColor: Colors.transparent,
              icon: Icon(
                size: 14,
                authProvider.showPassword
                    ? CupertinoIcons.eye_slash_fill
                    : Icons.remove_red_eye_sharp,
                color: AppColors.hintColor,
              ),
            ),
          )
        ],
      );
    }

    showToast(String msg, Color backgroundColor) {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: backgroundColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    Widget registerButton() {
      return GestureDetector(
        onTap: () async {
          if (_registerFormKey.currentState?.validate() ?? false) {
            Map userData = {
              "name": authProvider.nameController.text,
              "email": authProvider.emailController.text,
              "phone": authProvider.phoneController.text,
              "password": authProvider.passController.text,
            };
            bool? result = await LocalStorage.registerUser(userData);
            if (result) {
              showToast("Registered Successfully", Colors.green);
              authProvider.clearData();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            } else {
              showToast("An error occurred, please try again", Colors.red);
            }
          }

          ///TODO of login button
        },
        child: ActionButtons(
            backgroundColor: AppColors.primaryColor,
            radius: 30,
            height: 50,
            width: MediaQuery.of(context).size.width * .8,
            text: const Text(
              "Register",
              style: TextStyles.buttonText,
            )),
      );
    }

    return Stack(
      children: [
        Scaffold(
          appBar:
              const LeadingTitleAppBar(title: "Register", showLeading: true),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Form(
                key: _registerFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        fullName(),
                        const SizedBox(
                          height: 10,
                        ),
                        emailField(),
                        const SizedBox(
                          height: 10,
                        ),
                        phone(),
                        const SizedBox(
                          height: 10,
                        ),
                        passwordField(),
                        const SizedBox(
                          height: 10,
                        ),
                        registerButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        TopBottomPaddings(context: context, isUpper: true),
        TopBottomPaddings(context: context, isUpper: false)
      ],
    );
  }
}
