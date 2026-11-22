import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class AppModel {
  static List<String> itemStatus(BuildContext context) {
    return [
      AppLocalizations.of(context)!.available,
      AppLocalizations.of(context)!.unavailable,
    ];
  }

  static List<String> requestStatus(BuildContext context) {
    return [
      AppLocalizations.of(context)!.accepted,
      AppLocalizations.of(context)!.pending,
      AppLocalizations.of(context)!.cancelled,
      AppLocalizations.of(context)!.rejected,
    ];
  }
}
