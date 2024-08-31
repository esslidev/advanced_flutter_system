import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/custom_button.dart';

class BreadCrumbs extends StatelessWidget {
  final String path;
  final double fontSize; // Added fontSize parameter

  const BreadCrumbs(
      {super.key,
      required this.path,
      this.fontSize = 12.0}); // Default value for fontSize

  @override
  Widget build(BuildContext context) {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);
    final List<String> routeTree =
        path.split('/').where((e) => e.isNotEmpty).toList();

    return Row(
      children: [
        for (int i = 0; i < routeTree.length; i++) ...[
          _buildCustomButton(
            title: AppPaths.routes
                .getRouteName('/${routeTree.sublist(0, i + 1).join('/')}'),
            onPressed: () {
              Beamer.of(context)
                  .beamToNamed('/${routeTree.sublist(0, i + 1).join('/')}');
            },
            textColor: i == routeTree.length - 1
                ? AppTheme.light.primary2
                : AppTheme.colors.graySteel,
            R: R,
            fontSize: fontSize, // Pass fontSize parameter
          ),
          if (i < routeTree.length - 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: R.size(3)),
              child: Icon(Icons.arrow_forward_ios,
                  size: R.size(12), color: AppTheme.colors.graySteel),
            ),
        ],
      ],
    );
  }

  Widget _buildCustomButton({
    required String title,
    Color? textColor,
    VoidCallback? onPressed,
    required ResponsiveSizeAdapter R,
    required double fontSize, // Added fontSize parameter
  }) {
    return CustomButton(
      text: title,
      fontSize: R.size(fontSize), // Use fontSize parameter
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.symmetric(
        vertical: R.size(5),
        horizontal: R.size(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: R.size(3)),
      borderRadius: R.size(2),
      textColor: textColor ?? AppTheme.colors.graySteel,
      onHoverStyle: CustomButtonStyle(),
      onPressed: onPressed,
    );
  }
}
