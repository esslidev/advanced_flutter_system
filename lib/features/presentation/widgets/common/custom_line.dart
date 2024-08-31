import 'package:flutter/material.dart';

import '../../../../core/constants/app_theme.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomLine extends StatelessWidget {
  final Color? lineColor;
  final bool isVertical;
  final double? size;

  const CustomLine({
    super.key,
    this.lineColor,
    this.isVertical = false,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);
    return Container(
      width: isVertical ? R.size(1) : size ?? double.infinity,
      height: isVertical ? size ?? double.infinity : R.size(1),
      color: lineColor ?? AppTheme.colors.graySteel.withOpacity(0.4),
    );
  }
}
