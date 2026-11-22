import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class Validation {
  static late BuildContext _context;

  static BuildContext get context => _context;

  static set context(BuildContext value) {
    _context = value;
  }

  static var language = AppLocalizations.of(context)!;

  static String? validatePassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return language.enter_your_password;
    }

    if (!RegExp(r'[A-Z]').hasMatch(text)) {
      return language.password_capital_letter;
    }

    if (!RegExp(r'[a-z]').hasMatch(text)) {
      return language.password_small_letter;
    }

    if (!RegExp(r'[0-9]').hasMatch(text)) {
      return language.password_number;
    }

    if (!RegExp(r'[^A-Za-z0-9\s]').hasMatch(text)) {
      return language.password_symbol;
    }

    if (text.length < 8) {
      return language.password_min_length;
    }

    return null;
  }

  static String? validateFullName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return language.enter_your_full_name;
    }

    final regx = RegExp(r'^[a-zA-Z ]+$');

    if (!regx.hasMatch(text.trim())) {
      return language.enter_valid_full_name;
    }

    return null;
  }

  static String? validateInput(String? text) {
    if (text == null || text.trim().isEmpty) {
      return language.please_enter_this_field;
    }

    return null;
  }

  static String? validateMobileNum(String? text) {
    if (text == null || text.trim().isEmpty) {
      return language.enter_your_phone;
    }
    if (text.length != 11) {
      return language.invalid_mobile_number;
    }
    return null;
  }

  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty) {
      return language.enter_your_email;
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return language.invalid_email;
    }
    return null;
  }

  static String? rePasswordValidator(
    String? text,
    TextEditingController passwordController,
  ) {
    if (text == null || text.trim().isEmpty) {
      return language.enter_your_confirm_password;
    }
    if (text != passwordController.text) {
      return language.password_not_match;
    }
    return null;
  }

  static String? validateTelegramUsername(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "Please Your User Name";
    }

    String username = text.trim();
    if (username.startsWith('@')) {
      username = username.substring(1);
    }

    final telegramRegex = RegExp(r'^[a-zA-Z0-9_]{5,32}$');

    if (!telegramRegex.hasMatch(username)) {
      return 'Enter a valid Telegram username';
    }

    return null;
  }
}
