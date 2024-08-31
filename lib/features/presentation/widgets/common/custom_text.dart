import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/app_style.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle; // Added textStyle parameter
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final double? iconTextPadding;
  final double? letterSpacing;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? lineHeight;
  final bool selectable;
  final Color? backgroundColor; // New parameter for background color
  final double? borderRadius; // New parameter for border radius

  const CustomText({
    super.key,
    required this.text,
    this.textStyle, // Initialize textStyle
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.iconTextPadding,
    this.letterSpacing,
    this.padding,
    this.margin,
    this.maxLines,
    this.overflow,
    this.lineHeight,
    this.selectable = false,
    this.backgroundColor, // Initialize background color
    this.borderRadius, // Initialize border radius
  });

  @override
  Widget build(BuildContext context) {
    // Use the provided textStyle if available, otherwise fallback to defaults
    final effectiveTextStyle = textStyle?.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: lineHeight,
        ) ??
        AppStyle.bodyText.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: lineHeight,
        );

    final textWidget = selectable
        ? SelectableText(
            text,
            style: effectiveTextStyle,
            textAlign: textAlign,
            maxLines: maxLines,
          )
        : Text(
            text,
            style: effectiveTextStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow ?? TextOverflow.clip,
            softWrap: true,
          );

    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor, // Set the background color
        borderRadius:
            BorderRadius.circular(borderRadius ?? 0.0), // Set the border radius
      ),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (svgIconPath != null && svgIconPath!.isNotEmpty)
                SvgPicture.asset(
                  svgIconPath!,
                  color: iconColor,
                  width: iconWidth,
                  height: iconHeight,
                ),
              if (svgIconPath != null && svgIconPath!.isNotEmpty)
                SizedBox(
                  width:
                      iconTextPadding ?? ResponsiveSizeAdapter(context).size(8),
                ),
              Expanded(
                child: textWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
