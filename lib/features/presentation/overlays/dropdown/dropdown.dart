import 'package:flutter/material.dart';
import '../../../../core/enums/widget_enums.dart';
import '../../../../core/util/responsive_screen_adapter.dart';

class DropdownStyle {
  final double? width;
  final double? height;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double shadowBlurRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? backgroundColor;
  final Radius borderRadius;

  DropdownStyle({
    this.width,
    this.height,
    this.shadowColor,
    this.shadowOffset = const Offset(0, 2),
    this.shadowBlurRadius = 4.0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.backgroundColor,
    this.borderRadius = const Radius.circular(6),
  });
}

class DropdownOverlay {
  final BuildContext context;
  final Offset offset;
  final double? width;
  final double? height;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double shadowBlurRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? backgroundColor;
  final Radius borderRadius;
  final DropdownAlignment dropdownAlignment; // New property
  final List<Widget> items;

  DropdownOverlay({
    required this.context,
    required this.offset,
    this.width,
    this.height,
    this.shadowColor,
    this.shadowOffset = const Offset(0, 2),
    this.shadowBlurRadius = 4.0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.backgroundColor = Colors.white,
    this.borderRadius = const Radius.circular(6.0),
    this.dropdownAlignment = DropdownAlignment.start, // Initialize new property
    required this.items,
  });

  OverlayEntry? _overlayEntry;

  void show() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        // Calculate the adjusted position based on alignment
        double adjustedOffsetX = offset.dx;
        if (dropdownAlignment == DropdownAlignment.center) {
          adjustedOffsetX -= (width ?? 0) / 2;
        } else if (dropdownAlignment == DropdownAlignment.end) {
          adjustedOffsetX -= (width ?? 0);
        }

        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                hide(); // Hide the dropdown when tapping outside
              },
              behavior: HitTestBehavior.translucent, // Ensure taps are detected
              child: Container(
                color: Colors.transparent, // Cover entire screen
              ),
            ),
            Positioned(
              left: adjustedOffsetX,
              top: offset.dy,
              width: width,
              height: height,
              child: Material(
                color:
                    Colors.transparent, // Transparent background for Material
                child: ResponsiveScreenAdapter(
                  defaultScreen: _buildDialog(),
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool isShown() {
    return _overlayEntry != null;
  }

  Widget _buildDialog() {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(borderRadius),
        boxShadow: shadowColor != null
            ? [
                BoxShadow(
                  color: shadowColor!,
                  offset: shadowOffset!,
                  blurRadius: shadowBlurRadius,
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}
