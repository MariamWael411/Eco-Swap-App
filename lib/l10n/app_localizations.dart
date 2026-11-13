import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @intro1_title.
  ///
  /// In en, this message translates to:
  /// **'Give Your Items a New Life'**
  String get intro1_title;

  /// No description provided for @intro1_body.
  ///
  /// In en, this message translates to:
  /// **'Share items you no longer need with people nearby who can put them to good use.'**
  String get intro1_body;

  /// No description provided for @intro2_title.
  ///
  /// In en, this message translates to:
  /// **'Find What You Need'**
  String get intro2_title;

  /// No description provided for @intro2_body.
  ///
  /// In en, this message translates to:
  /// **'Discover useful items shared by others in your community — completely free.'**
  String get intro2_body;

  /// No description provided for @intro3_title.
  ///
  /// In en, this message translates to:
  /// **'Reuse More, Waste Less'**
  String get intro3_title;

  /// No description provided for @intro3_body.
  ///
  /// In en, this message translates to:
  /// **'Every swap keeps an item in use and helps your community reduce unnecessary waste.'**
  String get intro3_body;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome_back;

  /// No description provided for @sign_in_to_continue_sharing.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue sharing.'**
  String get sign_in_to_continue_sharing;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get email_address;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @or_continue_with.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get or_continue_with;

  /// No description provided for @continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_with_google;

  /// No description provided for @new_to_ecoSwap.
  ///
  /// In en, this message translates to:
  /// **'New to EcoSwap?'**
  String get new_to_ecoSwap;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get create_account;

  /// No description provided for @create_your_account.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get create_your_account;

  /// No description provided for @join_your_local_sharing_community.
  ///
  /// In en, this message translates to:
  /// **'Join your local sharing community.'**
  String get join_your_local_sharing_community;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enter_your_name;

  /// No description provided for @enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get enter_your_password;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get enter_your_email;

  /// No description provided for @enter_your_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number'**
  String get enter_your_phone;

  /// No description provided for @enter_your_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Your RE_Password'**
  String get enter_your_confirm_password;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @reset_your_password.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get reset_your_password;

  /// No description provided for @we_will_send_a_secure_reset_link_to_your_inbox.
  ///
  /// In en, this message translates to:
  /// **'We’ll send a secure reset link to your inbox.'**
  String get we_will_send_a_secure_reset_link_to_your_inbox;

  /// No description provided for @send_reset_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get send_reset_link;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get back_to_login;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'My Items'**
  String get item;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
