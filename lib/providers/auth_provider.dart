import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool showPassword = false;

  changePassVisibility(bool value) {
    showPassword = value;
    notifyListeners();
  }

  clearData() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passController.clear();
    notifyListeners();
  }
}
