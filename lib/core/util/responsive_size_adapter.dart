import 'package:flutter/material.dart';

class ResponsiveSizeAdapter {
  final BuildContext context;

  ResponsiveSizeAdapter(this.context);

  double size(double baseSize) {
    try {
      double shortestSide = MediaQuery.of(context).size.shortestSide;
      const double referenceScreenWidth = 600.0;
      double screenWidthRatio = shortestSide / referenceScreenWidth;

      // Clamping the ratio to avoid extreme scaling
      screenWidthRatio = screenWidthRatio.clamp(0.5, 2.0);

      return baseSize * screenWidthRatio;
    } catch (error) {
      // Return baseSize instead of 0 as a fallback
      return baseSize;
    }
  }

  EdgeInsets padding(double basePadding) {
    double responsivePadding = size(basePadding);
    return EdgeInsets.all(responsivePadding);
  }

  EdgeInsets symmetricPadding(
      {double horizontal = 0.0, double vertical = 0.0}) {
    return EdgeInsets.symmetric(
      horizontal: size(horizontal),
      vertical: size(vertical),
    );
  }
}
