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
  /// **'Share items you no longer need with people nearby who can\n put them to good use.'**
  String get intro1_body;

  /// No description provided for @intro2_title.
  ///
  /// In en, this message translates to:
  /// **'Find What You Need'**
  String get intro2_title;

  /// No description provided for @intro2_body.
  ///
  /// In en, this message translates to:
  /// **'Discover useful items shared by others in your community — \ncompletely free.'**
  String get intro2_body;

  /// No description provided for @intro3_title.
  ///
  /// In en, this message translates to:
  /// **'Reuse More, Waste Less'**
  String get intro3_title;

  /// No description provided for @intro3_body.
  ///
  /// In en, this message translates to:
  /// **'Every swap keeps an item in use and helps your community\n reduce unnecessary waste.'**
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

  /// No description provided for @enter_valid_name.
  ///
  /// In en, this message translates to:
  /// **'Enter a Valid Name'**
  String get enter_valid_name;

  /// No description provided for @enter_your_full_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Full Name'**
  String get enter_your_full_name;

  /// No description provided for @enter_valid_full_name.
  ///
  /// In en, this message translates to:
  /// **'Enter a Valid Full Name'**
  String get enter_valid_full_name;

  /// No description provided for @password_capital_letter.
  ///
  /// In en, this message translates to:
  /// **'Password should contain at least one capital letter'**
  String get password_capital_letter;

  /// No description provided for @password_small_letter.
  ///
  /// In en, this message translates to:
  /// **'Password should contain at least one small letter'**
  String get password_small_letter;

  /// No description provided for @password_number.
  ///
  /// In en, this message translates to:
  /// **'Password should contain at least one number'**
  String get password_number;

  /// No description provided for @password_symbol.
  ///
  /// In en, this message translates to:
  /// **'Password should contain at least one symbol'**
  String get password_symbol;

  /// No description provided for @password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password should be at least 8 characters'**
  String get password_min_length;

  /// No description provided for @enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Mobile Number'**
  String get enter_mobile_number;

  /// No description provided for @invalid_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Correct Mobile Number'**
  String get invalid_mobile_number;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Email'**
  String get invalid_email;

  /// No description provided for @enter_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter confirm password'**
  String get enter_confirm_password;

  /// No description provided for @password_not_match.
  ///
  /// In en, this message translates to:
  /// **'Confirm password doesn\'t match password'**
  String get password_not_match;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// No description provided for @you_are_helping_your_community_wastel_ess.
  ///
  /// In en, this message translates to:
  /// **'You’re helping your community waste less.'**
  String get you_are_helping_your_community_wastel_ess;

  /// No description provided for @items_shared.
  ///
  /// In en, this message translates to:
  /// **'8 items shared'**
  String get items_shared;

  /// No description provided for @sign_out_of_your_ecoSwap_account.
  ///
  /// In en, this message translates to:
  /// **'Sign out of your EcoSwap account'**
  String get sign_out_of_your_ecoSwap_account;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @preference.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get preference;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get account;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get light_mode;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark_mode;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @register_successfully.
  ///
  /// In en, this message translates to:
  /// **'Register Successfully'**
  String get register_successfully;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @login_successfully.
  ///
  /// In en, this message translates to:
  /// **'Login Successfully'**
  String get login_successfully;

  /// No description provided for @check_your_email.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get check_your_email;

  /// No description provided for @we_sent_a_password_reset_link_to_your.
  ///
  /// In en, this message translates to:
  /// **'We sent a password reset link to your inbox. It may take a\n minute to arrive.'**
  String get we_sent_a_password_reset_link_to_your;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @items_available_today.
  ///
  /// In en, this message translates to:
  /// **'28 Items Available Today'**
  String get items_available_today;

  /// No description provided for @fresh_finds_near_you.
  ///
  /// In en, this message translates to:
  /// **'Fresh Finds Near You'**
  String get fresh_finds_near_you;

  /// No description provided for @clothing.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get clothing;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @search_available_items.
  ///
  /// In en, this message translates to:
  /// **'Search Available Items'**
  String get search_available_items;

  /// No description provided for @give_something_a_second_life_nearby.
  ///
  /// In en, this message translates to:
  /// **'Give Something a \nSecond Life Nearby'**
  String get give_something_a_second_life_nearby;

  /// No description provided for @good_morning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning,'**
  String get good_morning;

  /// No description provided for @give_share.
  ///
  /// In en, this message translates to:
  /// **'GIVE • SHARE • REUSE'**
  String get give_share;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @your_items_have_helped.
  ///
  /// In en, this message translates to:
  /// **'Your Items Have Helped'**
  String get your_items_have_helped;

  /// No description provided for @neighbors_so_far.
  ///
  /// In en, this message translates to:
  /// **'Neighbors So Far'**
  String get neighbors_so_far;

  /// No description provided for @small_actions_real_impact.
  ///
  /// In en, this message translates to:
  /// **'Small Actions, Real Impact'**
  String get small_actions_real_impact;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @no_requests_yet.
  ///
  /// In en, this message translates to:
  /// **'No Requests Yet'**
  String get no_requests_yet;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @listings.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get listings;

  /// No description provided for @your_shared_items.
  ///
  /// In en, this message translates to:
  /// **'Your Shared Items'**
  String get your_shared_items;

  /// No description provided for @available2.
  ///
  /// In en, this message translates to:
  /// **'available'**
  String get available2;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @cancel_request.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get cancel_request;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @requested.
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get requested;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// No description provided for @received.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get received;

  /// No description provided for @item_request.
  ///
  /// In en, this message translates to:
  /// **'ITEM REQUEST'**
  String get item_request;

  /// No description provided for @publish_item.
  ///
  /// In en, this message translates to:
  /// **'Publish item'**
  String get publish_item;

  /// No description provided for @well_used.
  ///
  /// In en, this message translates to:
  /// **'Well used'**
  String get well_used;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @like_new.
  ///
  /// In en, this message translates to:
  /// **'Like new'**
  String get like_new;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get condition;

  /// No description provided for @select_a_category.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get select_a_category;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @condition_size_included.
  ///
  /// In en, this message translates to:
  /// **'Condition, size, what\'s included...'**
  String get condition_size_included;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @wooden_side_table_example.
  ///
  /// In en, this message translates to:
  /// **'e.g. Wooden side table'**
  String get wooden_side_table_example;

  /// No description provided for @item_title.
  ///
  /// In en, this message translates to:
  /// **'Item title'**
  String get item_title;

  /// No description provided for @natural_light_photo.
  ///
  /// In en, this message translates to:
  /// **'Use natural light and show the full item'**
  String get natural_light_photo;

  /// No description provided for @add_one_clear_photo.
  ///
  /// In en, this message translates to:
  /// **'Add one clear photo'**
  String get add_one_clear_photo;

  /// No description provided for @add_details_for_nearby.
  ///
  /// In en, this message translates to:
  /// **'Add a few details so someone nearby can find it.'**
  String get add_details_for_nearby;

  /// No description provided for @give_it_a_second_life.
  ///
  /// In en, this message translates to:
  /// **'Give it a second life'**
  String get give_it_a_second_life;

  /// No description provided for @add_an_item.
  ///
  /// In en, this message translates to:
  /// **'Add an item'**
  String get add_an_item;

  /// No description provided for @please_enter_this_field.
  ///
  /// In en, this message translates to:
  /// **'Please enter this field'**
  String get please_enter_this_field;

  /// No description provided for @contact_details_help.
  ///
  /// In en, this message translates to:
  /// **'Your contact details help item owners recognize your requests.'**
  String get contact_details_help;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_changes;
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
