import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ValidateTextFiled {
  ValidateTextFiled._();

  static String? validate(
    BuildContext ctx,
    String? value,
    ValidationTypes label,
  ) {
    switch (label.toString()) {
      case (ValidationTypes.signinEmail):
        {
          return _validateEmail(ctx, value!);
        }
      case (ValidationTypes.signinPassword):
        {
          return _validateSigninPassword(ctx, value!);
        }
      case (ValidationTypes.signupFirstName):
        {
          return _validateSignupFirstName(ctx, value!);
        }
      case (ValidationTypes.signupLastName):
        {
          return _validateSignupLastName(ctx, value!);
        }
      case (ValidationTypes.signupPhoneNumber):
        {
          return _validateSignupPhoneNumber(ctx, value!);
        }
      case (ValidationTypes.signupBirthDay):
        {
          return _validateSignupDayBirthday(ctx, value!);
        }
      case (ValidationTypes.signupBirthMonth):
        {
          return _validateSignupMonthBirthday(ctx, value!);
        }
      case (ValidationTypes.signupBirthYear):
        {
          return _validateSignupYearBirthday(ctx, value!);
        }
      default:
        return null;
    }
  }
}

String? _validateEmail(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.requiredFill;
  } else if (!_isValidEmail(value)) {
    return l10n.invalidEmail;
  } else {
    return "";
  }
}

String? _validateSigninPassword(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.requiredFill;
  } else if (value.length < 8) {
    return l10n.atLeast8Chars;
  } else {
    return "";
  }
}

String? _validateSignupFirstName(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.requiredFill;
  } else if (value.length < 2) {
    return l10n.atLeast3Chars;
  } else {
    return "";
  }
}

String? _validateSignupLastName(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.requiredFill;
  } else if (value.length < 2) {
    return l10n.atLeast3Chars;
  } else {
    return "";
  }
}

String? _validateSignupPhoneNumber(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.requiredFill;
  } else if (value.isEmpty || !_isValidPhoneNumber(value)) {
    return l10n.invalidPhoneNumber;
  } else {
    return "";
  }
}

String? _validateSignupDayBirthday(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.invalidBirthDay;
  } else if (_isValidNumber(value)) {
    int? day = int.tryParse(value) ?? 0;
    if (day > 31 || day < 1 || value.length != 2) {
      return l10n.invalidBirthDay;
    } else {
      return "";
    }
  } else {
    return l10n.invalidBirthDay;
  }
}

String? _validateSignupMonthBirthday(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  if (value.isEmpty) {
    return l10n.invalidBirthMonth;
  } else if (_isValidNumber(value)) {
    int? month = int.tryParse(value) ?? 0;
    if (month > 12 || month < 1 || value.length != 2) {
      return l10n.invalidBirthMonth;
    } else {
      return "";
    }
  } else {
    return l10n.invalidBirthMonth;
  }
}

String? _validateSignupYearBirthday(
  BuildContext ctx,
  String value,
) {
  final l10n = ctx.l10n;
  var date = DateTime.now();
  var minYear = DateTime(date.year - 5).year;
  var maxYear = 1950;
  if (value.isEmpty) {
    return l10n.invalidBirthYear;
  } else if (_isValidNumber(value)) {
    int? year = int.tryParse(value) ?? 0;
    if (year > minYear || year < maxYear || value.length != 4) {
      return l10n.invalidBirthYear;
    } else {
      return "";
    }
  } else {
    return l10n.invalidBirthYear;
  }
}

bool _isValidEmail(String value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}

bool _isValidPhoneNumber(String value) {
  return RegExp(r"^01[0125][0-9]{8}$").hasMatch(value);
}

bool _isValidNumber(String value) {
  return RegExp(r"^[0-9]*$").hasMatch(value);
}
