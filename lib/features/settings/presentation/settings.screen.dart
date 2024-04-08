import 'package:flutter/material.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/bottom_app_bar.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_header.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/texts/header_text.widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UIMainScaffold(
      canPop: false,
      mainHeader: UIMainHeader(
        height: 134,
        child: UIHeaderText(
          'Settings',
          fontSize: 32,
        ),
      ),
      body: SizedBox(),
      bottomAppBar: UIBottomAppBar(
        currentTab: TabType.settings,
      ),
    );
  }
}
