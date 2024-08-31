import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/enums/widget_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../overlays/dropdown/dropdown.dart';

class CustomTextFieldStyle {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;

  CustomTextFieldStyle({
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
  });
}

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? borderRadius;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final CustomTextFieldIconPosition iconPosition;
  final Color? iconColor;
  final String? hintText;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontWeight? hintFontWeight;
  final Color? focusedBorderColor;
  final CustomTextFieldStyle? onFocusStyle;
  final Color? textColor;
  final Color? hintColor;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double shadowBlurRadius;
  final List<Widget>? dropdownItems;
  final DropdownAlignment dropdownAlignment;
  final DropdownStyle? dropdownStyle;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconPosition = CustomTextFieldIconPosition.end,
    this.iconColor,
    this.hintText,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.fontSize,
    this.fontWeight,
    this.hintFontWeight, // Initialize the new property
    this.focusedBorderColor,
    this.onFocusStyle,
    this.textColor,
    this.hintColor,
    this.shadowColor,
    this.shadowOffset = Offset.zero,
    this.shadowBlurRadius = 0.0,
    this.dropdownItems,
    this.dropdownAlignment = DropdownAlignment.start,
    this.dropdownStyle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late ResponsiveSizeAdapter R;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);

    _focusNode.addListener(() {
      setState(() {}); // Rebuild to update focus state
    });

    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  CustomTextFieldStyle _getEffectiveStyle() {
    final baseStyle = CustomTextFieldStyle(
      width: widget.width,
      height: widget.height,
      borderRadius: widget.borderRadius,
      textColor: widget.textColor,
      hintColor: widget.hintColor,
      iconColor: widget.iconColor,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
    );

    if (_focusNode.hasFocus && widget.onFocusStyle != null) {
      return CustomTextFieldStyle(
        width: widget.onFocusStyle?.width ?? baseStyle.width,
        height: widget.onFocusStyle?.height ?? baseStyle.height,
        borderRadius:
            widget.onFocusStyle?.borderRadius ?? baseStyle.borderRadius,
        textColor: widget.onFocusStyle?.textColor ?? baseStyle.textColor,
        hintColor: widget.onFocusStyle?.hintColor ?? baseStyle.hintColor,
        iconColor: widget.onFocusStyle?.iconColor ?? baseStyle.iconColor,
        backgroundColor:
            widget.onFocusStyle?.backgroundColor ?? baseStyle.backgroundColor,
        borderColor: widget.onFocusStyle?.borderColor ?? baseStyle.borderColor,
      );
    } else {
      return baseStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = TextStyle(
      fontSize: widget.fontSize ?? 16.0,
      fontWeight: widget.fontWeight ?? FontWeight.normal,
      color: _getEffectiveStyle().textColor ?? Colors.black,
    );

    final TextStyle hintTextStyle = TextStyle(
      fontSize: widget.fontSize ?? 16.0,
      fontWeight:
          widget.hintFontWeight ?? FontWeight.normal, // Use hintFontWeight
      color: _getEffectiveStyle().hintColor ?? Colors.black.withOpacity(0.4),
    );

    final effectiveStyle = _getEffectiveStyle();

    return Container(
      width: effectiveStyle.width,
      height: effectiveStyle.height,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: effectiveStyle.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(effectiveStyle.borderRadius ?? 0),
        border: Border.all(
          color: _focusNode.hasFocus
              ? (widget.focusedBorderColor ??
                  effectiveStyle.borderColor ??
                  Colors.transparent)
              : (effectiveStyle.borderColor ?? Colors.transparent),
          width: 1.5,
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
      child: Row(
        children: [
          if (widget.svgIconPath != null &&
              widget.iconPosition == CustomTextFieldIconPosition.start)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                widget.svgIconPath!,
                color: effectiveStyle.iconColor,
                width: widget.iconWidth,
                height: widget.iconHeight,
              ),
            ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              style: defaultTextStyle,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if (widget.svgIconPath != null &&
              widget.iconPosition == CustomTextFieldIconPosition.end)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                widget.svgIconPath!,
                color: effectiveStyle.iconColor,
                width: widget.iconWidth,
                height: widget.iconHeight,
              ),
            ),
        ],
      ),
    );
  }
}
