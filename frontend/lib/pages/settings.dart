import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smooth_scroll_2/configs/custom_cache_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            final manager = CustomCacheManager();
            manager.emptyCache();

            showOkAlertDialog(
              context: context,
              title: '確認',
              message: 'キャッシュを削除しました',
            );
          },
          child: const Text('キャッシュを削除する'),
        ),
      ],
    );
  }
}
