import 'package:flutter/material.dart';
import 'package:nex_gen_task/userInterface/auth/login_screen.dart';
import 'package:nex_gen_task/userInterface/auth/register.dart';
import 'package:nex_gen_task/userInterface/commonComponents/leading_title_app_bar.dart';
import '../../designExtentions/colors.dart';
import '../../designExtentions/text_styles/text_styles.dart';
import 'commonComponents/fill_button.dart';
import 'commonComponents/top_bottom_safe_area.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget viewTripListButton() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>  Register()));
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

    Widget gotoLoginButton() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: ActionButtons(
            backgroundColor: AppColors.primaryColor,
            radius: 30,
            height: 50,
            width: MediaQuery.of(context).size.width * .8,
            text: const Text(
              "Login",
              style: TextStyles.buttonText,
            )),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          Scaffold(
            appBar: const LeadingTitleAppBar(
                title: "Selection Screen", showLeading: false),
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        viewTripListButton(),
                        const SizedBox(
                          height: 20,
                        ),
                        gotoLoginButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          TopBottomPaddings(context: context, isUpper: true),
          TopBottomPaddings(context: context, isUpper: false)
        ],
      ),
    );
  }
}
