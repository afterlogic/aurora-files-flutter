import 'dart:ui';

//// ignore_for_file: non_constant_identifier_names
//// ignore_for_file: camel_case_types
//// ignore_for_file: prefer_single_quotes

abstract class S {
  Locale get locale;
  String get mail;
  String get contacts;
  String get files;
  String get calendar;
  String get tasks;
  String get cancel;
  String quota_using(String progress, limit);
  String get offline_mode;
  String get settings;
  String get log_out;
  String no_route(String name);
  String get common;
  String get encryption;
  String get openPGP;
  String get storage_info;
  String get about;
  String version(String version);
  String get terms;
  String get privacy_policy;
  String get clear_cache;
  String get confirm_delete;
  String get clear;
  String get cache_cleared_success;
  String get dark_theme;
  String get encryption_description;
  String get delete_encryption_key_success;
  String get delete_key;
  String get share_key;
  String get download_key;
  String get encryption_export_description;
  String get encryption_keys;
  String get generate_keys;
  String get key_not_found_in_file;
  String get import_encryption_key_success;
  String get import_key_from_file;
  String get import_key_from_text;
  String get need_to_set_encryption_key;
  String get oK;
  String key_downloaded_into(String dir);
  String get import_key;
  String get generate_key;
  String get add_key_progress;
  String get key_name;
  String get key_text;
  String get import;
  String get generate;
  String get delete_key_description;
  String get delete;
  String get download_key_progress;
  String get download_confirm;
  String get email;
  String get password;
  String get select_length;
  String get length;
  String get close;
  String get password_is_empty;
  String get already_have_key;
  String get already_have_keys;
  String get import_selected_keys;
  String get check_keys;
  String get import_keys;
  String get all_public_keys;
  String get send_all;
  String get download_all;
  String downloading_to(String path);
  String get private_key;
  String get public_key;
  String get share;
  String get download;
  String confirm_delete_pgp_key(String email);
  String get public_keys;
  String get private_keys;
  String get export_all_public_keys;
  String get import_keys_from_text;
  String get import_keys_from_file;
  String get offline_information_is_not_available;
  String get information_is_not_available;
  String available_space(String format);
  String used_space(String used, limit);
  String get upgrade_now;
  String get has_public_link;
  String get available_offline;
  String get synched_successfully;
  String get synch_file_progress;
  String downloaded_successfully_into(String name, path);
  String downloading(String name);
  String get set_any_encryption_key;
  String get need_an_encryption_to_share;
  String get search;
  String get add_folder;
  String get move_file_or_folder;
  String get copy;
  String get move;
  String get link_coppied_to_clipboard;
  String get public_link_access;
  String get copy_public_link;
  String get secure_sharing;
  String get has_PGP_public_key;
  String get has_no_PGP_public_key;
  String get encryption_type;
  String get key_will_be_used;
  String get password_will_be_used;
  String get encrypt;
  String get key_based;
  String get password_based;
  String get not_have_recipiens;
  String get select_recipient;
  String get cant_load_recipients;
  String get try_again;
  String get no_name;
  String encrypted_using_key(String user);
  String get encrypted_using_password;
  String get add_new_folder;
  String adding_folder(String name);
  String get enter_folder_name;
  String get add;
  String get file;
  String get folder;
  String get delete_files;
  String get delete_file;
  String confirm_delete_file(String file);
  String these_files(String count);
  String this_file(String name);
  String get offline;
  String get copy_or_move;
  String get rename;
  String renaming_to(String name);
  String get enter_new_name;
  String get share_file;
  String get getting_file_progress;
  String get decrypt_error;
  String get file_is_damaged;
  String get encrypted;
  String get open_PDF;
  String get please_wait_until_loading;
  String get delete_from_offline;
  String get filename;
  String get size;
  String get created;
  String get location;
  String get owner;
  String get need_an_encryption_to_uploading;
  String get successfully_uploaded;
  String get no_internet_connection;
  String get retry;
  String get go_offline;
  String get no_results;
  String get empty_here;
  String get upgrade_your_plan;
  String get please_upgrade_your_plan;
  String get back_to_login;
  String get please_enter_hostname;
  String get please_enter_email;
  String get please_enter_password;
  String get enter_host;
  String get host;
  String get login;
  String get encrypted_file_link;
  String get send;
  String get send_encrypted;
  String get upload;
  String get encrypt_error;
  String get encrypted_file_password;
  String get create_link;
  String get create_encrypt_link;
  String get encrypt_link;
  String get public_link;
  String get remove_link;
  String get send_to;
  String get recipient;
  String get encrypted_mail_using_key;
  String get send_email;
  String get sending;
  String get sending_complete;
  String get failed;
  String get keys_not_found;
  String sign_with_not_key(String data);
  String get invalid_password;
  String get sign_email;
  String get sign_file_email;
  String get data;
  String sign_data_with_not_key(String data);
  String sign_mail_with_not_key(String data);
  String get password_sign;
  String get email_signed;
  String get data_signed;
  String data_not_signed(String data);
  String get protected_public_link;
  String get send_public_link_to;
  String get copy_password;
  String get copy_encrypted_password;
  String encrypted_sign_using_key(String user);
  String get email_not_signed;
  String get two_factor_auth;
  String get pin;
  String get verify_pin;
  String get invalid_pin;
  String get upload_file;
  String upload_files(String count);
}
