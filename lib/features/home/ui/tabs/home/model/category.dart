import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class Category {
  String name;
  String icon;

  static late BuildContext _context;

  static BuildContext get context => _context;

  static set context(BuildContext value) {
    _context = value;
  }

  static var language = AppLocalizations.of(context)!;

  Category({required this.icon, required this.name});

  static List<Category> catogeries() {
    return [
      Category(icon: AppAssets.leave, name: language.all),
      Category(icon: AppAssets.phone, name: language.electronics),
      Category(icon: AppAssets.list, name: language.books),
      Category(icon: AppAssets.person, name: language.clothing),
      Category(icon: AppAssets.home, name: language.home),
    ];
  }
}
