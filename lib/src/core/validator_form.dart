import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

mixin Validator {
  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.email_required.tr();
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return AppStrings.email_valid_message.tr();
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.password_required.tr();
    } else if (value.length < 6) {
      return AppStrings.password_valid_message.tr();
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirm_password_is_required.tr();
    } else if (value != password) {
      return AppStrings.confirm_password_does_not_match.tr();
    }
    return null;
  }

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.name_required.tr();
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.name_required.tr();
    }
    return null;
  }

  // Address validation
  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Form is required';
    }
    return null;
  }

  // City validation
  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    return null;
  }
}
