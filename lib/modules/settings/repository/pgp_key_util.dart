import 'dart:convert';
import 'dart:io';

import 'package:aurorafiles/database/app_database.dart';
import 'package:aurorafiles/database/pgp_key/pgp_key_dao.dart';
import 'package:aurorafiles/di/di.dart';
import 'package:aurorafiles/modules/app_store.dart';
import 'package:aurorafiles/utils/download_directory.dart';
import 'package:aurorafiles/utils/permissions.dart';
import 'package:crypto_plugin/crypto_plugin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_extend/share_extend.dart';

class PgpKeyUtil {
  static PgpKeyUtil _instance;

  static PgpKeyUtil get instance =>
      _instance ??= PgpKeyUtil._(DI.get(), DI.get());

  final Utf8Codec utf8 = Utf8Codec(allowMalformed: true);
  final Pgp pgp;

  final PgpKeyDao pgpKeyDao;

  PgpKeyUtil._(this.pgp, this.pgpKeyDao);

  Future<List<LocalPgpKey>> validateText(String text) async {
    final keys = RegExp("$keyStart((\\D|\\d)*)$keyEnd")
        .allMatches(text)
        .map((regExp) => regExp.group(0))
        .toList();
    final localKeys = <LocalPgpKey>[];

    for (String key in keys) {
      final description = await pgp.getKeyDescription(key);

      for (String email in description.email) {
        final groups = RegExp("(\\D|\\d)*<((?:\\D|\\d)*)>").firstMatch(email);
        String validEmail;
        String name = "";
        if (groups?.groupCount == 2) {
          name = groups.group(1);
          validEmail = groups.group(2);
        } else {
          validEmail = email;
        }
        final localPgpKey = LocalPgpKey(
          email: validEmail,
          key: key,
          isPrivate: description.isPrivate,
          length: description.length,
          name: name,
        );

        localKeys.add(localPgpKey);
      }
    }

    return localKeys;
  }

  Future<LocalPgpKey> userPrivateKey() {
    return pgpKeyDao.getKey(AppStore.authState.userEmail, true);
  }

  Future<LocalPgpKey> userPublicKey() {
    return pgpKeyDao.getKey(AppStore.authState.userEmail, false);
  }

  saveKeys(List<LocalPgpKey> keys) async {
    await pgpKeyDao.addKeys(keys);
  }

  Future<List<LocalPgpKey>> checkHasKeys(List<LocalPgpKey> keys) {
    return pgpKeyDao.checkHasKeys(keys);
  }

  Future<bool> checkHasKey(String email) {
    return pgpKeyDao.checkHasKey(email);
  }

  Future deleteByEmail(List<String> emails) {
    return pgpKeyDao.deleteByEmails(emails);
  }

  Future<List<LocalPgpKey>> importKeyFromFile() async {
    final File fileWithKey = await FilePicker.getFile();
    if (fileWithKey == null) return null;
    final String contents = await fileWithKey.readAsString();
    return validateText(contents);
  }

  Future<void> shareKeys(String text) async {
    await ShareExtend.share(text, "text");
  }

  Future<String> keysFolder() async {
    final Directory dir = await getDownloadDirectory();
    return dir.path + pgpKeyPath;
  }

  Future<File> downloadKey(LocalPgpKey key) async {
    if (!Platform.isIOS) await getStoragePermissions();

    final file = File(await keysFolder() +
        Platform.pathSeparator +
        "${key.name ?? ""} ${key.email} PGP ${key.isPrivate ? "private" : "public"} key" +
        ".asc");
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    await file.writeAsString(key.key);
    return file;
  }

  Future<File> downloadPublicKeys(List<LocalPgpKey> keys) async {
    final publicKeys = keys.where((item) => !item.isPrivate);
    if (!Platform.isIOS) await getStoragePermissions();
    final file = File(await keysFolder() +
        Platform.pathSeparator +
        "PGP public keys" +
        ".asc");
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    for (LocalPgpKey key in publicKeys) {
      await file.writeAsString(key.key, mode: FileMode.append);
    }
    return file;
  }

  Future deleteKey(LocalPgpKey key) async {
    await pgpKeyDao.deleteKey(key);
  }

  Future<KeyPair> createKeys(int length, String email, String password) async {
    await pgp.stop();
    return pgp.createKeys(length, email, password);
  }

  Future<bool> checkPrivateKey(String password, String pgpKey) {
    return pgp.checkPassword(password, pgpKey);
  }

  Future<String> userEncrypt(String string) async {
    try {
      await pgp.setPublicKeys([(await userPublicKey()).key]);
      final result = await pgp.encryptBytes(utf8.encode(string), null);
      pgp.stop();
      return utf8.decode(result);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> userDecrypt(String string, String password) async {
    try {
      await pgp.setPrivateKey((await userPrivateKey()).key);
      final result = await pgp.decryptBytes(utf8.encode(string), password);
      pgp.stop();
      return utf8.decode(result);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> hasUserKey() async {
    return (await userPrivateKey()) != null && (await userPublicKey()) != null;
  }

  static const pgpKeyPath = "/pgp_keys";
  static const keyStart = "-----BEGIN PGP \\w* KEY BLOCK-----";
  static const keyEnd = "-----END PGP \\w* KEY BLOCK-----";

  close() {
    pgp.stop();
  }
}
