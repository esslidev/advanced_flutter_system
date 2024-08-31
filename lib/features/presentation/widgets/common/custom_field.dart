import 'package:flutter/material.dart';
import '../../../../core/enums/widget_enums.dart';

class CustomField extends StatefulWidget {
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final FieldArrangement arrangement;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int flex;
  final double? width;
  final double? height;
  final double gap;
  final bool wrap;
  final double? minHeight;
  final double? minWidth;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double shadowBlurRadius;
  final bool loading;
  final Widget? loadingChild;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final bool expanded; // New parameter

  const CustomField({
    super.key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth = 0.0,
    this.borderColor,
    this.arrangement = FieldArrangement.column,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.flex = 1,
    this.width,
    this.height,
    this.gap = 0.0,
    this.wrap = false,
    this.minHeight,
    this.minWidth,
    this.shadowColor,
    this.shadowOffset = Offset.zero,
    this.shadowBlurRadius = 0.0,
    this.loading = false,
    this.loadingChild,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.expanded = false, // Default to false
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.loading && widget.loadingChild != null) {
      content = widget.loadingChild!;
    } else {
      content = _buildChildren();
    }

    Widget container = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: widget.minWidth ?? 0.0,
        minHeight: widget.minHeight ?? 0.0,
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        alignment: widget.alignment,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth,
          ),
          boxShadow: widget.shadowColor != null && widget.shadowBlurRadius > 0
              ? [
                  BoxShadow(
                    color: widget.shadowColor!,
                    offset: widget.shadowOffset ?? Offset.zero,
                    blurRadius: widget.shadowBlurRadius,
                  ),
                ]
              : null,
        ),
        clipBehavior: widget.clipBehavior ?? Clip.none,
        child: content,
      ),
    );

    return widget.expanded
        ? Expanded(child: container) // Expand to fill parent
        : container;
  }

  Widget _buildChildren() {
    final List<Widget> spacedChildren = <Widget>[];
    for (int i = 0; i < widget.children.length; i++) {
      spacedChildren.add(widget.children[i]);
      if (i < widget.children.length - 1) {
        spacedChildren.add(SizedBox(
          width: widget.arrangement == FieldArrangement.row && !widget.wrap
              ? widget.gap
              : 0,
          height: widget.arrangement == FieldArrangement.column && !widget.wrap
              ? widget.gap
              : 0,
        ));
      }
    }

    final mainAxis = widget.arrangement == FieldArrangement.row
        ? Axis.horizontal
        : Axis.vertical;

    if (widget.wrap && widget.arrangement == FieldArrangement.row) {
      return Wrap(
        spacing: widget.gap,
        runSpacing: widget.gap,
        alignment: widget.mainAxisAlignment.wrapAlignment,
        crossAxisAlignment: widget.crossAxisAlignment.wrapCrossAlignment,
        children: widget.children,
      );
    }

    return Flex(
      direction: mainAxis,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: spacedChildren,
    );
  }
}

extension on MainAxisAlignment {
  WrapAlignment get wrapAlignment {
    switch (this) {
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}

extension on CrossAxisAlignment {
  WrapCrossAlignment get wrapCrossAlignment {
    switch (this) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      case CrossAxisAlignment.stretch:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.baseline:
        return WrapCrossAlignment.start;
    }
  }
}
