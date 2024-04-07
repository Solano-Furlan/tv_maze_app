import 'package:flutter/material.dart';
import 'package:tv_maze_app/core/design_system/widgets/images/svg_asset.widget.dart';

class UIIconCard extends StatelessWidget {
  const UIIconCard({
    required this.svgIconPath,
    required this.backgroundColor,
    required this.iconColor,
    super.key,
  });

  final String svgIconPath;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      child: UISvgAsset(
        path: svgIconPath,
        color: iconColor,
        size: 24,
      ),
    );
  }
}
