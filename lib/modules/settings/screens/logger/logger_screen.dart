import 'package:aurora_logger/aurora_logger.dart';
import 'package:aurora_ui_kit/aurora_ui_kit.dart';
import 'package:aurorafiles/generated/s_of_context.dart';
import 'package:aurorafiles/modules/app_store.dart';
import 'package:aurorafiles/shared_ui/layout_config.dart';
import 'package:flutter/material.dart';

class LoggerScreen extends StatefulWidget {
  @override
  _LoggerScreenState createState() => _LoggerScreenState();
}

class _LoggerScreenState extends State<LoggerScreen> {
  @override
  Widget build(BuildContext context) {
    final s = Str.of(context);
    final isTablet = LayoutConfig.of(context).isTablet;
    return Scaffold(
      appBar: isTablet
          ? null
          : AMAppBar(
              title: Text("Debug"),
            ),
      body: LoggerSettingWidget(
        LoggerSettingArg(
            AppStore.authState.apiUrl,
            s.logger_label_show_debug_view,
            s.logger_btn_delete_all,
            s.logger_hint_delete_all_logs,
            s.logger_hint_delete_log, (hint) async {
          final result = await AMConfirmationDialog.show(
            context,
            "",
            hint,
            s.delete,
            s.cancel,
          );
          if (result == true) {
            return true;
          } else {
            return false;
          }
        }),
      ),
    );
  }
}
