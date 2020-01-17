import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

//

  String get invalid_password => "Invalid password";

  String get sign_email => "Sign the email";

  String get sign_file_email => "Sign the file and email";

  String get data => "data";

  String sign_data_with_not_key(String data) =>
      "Will not sign the $data because you don’t have pgp private key.";

  String sign_mail_with_not_key(String data) =>
      "The $data will not be signed because you don’t have pgp private key.";

  String get password_sign => "For password-based encryption the pgp-signing is not supported.";

  String get email_signed => "The email will be signed using your private key.";

  String get data_signed => "Will sign the data with your private key.";

  String get email_not_signed => "The email will not be signed.";

  String get data_not_signed => "Will not sign the data.";

  String get protected_public_link => "Protected public link";

  String get send_public_link_to => "Send public link to";

//
  String get about => "About";

  String get add => "Add";

  String get add_folder => "Add folder";

  String get add_key_progress => "Adding encryption key...";

  String get add_new_folder => "Add new folder";

  String get all_public_keys => "All public keys";

  String get already_have_key => "You already have the key(s) for this email";

  String get already_have_keys => "Keys which are already in the system are greyed out.";

  String get available_offline => "Available offline";

  String get back_to_login => "Back to login";

  String get cache_cleared_success => "Cache cleared successfully";

  String get calendar => "Calendar";

  String get cancel => "Cancel";

  String get cant_load_recipients => "Cant load recipients:";

  String get check_keys => "Check keys";

  String get clear => "Clear";

  String get clear_cache => "Clear cache";

  String get close => "Close";

  String get common => "Common";

  String get confirm_delete =>
      "Are you sure you want to delete all the cached files and images? This will not affect saved files for offline.";

  String get contacts => "Contacts";

  String get copy => "Copy";

  String get copy_or_move => "Copy/Move";

  String get copy_password =>
      "You can send the link via email. The password must be sent using a different channel.\n\nYou will be able to retrieve the password when need.";

  String get copy_encrypted_password =>
      "You can send the link via email. The password must be sent using a different channel.\n\n  Store the password somewhere. You will not be able to recover it otherwise.";

  String get copy_public_link => "Copy public link";

  String get create_encrypt_link => "Create protected public link";

  String get create_link => "Create public link";

  String get created => "Created";

  String get dark_theme => "Dark theme";

  String get decrypt_error =>
      "An error occurred during the decryption process. Perhaps, this file was encrypted with another key.";

  String get delete => "Delete";

  String get delete_encryption_key_success => "The encryption key was successfully deleted.";

  String get delete_file => "Delete file";

  String get delete_files => "Delete files";

  String get delete_from_offline => "Delete file from offline";

  String get delete_key => "Delete key";

  String get delete_key_description =>
      "Attention! You'll no longer be able to decrypt encrypted files on this device unless you import this key again.";

  String get download => "Download";

  String get download_all => "Download all";

  String get email => "Email";

  String get empty_here => "Empty here";

  String get encrypt => "Encrypt";

  String get encrypt_error => "Encrypt error";

  String get encrypt_link => "Protect public link with password";

  String get encrypted => "Encrypted";

  String get encrypted_file_link => "Encrypted file public link:";

  String get encrypted_file_password => "Encrypted file password";

  String get encrypted_mail_using_key => "You can send the link and the password via email.";

  String get encrypted_using_password =>
      "If you don't send email now, store the password somewhere. You will not be able to recover it otherwise.";

  String get encryption => "Encryption";

  String get encryption_description =>
      "Files are encrypted/decrypted right on this device, even the server itself cannot get access to non-encrypted content of paranoid-encrypted files. Encryption method is AES256.";

  String get encryption_export_description =>
      "To access encrypted files on other devices/browsers, export the key and then import it on another device/browser.";

  String get encryption_keys => "Encryption key:";

  String get encryption_type => "Encryption type:";

  String get enter_folder_name => "Enter folder name";

  String get enter_host =>
      "Could not detect domain from this email, please specify your server url manually.";

  String get enter_new_name => "Enter new name";

  String get export => "Export";

  String get export_all_public_keys => "Export all public keys";

  String get export_confirm => "Are you sure you want to export this key?";

  String get export_key => "Export key";

  String get export_key_progress => "Exporting the key...";

  String get failed => "Failed";

  String get file => "file";

  String get file_is_damaged => "Error happened. Perhaps this file is damaged.";

  String get filename => "Filename";

  String get files => "Files";

  String get folder => "folder";

  String get generate => "Generate";

  String get generate_key => "Generate key";

  String get generate_keys => "Generate keys";

  String get getting_file_progress => "Getting file for sharing...";

  String get go_offline => "Go offline";

  String get has_PGP_public_key =>
      "Selected recipient has PGP public key. The file can be encrypted using this key.";

  String get has_no_PGP_public_key =>
      "Selected recipient has no PGP public key. The key based encryption is not allowed.";

  String get has_public_link => "Has public link";

  String get host => "Host";

  String get import => "Import";

  String get import_encryption_key_success => "The encryption key was successfully imported";

  String get import_key => "Import key";

  String get import_key_from_file => "Import key from file";

  String get import_key_from_text => "Import key from text";

  String get import_keys => "Import keys";

  String get import_keys_from_file => "Import keys from file";

  String get import_keys_from_text => "Import keys from text";

  String get import_selected_keys => "Import selected keys";

  String get information_is_not_available => "This information is not available at the moment.";

  String get key_based => "Key based";

  String get key_name => "Key name";

  String get key_not_found_in_file => "Could not find a key in this file";

  String get key_text => "Key text";

  String get key_will_be_used => "The Key based encryption will be used";

  String get length => "Length";

  String get link_coppied_to_clipboard => "Link coppied to clipboard";

  String get location => "Location";

  String get log_out => "Log out";

  String get login => "Login";

  String get mail => "Mail";

  String get move => "Move";

  String get move_file_or_folder => "Move files/folders";

  String get need_an_encryption_to_share => "You need an encryption key to share files.";

  String get need_an_encryption_to_uploading =>
      "You need to set an encryption key before uploading files.";

  String get need_to_set_encryption_key =>
      "To start using encryption of uploaded files your need to set any encryption key.";

  String get no_internet_connection => "No internet connection";

  String get no_name => "No name";

  String get no_results => "No results";

  String get not_have_recipiens => "Not have recipiens";

  String get oK => "OK";

  String get offline => "Offline";

  String get offline_information_is_not_available =>
      "This information is not available when you're offline.";

  String get offline_mode => "Offline mode";

  String get openPGP => "OpenPGP";

  String get open_PDF => "Open PDF";

  String get owner => "Owner";

  String get password => "Password";

  String get password_based => "Password based";

  String get password_is_empty => "password is empty";

  String get password_will_be_used => "The Password based encryption will be used";

  String get please_enter_email => "Please enter email";

  String get please_enter_hostname => "Please enter hostname";

  String get please_enter_password => "Please enter password";

  String get please_upgrade_your_plan =>
      "Mobile apps are not allowed in your billing plan.\nPlease upgrade your plan.";

  String get please_wait_until_loading => "Please wait until the file finishes loading";

  String get privacy_policy => "Privacy policy";

  String get private_key => "Private key";

  String get private_keys => "Private keys";

  String get public_key => "Public key";

  String get public_keys => "Public keys";

  String get public_link => "Public link";

  String get public_link_access => "Public link access";

  String get recipient => "Recipient";

  String get remove_link => "Remove link";

  String get rename => "Rename";

  String get retry => "Retry";

  String get search => "Search";

  String get secure_sharing => "Secure sharing";

  String get select_length => "Select length";

  String get select_recipient => "Select recipient:";

  String get send => "Send via email";

  String get send_all => "Send all";

  String get send_email => "You can send the link via email.";

  String get send_encrypted => "Send via encrypted email";

  String get send_to => "Send to..";

  String get sending => "Sending..";

  String get sending_complete => "Sending complete";

  String get set_any_encryption_key =>
      "You have enabled encryption of uploaded files but haven't set any encryption key.";

  String get settings => "Settings";

  String get share => "Share";

  String get share_file => "Share file";

  String get size => "Size";

  String get storage_info => "Storage info";

  String get successfully_uploaded => "File successfully uploaded";

  String get synch_file_progress => "Synching file...";

  String get synched_successfully => "File synched successfully";

  String get tasks => "Tasks";

  String get terms => "Terms of Service";

  String get try_again => "Try again";

  String get upgrade_now => "Upgrade now";

  String get upload => "Upload";

  String get keys_not_found => "Keys not found";

  String adding_folder(String name) => "Adding $name folder";

  String available_space(String format) => "Available space: $format";

  String confirm_delete_file(String file) => "Are you sure you want to delete $file";

  String confirm_delete_pgp_key(String email) =>
      "Are you sure you want to delete OpenPGP key for $email?";

  String downloaded_successfully_into(String name, String path) =>
      "$name downloaded successfully into: $path";

  String downloading(String name) => "Downloading $name";

  String downloading_to(String path) => "Downloading $path";

  String encrypted_using_key(String user) =>
      "The file is encrypted using $user's PGP public key. You can send the link via encrypted email.";

  String encrypted_sign_using_key(String user) =>
      "The file is encrypted using $user's PGP public key. You can send the link via digitally signed encrypted email.";

  String key_exported_into(String dir) => "The key was exported into: $dir";

  String no_route(String name) => "No route defined for $name";

  String quota_using(String progress, String limit) => "You are using $progress% of your $limit";

  String renaming_to(String name) => "Renaming to $name";

  String these_files(String count) => "these $count files/folders ";

  String this_file(String name) => "this $name?";

  String used_space(String used, String limit) => "Used space: $used out of $limit";

  String version(String version) => "Version $version";
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        default:
        // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty ? l.languageCode : l.toString();
