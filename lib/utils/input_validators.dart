/// ~|||||||||validations||||||||||||~ \\\\

///email validator
String? emailValidator(String? value) {
  if (value!.trim().isNotEmpty) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (emailValid) {
      return null;
    } else {
      return "Email is not valid";
    }
  } else {
    return "Email is required";
  }
}

///phone validator
String? phoneValidation(String? value) {
  if (value!.trim().isNotEmpty) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Phone is not valid';
    } else {
      return null;
    }
  } else {
    return "Phone is required";
  }
}

///other fields validator
String? fieldsValidator(String? value) {
  if (value!.trim().isNotEmpty) {
    return null;
  } else {
    return "Field is required";
  }
}

///other fields validator
String? passValidator(String? value) {
  if (value!.trim().isNotEmpty && value.trim().length >= 6) {
    return null;
  } else if (value.trim().isEmpty) {
    return "Field is required";
  } else if (value.trim().length < 6) {
    return "Password must be of characters 6";
  } else {
    return "Field is required";
  }
}

///other fields validator
String? priceValidator(String? value) {
  if (value!.trim().isNotEmpty) {
    if ((double.parse(value.toString()) > 0.0)) {
      return null;
    } else {
      return "Price is invalid";
    }
  } else {
    return "Field is required";
  }
}
