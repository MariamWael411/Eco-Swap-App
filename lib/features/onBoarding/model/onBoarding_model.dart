import 'package:eco_swap_app/core/utils/app_assets.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../l10n/app_localizations.dart';

class OnboardingModel {
  static List<String> titles = [
    AppLocalizations.of(context)!.intro1_title,
    AppLocalizations.of(context)!.intro2_title,
    AppLocalizations.of(context)!.intro3_title,
  ];

  static List<String> bodies = [
    AppLocalizations.of(context)!.intro1_body,
    AppLocalizations.of(context)!.intro2_body,
    AppLocalizations.of(context)!.intro3_body,
  ];

  static List<String> imagesLight = [
    AppAssets.intro1Light,
    AppAssets.intro2Light,
    AppAssets.intro3Light,
  ];

  static List<String> imagesDark = [
    AppAssets.intro1Dark,
    AppAssets.intro2Dark,
    AppAssets.intro3Dark,
  ];
  static late BuildContext _context;

  static BuildContext get context => _context;

  static set context(BuildContext value) {
    _context = value;
  }
}
