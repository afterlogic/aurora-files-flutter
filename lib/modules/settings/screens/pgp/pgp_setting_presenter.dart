import 'package:aurorafiles/database/app_database.dart';
import 'package:aurorafiles/database/pgp_key/pgp_key_dao.dart';
import 'package:aurorafiles/modules/app_store.dart';
import 'package:aurorafiles/modules/settings/repository/pgp_key_util.dart';
import 'package:aurorafiles/modules/settings/screens/pgp/pgp_setting_view.dart';
import 'package:crypto_plugin/algorithm/pgp.dart';

class PgpSettingPresenter {
  final PgpSettingView _view;
  final PgpKeyDao _pgpKeyDao;
  final PgpKeyUtil pgpKeyUtil;

  PgpSettingPresenter(this._view, this._pgpKeyDao, Pgp pgp)
      : pgpKeyUtil = PgpKeyUtil(pgp, _pgpKeyDao);

  getPublicKey() {
    _pgpKeyDao.getPublicKey().then(
      (keys) {
        _view.keysState.add(KeysState(keys));
      },
      onError: (e) {
        _view.keysState.add(KeysState([]));
      },
    );
  }

  getKeysFromFile() async {
    final result = await pgpKeyUtil.importKeyFromFile();
    if (result != null && result.isNotEmpty) {
      _view.showImportDialog(result);
    }
  }

  getKeysFromText(String text) async {
    final result = await pgpKeyUtil.validateText(text);
    if (result != null && result.isNotEmpty) {
      _view.showImportDialog(result);
    }
  }

  Future<String> exportAll(List<LocalPgpKey> keys) async {
    for (LocalPgpKey key in keys) {
      await pgpKeyUtil.downloadKey(key);
    }
    return await pgpKeyUtil.keysFolder();
  }

  saveKeys(List<LocalPgpKey> result) async {
    await pgpKeyUtil.saveKeys(result);
    getPublicKey();
  }
}
