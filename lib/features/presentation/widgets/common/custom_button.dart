import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/theme/app_style.dart';
import '../../../../core/enums/widget_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../overlays/dropdown/dropdown.dart';

class CustomButtonStyle {
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  CustomButtonStyle({
    this.width,
    this.height,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
  });
}

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? borderRadius;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final CustomButtonIconPosition iconPosition;
  final Color? iconColor;
  final double? iconTextGap;
  final String? text;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isActive;
  final CustomButtonStyle? onActiveStyle;
  final CustomButtonStyle? onHoverStyle;
  final VoidCallback? onPressed;
  final List<Widget>? dropdownItems;
  final DropdownAlignment dropdownAlignment;
  final DropdownStyle? dropdownStyle;
  final bool useIntrinsicWidth;
  final Duration animationDuration;
  final Curve animationCurve;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconPosition = CustomButtonIconPosition.left,
    this.iconColor,
    this.iconTextGap,
    this.text,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isActive = false,
    this.onActiveStyle,
    this.onHoverStyle,
    this.onPressed,
    this.dropdownItems,
    this.dropdownAlignment = DropdownAlignment.start,
    this.dropdownStyle,
    this.useIntrinsicWidth = true,
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late ResponsiveSizeAdapter R;
  DropdownOverlay? _dropDownOverlay;
  final GlobalKey _buttonKey = GlobalKey(); // Key to access button's position

  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = widget.onHoverStyle != null ? isHovered : false;
    });
  }

  void _toggleDropdown() {
    print('toggle');
    if (_dropDownOverlay == null) {
      final RenderBox renderBox =
          _buttonKey.currentContext!.findRenderObject() as RenderBox;
      final Offset buttonOffset = renderBox.localToGlobal(Offset.zero);

      final Size buttonSize = renderBox.size;

      // Calculate dropdown position based on alignment
      Offset dropdownOffset =
          Offset(buttonOffset.dx, buttonOffset.dy + buttonSize.height);
      ;

      _dropDownOverlay = DropdownOverlay(
        context: context,
        offset: dropdownOffset,
        width: widget.dropdownStyle?.width,
        height: widget.dropdownStyle?.height,
        dropdownAlignment: widget.dropdownAlignment,
        shadowColor: widget.dropdownStyle?.shadowColor,
        shadowOffset: widget.dropdownStyle?.shadowOffset,
        shadowBlurRadius: widget.dropdownStyle?.shadowBlurRadius ?? 4.0,
        padding: widget.dropdownStyle?.padding ?? EdgeInsets.zero,
        margin: widget.dropdownStyle?.margin ?? EdgeInsets.zero,
        mainAxisAlignment:
            widget.dropdownStyle?.mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: widget.dropdownStyle?.crossAxisAlignment ??
            CrossAxisAlignment.start,
        backgroundColor: widget.dropdownStyle?.backgroundColor,
        borderRadius:
            widget.dropdownStyle?.borderRadius ?? const Radius.circular(6.0),
        items: widget.dropdownItems ?? [],
      );
      _dropDownOverlay?.show();
    } else {
      _dropDownOverlay?.hide();
      _dropDownOverlay = null;
    }
  }

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  void dispose() {
    _dropDownOverlay?.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = AnimatedContainer(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.isActive
            ? widget.onActiveStyle?.backgroundColor
            : _isHovered
                ? widget.onHoverStyle?.backgroundColor
                : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
        boxShadow: widget.isActive
            ? widget.onActiveStyle?.boxShadow
            : _isHovered
                ? widget.onHoverStyle?.boxShadow
                : widget.boxShadow,
      ),
      child: _buildButtonContent(),
    );

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        key: _buttonKey,
        onTap:
            widget.dropdownItems != null ? _toggleDropdown : widget.onPressed,
        child: widget.useIntrinsicWidth
            ? IntrinsicWidth(child: buttonContent)
            : buttonContent,
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.svgIconPath != null && widget.text == null) {
      return Center(child: _buildIcon());
    }

    switch (widget.iconPosition) {
      case CustomButtonIconPosition.top:
        return Column(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.svgIconPath != null) _buildIcon(),
            if (widget.svgIconPath != null && widget.text != null)
              SizedBox(height: widget.iconTextGap ?? R.size(6)),
            if (widget.text != null) _buildText(),
          ],
        );
      case CustomButtonIconPosition.left:
        return Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.svgIconPath != null) _buildIcon(),
            if (widget.svgIconPath != null && widget.text != null)
              SizedBox(width: widget.iconTextGap ?? R.size(6)),
            if (widget.text != null) _buildText(),
          ],
        );
      case CustomButtonIconPosition.right:
        return Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.text != null) _buildText(),
            if (widget.text != null && widget.svgIconPath != null)
              SizedBox(width: widget.iconTextGap ?? R.size(6)),
            if (widget.svgIconPath != null) _buildIcon(),
          ],
        );
      case CustomButtonIconPosition.bottom:
        return Column(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.text != null) _buildText(),
            if (widget.text != null && widget.svgIconPath != null)
              SizedBox(height: widget.iconTextGap ?? R.size(6)),
            if (widget.svgIconPath != null) _buildIcon(),
          ],
        );
      default:
        return Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.svgIconPath != null) _buildIcon(),
            if (widget.svgIconPath != null && widget.text != null)
              SizedBox(width: widget.iconTextGap ?? R.size(6)),
            if (widget.text != null) _buildText(),
          ],
        );
    }
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      widget.svgIconPath!,
      color: widget.isActive
          ? widget.onActiveStyle?.iconColor
          : _isHovered
              ? widget.onHoverStyle?.iconColor
              : widget.iconColor,
      width: widget.iconWidth,
      height: widget.iconHeight,
    );
  }

  Widget _buildText() {
    return Text(
      widget.text!,
      style: AppStyle.bodyText.copyWith(
        color: widget.isActive
            ? widget.onActiveStyle?.textColor
            : _isHovered
                ? widget.onHoverStyle?.textColor
                : widget.textColor,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
        letterSpacing: widget.letterSpacing,
      ),
    );
  }
}
