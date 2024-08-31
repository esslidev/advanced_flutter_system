import 'package:flutter/material.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/enums/widget_enums.dart';
import '../common/custom_field.dart';
import '../common/custom_line.dart';
import '../common/custom_text.dart';

class GlobalCard extends StatefulWidget {
  final String title;
  final Widget? sideChild;
  final List<Widget> children;
  final bool loading;

  const GlobalCard({
    super.key,
    required this.title,
    this.sideChild,
    required this.children,
    this.loading = false,
  });
  @override
  State<GlobalCard> createState() => _GlobalCardState();
}

class _GlobalCardState extends State<GlobalCard> {
  late ResponsiveSizeAdapter R;
  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return CustomField(
        width: double.infinity,
        minHeight: R.size(150),
        backgroundColor: AppTheme.colors.whiteSolid,
        borderRadius: R.size(8),
        padding:
            EdgeInsets.symmetric(vertical: R.size(24), horizontal: R.size(24)),
        shadowColor: AppTheme.colors.graySteel.withOpacity(0.2),
        shadowOffset: Offset(R.size(2), R.size(2)),
        shadowBlurRadius: 8,
        loading: widget.loading,
        loadingChild: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                AppTheme.light.primary1), // Green progress indicator
          ),
        ),
        children: [
          CustomField(
              arrangement: FieldArrangement.row,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: R.size(20),
                  fontWeight: FontWeight.w500,
                ),
                if (widget.sideChild != null) ...[
                  const Spacer(),
                  widget.sideChild!,
                ],
              ]),
          SizedBox(
            height: R.size(10),
          ),
          const CustomLine(),
          SizedBox(
            height: R.size(24),
          ),
          ...widget.children
        ]);
  }
}
